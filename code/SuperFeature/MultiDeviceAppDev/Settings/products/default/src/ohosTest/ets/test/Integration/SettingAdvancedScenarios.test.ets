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

export default function settingAdvancedScenariosSuite() {
  describe('SettingAdvancedScenariosSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0118
     * @tc.name    SettingAdvancedScenarios118
     * @tc.desc    Settings toggle and enabled counts 118 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(438) - 0.4 * 438) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit118') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0119
     * @tc.name    SettingAdvancedScenarios119
     * @tc.desc    Settings toggle and enabled counts 119 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(439) - 0.4 * 439) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit119') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0120
     * @tc.name    SettingAdvancedScenarios120
     * @tc.desc    Settings toggle and enabled counts 120 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(440) - 0.4 * 440) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit120') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0121
     * @tc.name    SettingAdvancedScenarios121
     * @tc.desc    Settings toggle and enabled counts 121 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(441) - 0.4 * 441) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit121') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0122
     * @tc.name    SettingAdvancedScenarios122
     * @tc.desc    Settings toggle and enabled counts 122 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(442) - 0.4 * 442) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit122') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0123
     * @tc.name    SettingAdvancedScenarios123
     * @tc.desc    Settings toggle and enabled counts 123 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(443) - 0.4 * 443) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit123') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0124
     * @tc.name    SettingAdvancedScenarios124
     * @tc.desc    Settings toggle and enabled counts 124 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(444) - 0.4 * 444) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit124') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0125
     * @tc.name    SettingAdvancedScenarios125
     * @tc.desc    Settings toggle and enabled counts 125 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(445) - 0.4 * 445) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit125') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0126
     * @tc.name    SettingAdvancedScenarios126
     * @tc.desc    Settings toggle and enabled counts 126 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(446) - 0.4 * 446) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit126') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0127
     * @tc.name    SettingAdvancedScenarios127
     * @tc.desc    Settings toggle and enabled counts 127 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(447) - 0.4 * 447) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit127') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0128
     * @tc.name    SettingAdvancedScenarios128
     * @tc.desc    Settings toggle and enabled counts 128 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(448) - 0.4 * 448) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit128') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0129
     * @tc.name    SettingAdvancedScenarios129
     * @tc.desc    Settings toggle and enabled counts 129 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(449) - 0.4 * 449) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit129') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0130
     * @tc.name    SettingAdvancedScenarios130
     * @tc.desc    Settings toggle and enabled counts 130 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(450) - 0.4 * 450) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit130') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0131
     * @tc.name    SettingAdvancedScenarios131
     * @tc.desc    Settings toggle and enabled counts 131 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(451) - 0.4 * 451) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit131') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0132
     * @tc.name    SettingAdvancedScenarios132
     * @tc.desc    Settings toggle and enabled counts 132 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(452) - 0.4 * 452) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit132') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0133
     * @tc.name    SettingAdvancedScenarios133
     * @tc.desc    Settings toggle and enabled counts 133 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(453) - 0.4 * 453) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit133') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0134
     * @tc.name    SettingAdvancedScenarios134
     * @tc.desc    Settings toggle and enabled counts 134 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(454) - 0.4 * 454) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit134') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0135
     * @tc.name    SettingAdvancedScenarios135
     * @tc.desc    Settings toggle and enabled counts 135 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(455) - 0.4 * 455) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit135') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0136
     * @tc.name    SettingAdvancedScenarios136
     * @tc.desc    Settings toggle and enabled counts 136 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(456) - 0.4 * 456) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit136') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0137
     * @tc.name    SettingAdvancedScenarios137
     * @tc.desc    Settings toggle and enabled counts 137 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(457) - 0.4 * 457) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit137') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0138
     * @tc.name    SettingAdvancedScenarios138
     * @tc.desc    Settings toggle and enabled counts 138 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(458) - 0.4 * 458) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit138') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0139
     * @tc.name    SettingAdvancedScenarios139
     * @tc.desc    Settings toggle and enabled counts 139 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(459) - 0.4 * 459) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit139') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0140
     * @tc.name    SettingAdvancedScenarios140
     * @tc.desc    Settings toggle and enabled counts 140 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(460) - 0.4 * 460) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit140') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0141
     * @tc.name    SettingAdvancedScenarios141
     * @tc.desc    Settings toggle and enabled counts 141 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(461) - 0.4 * 461) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit141') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0142
     * @tc.name    SettingAdvancedScenarios142
     * @tc.desc    Settings toggle and enabled counts 142 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(462) - 0.4 * 462) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit142') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0143
     * @tc.name    SettingAdvancedScenarios143
     * @tc.desc    Settings toggle and enabled counts 143 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(463) - 0.4 * 463) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit143') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0144
     * @tc.name    SettingAdvancedScenarios144
     * @tc.desc    Settings toggle and enabled counts 144 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(464) - 0.4 * 464) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit144') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0145
     * @tc.name    SettingAdvancedScenarios145
     * @tc.desc    Settings toggle and enabled counts 145 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(465) - 0.4 * 465) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit145') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0146
     * @tc.name    SettingAdvancedScenarios146
     * @tc.desc    Settings toggle and enabled counts 146 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(466) - 0.4 * 466) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit146') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0147
     * @tc.name    SettingAdvancedScenarios147
     * @tc.desc    Settings toggle and enabled counts 147 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(467) - 0.4 * 467) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit147') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0148
     * @tc.name    SettingAdvancedScenarios148
     * @tc.desc    Settings toggle and enabled counts 148 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(468) - 0.4 * 468) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit148') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0149
     * @tc.name    SettingAdvancedScenarios149
     * @tc.desc    Settings toggle and enabled counts 149 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(469) - 0.4 * 469) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit149') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0150
     * @tc.name    SettingAdvancedScenarios150
     * @tc.desc    Settings toggle and enabled counts 150 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(470) - 0.4 * 470) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit150') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0151
     * @tc.name    SettingAdvancedScenarios151
     * @tc.desc    Settings toggle and enabled counts 151 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(471) - 0.4 * 471) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit151') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0152
     * @tc.name    SettingAdvancedScenarios152
     * @tc.desc    Settings toggle and enabled counts 152 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(472) - 0.4 * 472) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit152') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0153
     * @tc.name    SettingAdvancedScenarios153
     * @tc.desc    Settings toggle and enabled counts 153 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(473) - 0.4 * 473) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit153') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0154
     * @tc.name    SettingAdvancedScenarios154
     * @tc.desc    Settings toggle and enabled counts 154 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(474) - 0.4 * 474) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit154') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0155
     * @tc.name    SettingAdvancedScenarios155
     * @tc.desc    Settings toggle and enabled counts 155 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(475) - 0.4 * 475) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit155') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0156
     * @tc.name    SettingAdvancedScenarios156
     * @tc.desc    Settings toggle and enabled counts 156 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(476) - 0.4 * 476) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit156') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0157
     * @tc.name    SettingAdvancedScenarios157
     * @tc.desc    Settings toggle and enabled counts 157 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(477) - 0.4 * 477) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit157') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0158
     * @tc.name    SettingAdvancedScenarios158
     * @tc.desc    Settings toggle and enabled counts 158 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(478) - 0.4 * 478) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit158') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0159
     * @tc.name    SettingAdvancedScenarios159
     * @tc.desc    Settings toggle and enabled counts 159 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(479) - 0.4 * 479) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit159') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0160
     * @tc.name    SettingAdvancedScenarios160
     * @tc.desc    Settings toggle and enabled counts 160 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(480) - 0.4 * 480) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit160') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0161
     * @tc.name    SettingAdvancedScenarios161
     * @tc.desc    Settings toggle and enabled counts 161 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAdvancedScenarios161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let toggles = 0;
      for (let k = 0; k < m.getEntries().length; k++) {
        if (m.getEntries()[k].hasToggle) { toggles++; }
      }
      expect(m.getToggleCount()).assertEqual(toggles);
      expect(m.getEnabledCount() <= toggles).assertEqual(true);
      expect(Math.abs(m.navbarWidth(481) - 0.4 * 481) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit161') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

