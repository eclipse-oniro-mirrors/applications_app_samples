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

export default function settingUISuite() {
  describe('SettingUISuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0001
     * @tc.name    SettingUI001
     * @tc.desc    Settings entry lookup 1 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit1') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0002
     * @tc.name    SettingUI002
     * @tc.desc    Settings entry lookup 2 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit2') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0003
     * @tc.name    SettingUI003
     * @tc.desc    Settings entry lookup 3 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit3') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0004
     * @tc.name    SettingUI004
     * @tc.desc    Settings entry lookup 0 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit4') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0005
     * @tc.name    SettingUI005
     * @tc.desc    Settings entry lookup 1 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit5') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0006
     * @tc.name    SettingUI006
     * @tc.desc    Settings entry lookup 2 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit6') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0007
     * @tc.name    SettingUI007
     * @tc.desc    Settings entry lookup 3 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit7') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0008
     * @tc.name    SettingUI008
     * @tc.desc    Settings entry lookup 0 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit8') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0009
     * @tc.name    SettingUI009
     * @tc.desc    Settings entry lookup 1 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit9') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0010
     * @tc.name    SettingUI010
     * @tc.desc    Settings entry lookup 2 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit10') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0011
     * @tc.name    SettingUI011
     * @tc.desc    Settings entry lookup 3 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit11') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0012
     * @tc.name    SettingUI012
     * @tc.desc    Settings entry lookup 0 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit12') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0013
     * @tc.name    SettingUI013
     * @tc.desc    Settings entry lookup 1 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit13') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0014
     * @tc.name    SettingUI014
     * @tc.desc    Settings entry lookup 2 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit14') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0015
     * @tc.name    SettingUI015
     * @tc.desc    Settings entry lookup 3 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit15') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0016
     * @tc.name    SettingUI016
     * @tc.desc    Settings entry lookup 0 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit16') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0017
     * @tc.name    SettingUI017
     * @tc.desc    Settings entry lookup 1 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit17') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0018
     * @tc.name    SettingUI018
     * @tc.desc    Settings entry lookup 2 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit18') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0019
     * @tc.name    SettingUI019
     * @tc.desc    Settings entry lookup 3 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit19') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0020
     * @tc.name    SettingUI020
     * @tc.desc    Settings entry lookup 0 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit20') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0021
     * @tc.name    SettingUI021
     * @tc.desc    Settings entry lookup 1 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit21') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0022
     * @tc.name    SettingUI022
     * @tc.desc    Settings entry lookup 2 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit22') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0023
     * @tc.name    SettingUI023
     * @tc.desc    Settings entry lookup 3 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit23') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0024
     * @tc.name    SettingUI024
     * @tc.desc    Settings entry lookup 0 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit24') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0025
     * @tc.name    SettingUI025
     * @tc.desc    Settings entry lookup 1 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit25') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0026
     * @tc.name    SettingUI026
     * @tc.desc    Settings entry lookup 2 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit26') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0027
     * @tc.name    SettingUI027
     * @tc.desc    Settings entry lookup 3 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit27') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0028
     * @tc.name    SettingUI028
     * @tc.desc    Settings entry lookup 0 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit28') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0029
     * @tc.name    SettingUI029
     * @tc.desc    Settings entry lookup 1 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit29') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0030
     * @tc.name    SettingUI030
     * @tc.desc    Settings entry lookup 2 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit30') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0031
     * @tc.name    SettingUI031
     * @tc.desc    Settings entry lookup 3 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit31') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0032
     * @tc.name    SettingUI032
     * @tc.desc    Settings entry lookup 0 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit32') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0033
     * @tc.name    SettingUI033
     * @tc.desc    Settings entry lookup 1 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit33') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0034
     * @tc.name    SettingUI034
     * @tc.desc    Settings entry lookup 2 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit34') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0035
     * @tc.name    SettingUI035
     * @tc.desc    Settings entry lookup 3 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit35') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0036
     * @tc.name    SettingUI036
     * @tc.desc    Settings entry lookup 0 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit36') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0037
     * @tc.name    SettingUI037
     * @tc.desc    Settings entry lookup 1 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit37') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0038
     * @tc.name    SettingUI038
     * @tc.desc    Settings entry lookup 2 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit38') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0039
     * @tc.name    SettingUI039
     * @tc.desc    Settings entry lookup 3 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit39') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0040
     * @tc.name    SettingUI040
     * @tc.desc    Settings entry lookup 0 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit40') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0041
     * @tc.name    SettingUI041
     * @tc.desc    Settings entry lookup 1 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit41') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0042
     * @tc.name    SettingUI042
     * @tc.desc    Settings entry lookup 2 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit42') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0043
     * @tc.name    SettingUI043
     * @tc.desc    Settings entry lookup 3 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit43') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0044
     * @tc.name    SettingUI044
     * @tc.desc    Settings entry lookup 0 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit44') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0045
     * @tc.name    SettingUI045
     * @tc.desc    Settings entry lookup 1 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit45') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0046
     * @tc.name    SettingUI046
     * @tc.desc    Settings entry lookup 2 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit46') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0047
     * @tc.name    SettingUI047
     * @tc.desc    Settings entry lookup 3 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit47') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0048
     * @tc.name    SettingUI048
     * @tc.desc    Settings entry lookup 0 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit48') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0049
     * @tc.name    SettingUI049
     * @tc.desc    Settings entry lookup 1 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit49') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0050
     * @tc.name    SettingUI050
     * @tc.desc    Settings entry lookup 2 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit50') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0051
     * @tc.name    SettingUI051
     * @tc.desc    Settings entry lookup 3 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit51') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0052
     * @tc.name    SettingUI052
     * @tc.desc    Settings entry lookup 0 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit52') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0053
     * @tc.name    SettingUI053
     * @tc.desc    Settings entry lookup 1 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit53') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0054
     * @tc.name    SettingUI054
     * @tc.desc    Settings entry lookup 2 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit54') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0055
     * @tc.name    SettingUI055
     * @tc.desc    Settings entry lookup 3 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit55') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0056
     * @tc.name    SettingUI056
     * @tc.desc    Settings entry lookup 0 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit56') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0057
     * @tc.name    SettingUI057
     * @tc.desc    Settings entry lookup 1 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit57') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0058
     * @tc.name    SettingUI058
     * @tc.desc    Settings entry lookup 2 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit58') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0059
     * @tc.name    SettingUI059
     * @tc.desc    Settings entry lookup 3 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit59') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0060
     * @tc.name    SettingUI060
     * @tc.desc    Settings entry lookup 0 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit60') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0061
     * @tc.name    SettingUI061
     * @tc.desc    Settings entry lookup 1 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit61') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0062
     * @tc.name    SettingUI062
     * @tc.desc    Settings entry lookup 2 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit62') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0063
     * @tc.name    SettingUI063
     * @tc.desc    Settings entry lookup 3 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit63') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0064
     * @tc.name    SettingUI064
     * @tc.desc    Settings entry lookup 0 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit64') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0065
     * @tc.name    SettingUI065
     * @tc.desc    Settings entry lookup 1 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit65') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0066
     * @tc.name    SettingUI066
     * @tc.desc    Settings entry lookup 2 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit66') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0067
     * @tc.name    SettingUI067
     * @tc.desc    Settings entry lookup 3 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit67') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0068
     * @tc.name    SettingUI068
     * @tc.desc    Settings entry lookup 0 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit68') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0069
     * @tc.name    SettingUI069
     * @tc.desc    Settings entry lookup 1 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit69') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0070
     * @tc.name    SettingUI070
     * @tc.desc    Settings entry lookup 2 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit70') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0071
     * @tc.name    SettingUI071
     * @tc.desc    Settings entry lookup 3 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit71') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0072
     * @tc.name    SettingUI072
     * @tc.desc    Settings entry lookup 0 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit72') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0073
     * @tc.name    SettingUI073
     * @tc.desc    Settings entry lookup 1 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit73') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0074
     * @tc.name    SettingUI074
     * @tc.desc    Settings entry lookup 2 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit74') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0075
     * @tc.name    SettingUI075
     * @tc.desc    Settings entry lookup 3 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit75') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0076
     * @tc.name    SettingUI076
     * @tc.desc    Settings entry lookup 0 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit76') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0077
     * @tc.name    SettingUI077
     * @tc.desc    Settings entry lookup 1 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit77') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0078
     * @tc.name    SettingUI078
     * @tc.desc    Settings entry lookup 2 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit78') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0079
     * @tc.name    SettingUI079
     * @tc.desc    Settings entry lookup 3 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit79') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0080
     * @tc.name    SettingUI080
     * @tc.desc    Settings entry lookup 0 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit80') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0081
     * @tc.name    SettingUI081
     * @tc.desc    Settings entry lookup 1 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit81') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0082
     * @tc.name    SettingUI082
     * @tc.desc    Settings entry lookup 2 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit82') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0083
     * @tc.name    SettingUI083
     * @tc.desc    Settings entry lookup 3 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit83') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0084
     * @tc.name    SettingUI084
     * @tc.desc    Settings entry lookup 0 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit84') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0085
     * @tc.name    SettingUI085
     * @tc.desc    Settings entry lookup 1 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit85') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0086
     * @tc.name    SettingUI086
     * @tc.desc    Settings entry lookup 2 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit86') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0087
     * @tc.name    SettingUI087
     * @tc.desc    Settings entry lookup 3 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit87') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0088
     * @tc.name    SettingUI088
     * @tc.desc    Settings entry lookup 0 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit88') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0089
     * @tc.name    SettingUI089
     * @tc.desc    Settings entry lookup 1 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit89') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0090
     * @tc.name    SettingUI090
     * @tc.desc    Settings entry lookup 2 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit90') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0091
     * @tc.name    SettingUI091
     * @tc.desc    Settings entry lookup 3 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit91') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0092
     * @tc.name    SettingUI092
     * @tc.desc    Settings entry lookup 0 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit92') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0093
     * @tc.name    SettingUI093
     * @tc.desc    Settings entry lookup 1 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit93') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0094
     * @tc.name    SettingUI094
     * @tc.desc    Settings entry lookup 2 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit94') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0095
     * @tc.name    SettingUI095
     * @tc.desc    Settings entry lookup 3 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit95') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0096
     * @tc.name    SettingUI096
     * @tc.desc    Settings entry lookup 0 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit96') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0097
     * @tc.name    SettingUI097
     * @tc.desc    Settings entry lookup 1 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit97') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0098
     * @tc.name    SettingUI098
     * @tc.desc    Settings entry lookup 2 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit98') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0099
     * @tc.name    SettingUI099
     * @tc.desc    Settings entry lookup 3 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit99') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0100
     * @tc.name    SettingUI100
     * @tc.desc    Settings entry lookup 0 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit100') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0101
     * @tc.name    SettingUI101
     * @tc.desc    Settings entry lookup 1 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit101') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0102
     * @tc.name    SettingUI102
     * @tc.desc    Settings entry lookup 2 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit102') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0103
     * @tc.name    SettingUI103
     * @tc.desc    Settings entry lookup 3 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit103') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0104
     * @tc.name    SettingUI104
     * @tc.desc    Settings entry lookup 0 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit104') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0105
     * @tc.name    SettingUI105
     * @tc.desc    Settings entry lookup 1 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit105') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0106
     * @tc.name    SettingUI106
     * @tc.desc    Settings entry lookup 2 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit106') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0107
     * @tc.name    SettingUI107
     * @tc.desc    Settings entry lookup 3 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit107') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0108
     * @tc.name    SettingUI108
     * @tc.desc    Settings entry lookup 0 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit108') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0109
     * @tc.name    SettingUI109
     * @tc.desc    Settings entry lookup 1 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingUI109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const entry = m.getEntry(key);
      expect(entry !== undefined).assertEqual(true);
      expect(m.getEntry('nohit109') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
