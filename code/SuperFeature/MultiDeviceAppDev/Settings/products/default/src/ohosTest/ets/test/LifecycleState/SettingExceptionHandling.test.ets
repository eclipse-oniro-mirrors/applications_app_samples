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

export default function settingExceptionHandlingSuite() {
  describe('SettingExceptionHandlingSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0541
     * @tc.name    SettingExceptionHandling541
     * @tc.desc    Settings fresh model entries 541 probe 541
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling541', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit541') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0542
     * @tc.name    SettingExceptionHandling542
     * @tc.desc    Settings fresh model entries 542 probe 542
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling542', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit542') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0543
     * @tc.name    SettingExceptionHandling543
     * @tc.desc    Settings fresh model entries 543 probe 543
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling543', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit543') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0544
     * @tc.name    SettingExceptionHandling544
     * @tc.desc    Settings fresh model entries 544 probe 544
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling544', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit544') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0545
     * @tc.name    SettingExceptionHandling545
     * @tc.desc    Settings fresh model entries 545 probe 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling545', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit545') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0546
     * @tc.name    SettingExceptionHandling546
     * @tc.desc    Settings fresh model entries 546 probe 546
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling546', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit546') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0547
     * @tc.name    SettingExceptionHandling547
     * @tc.desc    Settings fresh model entries 547 probe 547
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling547', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit547') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0548
     * @tc.name    SettingExceptionHandling548
     * @tc.desc    Settings fresh model entries 548 probe 548
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling548', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit548') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0549
     * @tc.name    SettingExceptionHandling549
     * @tc.desc    Settings fresh model entries 549 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit549') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0550
     * @tc.name    SettingExceptionHandling550
     * @tc.desc    Settings fresh model entries 550 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit550') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0551
     * @tc.name    SettingExceptionHandling551
     * @tc.desc    Settings fresh model entries 551 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit551') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0552
     * @tc.name    SettingExceptionHandling552
     * @tc.desc    Settings fresh model entries 552 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit552') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0553
     * @tc.name    SettingExceptionHandling553
     * @tc.desc    Settings fresh model entries 553 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit553') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0554
     * @tc.name    SettingExceptionHandling554
     * @tc.desc    Settings fresh model entries 554 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit554') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0555
     * @tc.name    SettingExceptionHandling555
     * @tc.desc    Settings fresh model entries 555 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit555') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0556
     * @tc.name    SettingExceptionHandling556
     * @tc.desc    Settings fresh model entries 556 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit556') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0557
     * @tc.name    SettingExceptionHandling557
     * @tc.desc    Settings fresh model entries 557 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit557') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0558
     * @tc.name    SettingExceptionHandling558
     * @tc.desc    Settings fresh model entries 558 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit558') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0559
     * @tc.name    SettingExceptionHandling559
     * @tc.desc    Settings fresh model entries 559 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit559') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0560
     * @tc.name    SettingExceptionHandling560
     * @tc.desc    Settings fresh model entries 560 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit560') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0561
     * @tc.name    SettingExceptionHandling561
     * @tc.desc    Settings fresh model entries 561 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit561') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0562
     * @tc.name    SettingExceptionHandling562
     * @tc.desc    Settings fresh model entries 562 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit562') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0563
     * @tc.name    SettingExceptionHandling563
     * @tc.desc    Settings fresh model entries 563 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit563') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0564
     * @tc.name    SettingExceptionHandling564
     * @tc.desc    Settings fresh model entries 564 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit564') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0565
     * @tc.name    SettingExceptionHandling565
     * @tc.desc    Settings fresh model entries 565 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit565') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0566
     * @tc.name    SettingExceptionHandling566
     * @tc.desc    Settings fresh model entries 566 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit566') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0567
     * @tc.name    SettingExceptionHandling567
     * @tc.desc    Settings fresh model entries 567 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit567') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0568
     * @tc.name    SettingExceptionHandling568
     * @tc.desc    Settings fresh model entries 568 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit568') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0569
     * @tc.name    SettingExceptionHandling569
     * @tc.desc    Settings fresh model entries 569 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit569') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0570
     * @tc.name    SettingExceptionHandling570
     * @tc.desc    Settings fresh model entries 570 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit570') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0571
     * @tc.name    SettingExceptionHandling571
     * @tc.desc    Settings fresh model entries 571 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit571') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0572
     * @tc.name    SettingExceptionHandling572
     * @tc.desc    Settings fresh model entries 572 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit572') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0573
     * @tc.name    SettingExceptionHandling573
     * @tc.desc    Settings fresh model entries 573 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit573') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0574
     * @tc.name    SettingExceptionHandling574
     * @tc.desc    Settings fresh model entries 574 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit574') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0575
     * @tc.name    SettingExceptionHandling575
     * @tc.desc    Settings fresh model entries 575 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit575') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0576
     * @tc.name    SettingExceptionHandling576
     * @tc.desc    Settings fresh model entries 576 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit576') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0577
     * @tc.name    SettingExceptionHandling577
     * @tc.desc    Settings fresh model entries 577 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit577') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0578
     * @tc.name    SettingExceptionHandling578
     * @tc.desc    Settings fresh model entries 578 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit578') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0579
     * @tc.name    SettingExceptionHandling579
     * @tc.desc    Settings fresh model entries 579 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit579') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0580
     * @tc.name    SettingExceptionHandling580
     * @tc.desc    Settings fresh model entries 580 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit580') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0581
     * @tc.name    SettingExceptionHandling581
     * @tc.desc    Settings fresh model entries 581 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit581') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0582
     * @tc.name    SettingExceptionHandling582
     * @tc.desc    Settings fresh model entries 582 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit582') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0583
     * @tc.name    SettingExceptionHandling583
     * @tc.desc    Settings fresh model entries 583 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit583') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0584
     * @tc.name    SettingExceptionHandling584
     * @tc.desc    Settings fresh model entries 584 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit584') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0585
     * @tc.name    SettingExceptionHandling585
     * @tc.desc    Settings fresh model entries 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit585') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0586
     * @tc.name    SettingExceptionHandling586
     * @tc.desc    Settings fresh model entries 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit586') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0587
     * @tc.name    SettingExceptionHandling587
     * @tc.desc    Settings fresh model entries 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit587') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0588
     * @tc.name    SettingExceptionHandling588
     * @tc.desc    Settings fresh model entries 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit588') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0589
     * @tc.name    SettingExceptionHandling589
     * @tc.desc    Settings fresh model entries 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit589') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0590
     * @tc.name    SettingExceptionHandling590
     * @tc.desc    Settings fresh model entries 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit590') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0591
     * @tc.name    SettingExceptionHandling591
     * @tc.desc    Settings fresh model entries 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit591') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0592
     * @tc.name    SettingExceptionHandling592
     * @tc.desc    Settings fresh model entries 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit592') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0593
     * @tc.name    SettingExceptionHandling593
     * @tc.desc    Settings fresh model entries 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit593') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0594
     * @tc.name    SettingExceptionHandling594
     * @tc.desc    Settings fresh model entries 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit594') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0595
     * @tc.name    SettingExceptionHandling595
     * @tc.desc    Settings fresh model entries 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit595') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0596
     * @tc.name    SettingExceptionHandling596
     * @tc.desc    Settings fresh model entries 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit596') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0597
     * @tc.name    SettingExceptionHandling597
     * @tc.desc    Settings fresh model entries 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit597') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0598
     * @tc.name    SettingExceptionHandling598
     * @tc.desc    Settings fresh model entries 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit598') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0599
     * @tc.name    SettingExceptionHandling599
     * @tc.desc    Settings fresh model entries 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit599') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0600
     * @tc.name    SettingExceptionHandling600
     * @tc.desc    Settings fresh model entries 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit600') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0601
     * @tc.name    SettingExceptionHandling601
     * @tc.desc    Settings fresh model entries 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit601') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0602
     * @tc.name    SettingExceptionHandling602
     * @tc.desc    Settings fresh model entries 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit602') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0603
     * @tc.name    SettingExceptionHandling603
     * @tc.desc    Settings fresh model entries 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit603') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0604
     * @tc.name    SettingExceptionHandling604
     * @tc.desc    Settings fresh model entries 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit604') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0605
     * @tc.name    SettingExceptionHandling605
     * @tc.desc    Settings fresh model entries 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit605') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0606
     * @tc.name    SettingExceptionHandling606
     * @tc.desc    Settings fresh model entries 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit606') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0607
     * @tc.name    SettingExceptionHandling607
     * @tc.desc    Settings fresh model entries 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit607') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0608
     * @tc.name    SettingExceptionHandling608
     * @tc.desc    Settings fresh model entries 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit608') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0609
     * @tc.name    SettingExceptionHandling609
     * @tc.desc    Settings fresh model entries 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit609') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0610
     * @tc.name    SettingExceptionHandling610
     * @tc.desc    Settings fresh model entries 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit610') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0611
     * @tc.name    SettingExceptionHandling611
     * @tc.desc    Settings fresh model entries 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit611') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0612
     * @tc.name    SettingExceptionHandling612
     * @tc.desc    Settings fresh model entries 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit612') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0613
     * @tc.name    SettingExceptionHandling613
     * @tc.desc    Settings fresh model entries 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit613') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0614
     * @tc.name    SettingExceptionHandling614
     * @tc.desc    Settings fresh model entries 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit614') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0615
     * @tc.name    SettingExceptionHandling615
     * @tc.desc    Settings fresh model entries 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit615') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0616
     * @tc.name    SettingExceptionHandling616
     * @tc.desc    Settings fresh model entries 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit616') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0617
     * @tc.name    SettingExceptionHandling617
     * @tc.desc    Settings fresh model entries 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit617') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0618
     * @tc.name    SettingExceptionHandling618
     * @tc.desc    Settings fresh model entries 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit618') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0619
     * @tc.name    SettingExceptionHandling619
     * @tc.desc    Settings fresh model entries 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit619') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0620
     * @tc.name    SettingExceptionHandling620
     * @tc.desc    Settings fresh model entries 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit620') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0621
     * @tc.name    SettingExceptionHandling621
     * @tc.desc    Settings fresh model entries 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit621') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0622
     * @tc.name    SettingExceptionHandling622
     * @tc.desc    Settings fresh model entries 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit622') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0623
     * @tc.name    SettingExceptionHandling623
     * @tc.desc    Settings fresh model entries 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit623') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0624
     * @tc.name    SettingExceptionHandling624
     * @tc.desc    Settings fresh model entries 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit624') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0625
     * @tc.name    SettingExceptionHandling625
     * @tc.desc    Settings fresh model entries 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit625') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0626
     * @tc.name    SettingExceptionHandling626
     * @tc.desc    Settings fresh model entries 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit626') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0627
     * @tc.name    SettingExceptionHandling627
     * @tc.desc    Settings fresh model entries 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit627') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0628
     * @tc.name    SettingExceptionHandling628
     * @tc.desc    Settings fresh model entries 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit628') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0629
     * @tc.name    SettingExceptionHandling629
     * @tc.desc    Settings fresh model entries 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit629') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0630
     * @tc.name    SettingExceptionHandling630
     * @tc.desc    Settings fresh model entries 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit630') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0631
     * @tc.name    SettingExceptionHandling631
     * @tc.desc    Settings fresh model entries 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit631') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0632
     * @tc.name    SettingExceptionHandling632
     * @tc.desc    Settings fresh model entries 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit632') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0633
     * @tc.name    SettingExceptionHandling633
     * @tc.desc    Settings fresh model entries 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit633') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0634
     * @tc.name    SettingExceptionHandling634
     * @tc.desc    Settings fresh model entries 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit634') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0635
     * @tc.name    SettingExceptionHandling635
     * @tc.desc    Settings fresh model entries 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit635') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0636
     * @tc.name    SettingExceptionHandling636
     * @tc.desc    Settings fresh model entries 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit636') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0637
     * @tc.name    SettingExceptionHandling637
     * @tc.desc    Settings fresh model entries 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit637') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0638
     * @tc.name    SettingExceptionHandling638
     * @tc.desc    Settings fresh model entries 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit638') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0639
     * @tc.name    SettingExceptionHandling639
     * @tc.desc    Settings fresh model entries 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit639') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0640
     * @tc.name    SettingExceptionHandling640
     * @tc.desc    Settings fresh model entries 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit640') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0641
     * @tc.name    SettingExceptionHandling641
     * @tc.desc    Settings fresh model entries 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit641') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0642
     * @tc.name    SettingExceptionHandling642
     * @tc.desc    Settings fresh model entries 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit642') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0643
     * @tc.name    SettingExceptionHandling643
     * @tc.desc    Settings fresh model entries 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit643') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0644
     * @tc.name    SettingExceptionHandling644
     * @tc.desc    Settings fresh model entries 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit644') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0645
     * @tc.name    SettingExceptionHandling645
     * @tc.desc    Settings fresh model entries 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit645') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0646
     * @tc.name    SettingExceptionHandling646
     * @tc.desc    Settings fresh model entries 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit646') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0647
     * @tc.name    SettingExceptionHandling647
     * @tc.desc    Settings fresh model entries 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit647') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0648
     * @tc.name    SettingExceptionHandling648
     * @tc.desc    Settings fresh model entries 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit648') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0649
     * @tc.name    SettingExceptionHandling649
     * @tc.desc    Settings fresh model entries 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit649') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0650
     * @tc.name    SettingExceptionHandling650
     * @tc.desc    Settings fresh model entries 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit650') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0651
     * @tc.name    SettingExceptionHandling651
     * @tc.desc    Settings fresh model entries 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit651') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0652
     * @tc.name    SettingExceptionHandling652
     * @tc.desc    Settings fresh model entries 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit652') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0653
     * @tc.name    SettingExceptionHandling653
     * @tc.desc    Settings fresh model entries 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit653') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0654
     * @tc.name    SettingExceptionHandling654
     * @tc.desc    Settings fresh model entries 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit654') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0655
     * @tc.name    SettingExceptionHandling655
     * @tc.desc    Settings fresh model entries 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit655') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0656
     * @tc.name    SettingExceptionHandling656
     * @tc.desc    Settings fresh model entries 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit656') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0657
     * @tc.name    SettingExceptionHandling657
     * @tc.desc    Settings fresh model entries 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit657') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0658
     * @tc.name    SettingExceptionHandling658
     * @tc.desc    Settings fresh model entries 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit658') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0659
     * @tc.name    SettingExceptionHandling659
     * @tc.desc    Settings fresh model entries 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit659') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0660
     * @tc.name    SettingExceptionHandling660
     * @tc.desc    Settings fresh model entries 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit660') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0661
     * @tc.name    SettingExceptionHandling661
     * @tc.desc    Settings fresh model entries 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit661') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0662
     * @tc.name    SettingExceptionHandling662
     * @tc.desc    Settings fresh model entries 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit662') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0663
     * @tc.name    SettingExceptionHandling663
     * @tc.desc    Settings fresh model entries 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit663') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0664
     * @tc.name    SettingExceptionHandling664
     * @tc.desc    Settings fresh model entries 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit664') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0665
     * @tc.name    SettingExceptionHandling665
     * @tc.desc    Settings fresh model entries 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit665') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0666
     * @tc.name    SettingExceptionHandling666
     * @tc.desc    Settings fresh model entries 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit666') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0667
     * @tc.name    SettingExceptionHandling667
     * @tc.desc    Settings fresh model entries 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit667') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0668
     * @tc.name    SettingExceptionHandling668
     * @tc.desc    Settings fresh model entries 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit668') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0669
     * @tc.name    SettingExceptionHandling669
     * @tc.desc    Settings fresh model entries 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit669') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0670
     * @tc.name    SettingExceptionHandling670
     * @tc.desc    Settings fresh model entries 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit670') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0671
     * @tc.name    SettingExceptionHandling671
     * @tc.desc    Settings fresh model entries 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit671') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0672
     * @tc.name    SettingExceptionHandling672
     * @tc.desc    Settings fresh model entries 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit672') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0673
     * @tc.name    SettingExceptionHandling673
     * @tc.desc    Settings fresh model entries 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit673') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0674
     * @tc.name    SettingExceptionHandling674
     * @tc.desc    Settings fresh model entries 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit674') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0675
     * @tc.name    SettingExceptionHandling675
     * @tc.desc    Settings fresh model entries 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit675') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0676
     * @tc.name    SettingExceptionHandling676
     * @tc.desc    Settings fresh model entries 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit676') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0677
     * @tc.name    SettingExceptionHandling677
     * @tc.desc    Settings fresh model entries 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit677') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0678
     * @tc.name    SettingExceptionHandling678
     * @tc.desc    Settings fresh model entries 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit678') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0679
     * @tc.name    SettingExceptionHandling679
     * @tc.desc    Settings fresh model entries 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit679') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0680
     * @tc.name    SettingExceptionHandling680
     * @tc.desc    Settings fresh model entries 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit680') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0681
     * @tc.name    SettingExceptionHandling681
     * @tc.desc    Settings fresh model entries 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit681') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0682
     * @tc.name    SettingExceptionHandling682
     * @tc.desc    Settings fresh model entries 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit682') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0683
     * @tc.name    SettingExceptionHandling683
     * @tc.desc    Settings fresh model entries 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit683') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0684
     * @tc.name    SettingExceptionHandling684
     * @tc.desc    Settings fresh model entries 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit684') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0685
     * @tc.name    SettingExceptionHandling685
     * @tc.desc    Settings fresh model entries 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit685') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0686
     * @tc.name    SettingExceptionHandling686
     * @tc.desc    Settings fresh model entries 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit686') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0687
     * @tc.name    SettingExceptionHandling687
     * @tc.desc    Settings fresh model entries 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit687') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0688
     * @tc.name    SettingExceptionHandling688
     * @tc.desc    Settings fresh model entries 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit688') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0689
     * @tc.name    SettingExceptionHandling689
     * @tc.desc    Settings fresh model entries 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit689') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0690
     * @tc.name    SettingExceptionHandling690
     * @tc.desc    Settings fresh model entries 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit690') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0691
     * @tc.name    SettingExceptionHandling691
     * @tc.desc    Settings fresh model entries 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit691') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0692
     * @tc.name    SettingExceptionHandling692
     * @tc.desc    Settings fresh model entries 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit692') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0693
     * @tc.name    SettingExceptionHandling693
     * @tc.desc    Settings fresh model entries 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit693') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0694
     * @tc.name    SettingExceptionHandling694
     * @tc.desc    Settings fresh model entries 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit694') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0695
     * @tc.name    SettingExceptionHandling695
     * @tc.desc    Settings fresh model entries 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit695') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0696
     * @tc.name    SettingExceptionHandling696
     * @tc.desc    Settings fresh model entries 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit696') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0697
     * @tc.name    SettingExceptionHandling697
     * @tc.desc    Settings fresh model entries 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit697') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0698
     * @tc.name    SettingExceptionHandling698
     * @tc.desc    Settings fresh model entries 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit698') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0699
     * @tc.name    SettingExceptionHandling699
     * @tc.desc    Settings fresh model entries 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit699') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0700
     * @tc.name    SettingExceptionHandling700
     * @tc.desc    Settings fresh model entries 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit700') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0701
     * @tc.name    SettingExceptionHandling701
     * @tc.desc    Settings fresh model entries 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit701') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0702
     * @tc.name    SettingExceptionHandling702
     * @tc.desc    Settings fresh model entries 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit702') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0703
     * @tc.name    SettingExceptionHandling703
     * @tc.desc    Settings fresh model entries 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit703') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0704
     * @tc.name    SettingExceptionHandling704
     * @tc.desc    Settings fresh model entries 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit704') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0705
     * @tc.name    SettingExceptionHandling705
     * @tc.desc    Settings fresh model entries 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit705') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0706
     * @tc.name    SettingExceptionHandling706
     * @tc.desc    Settings fresh model entries 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit706') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0707
     * @tc.name    SettingExceptionHandling707
     * @tc.desc    Settings fresh model entries 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit707') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0708
     * @tc.name    SettingExceptionHandling708
     * @tc.desc    Settings fresh model entries 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit708') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0709
     * @tc.name    SettingExceptionHandling709
     * @tc.desc    Settings fresh model entries 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit709') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0710
     * @tc.name    SettingExceptionHandling710
     * @tc.desc    Settings fresh model entries 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit710') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0711
     * @tc.name    SettingExceptionHandling711
     * @tc.desc    Settings fresh model entries 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit711') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0712
     * @tc.name    SettingExceptionHandling712
     * @tc.desc    Settings fresh model entries 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit712') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0713
     * @tc.name    SettingExceptionHandling713
     * @tc.desc    Settings fresh model entries 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit713') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0714
     * @tc.name    SettingExceptionHandling714
     * @tc.desc    Settings fresh model entries 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit714') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0715
     * @tc.name    SettingExceptionHandling715
     * @tc.desc    Settings fresh model entries 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit715') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0716
     * @tc.name    SettingExceptionHandling716
     * @tc.desc    Settings fresh model entries 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit716') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0717
     * @tc.name    SettingExceptionHandling717
     * @tc.desc    Settings fresh model entries 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit717') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0718
     * @tc.name    SettingExceptionHandling718
     * @tc.desc    Settings fresh model entries 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit718') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0719
     * @tc.name    SettingExceptionHandling719
     * @tc.desc    Settings fresh model entries 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit719') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0720
     * @tc.name    SettingExceptionHandling720
     * @tc.desc    Settings fresh model entries 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit720') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0721
     * @tc.name    SettingExceptionHandling721
     * @tc.desc    Settings fresh model entries 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit721') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0722
     * @tc.name    SettingExceptionHandling722
     * @tc.desc    Settings fresh model entries 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit722') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0723
     * @tc.name    SettingExceptionHandling723
     * @tc.desc    Settings fresh model entries 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit723') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0724
     * @tc.name    SettingExceptionHandling724
     * @tc.desc    Settings fresh model entries 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit724') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0725
     * @tc.name    SettingExceptionHandling725
     * @tc.desc    Settings fresh model entries 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit725') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0726
     * @tc.name    SettingExceptionHandling726
     * @tc.desc    Settings fresh model entries 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit726') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0727
     * @tc.name    SettingExceptionHandling727
     * @tc.desc    Settings fresh model entries 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit727') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0728
     * @tc.name    SettingExceptionHandling728
     * @tc.desc    Settings fresh model entries 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit728') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0729
     * @tc.name    SettingExceptionHandling729
     * @tc.desc    Settings fresh model entries 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit729') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0730
     * @tc.name    SettingExceptionHandling730
     * @tc.desc    Settings fresh model entries 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit730') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0731
     * @tc.name    SettingExceptionHandling731
     * @tc.desc    Settings fresh model entries 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit731') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0732
     * @tc.name    SettingExceptionHandling732
     * @tc.desc    Settings fresh model entries 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit732') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0733
     * @tc.name    SettingExceptionHandling733
     * @tc.desc    Settings fresh model entries 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit733') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0734
     * @tc.name    SettingExceptionHandling734
     * @tc.desc    Settings fresh model entries 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit734') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0735
     * @tc.name    SettingExceptionHandling735
     * @tc.desc    Settings fresh model entries 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit735') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0736
     * @tc.name    SettingExceptionHandling736
     * @tc.desc    Settings fresh model entries 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit736') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0737
     * @tc.name    SettingExceptionHandling737
     * @tc.desc    Settings fresh model entries 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit737') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0738
     * @tc.name    SettingExceptionHandling738
     * @tc.desc    Settings fresh model entries 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit738') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0739
     * @tc.name    SettingExceptionHandling739
     * @tc.desc    Settings fresh model entries 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit739') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0740
     * @tc.name    SettingExceptionHandling740
     * @tc.desc    Settings fresh model entries 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit740') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0741
     * @tc.name    SettingExceptionHandling741
     * @tc.desc    Settings fresh model entries 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit741') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0742
     * @tc.name    SettingExceptionHandling742
     * @tc.desc    Settings fresh model entries 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit742') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0743
     * @tc.name    SettingExceptionHandling743
     * @tc.desc    Settings fresh model entries 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit743') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0744
     * @tc.name    SettingExceptionHandling744
     * @tc.desc    Settings fresh model entries 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit744') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0745
     * @tc.name    SettingExceptionHandling745
     * @tc.desc    Settings fresh model entries 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[1].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit745') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0746
     * @tc.name    SettingExceptionHandling746
     * @tc.desc    Settings fresh model entries 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[2].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit746') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0747
     * @tc.name    SettingExceptionHandling747
     * @tc.desc    Settings fresh model entries 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[3].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit747') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0748
     * @tc.name    SettingExceptionHandling748
     * @tc.desc    Settings fresh model entries 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingExceptionHandling748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: SettingsModel = new SettingsModel();
      expect(local.getItemCount()).assertEqual(m.getItemCount());
      expect(local.hasUniqueKeys()).assertEqual(true);
      expect(local.getEntry(m.getEntries()[0].key) !== undefined).assertEqual(true);
      expect(m.getEntry('nohit748') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
