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

export default function settingAccessibilityNavigationSuite() {
  describe('SettingAccessibilityNavigationSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0162
     * @tc.name    SettingAccessibilityNavigation162
     * @tc.desc    Settings toggle effect 2 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit162') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0163
     * @tc.name    SettingAccessibilityNavigation163
     * @tc.desc    Settings toggle effect 3 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit163') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0164
     * @tc.name    SettingAccessibilityNavigation164
     * @tc.desc    Settings toggle effect 0 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit164') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0165
     * @tc.name    SettingAccessibilityNavigation165
     * @tc.desc    Settings toggle effect 1 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit165') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0166
     * @tc.name    SettingAccessibilityNavigation166
     * @tc.desc    Settings toggle effect 2 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit166') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0167
     * @tc.name    SettingAccessibilityNavigation167
     * @tc.desc    Settings toggle effect 3 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit167') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0168
     * @tc.name    SettingAccessibilityNavigation168
     * @tc.desc    Settings toggle effect 0 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit168') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0169
     * @tc.name    SettingAccessibilityNavigation169
     * @tc.desc    Settings toggle effect 1 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit169') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0170
     * @tc.name    SettingAccessibilityNavigation170
     * @tc.desc    Settings toggle effect 2 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit170') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0171
     * @tc.name    SettingAccessibilityNavigation171
     * @tc.desc    Settings toggle effect 3 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit171') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0172
     * @tc.name    SettingAccessibilityNavigation172
     * @tc.desc    Settings toggle effect 0 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit172') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0173
     * @tc.name    SettingAccessibilityNavigation173
     * @tc.desc    Settings toggle effect 1 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit173') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0174
     * @tc.name    SettingAccessibilityNavigation174
     * @tc.desc    Settings toggle effect 2 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit174') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0175
     * @tc.name    SettingAccessibilityNavigation175
     * @tc.desc    Settings toggle effect 3 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit175') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0176
     * @tc.name    SettingAccessibilityNavigation176
     * @tc.desc    Settings toggle effect 0 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit176') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0177
     * @tc.name    SettingAccessibilityNavigation177
     * @tc.desc    Settings toggle effect 1 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit177') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0178
     * @tc.name    SettingAccessibilityNavigation178
     * @tc.desc    Settings toggle effect 2 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit178') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0179
     * @tc.name    SettingAccessibilityNavigation179
     * @tc.desc    Settings toggle effect 3 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit179') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0180
     * @tc.name    SettingAccessibilityNavigation180
     * @tc.desc    Settings toggle effect 0 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit180') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0181
     * @tc.name    SettingAccessibilityNavigation181
     * @tc.desc    Settings toggle effect 1 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit181') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0182
     * @tc.name    SettingAccessibilityNavigation182
     * @tc.desc    Settings toggle effect 2 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit182') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0183
     * @tc.name    SettingAccessibilityNavigation183
     * @tc.desc    Settings toggle effect 3 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit183') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0184
     * @tc.name    SettingAccessibilityNavigation184
     * @tc.desc    Settings toggle effect 0 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit184') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0185
     * @tc.name    SettingAccessibilityNavigation185
     * @tc.desc    Settings toggle effect 1 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit185') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0186
     * @tc.name    SettingAccessibilityNavigation186
     * @tc.desc    Settings toggle effect 2 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit186') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0187
     * @tc.name    SettingAccessibilityNavigation187
     * @tc.desc    Settings toggle effect 3 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit187') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0188
     * @tc.name    SettingAccessibilityNavigation188
     * @tc.desc    Settings toggle effect 0 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit188') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0189
     * @tc.name    SettingAccessibilityNavigation189
     * @tc.desc    Settings toggle effect 1 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit189') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0190
     * @tc.name    SettingAccessibilityNavigation190
     * @tc.desc    Settings toggle effect 2 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit190') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0191
     * @tc.name    SettingAccessibilityNavigation191
     * @tc.desc    Settings toggle effect 3 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit191') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0192
     * @tc.name    SettingAccessibilityNavigation192
     * @tc.desc    Settings toggle effect 0 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit192') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0193
     * @tc.name    SettingAccessibilityNavigation193
     * @tc.desc    Settings toggle effect 1 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit193') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0194
     * @tc.name    SettingAccessibilityNavigation194
     * @tc.desc    Settings toggle effect 2 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit194') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0195
     * @tc.name    SettingAccessibilityNavigation195
     * @tc.desc    Settings toggle effect 3 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit195') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0196
     * @tc.name    SettingAccessibilityNavigation196
     * @tc.desc    Settings toggle effect 0 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit196') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0197
     * @tc.name    SettingAccessibilityNavigation197
     * @tc.desc    Settings toggle effect 1 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit197') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0198
     * @tc.name    SettingAccessibilityNavigation198
     * @tc.desc    Settings toggle effect 2 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit198') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0199
     * @tc.name    SettingAccessibilityNavigation199
     * @tc.desc    Settings toggle effect 3 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit199') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0200
     * @tc.name    SettingAccessibilityNavigation200
     * @tc.desc    Settings toggle effect 0 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit200') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0201
     * @tc.name    SettingAccessibilityNavigation201
     * @tc.desc    Settings toggle effect 1 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit201') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0202
     * @tc.name    SettingAccessibilityNavigation202
     * @tc.desc    Settings toggle effect 2 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit202') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0203
     * @tc.name    SettingAccessibilityNavigation203
     * @tc.desc    Settings toggle effect 3 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit203') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0204
     * @tc.name    SettingAccessibilityNavigation204
     * @tc.desc    Settings toggle effect 0 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit204') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0205
     * @tc.name    SettingAccessibilityNavigation205
     * @tc.desc    Settings toggle effect 1 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit205') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0206
     * @tc.name    SettingAccessibilityNavigation206
     * @tc.desc    Settings toggle effect 2 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit206') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0207
     * @tc.name    SettingAccessibilityNavigation207
     * @tc.desc    Settings toggle effect 3 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit207') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0208
     * @tc.name    SettingAccessibilityNavigation208
     * @tc.desc    Settings toggle effect 0 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit208') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0209
     * @tc.name    SettingAccessibilityNavigation209
     * @tc.desc    Settings toggle effect 1 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit209') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0210
     * @tc.name    SettingAccessibilityNavigation210
     * @tc.desc    Settings toggle effect 2 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit210') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0211
     * @tc.name    SettingAccessibilityNavigation211
     * @tc.desc    Settings toggle effect 3 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit211') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0212
     * @tc.name    SettingAccessibilityNavigation212
     * @tc.desc    Settings toggle effect 0 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit212') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0213
     * @tc.name    SettingAccessibilityNavigation213
     * @tc.desc    Settings toggle effect 1 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit213') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0214
     * @tc.name    SettingAccessibilityNavigation214
     * @tc.desc    Settings toggle effect 2 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit214') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0215
     * @tc.name    SettingAccessibilityNavigation215
     * @tc.desc    Settings toggle effect 3 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit215') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0216
     * @tc.name    SettingAccessibilityNavigation216
     * @tc.desc    Settings toggle effect 0 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit216') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0217
     * @tc.name    SettingAccessibilityNavigation217
     * @tc.desc    Settings toggle effect 1 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit217') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0218
     * @tc.name    SettingAccessibilityNavigation218
     * @tc.desc    Settings toggle effect 2 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit218') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0219
     * @tc.name    SettingAccessibilityNavigation219
     * @tc.desc    Settings toggle effect 3 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit219') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0220
     * @tc.name    SettingAccessibilityNavigation220
     * @tc.desc    Settings toggle effect 0 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit220') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0221
     * @tc.name    SettingAccessibilityNavigation221
     * @tc.desc    Settings toggle effect 1 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit221') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0222
     * @tc.name    SettingAccessibilityNavigation222
     * @tc.desc    Settings toggle effect 2 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit222') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0223
     * @tc.name    SettingAccessibilityNavigation223
     * @tc.desc    Settings toggle effect 3 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit223') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0224
     * @tc.name    SettingAccessibilityNavigation224
     * @tc.desc    Settings toggle effect 0 probe 224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit224') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0225
     * @tc.name    SettingAccessibilityNavigation225
     * @tc.desc    Settings toggle effect 1 probe 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit225') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0226
     * @tc.name    SettingAccessibilityNavigation226
     * @tc.desc    Settings toggle effect 2 probe 226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit226') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0227
     * @tc.name    SettingAccessibilityNavigation227
     * @tc.desc    Settings toggle effect 3 probe 227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit227') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0228
     * @tc.name    SettingAccessibilityNavigation228
     * @tc.desc    Settings toggle effect 0 probe 228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit228') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0229
     * @tc.name    SettingAccessibilityNavigation229
     * @tc.desc    Settings toggle effect 1 probe 229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit229') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0230
     * @tc.name    SettingAccessibilityNavigation230
     * @tc.desc    Settings toggle effect 2 probe 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit230') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0231
     * @tc.name    SettingAccessibilityNavigation231
     * @tc.desc    Settings toggle effect 3 probe 231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit231') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0232
     * @tc.name    SettingAccessibilityNavigation232
     * @tc.desc    Settings toggle effect 0 probe 232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit232') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0233
     * @tc.name    SettingAccessibilityNavigation233
     * @tc.desc    Settings toggle effect 1 probe 233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit233') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0234
     * @tc.name    SettingAccessibilityNavigation234
     * @tc.desc    Settings toggle effect 2 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit234') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0235
     * @tc.name    SettingAccessibilityNavigation235
     * @tc.desc    Settings toggle effect 3 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit235') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0236
     * @tc.name    SettingAccessibilityNavigation236
     * @tc.desc    Settings toggle effect 0 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit236') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0237
     * @tc.name    SettingAccessibilityNavigation237
     * @tc.desc    Settings toggle effect 1 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit237') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0238
     * @tc.name    SettingAccessibilityNavigation238
     * @tc.desc    Settings toggle effect 2 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit238') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0239
     * @tc.name    SettingAccessibilityNavigation239
     * @tc.desc    Settings toggle effect 3 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit239') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0240
     * @tc.name    SettingAccessibilityNavigation240
     * @tc.desc    Settings toggle effect 0 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit240') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0241
     * @tc.name    SettingAccessibilityNavigation241
     * @tc.desc    Settings toggle effect 1 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit241') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0242
     * @tc.name    SettingAccessibilityNavigation242
     * @tc.desc    Settings toggle effect 2 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit242') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0243
     * @tc.name    SettingAccessibilityNavigation243
     * @tc.desc    Settings toggle effect 3 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit243') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0244
     * @tc.name    SettingAccessibilityNavigation244
     * @tc.desc    Settings toggle effect 0 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit244') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0245
     * @tc.name    SettingAccessibilityNavigation245
     * @tc.desc    Settings toggle effect 1 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit245') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0246
     * @tc.name    SettingAccessibilityNavigation246
     * @tc.desc    Settings toggle effect 2 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit246') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0247
     * @tc.name    SettingAccessibilityNavigation247
     * @tc.desc    Settings toggle effect 3 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit247') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0248
     * @tc.name    SettingAccessibilityNavigation248
     * @tc.desc    Settings toggle effect 0 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit248') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0249
     * @tc.name    SettingAccessibilityNavigation249
     * @tc.desc    Settings toggle effect 1 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit249') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0250
     * @tc.name    SettingAccessibilityNavigation250
     * @tc.desc    Settings toggle effect 2 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit250') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0251
     * @tc.name    SettingAccessibilityNavigation251
     * @tc.desc    Settings toggle effect 3 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit251') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0252
     * @tc.name    SettingAccessibilityNavigation252
     * @tc.desc    Settings toggle effect 0 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit252') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0253
     * @tc.name    SettingAccessibilityNavigation253
     * @tc.desc    Settings toggle effect 1 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit253') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0254
     * @tc.name    SettingAccessibilityNavigation254
     * @tc.desc    Settings toggle effect 2 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit254') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0255
     * @tc.name    SettingAccessibilityNavigation255
     * @tc.desc    Settings toggle effect 3 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit255') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0256
     * @tc.name    SettingAccessibilityNavigation256
     * @tc.desc    Settings toggle effect 0 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit256') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0257
     * @tc.name    SettingAccessibilityNavigation257
     * @tc.desc    Settings toggle effect 1 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit257') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0258
     * @tc.name    SettingAccessibilityNavigation258
     * @tc.desc    Settings toggle effect 2 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit258') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0259
     * @tc.name    SettingAccessibilityNavigation259
     * @tc.desc    Settings toggle effect 3 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit259') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0260
     * @tc.name    SettingAccessibilityNavigation260
     * @tc.desc    Settings toggle effect 0 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit260') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0261
     * @tc.name    SettingAccessibilityNavigation261
     * @tc.desc    Settings toggle effect 1 probe 261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit261') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0262
     * @tc.name    SettingAccessibilityNavigation262
     * @tc.desc    Settings toggle effect 2 probe 262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit262') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0263
     * @tc.name    SettingAccessibilityNavigation263
     * @tc.desc    Settings toggle effect 3 probe 263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit263') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0264
     * @tc.name    SettingAccessibilityNavigation264
     * @tc.desc    Settings toggle effect 0 probe 264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit264') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0265
     * @tc.name    SettingAccessibilityNavigation265
     * @tc.desc    Settings toggle effect 1 probe 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit265') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0266
     * @tc.name    SettingAccessibilityNavigation266
     * @tc.desc    Settings toggle effect 2 probe 266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit266') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0267
     * @tc.name    SettingAccessibilityNavigation267
     * @tc.desc    Settings toggle effect 3 probe 267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit267') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0268
     * @tc.name    SettingAccessibilityNavigation268
     * @tc.desc    Settings toggle effect 0 probe 268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit268') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0269
     * @tc.name    SettingAccessibilityNavigation269
     * @tc.desc    Settings toggle effect 1 probe 269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit269') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0270
     * @tc.name    SettingAccessibilityNavigation270
     * @tc.desc    Settings toggle effect 2 probe 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit270') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0271
     * @tc.name    SettingAccessibilityNavigation271
     * @tc.desc    Settings toggle effect 3 probe 271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit271') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0272
     * @tc.name    SettingAccessibilityNavigation272
     * @tc.desc    Settings toggle effect 0 probe 272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit272') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0273
     * @tc.name    SettingAccessibilityNavigation273
     * @tc.desc    Settings toggle effect 1 probe 273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit273') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0274
     * @tc.name    SettingAccessibilityNavigation274
     * @tc.desc    Settings toggle effect 2 probe 274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit274') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0275
     * @tc.name    SettingAccessibilityNavigation275
     * @tc.desc    Settings toggle effect 3 probe 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit275') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0276
     * @tc.name    SettingAccessibilityNavigation276
     * @tc.desc    Settings toggle effect 0 probe 276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit276') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0277
     * @tc.name    SettingAccessibilityNavigation277
     * @tc.desc    Settings toggle effect 1 probe 277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit277') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0278
     * @tc.name    SettingAccessibilityNavigation278
     * @tc.desc    Settings toggle effect 2 probe 278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit278') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0279
     * @tc.name    SettingAccessibilityNavigation279
     * @tc.desc    Settings toggle effect 3 probe 279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit279') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0280
     * @tc.name    SettingAccessibilityNavigation280
     * @tc.desc    Settings toggle effect 0 probe 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit280') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0281
     * @tc.name    SettingAccessibilityNavigation281
     * @tc.desc    Settings toggle effect 1 probe 281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit281') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0282
     * @tc.name    SettingAccessibilityNavigation282
     * @tc.desc    Settings toggle effect 2 probe 282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit282') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0283
     * @tc.name    SettingAccessibilityNavigation283
     * @tc.desc    Settings toggle effect 3 probe 283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit283') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0284
     * @tc.name    SettingAccessibilityNavigation284
     * @tc.desc    Settings toggle effect 0 probe 284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit284') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0285
     * @tc.name    SettingAccessibilityNavigation285
     * @tc.desc    Settings toggle effect 1 probe 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit285') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0286
     * @tc.name    SettingAccessibilityNavigation286
     * @tc.desc    Settings toggle effect 2 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit286') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0287
     * @tc.name    SettingAccessibilityNavigation287
     * @tc.desc    Settings toggle effect 3 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit287') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0288
     * @tc.name    SettingAccessibilityNavigation288
     * @tc.desc    Settings toggle effect 0 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit288') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0289
     * @tc.name    SettingAccessibilityNavigation289
     * @tc.desc    Settings toggle effect 1 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit289') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0290
     * @tc.name    SettingAccessibilityNavigation290
     * @tc.desc    Settings toggle effect 2 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit290') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0291
     * @tc.name    SettingAccessibilityNavigation291
     * @tc.desc    Settings toggle effect 3 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit291') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0292
     * @tc.name    SettingAccessibilityNavigation292
     * @tc.desc    Settings toggle effect 0 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit292') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0293
     * @tc.name    SettingAccessibilityNavigation293
     * @tc.desc    Settings toggle effect 1 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit293') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0294
     * @tc.name    SettingAccessibilityNavigation294
     * @tc.desc    Settings toggle effect 2 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit294') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0295
     * @tc.name    SettingAccessibilityNavigation295
     * @tc.desc    Settings toggle effect 3 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit295') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0296
     * @tc.name    SettingAccessibilityNavigation296
     * @tc.desc    Settings toggle effect 0 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit296') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0297
     * @tc.name    SettingAccessibilityNavigation297
     * @tc.desc    Settings toggle effect 1 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit297') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0298
     * @tc.name    SettingAccessibilityNavigation298
     * @tc.desc    Settings toggle effect 2 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit298') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0299
     * @tc.name    SettingAccessibilityNavigation299
     * @tc.desc    Settings toggle effect 3 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit299') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0300
     * @tc.name    SettingAccessibilityNavigation300
     * @tc.desc    Settings toggle effect 0 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit300') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0301
     * @tc.name    SettingAccessibilityNavigation301
     * @tc.desc    Settings toggle effect 1 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit301') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0302
     * @tc.name    SettingAccessibilityNavigation302
     * @tc.desc    Settings toggle effect 2 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit302') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0303
     * @tc.name    SettingAccessibilityNavigation303
     * @tc.desc    Settings toggle effect 3 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit303') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0304
     * @tc.name    SettingAccessibilityNavigation304
     * @tc.desc    Settings toggle effect 0 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit304') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0305
     * @tc.name    SettingAccessibilityNavigation305
     * @tc.desc    Settings toggle effect 1 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit305') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0306
     * @tc.name    SettingAccessibilityNavigation306
     * @tc.desc    Settings toggle effect 2 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit306') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0307
     * @tc.name    SettingAccessibilityNavigation307
     * @tc.desc    Settings toggle effect 3 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit307') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0308
     * @tc.name    SettingAccessibilityNavigation308
     * @tc.desc    Settings toggle effect 0 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit308') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0309
     * @tc.name    SettingAccessibilityNavigation309
     * @tc.desc    Settings toggle effect 1 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit309') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0310
     * @tc.name    SettingAccessibilityNavigation310
     * @tc.desc    Settings toggle effect 2 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit310') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0311
     * @tc.name    SettingAccessibilityNavigation311
     * @tc.desc    Settings toggle effect 3 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit311') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0312
     * @tc.name    SettingAccessibilityNavigation312
     * @tc.desc    Settings toggle effect 0 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit312') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0313
     * @tc.name    SettingAccessibilityNavigation313
     * @tc.desc    Settings toggle effect 1 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit313') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0314
     * @tc.name    SettingAccessibilityNavigation314
     * @tc.desc    Settings toggle effect 2 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit314') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0315
     * @tc.name    SettingAccessibilityNavigation315
     * @tc.desc    Settings toggle effect 3 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit315') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0316
     * @tc.name    SettingAccessibilityNavigation316
     * @tc.desc    Settings toggle effect 0 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit316') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0317
     * @tc.name    SettingAccessibilityNavigation317
     * @tc.desc    Settings toggle effect 1 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit317') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0318
     * @tc.name    SettingAccessibilityNavigation318
     * @tc.desc    Settings toggle effect 2 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit318') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0319
     * @tc.name    SettingAccessibilityNavigation319
     * @tc.desc    Settings toggle effect 3 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit319') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0320
     * @tc.name    SettingAccessibilityNavigation320
     * @tc.desc    Settings toggle effect 0 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit320') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0321
     * @tc.name    SettingAccessibilityNavigation321
     * @tc.desc    Settings toggle effect 1 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit321') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0322
     * @tc.name    SettingAccessibilityNavigation322
     * @tc.desc    Settings toggle effect 2 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit322') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0323
     * @tc.name    SettingAccessibilityNavigation323
     * @tc.desc    Settings toggle effect 3 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit323') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0324
     * @tc.name    SettingAccessibilityNavigation324
     * @tc.desc    Settings toggle effect 0 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit324') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0325
     * @tc.name    SettingAccessibilityNavigation325
     * @tc.desc    Settings toggle effect 1 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit325') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0326
     * @tc.name    SettingAccessibilityNavigation326
     * @tc.desc    Settings toggle effect 2 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit326') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0327
     * @tc.name    SettingAccessibilityNavigation327
     * @tc.desc    Settings toggle effect 3 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit327') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0328
     * @tc.name    SettingAccessibilityNavigation328
     * @tc.desc    Settings toggle effect 0 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit328') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0329
     * @tc.name    SettingAccessibilityNavigation329
     * @tc.desc    Settings toggle effect 1 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit329') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0330
     * @tc.name    SettingAccessibilityNavigation330
     * @tc.desc    Settings toggle effect 2 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit330') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0331
     * @tc.name    SettingAccessibilityNavigation331
     * @tc.desc    Settings toggle effect 3 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit331') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0332
     * @tc.name    SettingAccessibilityNavigation332
     * @tc.desc    Settings toggle effect 0 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit332') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0333
     * @tc.name    SettingAccessibilityNavigation333
     * @tc.desc    Settings toggle effect 1 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit333') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0334
     * @tc.name    SettingAccessibilityNavigation334
     * @tc.desc    Settings toggle effect 2 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit334') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0335
     * @tc.name    SettingAccessibilityNavigation335
     * @tc.desc    Settings toggle effect 3 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit335') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0336
     * @tc.name    SettingAccessibilityNavigation336
     * @tc.desc    Settings toggle effect 0 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit336') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0337
     * @tc.name    SettingAccessibilityNavigation337
     * @tc.desc    Settings toggle effect 1 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit337') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0338
     * @tc.name    SettingAccessibilityNavigation338
     * @tc.desc    Settings toggle effect 2 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit338') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0339
     * @tc.name    SettingAccessibilityNavigation339
     * @tc.desc    Settings toggle effect 3 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit339') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0340
     * @tc.name    SettingAccessibilityNavigation340
     * @tc.desc    Settings toggle effect 0 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit340') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0341
     * @tc.name    SettingAccessibilityNavigation341
     * @tc.desc    Settings toggle effect 1 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit341') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0342
     * @tc.name    SettingAccessibilityNavigation342
     * @tc.desc    Settings toggle effect 2 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit342') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0343
     * @tc.name    SettingAccessibilityNavigation343
     * @tc.desc    Settings toggle effect 3 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit343') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0344
     * @tc.name    SettingAccessibilityNavigation344
     * @tc.desc    Settings toggle effect 0 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit344') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0345
     * @tc.name    SettingAccessibilityNavigation345
     * @tc.desc    Settings toggle effect 1 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit345') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0346
     * @tc.name    SettingAccessibilityNavigation346
     * @tc.desc    Settings toggle effect 2 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit346') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0347
     * @tc.name    SettingAccessibilityNavigation347
     * @tc.desc    Settings toggle effect 3 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit347') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0348
     * @tc.name    SettingAccessibilityNavigation348
     * @tc.desc    Settings toggle effect 0 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit348') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0349
     * @tc.name    SettingAccessibilityNavigation349
     * @tc.desc    Settings toggle effect 1 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit349') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0350
     * @tc.name    SettingAccessibilityNavigation350
     * @tc.desc    Settings toggle effect 2 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit350') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0351
     * @tc.name    SettingAccessibilityNavigation351
     * @tc.desc    Settings toggle effect 3 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit351') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0352
     * @tc.name    SettingAccessibilityNavigation352
     * @tc.desc    Settings toggle effect 0 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit352') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0353
     * @tc.name    SettingAccessibilityNavigation353
     * @tc.desc    Settings toggle effect 1 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit353') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0354
     * @tc.name    SettingAccessibilityNavigation354
     * @tc.desc    Settings toggle effect 2 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[2].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit354') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0355
     * @tc.name    SettingAccessibilityNavigation355
     * @tc.desc    Settings toggle effect 3 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[3].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit355') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0356
     * @tc.name    SettingAccessibilityNavigation356
     * @tc.desc    Settings toggle effect 0 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[0].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit356') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0357
     * @tc.name    SettingAccessibilityNavigation357
     * @tc.desc    Settings toggle effect 1 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAccessibilityNavigation357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const key: string = m.getEntries()[1].key;
      const before: boolean = m.isEnabled(key);
      const changed: boolean = m.toggle(key);
      if (changed) { expect(m.isEnabled(key)).assertEqual(!before); }
      else { expect(m.isEnabled(key)).assertEqual(before); }
      expect(m.getEntry('nohit357') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

