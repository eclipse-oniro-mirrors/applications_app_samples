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
