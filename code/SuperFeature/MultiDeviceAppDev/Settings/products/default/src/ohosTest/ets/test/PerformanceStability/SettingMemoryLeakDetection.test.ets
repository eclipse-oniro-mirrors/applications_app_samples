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

export default function settingMemoryLeakDetectionSuite() {
  describe('SettingMemoryLeakDetectionSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0771
     * @tc.name    SettingMemoryLeakDetection771
     * @tc.desc    Settings repeated entry scan 771 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit771') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0772
     * @tc.name    SettingMemoryLeakDetection772
     * @tc.desc    Settings repeated entry scan 772 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit772') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0773
     * @tc.name    SettingMemoryLeakDetection773
     * @tc.desc    Settings repeated entry scan 773 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit773') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0774
     * @tc.name    SettingMemoryLeakDetection774
     * @tc.desc    Settings repeated entry scan 774 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit774') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0775
     * @tc.name    SettingMemoryLeakDetection775
     * @tc.desc    Settings repeated entry scan 775 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit775') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0776
     * @tc.name    SettingMemoryLeakDetection776
     * @tc.desc    Settings repeated entry scan 776 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit776') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0777
     * @tc.name    SettingMemoryLeakDetection777
     * @tc.desc    Settings repeated entry scan 777 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit777') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0778
     * @tc.name    SettingMemoryLeakDetection778
     * @tc.desc    Settings repeated entry scan 778 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit778') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0779
     * @tc.name    SettingMemoryLeakDetection779
     * @tc.desc    Settings repeated entry scan 779 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit779') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0780
     * @tc.name    SettingMemoryLeakDetection780
     * @tc.desc    Settings repeated entry scan 780 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit780') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0781
     * @tc.name    SettingMemoryLeakDetection781
     * @tc.desc    Settings repeated entry scan 781 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit781') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0782
     * @tc.name    SettingMemoryLeakDetection782
     * @tc.desc    Settings repeated entry scan 782 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit782') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0783
     * @tc.name    SettingMemoryLeakDetection783
     * @tc.desc    Settings repeated entry scan 783 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit783') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0784
     * @tc.name    SettingMemoryLeakDetection784
     * @tc.desc    Settings repeated entry scan 784 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit784') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0785
     * @tc.name    SettingMemoryLeakDetection785
     * @tc.desc    Settings repeated entry scan 785 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit785') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0786
     * @tc.name    SettingMemoryLeakDetection786
     * @tc.desc    Settings repeated entry scan 786 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit786') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0787
     * @tc.name    SettingMemoryLeakDetection787
     * @tc.desc    Settings repeated entry scan 787 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit787') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0788
     * @tc.name    SettingMemoryLeakDetection788
     * @tc.desc    Settings repeated entry scan 788 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit788') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0789
     * @tc.name    SettingMemoryLeakDetection789
     * @tc.desc    Settings repeated entry scan 789 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit789') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0790
     * @tc.name    SettingMemoryLeakDetection790
     * @tc.desc    Settings repeated entry scan 790 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit790') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0791
     * @tc.name    SettingMemoryLeakDetection791
     * @tc.desc    Settings repeated entry scan 791 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit791') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0792
     * @tc.name    SettingMemoryLeakDetection792
     * @tc.desc    Settings repeated entry scan 792 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit792') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0793
     * @tc.name    SettingMemoryLeakDetection793
     * @tc.desc    Settings repeated entry scan 793 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit793') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0794
     * @tc.name    SettingMemoryLeakDetection794
     * @tc.desc    Settings repeated entry scan 794 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit794') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0795
     * @tc.name    SettingMemoryLeakDetection795
     * @tc.desc    Settings repeated entry scan 795 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit795') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0796
     * @tc.name    SettingMemoryLeakDetection796
     * @tc.desc    Settings repeated entry scan 796 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit796') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0797
     * @tc.name    SettingMemoryLeakDetection797
     * @tc.desc    Settings repeated entry scan 797 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit797') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0798
     * @tc.name    SettingMemoryLeakDetection798
     * @tc.desc    Settings repeated entry scan 798 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit798') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0799
     * @tc.name    SettingMemoryLeakDetection799
     * @tc.desc    Settings repeated entry scan 799 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit799') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0800
     * @tc.name    SettingMemoryLeakDetection800
     * @tc.desc    Settings repeated entry scan 800 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit800') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0801
     * @tc.name    SettingMemoryLeakDetection801
     * @tc.desc    Settings repeated entry scan 801 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit801') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0802
     * @tc.name    SettingMemoryLeakDetection802
     * @tc.desc    Settings repeated entry scan 802 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit802') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0803
     * @tc.name    SettingMemoryLeakDetection803
     * @tc.desc    Settings repeated entry scan 803 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit803') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0804
     * @tc.name    SettingMemoryLeakDetection804
     * @tc.desc    Settings repeated entry scan 804 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit804') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0805
     * @tc.name    SettingMemoryLeakDetection805
     * @tc.desc    Settings repeated entry scan 805 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit805') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0806
     * @tc.name    SettingMemoryLeakDetection806
     * @tc.desc    Settings repeated entry scan 806 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit806') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0807
     * @tc.name    SettingMemoryLeakDetection807
     * @tc.desc    Settings repeated entry scan 807 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit807') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0808
     * @tc.name    SettingMemoryLeakDetection808
     * @tc.desc    Settings repeated entry scan 808 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit808') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0809
     * @tc.name    SettingMemoryLeakDetection809
     * @tc.desc    Settings repeated entry scan 809 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit809') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0810
     * @tc.name    SettingMemoryLeakDetection810
     * @tc.desc    Settings repeated entry scan 810 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit810') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0811
     * @tc.name    SettingMemoryLeakDetection811
     * @tc.desc    Settings repeated entry scan 811 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit811') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0812
     * @tc.name    SettingMemoryLeakDetection812
     * @tc.desc    Settings repeated entry scan 812 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit812') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0813
     * @tc.name    SettingMemoryLeakDetection813
     * @tc.desc    Settings repeated entry scan 813 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit813') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0814
     * @tc.name    SettingMemoryLeakDetection814
     * @tc.desc    Settings repeated entry scan 814 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit814') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0815
     * @tc.name    SettingMemoryLeakDetection815
     * @tc.desc    Settings repeated entry scan 815 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit815') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0816
     * @tc.name    SettingMemoryLeakDetection816
     * @tc.desc    Settings repeated entry scan 816 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 0) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit816') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0817
     * @tc.name    SettingMemoryLeakDetection817
     * @tc.desc    Settings repeated entry scan 817 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 1) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit817') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0818
     * @tc.name    SettingMemoryLeakDetection818
     * @tc.desc    Settings repeated entry scan 818 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 2) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit818') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0819
     * @tc.name    SettingMemoryLeakDetection819
     * @tc.desc    Settings repeated entry scan 819 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingMemoryLeakDetection819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getEntries().length; k++) {
        expect(m.getEntry(m.getEntries()[(k + 3) % m.getItemCount()].key) !== undefined).assertEqual(true);
      }
      expect(m.getEntry('nohit819') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

