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
import { SettingsModel } from '../Shared/SettingsModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[SettingTests]';

export default function settingGestureRecognitionSuite() {
  describe('SettingGestureRecognitionSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0358
     * @tc.name    SettingGestureRecognition358
     * @tc.desc    Settings toggle effect 2 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit358') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0359
     * @tc.name    SettingGestureRecognition359
     * @tc.desc    Settings toggle effect 3 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit359') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0360
     * @tc.name    SettingGestureRecognition360
     * @tc.desc    Settings toggle effect 0 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit360') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0361
     * @tc.name    SettingGestureRecognition361
     * @tc.desc    Settings toggle effect 1 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit361') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0362
     * @tc.name    SettingGestureRecognition362
     * @tc.desc    Settings toggle effect 2 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit362') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0363
     * @tc.name    SettingGestureRecognition363
     * @tc.desc    Settings toggle effect 3 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit363') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0364
     * @tc.name    SettingGestureRecognition364
     * @tc.desc    Settings toggle effect 0 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit364') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0365
     * @tc.name    SettingGestureRecognition365
     * @tc.desc    Settings toggle effect 1 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit365') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0366
     * @tc.name    SettingGestureRecognition366
     * @tc.desc    Settings toggle effect 2 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit366') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0367
     * @tc.name    SettingGestureRecognition367
     * @tc.desc    Settings toggle effect 3 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit367') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0368
     * @tc.name    SettingGestureRecognition368
     * @tc.desc    Settings toggle effect 0 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit368') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0369
     * @tc.name    SettingGestureRecognition369
     * @tc.desc    Settings toggle effect 1 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit369') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0370
     * @tc.name    SettingGestureRecognition370
     * @tc.desc    Settings toggle effect 2 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit370') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0371
     * @tc.name    SettingGestureRecognition371
     * @tc.desc    Settings toggle effect 3 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit371') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0372
     * @tc.name    SettingGestureRecognition372
     * @tc.desc    Settings toggle effect 0 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit372') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0373
     * @tc.name    SettingGestureRecognition373
     * @tc.desc    Settings toggle effect 1 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit373') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0374
     * @tc.name    SettingGestureRecognition374
     * @tc.desc    Settings toggle effect 2 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit374') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0375
     * @tc.name    SettingGestureRecognition375
     * @tc.desc    Settings toggle effect 3 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit375') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0376
     * @tc.name    SettingGestureRecognition376
     * @tc.desc    Settings toggle effect 0 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit376') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0377
     * @tc.name    SettingGestureRecognition377
     * @tc.desc    Settings toggle effect 1 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit377') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0378
     * @tc.name    SettingGestureRecognition378
     * @tc.desc    Settings toggle effect 2 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit378') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0379
     * @tc.name    SettingGestureRecognition379
     * @tc.desc    Settings toggle effect 3 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit379') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0380
     * @tc.name    SettingGestureRecognition380
     * @tc.desc    Settings toggle effect 0 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit380') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0381
     * @tc.name    SettingGestureRecognition381
     * @tc.desc    Settings toggle effect 1 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit381') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0382
     * @tc.name    SettingGestureRecognition382
     * @tc.desc    Settings toggle effect 2 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit382') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0383
     * @tc.name    SettingGestureRecognition383
     * @tc.desc    Settings toggle effect 3 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit383') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0384
     * @tc.name    SettingGestureRecognition384
     * @tc.desc    Settings toggle effect 0 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit384') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0385
     * @tc.name    SettingGestureRecognition385
     * @tc.desc    Settings toggle effect 1 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit385') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0386
     * @tc.name    SettingGestureRecognition386
     * @tc.desc    Settings toggle effect 2 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit386') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0387
     * @tc.name    SettingGestureRecognition387
     * @tc.desc    Settings toggle effect 3 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit387') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0388
     * @tc.name    SettingGestureRecognition388
     * @tc.desc    Settings toggle effect 0 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit388') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0389
     * @tc.name    SettingGestureRecognition389
     * @tc.desc    Settings toggle effect 1 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit389') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0390
     * @tc.name    SettingGestureRecognition390
     * @tc.desc    Settings toggle effect 2 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit390') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0391
     * @tc.name    SettingGestureRecognition391
     * @tc.desc    Settings toggle effect 3 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit391') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0392
     * @tc.name    SettingGestureRecognition392
     * @tc.desc    Settings toggle effect 0 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit392') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0393
     * @tc.name    SettingGestureRecognition393
     * @tc.desc    Settings toggle effect 1 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit393') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0394
     * @tc.name    SettingGestureRecognition394
     * @tc.desc    Settings toggle effect 2 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit394') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0395
     * @tc.name    SettingGestureRecognition395
     * @tc.desc    Settings toggle effect 3 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit395') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0396
     * @tc.name    SettingGestureRecognition396
     * @tc.desc    Settings toggle effect 0 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit396') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0397
     * @tc.name    SettingGestureRecognition397
     * @tc.desc    Settings toggle effect 1 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit397') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0398
     * @tc.name    SettingGestureRecognition398
     * @tc.desc    Settings toggle effect 2 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit398') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0399
     * @tc.name    SettingGestureRecognition399
     * @tc.desc    Settings toggle effect 3 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit399') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0400
     * @tc.name    SettingGestureRecognition400
     * @tc.desc    Settings toggle effect 0 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit400') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0401
     * @tc.name    SettingGestureRecognition401
     * @tc.desc    Settings toggle effect 1 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit401') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0402
     * @tc.name    SettingGestureRecognition402
     * @tc.desc    Settings toggle effect 2 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit402') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0403
     * @tc.name    SettingGestureRecognition403
     * @tc.desc    Settings toggle effect 3 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit403') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0404
     * @tc.name    SettingGestureRecognition404
     * @tc.desc    Settings toggle effect 0 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit404') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0405
     * @tc.name    SettingGestureRecognition405
     * @tc.desc    Settings toggle effect 1 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit405') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0406
     * @tc.name    SettingGestureRecognition406
     * @tc.desc    Settings toggle effect 2 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit406') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0407
     * @tc.name    SettingGestureRecognition407
     * @tc.desc    Settings toggle effect 3 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit407') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0408
     * @tc.name    SettingGestureRecognition408
     * @tc.desc    Settings toggle effect 0 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit408') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0409
     * @tc.name    SettingGestureRecognition409
     * @tc.desc    Settings toggle effect 1 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit409') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0410
     * @tc.name    SettingGestureRecognition410
     * @tc.desc    Settings toggle effect 2 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit410') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0411
     * @tc.name    SettingGestureRecognition411
     * @tc.desc    Settings toggle effect 3 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit411') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0412
     * @tc.name    SettingGestureRecognition412
     * @tc.desc    Settings toggle effect 0 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit412') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0413
     * @tc.name    SettingGestureRecognition413
     * @tc.desc    Settings toggle effect 1 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit413') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0414
     * @tc.name    SettingGestureRecognition414
     * @tc.desc    Settings toggle effect 2 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit414') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0415
     * @tc.name    SettingGestureRecognition415
     * @tc.desc    Settings toggle effect 3 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit415') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0416
     * @tc.name    SettingGestureRecognition416
     * @tc.desc    Settings toggle effect 0 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit416') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0417
     * @tc.name    SettingGestureRecognition417
     * @tc.desc    Settings toggle effect 1 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit417') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0418
     * @tc.name    SettingGestureRecognition418
     * @tc.desc    Settings toggle effect 2 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit418') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0419
     * @tc.name    SettingGestureRecognition419
     * @tc.desc    Settings toggle effect 3 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit419') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0420
     * @tc.name    SettingGestureRecognition420
     * @tc.desc    Settings toggle effect 0 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit420') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0421
     * @tc.name    SettingGestureRecognition421
     * @tc.desc    Settings toggle effect 1 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit421') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0422
     * @tc.name    SettingGestureRecognition422
     * @tc.desc    Settings toggle effect 2 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit422') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0423
     * @tc.name    SettingGestureRecognition423
     * @tc.desc    Settings toggle effect 3 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit423') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0424
     * @tc.name    SettingGestureRecognition424
     * @tc.desc    Settings toggle effect 0 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit424') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0425
     * @tc.name    SettingGestureRecognition425
     * @tc.desc    Settings toggle effect 1 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit425') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0426
     * @tc.name    SettingGestureRecognition426
     * @tc.desc    Settings toggle effect 2 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit426') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0427
     * @tc.name    SettingGestureRecognition427
     * @tc.desc    Settings toggle effect 3 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit427') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0428
     * @tc.name    SettingGestureRecognition428
     * @tc.desc    Settings toggle effect 0 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit428') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0429
     * @tc.name    SettingGestureRecognition429
     * @tc.desc    Settings toggle effect 1 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit429') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0430
     * @tc.name    SettingGestureRecognition430
     * @tc.desc    Settings toggle effect 2 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit430') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0431
     * @tc.name    SettingGestureRecognition431
     * @tc.desc    Settings toggle effect 3 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit431') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0432
     * @tc.name    SettingGestureRecognition432
     * @tc.desc    Settings toggle effect 0 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit432') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0433
     * @tc.name    SettingGestureRecognition433
     * @tc.desc    Settings toggle effect 1 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit433') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0434
     * @tc.name    SettingGestureRecognition434
     * @tc.desc    Settings toggle effect 2 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit434') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0435
     * @tc.name    SettingGestureRecognition435
     * @tc.desc    Settings toggle effect 3 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit435') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0436
     * @tc.name    SettingGestureRecognition436
     * @tc.desc    Settings toggle effect 0 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit436') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0437
     * @tc.name    SettingGestureRecognition437
     * @tc.desc    Settings toggle effect 1 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit437') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0438
     * @tc.name    SettingGestureRecognition438
     * @tc.desc    Settings toggle effect 2 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit438') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0439
     * @tc.name    SettingGestureRecognition439
     * @tc.desc    Settings toggle effect 3 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit439') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0440
     * @tc.name    SettingGestureRecognition440
     * @tc.desc    Settings toggle effect 0 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit440') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0441
     * @tc.name    SettingGestureRecognition441
     * @tc.desc    Settings toggle effect 1 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit441') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0442
     * @tc.name    SettingGestureRecognition442
     * @tc.desc    Settings toggle effect 2 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition442', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit442') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0443
     * @tc.name    SettingGestureRecognition443
     * @tc.desc    Settings toggle effect 3 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition443', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit443') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0444
     * @tc.name    SettingGestureRecognition444
     * @tc.desc    Settings toggle effect 0 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition444', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit444') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0445
     * @tc.name    SettingGestureRecognition445
     * @tc.desc    Settings toggle effect 1 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition445', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit445') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0446
     * @tc.name    SettingGestureRecognition446
     * @tc.desc    Settings toggle effect 2 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition446', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit446') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0447
     * @tc.name    SettingGestureRecognition447
     * @tc.desc    Settings toggle effect 3 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition447', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit447') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0448
     * @tc.name    SettingGestureRecognition448
     * @tc.desc    Settings toggle effect 0 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition448', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit448') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0449
     * @tc.name    SettingGestureRecognition449
     * @tc.desc    Settings toggle effect 1 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition449', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit449') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0450
     * @tc.name    SettingGestureRecognition450
     * @tc.desc    Settings toggle effect 2 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition450', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit450') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0451
     * @tc.name    SettingGestureRecognition451
     * @tc.desc    Settings toggle effect 3 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit451') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0452
     * @tc.name    SettingGestureRecognition452
     * @tc.desc    Settings toggle effect 0 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit452') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0453
     * @tc.name    SettingGestureRecognition453
     * @tc.desc    Settings toggle effect 1 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit453') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0454
     * @tc.name    SettingGestureRecognition454
     * @tc.desc    Settings toggle effect 2 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit454') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0455
     * @tc.name    SettingGestureRecognition455
     * @tc.desc    Settings toggle effect 3 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit455') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0456
     * @tc.name    SettingGestureRecognition456
     * @tc.desc    Settings toggle effect 0 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit456') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0457
     * @tc.name    SettingGestureRecognition457
     * @tc.desc    Settings toggle effect 1 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit457') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0458
     * @tc.name    SettingGestureRecognition458
     * @tc.desc    Settings toggle effect 2 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit458') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0459
     * @tc.name    SettingGestureRecognition459
     * @tc.desc    Settings toggle effect 3 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit459') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0460
     * @tc.name    SettingGestureRecognition460
     * @tc.desc    Settings toggle effect 0 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit460') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0461
     * @tc.name    SettingGestureRecognition461
     * @tc.desc    Settings toggle effect 1 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit461') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0462
     * @tc.name    SettingGestureRecognition462
     * @tc.desc    Settings toggle effect 2 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit462') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0463
     * @tc.name    SettingGestureRecognition463
     * @tc.desc    Settings toggle effect 3 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit463') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0464
     * @tc.name    SettingGestureRecognition464
     * @tc.desc    Settings toggle effect 0 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit464') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0465
     * @tc.name    SettingGestureRecognition465
     * @tc.desc    Settings toggle effect 1 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit465') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0466
     * @tc.name    SettingGestureRecognition466
     * @tc.desc    Settings toggle effect 2 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit466') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0467
     * @tc.name    SettingGestureRecognition467
     * @tc.desc    Settings toggle effect 3 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit467') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0468
     * @tc.name    SettingGestureRecognition468
     * @tc.desc    Settings toggle effect 0 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit468') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0469
     * @tc.name    SettingGestureRecognition469
     * @tc.desc    Settings toggle effect 1 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit469') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0470
     * @tc.name    SettingGestureRecognition470
     * @tc.desc    Settings toggle effect 2 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit470') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0471
     * @tc.name    SettingGestureRecognition471
     * @tc.desc    Settings toggle effect 3 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit471') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0472
     * @tc.name    SettingGestureRecognition472
     * @tc.desc    Settings toggle effect 0 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit472') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0473
     * @tc.name    SettingGestureRecognition473
     * @tc.desc    Settings toggle effect 1 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit473') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0474
     * @tc.name    SettingGestureRecognition474
     * @tc.desc    Settings toggle effect 2 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit474') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0475
     * @tc.name    SettingGestureRecognition475
     * @tc.desc    Settings toggle effect 3 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit475') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0476
     * @tc.name    SettingGestureRecognition476
     * @tc.desc    Settings toggle effect 0 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit476') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0477
     * @tc.name    SettingGestureRecognition477
     * @tc.desc    Settings toggle effect 1 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit477') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0478
     * @tc.name    SettingGestureRecognition478
     * @tc.desc    Settings toggle effect 2 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit478') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0479
     * @tc.name    SettingGestureRecognition479
     * @tc.desc    Settings toggle effect 3 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit479') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0480
     * @tc.name    SettingGestureRecognition480
     * @tc.desc    Settings toggle effect 0 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit480') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0481
     * @tc.name    SettingGestureRecognition481
     * @tc.desc    Settings toggle effect 1 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit481') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0482
     * @tc.name    SettingGestureRecognition482
     * @tc.desc    Settings toggle effect 2 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit482') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0483
     * @tc.name    SettingGestureRecognition483
     * @tc.desc    Settings toggle effect 3 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit483') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0484
     * @tc.name    SettingGestureRecognition484
     * @tc.desc    Settings toggle effect 0 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit484') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0485
     * @tc.name    SettingGestureRecognition485
     * @tc.desc    Settings toggle effect 1 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit485') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0486
     * @tc.name    SettingGestureRecognition486
     * @tc.desc    Settings toggle effect 2 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit486') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0487
     * @tc.name    SettingGestureRecognition487
     * @tc.desc    Settings toggle effect 3 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit487') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0488
     * @tc.name    SettingGestureRecognition488
     * @tc.desc    Settings toggle effect 0 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit488') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0489
     * @tc.name    SettingGestureRecognition489
     * @tc.desc    Settings toggle effect 1 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit489') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0490
     * @tc.name    SettingGestureRecognition490
     * @tc.desc    Settings toggle effect 2 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit490') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0491
     * @tc.name    SettingGestureRecognition491
     * @tc.desc    Settings toggle effect 3 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit491') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0492
     * @tc.name    SettingGestureRecognition492
     * @tc.desc    Settings toggle effect 0 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit492') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0493
     * @tc.name    SettingGestureRecognition493
     * @tc.desc    Settings toggle effect 1 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit493') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0494
     * @tc.name    SettingGestureRecognition494
     * @tc.desc    Settings toggle effect 2 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit494') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0495
     * @tc.name    SettingGestureRecognition495
     * @tc.desc    Settings toggle effect 3 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit495') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0496
     * @tc.name    SettingGestureRecognition496
     * @tc.desc    Settings toggle effect 0 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit496') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0497
     * @tc.name    SettingGestureRecognition497
     * @tc.desc    Settings toggle effect 1 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit497') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0498
     * @tc.name    SettingGestureRecognition498
     * @tc.desc    Settings toggle effect 2 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit498') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0499
     * @tc.name    SettingGestureRecognition499
     * @tc.desc    Settings toggle effect 3 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit499') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0500
     * @tc.name    SettingGestureRecognition500
     * @tc.desc    Settings toggle effect 0 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit500') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0501
     * @tc.name    SettingGestureRecognition501
     * @tc.desc    Settings toggle effect 1 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit501') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0502
     * @tc.name    SettingGestureRecognition502
     * @tc.desc    Settings toggle effect 2 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit502') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0503
     * @tc.name    SettingGestureRecognition503
     * @tc.desc    Settings toggle effect 3 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit503') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0504
     * @tc.name    SettingGestureRecognition504
     * @tc.desc    Settings toggle effect 0 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit504') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0505
     * @tc.name    SettingGestureRecognition505
     * @tc.desc    Settings toggle effect 1 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit505') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0506
     * @tc.name    SettingGestureRecognition506
     * @tc.desc    Settings toggle effect 2 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit506') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0507
     * @tc.name    SettingGestureRecognition507
     * @tc.desc    Settings toggle effect 3 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit507') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0508
     * @tc.name    SettingGestureRecognition508
     * @tc.desc    Settings toggle effect 0 probe 508
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition508', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit508') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0509
     * @tc.name    SettingGestureRecognition509
     * @tc.desc    Settings toggle effect 1 probe 509
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition509', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit509') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0510
     * @tc.name    SettingGestureRecognition510
     * @tc.desc    Settings toggle effect 2 probe 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition510', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit510') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0511
     * @tc.name    SettingGestureRecognition511
     * @tc.desc    Settings toggle effect 3 probe 511
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition511', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit511') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0512
     * @tc.name    SettingGestureRecognition512
     * @tc.desc    Settings toggle effect 0 probe 512
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition512', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit512') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0513
     * @tc.name    SettingGestureRecognition513
     * @tc.desc    Settings toggle effect 1 probe 513
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition513', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit513') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0514
     * @tc.name    SettingGestureRecognition514
     * @tc.desc    Settings toggle effect 2 probe 514
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition514', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit514') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0515
     * @tc.name    SettingGestureRecognition515
     * @tc.desc    Settings toggle effect 3 probe 515
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition515', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit515') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0516
     * @tc.name    SettingGestureRecognition516
     * @tc.desc    Settings toggle effect 0 probe 516
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition516', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit516') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0517
     * @tc.name    SettingGestureRecognition517
     * @tc.desc    Settings toggle effect 1 probe 517
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition517', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit517') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0518
     * @tc.name    SettingGestureRecognition518
     * @tc.desc    Settings toggle effect 2 probe 518
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition518', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit518') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0519
     * @tc.name    SettingGestureRecognition519
     * @tc.desc    Settings toggle effect 3 probe 519
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition519', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit519') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0520
     * @tc.name    SettingGestureRecognition520
     * @tc.desc    Settings toggle effect 0 probe 520
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition520', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit520') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0521
     * @tc.name    SettingGestureRecognition521
     * @tc.desc    Settings toggle effect 1 probe 521
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition521', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit521') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0522
     * @tc.name    SettingGestureRecognition522
     * @tc.desc    Settings toggle effect 2 probe 522
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition522', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit522') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0523
     * @tc.name    SettingGestureRecognition523
     * @tc.desc    Settings toggle effect 3 probe 523
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition523', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit523') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0524
     * @tc.name    SettingGestureRecognition524
     * @tc.desc    Settings toggle effect 0 probe 524
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition524', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit524') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0525
     * @tc.name    SettingGestureRecognition525
     * @tc.desc    Settings toggle effect 1 probe 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition525', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit525') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0526
     * @tc.name    SettingGestureRecognition526
     * @tc.desc    Settings toggle effect 2 probe 526
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition526', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit526') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0527
     * @tc.name    SettingGestureRecognition527
     * @tc.desc    Settings toggle effect 3 probe 527
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition527', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit527') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0528
     * @tc.name    SettingGestureRecognition528
     * @tc.desc    Settings toggle effect 0 probe 528
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition528', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit528') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0529
     * @tc.name    SettingGestureRecognition529
     * @tc.desc    Settings toggle effect 1 probe 529
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition529', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit529') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0530
     * @tc.name    SettingGestureRecognition530
     * @tc.desc    Settings toggle effect 2 probe 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition530', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit530') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0531
     * @tc.name    SettingGestureRecognition531
     * @tc.desc    Settings toggle effect 3 probe 531
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition531', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit531') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0532
     * @tc.name    SettingGestureRecognition532
     * @tc.desc    Settings toggle effect 0 probe 532
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition532', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit532') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0533
     * @tc.name    SettingGestureRecognition533
     * @tc.desc    Settings toggle effect 1 probe 533
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition533', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit533') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0534
     * @tc.name    SettingGestureRecognition534
     * @tc.desc    Settings toggle effect 2 probe 534
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition534', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit534') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0535
     * @tc.name    SettingGestureRecognition535
     * @tc.desc    Settings toggle effect 3 probe 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition535', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit535') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0536
     * @tc.name    SettingGestureRecognition536
     * @tc.desc    Settings toggle effect 0 probe 536
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition536', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit536') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0537
     * @tc.name    SettingGestureRecognition537
     * @tc.desc    Settings toggle effect 1 probe 537
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition537', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit537') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0538
     * @tc.name    SettingGestureRecognition538
     * @tc.desc    Settings toggle effect 2 probe 538
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition538', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit538') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0539
     * @tc.name    SettingGestureRecognition539
     * @tc.desc    Settings toggle effect 3 probe 539
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition539', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit539') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0540
     * @tc.name    SettingGestureRecognition540
     * @tc.desc    Settings toggle effect 0 probe 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingGestureRecognition540', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit540') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

