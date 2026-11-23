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

export default function settingCommonEventUtilValidationSuite() {
  describe('SettingCommonEventUtilValidationSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0820
     * @tc.name    SettingCommonEventUtilValidation820
     * @tc.desc    Settings navbar width for 1140 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1140;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit820') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0821
     * @tc.name    SettingCommonEventUtilValidation821
     * @tc.desc    Settings split mode at 821 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 821;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit821') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0822
     * @tc.name    SettingCommonEventUtilValidation822
     * @tc.desc    Settings navbar width for 1142 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1142;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit822') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0823
     * @tc.name    SettingCommonEventUtilValidation823
     * @tc.desc    Settings split mode at 823 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 823;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit823') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0824
     * @tc.name    SettingCommonEventUtilValidation824
     * @tc.desc    Settings navbar width for 1144 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1144;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit824') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0825
     * @tc.name    SettingCommonEventUtilValidation825
     * @tc.desc    Settings split mode at 825 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 825;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit825') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0826
     * @tc.name    SettingCommonEventUtilValidation826
     * @tc.desc    Settings navbar width for 1146 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1146;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit826') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0827
     * @tc.name    SettingCommonEventUtilValidation827
     * @tc.desc    Settings split mode at 827 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 827;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit827') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0828
     * @tc.name    SettingCommonEventUtilValidation828
     * @tc.desc    Settings navbar width for 1148 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1148;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit828') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0829
     * @tc.name    SettingCommonEventUtilValidation829
     * @tc.desc    Settings split mode at 829 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 829;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit829') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0830
     * @tc.name    SettingCommonEventUtilValidation830
     * @tc.desc    Settings navbar width for 1150 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1150;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit830') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0831
     * @tc.name    SettingCommonEventUtilValidation831
     * @tc.desc    Settings split mode at 831 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 831;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit831') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0832
     * @tc.name    SettingCommonEventUtilValidation832
     * @tc.desc    Settings navbar width for 1152 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1152;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit832') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0833
     * @tc.name    SettingCommonEventUtilValidation833
     * @tc.desc    Settings split mode at 833 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 833;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit833') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0834
     * @tc.name    SettingCommonEventUtilValidation834
     * @tc.desc    Settings navbar width for 1154 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1154;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit834') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0835
     * @tc.name    SettingCommonEventUtilValidation835
     * @tc.desc    Settings split mode at 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 835;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit835') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0836
     * @tc.name    SettingCommonEventUtilValidation836
     * @tc.desc    Settings navbar width for 1156 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1156;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit836') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0837
     * @tc.name    SettingCommonEventUtilValidation837
     * @tc.desc    Settings split mode at 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 837;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit837') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0838
     * @tc.name    SettingCommonEventUtilValidation838
     * @tc.desc    Settings navbar width for 1158 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1158;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit838') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0839
     * @tc.name    SettingCommonEventUtilValidation839
     * @tc.desc    Settings split mode at 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 839;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit839') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0840
     * @tc.name    SettingCommonEventUtilValidation840
     * @tc.desc    Settings navbar width for 1160 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1160;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit840') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0841
     * @tc.name    SettingCommonEventUtilValidation841
     * @tc.desc    Settings split mode at 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 841;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit841') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0842
     * @tc.name    SettingCommonEventUtilValidation842
     * @tc.desc    Settings navbar width for 1162 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1162;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit842') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0843
     * @tc.name    SettingCommonEventUtilValidation843
     * @tc.desc    Settings split mode at 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 843;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit843') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0844
     * @tc.name    SettingCommonEventUtilValidation844
     * @tc.desc    Settings navbar width for 1164 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1164;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit844') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0845
     * @tc.name    SettingCommonEventUtilValidation845
     * @tc.desc    Settings split mode at 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 845;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit845') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0846
     * @tc.name    SettingCommonEventUtilValidation846
     * @tc.desc    Settings navbar width for 1166 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1166;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit846') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0847
     * @tc.name    SettingCommonEventUtilValidation847
     * @tc.desc    Settings split mode at 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 847;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit847') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0848
     * @tc.name    SettingCommonEventUtilValidation848
     * @tc.desc    Settings navbar width for 1168 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1168;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit848') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0849
     * @tc.name    SettingCommonEventUtilValidation849
     * @tc.desc    Settings split mode at 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 849;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit849') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0850
     * @tc.name    SettingCommonEventUtilValidation850
     * @tc.desc    Settings navbar width for 1170 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1170;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit850') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0851
     * @tc.name    SettingCommonEventUtilValidation851
     * @tc.desc    Settings split mode at 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 851;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit851') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0852
     * @tc.name    SettingCommonEventUtilValidation852
     * @tc.desc    Settings navbar width for 1172 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1172;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit852') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0853
     * @tc.name    SettingCommonEventUtilValidation853
     * @tc.desc    Settings split mode at 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 853;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit853') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0854
     * @tc.name    SettingCommonEventUtilValidation854
     * @tc.desc    Settings navbar width for 1174 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1174;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit854') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0855
     * @tc.name    SettingCommonEventUtilValidation855
     * @tc.desc    Settings split mode at 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 855;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit855') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0856
     * @tc.name    SettingCommonEventUtilValidation856
     * @tc.desc    Settings navbar width for 1176 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1176;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit856') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0857
     * @tc.name    SettingCommonEventUtilValidation857
     * @tc.desc    Settings split mode at 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 857;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit857') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0858
     * @tc.name    SettingCommonEventUtilValidation858
     * @tc.desc    Settings navbar width for 1178 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1178;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit858') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0859
     * @tc.name    SettingCommonEventUtilValidation859
     * @tc.desc    Settings split mode at 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 859;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit859') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0860
     * @tc.name    SettingCommonEventUtilValidation860
     * @tc.desc    Settings navbar width for 1180 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1180;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit860') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0861
     * @tc.name    SettingCommonEventUtilValidation861
     * @tc.desc    Settings split mode at 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 861;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit861') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0862
     * @tc.name    SettingCommonEventUtilValidation862
     * @tc.desc    Settings navbar width for 1182 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1182;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit862') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0863
     * @tc.name    SettingCommonEventUtilValidation863
     * @tc.desc    Settings split mode at 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 863;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit863') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0864
     * @tc.name    SettingCommonEventUtilValidation864
     * @tc.desc    Settings navbar width for 1184 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1184;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit864') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0865
     * @tc.name    SettingCommonEventUtilValidation865
     * @tc.desc    Settings split mode at 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 865;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit865') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0866
     * @tc.name    SettingCommonEventUtilValidation866
     * @tc.desc    Settings navbar width for 1186 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1186;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit866') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0867
     * @tc.name    SettingCommonEventUtilValidation867
     * @tc.desc    Settings split mode at 867 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 867;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit867') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0868
     * @tc.name    SettingCommonEventUtilValidation868
     * @tc.desc    Settings navbar width for 1188 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1188;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit868') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0869
     * @tc.name    SettingCommonEventUtilValidation869
     * @tc.desc    Settings split mode at 869 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 869;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit869') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0870
     * @tc.name    SettingCommonEventUtilValidation870
     * @tc.desc    Settings navbar width for 1190 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1190;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit870') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0871
     * @tc.name    SettingCommonEventUtilValidation871
     * @tc.desc    Settings split mode at 871 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 871;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit871') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0872
     * @tc.name    SettingCommonEventUtilValidation872
     * @tc.desc    Settings navbar width for 1192 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1192;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit872') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0873
     * @tc.name    SettingCommonEventUtilValidation873
     * @tc.desc    Settings split mode at 873 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 873;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit873') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0874
     * @tc.name    SettingCommonEventUtilValidation874
     * @tc.desc    Settings navbar width for 1194 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1194;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit874') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0875
     * @tc.name    SettingCommonEventUtilValidation875
     * @tc.desc    Settings split mode at 875 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 875;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit875') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0876
     * @tc.name    SettingCommonEventUtilValidation876
     * @tc.desc    Settings navbar width for 1196 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1196;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit876') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0877
     * @tc.name    SettingCommonEventUtilValidation877
     * @tc.desc    Settings split mode at 877 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 877;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit877') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0878
     * @tc.name    SettingCommonEventUtilValidation878
     * @tc.desc    Settings navbar width for 1198 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1198;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit878') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0879
     * @tc.name    SettingCommonEventUtilValidation879
     * @tc.desc    Settings split mode at 879 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 879;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit879') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0880
     * @tc.name    SettingCommonEventUtilValidation880
     * @tc.desc    Settings navbar width for 1200 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1200;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit880') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0881
     * @tc.name    SettingCommonEventUtilValidation881
     * @tc.desc    Settings split mode at 881 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 881;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit881') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0882
     * @tc.name    SettingCommonEventUtilValidation882
     * @tc.desc    Settings navbar width for 1202 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1202;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit882') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0883
     * @tc.name    SettingCommonEventUtilValidation883
     * @tc.desc    Settings split mode at 883 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 883;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit883') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0884
     * @tc.name    SettingCommonEventUtilValidation884
     * @tc.desc    Settings navbar width for 1204 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1204;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit884') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0885
     * @tc.name    SettingCommonEventUtilValidation885
     * @tc.desc    Settings split mode at 885 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 885;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit885') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0886
     * @tc.name    SettingCommonEventUtilValidation886
     * @tc.desc    Settings navbar width for 1206 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1206;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit886') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0887
     * @tc.name    SettingCommonEventUtilValidation887
     * @tc.desc    Settings split mode at 887 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 887;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit887') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0888
     * @tc.name    SettingCommonEventUtilValidation888
     * @tc.desc    Settings navbar width for 1208 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1208;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit888') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0889
     * @tc.name    SettingCommonEventUtilValidation889
     * @tc.desc    Settings split mode at 889 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 889;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit889') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0890
     * @tc.name    SettingCommonEventUtilValidation890
     * @tc.desc    Settings navbar width for 1210 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1210;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit890') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0891
     * @tc.name    SettingCommonEventUtilValidation891
     * @tc.desc    Settings split mode at 891 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 891;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit891') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0892
     * @tc.name    SettingCommonEventUtilValidation892
     * @tc.desc    Settings navbar width for 1212 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1212;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit892') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0893
     * @tc.name    SettingCommonEventUtilValidation893
     * @tc.desc    Settings split mode at 893 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 893;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit893') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0894
     * @tc.name    SettingCommonEventUtilValidation894
     * @tc.desc    Settings navbar width for 1214 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1214;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit894') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0895
     * @tc.name    SettingCommonEventUtilValidation895
     * @tc.desc    Settings split mode at 895 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 895;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit895') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0896
     * @tc.name    SettingCommonEventUtilValidation896
     * @tc.desc    Settings navbar width for 1216 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1216;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit896') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0897
     * @tc.name    SettingCommonEventUtilValidation897
     * @tc.desc    Settings split mode at 897 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 897;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit897') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0898
     * @tc.name    SettingCommonEventUtilValidation898
     * @tc.desc    Settings navbar width for 1218 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1218;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit898') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0899
     * @tc.name    SettingCommonEventUtilValidation899
     * @tc.desc    Settings split mode at 899 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 899;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit899') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0900
     * @tc.name    SettingCommonEventUtilValidation900
     * @tc.desc    Settings navbar width for 1220 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1220;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit900') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0901
     * @tc.name    SettingCommonEventUtilValidation901
     * @tc.desc    Settings split mode at 901 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 901;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit901') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0902
     * @tc.name    SettingCommonEventUtilValidation902
     * @tc.desc    Settings navbar width for 1222 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1222;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit902') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0903
     * @tc.name    SettingCommonEventUtilValidation903
     * @tc.desc    Settings split mode at 903 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 903;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit903') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0904
     * @tc.name    SettingCommonEventUtilValidation904
     * @tc.desc    Settings navbar width for 1224 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1224;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit904') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0905
     * @tc.name    SettingCommonEventUtilValidation905
     * @tc.desc    Settings split mode at 905 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 905;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit905') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0906
     * @tc.name    SettingCommonEventUtilValidation906
     * @tc.desc    Settings navbar width for 1226 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1226;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit906') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0907
     * @tc.name    SettingCommonEventUtilValidation907
     * @tc.desc    Settings split mode at 907 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 907;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit907') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0908
     * @tc.name    SettingCommonEventUtilValidation908
     * @tc.desc    Settings navbar width for 1228 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1228;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit908') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0909
     * @tc.name    SettingCommonEventUtilValidation909
     * @tc.desc    Settings split mode at 909 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 909;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit909') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0910
     * @tc.name    SettingCommonEventUtilValidation910
     * @tc.desc    Settings navbar width for 1230 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1230;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit910') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0911
     * @tc.name    SettingCommonEventUtilValidation911
     * @tc.desc    Settings split mode at 911 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 911;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit911') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0912
     * @tc.name    SettingCommonEventUtilValidation912
     * @tc.desc    Settings navbar width for 1232 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1232;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit912') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0913
     * @tc.name    SettingCommonEventUtilValidation913
     * @tc.desc    Settings split mode at 913 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 913;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit913') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0914
     * @tc.name    SettingCommonEventUtilValidation914
     * @tc.desc    Settings navbar width for 1234 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1234;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit914') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0915
     * @tc.name    SettingCommonEventUtilValidation915
     * @tc.desc    Settings split mode at 915 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 915;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit915') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0916
     * @tc.name    SettingCommonEventUtilValidation916
     * @tc.desc    Settings navbar width for 1236 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1236;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit916') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0917
     * @tc.name    SettingCommonEventUtilValidation917
     * @tc.desc    Settings split mode at 917 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 917;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit917') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0918
     * @tc.name    SettingCommonEventUtilValidation918
     * @tc.desc    Settings navbar width for 1238 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1238;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit918') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0919
     * @tc.name    SettingCommonEventUtilValidation919
     * @tc.desc    Settings split mode at 919 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 919;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit919') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0920
     * @tc.name    SettingCommonEventUtilValidation920
     * @tc.desc    Settings navbar width for 1240 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1240;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit920') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0921
     * @tc.name    SettingCommonEventUtilValidation921
     * @tc.desc    Settings split mode at 921 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 921;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit921') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0922
     * @tc.name    SettingCommonEventUtilValidation922
     * @tc.desc    Settings navbar width for 1242 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1242;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit922') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0923
     * @tc.name    SettingCommonEventUtilValidation923
     * @tc.desc    Settings split mode at 923 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 923;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit923') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0924
     * @tc.name    SettingCommonEventUtilValidation924
     * @tc.desc    Settings navbar width for 1244 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1244;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit924') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0925
     * @tc.name    SettingCommonEventUtilValidation925
     * @tc.desc    Settings split mode at 925 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 925;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit925') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0926
     * @tc.name    SettingCommonEventUtilValidation926
     * @tc.desc    Settings navbar width for 1246 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1246;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit926') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0927
     * @tc.name    SettingCommonEventUtilValidation927
     * @tc.desc    Settings split mode at 927 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 927;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit927') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0928
     * @tc.name    SettingCommonEventUtilValidation928
     * @tc.desc    Settings navbar width for 1248 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1248;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit928') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0929
     * @tc.name    SettingCommonEventUtilValidation929
     * @tc.desc    Settings split mode at 929 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 929;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit929') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0930
     * @tc.name    SettingCommonEventUtilValidation930
     * @tc.desc    Settings navbar width for 1250 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1250;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit930') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0931
     * @tc.name    SettingCommonEventUtilValidation931
     * @tc.desc    Settings split mode at 931 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 931;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit931') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0932
     * @tc.name    SettingCommonEventUtilValidation932
     * @tc.desc    Settings navbar width for 1252 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1252;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit932') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0933
     * @tc.name    SettingCommonEventUtilValidation933
     * @tc.desc    Settings split mode at 933 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 933;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit933') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0934
     * @tc.name    SettingCommonEventUtilValidation934
     * @tc.desc    Settings navbar width for 1254 probe 934
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation934', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1254;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit934') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0935
     * @tc.name    SettingCommonEventUtilValidation935
     * @tc.desc    Settings split mode at 935 probe 935
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation935', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 935;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit935') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0936
     * @tc.name    SettingCommonEventUtilValidation936
     * @tc.desc    Settings navbar width for 1256 probe 936
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation936', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1256;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit936') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0937
     * @tc.name    SettingCommonEventUtilValidation937
     * @tc.desc    Settings split mode at 937 probe 937
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation937', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 937;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit937') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0938
     * @tc.name    SettingCommonEventUtilValidation938
     * @tc.desc    Settings navbar width for 1258 probe 938
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation938', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1258;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit938') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0939
     * @tc.name    SettingCommonEventUtilValidation939
     * @tc.desc    Settings split mode at 939 probe 939
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation939', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 939;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit939') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0940
     * @tc.name    SettingCommonEventUtilValidation940
     * @tc.desc    Settings navbar width for 1260 probe 940
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation940', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1260;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit940') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0941
     * @tc.name    SettingCommonEventUtilValidation941
     * @tc.desc    Settings split mode at 941 probe 941
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation941', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 941;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit941') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0942
     * @tc.name    SettingCommonEventUtilValidation942
     * @tc.desc    Settings navbar width for 1262 probe 942
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation942', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1262;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit942') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0943
     * @tc.name    SettingCommonEventUtilValidation943
     * @tc.desc    Settings split mode at 943 probe 943
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation943', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 943;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit943') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0944
     * @tc.name    SettingCommonEventUtilValidation944
     * @tc.desc    Settings navbar width for 1264 probe 944
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation944', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1264;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit944') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0945
     * @tc.name    SettingCommonEventUtilValidation945
     * @tc.desc    Settings split mode at 945 probe 945
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation945', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 945;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit945') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0946
     * @tc.name    SettingCommonEventUtilValidation946
     * @tc.desc    Settings navbar width for 1266 probe 946
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation946', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1266;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit946') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0947
     * @tc.name    SettingCommonEventUtilValidation947
     * @tc.desc    Settings split mode at 947 probe 947
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation947', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 947;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit947') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0948
     * @tc.name    SettingCommonEventUtilValidation948
     * @tc.desc    Settings navbar width for 1268 probe 948
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation948', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1268;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit948') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0949
     * @tc.name    SettingCommonEventUtilValidation949
     * @tc.desc    Settings split mode at 949 probe 949
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation949', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 949;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit949') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0950
     * @tc.name    SettingCommonEventUtilValidation950
     * @tc.desc    Settings navbar width for 1270 probe 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation950', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1270;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit950') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0951
     * @tc.name    SettingCommonEventUtilValidation951
     * @tc.desc    Settings split mode at 951 probe 951
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation951', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 951;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit951') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0952
     * @tc.name    SettingCommonEventUtilValidation952
     * @tc.desc    Settings navbar width for 1272 probe 952
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation952', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1272;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit952') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0953
     * @tc.name    SettingCommonEventUtilValidation953
     * @tc.desc    Settings split mode at 953 probe 953
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation953', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 953;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit953') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0954
     * @tc.name    SettingCommonEventUtilValidation954
     * @tc.desc    Settings navbar width for 1274 probe 954
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation954', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1274;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit954') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0955
     * @tc.name    SettingCommonEventUtilValidation955
     * @tc.desc    Settings split mode at 955 probe 955
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation955', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 955;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit955') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0956
     * @tc.name    SettingCommonEventUtilValidation956
     * @tc.desc    Settings navbar width for 1276 probe 956
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation956', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1276;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit956') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0957
     * @tc.name    SettingCommonEventUtilValidation957
     * @tc.desc    Settings split mode at 957 probe 957
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation957', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 957;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit957') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0958
     * @tc.name    SettingCommonEventUtilValidation958
     * @tc.desc    Settings navbar width for 1278 probe 958
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation958', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1278;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit958') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0959
     * @tc.name    SettingCommonEventUtilValidation959
     * @tc.desc    Settings split mode at 959 probe 959
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation959', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 959;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit959') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0960
     * @tc.name    SettingCommonEventUtilValidation960
     * @tc.desc    Settings navbar width for 1280 probe 960
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation960', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1280;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit960') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0961
     * @tc.name    SettingCommonEventUtilValidation961
     * @tc.desc    Settings split mode at 961 probe 961
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation961', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 961;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit961') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0962
     * @tc.name    SettingCommonEventUtilValidation962
     * @tc.desc    Settings navbar width for 1282 probe 962
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation962', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1282;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit962') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0963
     * @tc.name    SettingCommonEventUtilValidation963
     * @tc.desc    Settings split mode at 963 probe 963
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation963', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 963;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit963') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0964
     * @tc.name    SettingCommonEventUtilValidation964
     * @tc.desc    Settings navbar width for 1284 probe 964
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation964', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1284;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit964') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0965
     * @tc.name    SettingCommonEventUtilValidation965
     * @tc.desc    Settings split mode at 965 probe 965
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation965', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 965;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit965') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0966
     * @tc.name    SettingCommonEventUtilValidation966
     * @tc.desc    Settings navbar width for 1286 probe 966
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation966', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1286;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit966') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0967
     * @tc.name    SettingCommonEventUtilValidation967
     * @tc.desc    Settings split mode at 967 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 967;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit967') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0968
     * @tc.name    SettingCommonEventUtilValidation968
     * @tc.desc    Settings navbar width for 1288 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1288;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit968') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0969
     * @tc.name    SettingCommonEventUtilValidation969
     * @tc.desc    Settings split mode at 969 probe 969
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation969', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 969;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit969') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0970
     * @tc.name    SettingCommonEventUtilValidation970
     * @tc.desc    Settings navbar width for 1290 probe 970
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation970', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1290;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit970') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0971
     * @tc.name    SettingCommonEventUtilValidation971
     * @tc.desc    Settings split mode at 971 probe 971
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation971', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 971;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit971') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0972
     * @tc.name    SettingCommonEventUtilValidation972
     * @tc.desc    Settings navbar width for 1292 probe 972
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation972', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1292;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit972') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0973
     * @tc.name    SettingCommonEventUtilValidation973
     * @tc.desc    Settings split mode at 973 probe 973
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation973', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 973;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit973') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0974
     * @tc.name    SettingCommonEventUtilValidation974
     * @tc.desc    Settings navbar width for 1294 probe 974
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation974', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1294;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit974') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0975
     * @tc.name    SettingCommonEventUtilValidation975
     * @tc.desc    Settings split mode at 975 probe 975
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation975', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 975;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit975') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0976
     * @tc.name    SettingCommonEventUtilValidation976
     * @tc.desc    Settings navbar width for 1296 probe 976
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation976', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1296;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit976') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0977
     * @tc.name    SettingCommonEventUtilValidation977
     * @tc.desc    Settings split mode at 977 probe 977
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation977', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 977;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit977') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0978
     * @tc.name    SettingCommonEventUtilValidation978
     * @tc.desc    Settings navbar width for 1298 probe 978
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation978', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1298;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit978') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0979
     * @tc.name    SettingCommonEventUtilValidation979
     * @tc.desc    Settings split mode at 979 probe 979
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation979', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 979;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit979') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0980
     * @tc.name    SettingCommonEventUtilValidation980
     * @tc.desc    Settings navbar width for 1300 probe 980
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation980', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1300;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit980') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0981
     * @tc.name    SettingCommonEventUtilValidation981
     * @tc.desc    Settings split mode at 981 probe 981
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation981', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 981;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit981') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0982
     * @tc.name    SettingCommonEventUtilValidation982
     * @tc.desc    Settings navbar width for 1302 probe 982
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation982', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1302;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit982') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0983
     * @tc.name    SettingCommonEventUtilValidation983
     * @tc.desc    Settings split mode at 983 probe 983
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation983', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 983;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit983') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0984
     * @tc.name    SettingCommonEventUtilValidation984
     * @tc.desc    Settings navbar width for 1304 probe 984
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation984', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1304;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit984') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0985
     * @tc.name    SettingCommonEventUtilValidation985
     * @tc.desc    Settings split mode at 985 probe 985
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation985', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 985;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit985') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0986
     * @tc.name    SettingCommonEventUtilValidation986
     * @tc.desc    Settings navbar width for 1306 probe 986
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation986', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1306;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit986') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0987
     * @tc.name    SettingCommonEventUtilValidation987
     * @tc.desc    Settings split mode at 987 probe 987
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation987', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 987;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit987') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0988
     * @tc.name    SettingCommonEventUtilValidation988
     * @tc.desc    Settings navbar width for 1308 probe 988
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation988', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1308;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit988') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0989
     * @tc.name    SettingCommonEventUtilValidation989
     * @tc.desc    Settings split mode at 989 probe 989
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation989', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 989;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit989') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0990
     * @tc.name    SettingCommonEventUtilValidation990
     * @tc.desc    Settings navbar width for 1310 probe 990
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation990', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1310;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit990') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0991
     * @tc.name    SettingCommonEventUtilValidation991
     * @tc.desc    Settings split mode at 991 probe 991
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation991', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 991;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit991') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0992
     * @tc.name    SettingCommonEventUtilValidation992
     * @tc.desc    Settings navbar width for 1312 probe 992
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation992', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1312;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit992') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0993
     * @tc.name    SettingCommonEventUtilValidation993
     * @tc.desc    Settings split mode at 993 probe 993
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation993', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 993;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit993') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0994
     * @tc.name    SettingCommonEventUtilValidation994
     * @tc.desc    Settings navbar width for 1314 probe 994
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation994', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1314;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit994') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0995
     * @tc.name    SettingCommonEventUtilValidation995
     * @tc.desc    Settings split mode at 995 probe 995
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation995', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 995;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit995') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0996
     * @tc.name    SettingCommonEventUtilValidation996
     * @tc.desc    Settings navbar width for 1316 probe 996
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation996', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1316;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit996') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0997
     * @tc.name    SettingCommonEventUtilValidation997
     * @tc.desc    Settings split mode at 997 probe 997
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation997', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 997;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit997') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0998
     * @tc.name    SettingCommonEventUtilValidation998
     * @tc.desc    Settings navbar width for 1318 probe 998
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation998', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1318;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit998') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_0999
     * @tc.name    SettingCommonEventUtilValidation999
     * @tc.desc    Settings split mode at 999 probe 999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation999', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 999;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit999') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1000
     * @tc.name    SettingCommonEventUtilValidation1000
     * @tc.desc    Settings navbar width for 1320 probe 1000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1000', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1320;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1000') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1001
     * @tc.name    SettingCommonEventUtilValidation1001
     * @tc.desc    Settings split mode at 1 probe 1001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1001') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1002
     * @tc.name    SettingCommonEventUtilValidation1002
     * @tc.desc    Settings navbar width for 1322 probe 1002
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1322;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1002') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1003
     * @tc.name    SettingCommonEventUtilValidation1003
     * @tc.desc    Settings split mode at 3 probe 1003
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 3;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1003') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1004
     * @tc.name    SettingCommonEventUtilValidation1004
     * @tc.desc    Settings navbar width for 1324 probe 1004
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1324;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1004') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1005
     * @tc.name    SettingCommonEventUtilValidation1005
     * @tc.desc    Settings split mode at 5 probe 1005
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 5;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1005') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1006
     * @tc.name    SettingCommonEventUtilValidation1006
     * @tc.desc    Settings navbar width for 1326 probe 1006
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1326;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1006') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1007
     * @tc.name    SettingCommonEventUtilValidation1007
     * @tc.desc    Settings split mode at 7 probe 1007
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 7;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1007') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1008
     * @tc.name    SettingCommonEventUtilValidation1008
     * @tc.desc    Settings navbar width for 1328 probe 1008
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1328;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1008') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1009
     * @tc.name    SettingCommonEventUtilValidation1009
     * @tc.desc    Settings split mode at 9 probe 1009
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 9;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1009') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1010
     * @tc.name    SettingCommonEventUtilValidation1010
     * @tc.desc    Settings navbar width for 1330 probe 1010
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1330;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1010') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1011
     * @tc.name    SettingCommonEventUtilValidation1011
     * @tc.desc    Settings split mode at 11 probe 1011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 11;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1011') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1012
     * @tc.name    SettingCommonEventUtilValidation1012
     * @tc.desc    Settings navbar width for 1332 probe 1012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1332;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1012') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1013
     * @tc.name    SettingCommonEventUtilValidation1013
     * @tc.desc    Settings split mode at 13 probe 1013
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 13;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1013') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1014
     * @tc.name    SettingCommonEventUtilValidation1014
     * @tc.desc    Settings navbar width for 1334 probe 1014
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1334;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1014') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1015
     * @tc.name    SettingCommonEventUtilValidation1015
     * @tc.desc    Settings split mode at 15 probe 1015
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 15;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1015') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1016
     * @tc.name    SettingCommonEventUtilValidation1016
     * @tc.desc    Settings navbar width for 1336 probe 1016
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1336;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1016') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1017
     * @tc.name    SettingCommonEventUtilValidation1017
     * @tc.desc    Settings split mode at 17 probe 1017
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 17;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1017') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1018
     * @tc.name    SettingCommonEventUtilValidation1018
     * @tc.desc    Settings navbar width for 1338 probe 1018
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1338;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1018') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1019
     * @tc.name    SettingCommonEventUtilValidation1019
     * @tc.desc    Settings split mode at 19 probe 1019
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 19;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1019') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1020
     * @tc.name    SettingCommonEventUtilValidation1020
     * @tc.desc    Settings navbar width for 1340 probe 1020
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1340;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1020') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1021
     * @tc.name    SettingCommonEventUtilValidation1021
     * @tc.desc    Settings split mode at 21 probe 1021
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 21;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1021') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1022
     * @tc.name    SettingCommonEventUtilValidation1022
     * @tc.desc    Settings navbar width for 1342 probe 1022
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1342;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1022') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1023
     * @tc.name    SettingCommonEventUtilValidation1023
     * @tc.desc    Settings split mode at 23 probe 1023
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 23;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1023') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1024
     * @tc.name    SettingCommonEventUtilValidation1024
     * @tc.desc    Settings navbar width for 1344 probe 1024
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1344;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1024') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1025
     * @tc.name    SettingCommonEventUtilValidation1025
     * @tc.desc    Settings split mode at 25 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 25;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1025') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1026
     * @tc.name    SettingCommonEventUtilValidation1026
     * @tc.desc    Settings navbar width for 1346 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1346;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1026') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1027
     * @tc.name    SettingCommonEventUtilValidation1027
     * @tc.desc    Settings split mode at 27 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 27;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1027') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1028
     * @tc.name    SettingCommonEventUtilValidation1028
     * @tc.desc    Settings navbar width for 1348 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1348;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1028') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1029
     * @tc.name    SettingCommonEventUtilValidation1029
     * @tc.desc    Settings split mode at 29 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 29;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1029') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1030
     * @tc.name    SettingCommonEventUtilValidation1030
     * @tc.desc    Settings navbar width for 1350 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1350;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1030') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1031
     * @tc.name    SettingCommonEventUtilValidation1031
     * @tc.desc    Settings split mode at 31 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 31;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1031') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1032
     * @tc.name    SettingCommonEventUtilValidation1032
     * @tc.desc    Settings navbar width for 1352 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1352;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1032') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1033
     * @tc.name    SettingCommonEventUtilValidation1033
     * @tc.desc    Settings split mode at 33 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 33;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1033') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1034
     * @tc.name    SettingCommonEventUtilValidation1034
     * @tc.desc    Settings navbar width for 1354 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1354;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1034') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1035
     * @tc.name    SettingCommonEventUtilValidation1035
     * @tc.desc    Settings split mode at 35 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 35;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1035') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1036
     * @tc.name    SettingCommonEventUtilValidation1036
     * @tc.desc    Settings navbar width for 1356 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1356;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1036') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1037
     * @tc.name    SettingCommonEventUtilValidation1037
     * @tc.desc    Settings split mode at 37 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 37;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1037') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1038
     * @tc.name    SettingCommonEventUtilValidation1038
     * @tc.desc    Settings navbar width for 1358 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1358;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1038') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1039
     * @tc.name    SettingCommonEventUtilValidation1039
     * @tc.desc    Settings split mode at 39 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 39;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1039') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1040
     * @tc.name    SettingCommonEventUtilValidation1040
     * @tc.desc    Settings navbar width for 1360 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1360;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1040') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1041
     * @tc.name    SettingCommonEventUtilValidation1041
     * @tc.desc    Settings split mode at 41 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 41;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1041') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1042
     * @tc.name    SettingCommonEventUtilValidation1042
     * @tc.desc    Settings navbar width for 1362 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1362;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1042') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1043
     * @tc.name    SettingCommonEventUtilValidation1043
     * @tc.desc    Settings split mode at 43 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 43;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1043') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1044
     * @tc.name    SettingCommonEventUtilValidation1044
     * @tc.desc    Settings navbar width for 1364 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1364;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1044') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1045
     * @tc.name    SettingCommonEventUtilValidation1045
     * @tc.desc    Settings split mode at 45 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 45;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1045') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1046
     * @tc.name    SettingCommonEventUtilValidation1046
     * @tc.desc    Settings navbar width for 1366 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1366;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1046') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1047
     * @tc.name    SettingCommonEventUtilValidation1047
     * @tc.desc    Settings split mode at 47 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 47;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1047') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1048
     * @tc.name    SettingCommonEventUtilValidation1048
     * @tc.desc    Settings navbar width for 1368 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1368;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1048') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1049
     * @tc.name    SettingCommonEventUtilValidation1049
     * @tc.desc    Settings split mode at 49 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 49;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1049') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1050
     * @tc.name    SettingCommonEventUtilValidation1050
     * @tc.desc    Settings navbar width for 1370 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1370;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1050') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1051
     * @tc.name    SettingCommonEventUtilValidation1051
     * @tc.desc    Settings split mode at 51 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 51;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1051') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1052
     * @tc.name    SettingCommonEventUtilValidation1052
     * @tc.desc    Settings navbar width for 1372 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1372;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1052') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1053
     * @tc.name    SettingCommonEventUtilValidation1053
     * @tc.desc    Settings split mode at 53 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 53;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1053') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1054
     * @tc.name    SettingCommonEventUtilValidation1054
     * @tc.desc    Settings navbar width for 1374 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1374;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1054') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1055
     * @tc.name    SettingCommonEventUtilValidation1055
     * @tc.desc    Settings split mode at 55 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 55;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1055') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1056
     * @tc.name    SettingCommonEventUtilValidation1056
     * @tc.desc    Settings navbar width for 1376 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1376;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1056') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1057
     * @tc.name    SettingCommonEventUtilValidation1057
     * @tc.desc    Settings split mode at 57 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 57;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1057') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1058
     * @tc.name    SettingCommonEventUtilValidation1058
     * @tc.desc    Settings navbar width for 1378 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1378;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1058') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1059
     * @tc.name    SettingCommonEventUtilValidation1059
     * @tc.desc    Settings split mode at 59 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 59;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1059') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1060
     * @tc.name    SettingCommonEventUtilValidation1060
     * @tc.desc    Settings navbar width for 1380 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1380;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1060') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1061
     * @tc.name    SettingCommonEventUtilValidation1061
     * @tc.desc    Settings split mode at 61 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 61;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1061') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1062
     * @tc.name    SettingCommonEventUtilValidation1062
     * @tc.desc    Settings navbar width for 1382 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1382;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1062') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1063
     * @tc.name    SettingCommonEventUtilValidation1063
     * @tc.desc    Settings split mode at 63 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 63;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1063') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1064
     * @tc.name    SettingCommonEventUtilValidation1064
     * @tc.desc    Settings navbar width for 1384 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1384;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1064') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1065
     * @tc.name    SettingCommonEventUtilValidation1065
     * @tc.desc    Settings split mode at 65 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 65;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1065') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1066
     * @tc.name    SettingCommonEventUtilValidation1066
     * @tc.desc    Settings navbar width for 1386 probe 1066
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1386;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1066') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1067
     * @tc.name    SettingCommonEventUtilValidation1067
     * @tc.desc    Settings split mode at 67 probe 1067
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 67;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1067') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1068
     * @tc.name    SettingCommonEventUtilValidation1068
     * @tc.desc    Settings navbar width for 1388 probe 1068
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1388;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1068') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1069
     * @tc.name    SettingCommonEventUtilValidation1069
     * @tc.desc    Settings split mode at 69 probe 1069
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 69;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1069') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1070
     * @tc.name    SettingCommonEventUtilValidation1070
     * @tc.desc    Settings navbar width for 1390 probe 1070
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1390;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1070') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1071
     * @tc.name    SettingCommonEventUtilValidation1071
     * @tc.desc    Settings split mode at 71 probe 1071
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 71;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1071') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1072
     * @tc.name    SettingCommonEventUtilValidation1072
     * @tc.desc    Settings navbar width for 1392 probe 1072
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1392;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1072') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1073
     * @tc.name    SettingCommonEventUtilValidation1073
     * @tc.desc    Settings split mode at 73 probe 1073
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 73;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1073') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1074
     * @tc.name    SettingCommonEventUtilValidation1074
     * @tc.desc    Settings navbar width for 1394 probe 1074
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1394;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1074') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1075
     * @tc.name    SettingCommonEventUtilValidation1075
     * @tc.desc    Settings split mode at 75 probe 1075
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 75;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1075') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1076
     * @tc.name    SettingCommonEventUtilValidation1076
     * @tc.desc    Settings navbar width for 1396 probe 1076
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1396;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1076') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1077
     * @tc.name    SettingCommonEventUtilValidation1077
     * @tc.desc    Settings split mode at 77 probe 1077
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 77;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1077') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1078
     * @tc.name    SettingCommonEventUtilValidation1078
     * @tc.desc    Settings navbar width for 1398 probe 1078
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1398;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1078') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1079
     * @tc.name    SettingCommonEventUtilValidation1079
     * @tc.desc    Settings split mode at 79 probe 1079
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 79;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1079') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1080
     * @tc.name    SettingCommonEventUtilValidation1080
     * @tc.desc    Settings navbar width for 1400 probe 1080
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1400;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1080') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1081
     * @tc.name    SettingCommonEventUtilValidation1081
     * @tc.desc    Settings split mode at 81 probe 1081
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 81;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1081') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1082
     * @tc.name    SettingCommonEventUtilValidation1082
     * @tc.desc    Settings navbar width for 1402 probe 1082
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1402;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1082') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1083
     * @tc.name    SettingCommonEventUtilValidation1083
     * @tc.desc    Settings split mode at 83 probe 1083
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 83;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1083') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1084
     * @tc.name    SettingCommonEventUtilValidation1084
     * @tc.desc    Settings navbar width for 1404 probe 1084
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1404;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1084') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1085
     * @tc.name    SettingCommonEventUtilValidation1085
     * @tc.desc    Settings split mode at 85 probe 1085
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 85;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1085') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1086
     * @tc.name    SettingCommonEventUtilValidation1086
     * @tc.desc    Settings navbar width for 1406 probe 1086
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1406;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1086') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1087
     * @tc.name    SettingCommonEventUtilValidation1087
     * @tc.desc    Settings split mode at 87 probe 1087
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 87;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1087') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1088
     * @tc.name    SettingCommonEventUtilValidation1088
     * @tc.desc    Settings navbar width for 1408 probe 1088
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1408;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1088') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1089
     * @tc.name    SettingCommonEventUtilValidation1089
     * @tc.desc    Settings split mode at 89 probe 1089
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 89;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1089') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1090
     * @tc.name    SettingCommonEventUtilValidation1090
     * @tc.desc    Settings navbar width for 1410 probe 1090
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1410;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1090') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1091
     * @tc.name    SettingCommonEventUtilValidation1091
     * @tc.desc    Settings split mode at 91 probe 1091
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 91;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1091') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1092
     * @tc.name    SettingCommonEventUtilValidation1092
     * @tc.desc    Settings navbar width for 1412 probe 1092
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1412;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1092') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1093
     * @tc.name    SettingCommonEventUtilValidation1093
     * @tc.desc    Settings split mode at 93 probe 1093
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 93;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1093') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1094
     * @tc.name    SettingCommonEventUtilValidation1094
     * @tc.desc    Settings navbar width for 1414 probe 1094
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1414;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1094') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1095
     * @tc.name    SettingCommonEventUtilValidation1095
     * @tc.desc    Settings split mode at 95 probe 1095
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 95;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1095') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1096
     * @tc.name    SettingCommonEventUtilValidation1096
     * @tc.desc    Settings navbar width for 1416 probe 1096
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1416;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1096') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1097
     * @tc.name    SettingCommonEventUtilValidation1097
     * @tc.desc    Settings split mode at 97 probe 1097
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 97;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1097') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1098
     * @tc.name    SettingCommonEventUtilValidation1098
     * @tc.desc    Settings navbar width for 1418 probe 1098
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1418;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1098') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1099
     * @tc.name    SettingCommonEventUtilValidation1099
     * @tc.desc    Settings split mode at 99 probe 1099
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 99;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1099') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1100
     * @tc.name    SettingCommonEventUtilValidation1100
     * @tc.desc    Settings navbar width for 1420 probe 1100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1420;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1100') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1101
     * @tc.name    SettingCommonEventUtilValidation1101
     * @tc.desc    Settings split mode at 101 probe 1101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 101;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1101') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1102
     * @tc.name    SettingCommonEventUtilValidation1102
     * @tc.desc    Settings navbar width for 1422 probe 1102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1422;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1102') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1103
     * @tc.name    SettingCommonEventUtilValidation1103
     * @tc.desc    Settings split mode at 103 probe 1103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 103;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1103') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1104
     * @tc.name    SettingCommonEventUtilValidation1104
     * @tc.desc    Settings navbar width for 1424 probe 1104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1424;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1104') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1105
     * @tc.name    SettingCommonEventUtilValidation1105
     * @tc.desc    Settings split mode at 105 probe 1105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 105;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1105') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1106
     * @tc.name    SettingCommonEventUtilValidation1106
     * @tc.desc    Settings navbar width for 1426 probe 1106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1426;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1106') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1107
     * @tc.name    SettingCommonEventUtilValidation1107
     * @tc.desc    Settings split mode at 107 probe 1107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 107;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1107') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1108
     * @tc.name    SettingCommonEventUtilValidation1108
     * @tc.desc    Settings navbar width for 1428 probe 1108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1428;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1108') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1109
     * @tc.name    SettingCommonEventUtilValidation1109
     * @tc.desc    Settings split mode at 109 probe 1109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 109;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1109') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1110
     * @tc.name    SettingCommonEventUtilValidation1110
     * @tc.desc    Settings navbar width for 1430 probe 1110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1430;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1110') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1111
     * @tc.name    SettingCommonEventUtilValidation1111
     * @tc.desc    Settings split mode at 111 probe 1111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 111;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1111') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1112
     * @tc.name    SettingCommonEventUtilValidation1112
     * @tc.desc    Settings navbar width for 1432 probe 1112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1432;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1112') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1113
     * @tc.name    SettingCommonEventUtilValidation1113
     * @tc.desc    Settings split mode at 113 probe 1113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 113;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1113') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1114
     * @tc.name    SettingCommonEventUtilValidation1114
     * @tc.desc    Settings navbar width for 1434 probe 1114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1434;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1114') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1115
     * @tc.name    SettingCommonEventUtilValidation1115
     * @tc.desc    Settings split mode at 115 probe 1115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 115;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1115') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1116
     * @tc.name    SettingCommonEventUtilValidation1116
     * @tc.desc    Settings navbar width for 1436 probe 1116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1436;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1116') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1117
     * @tc.name    SettingCommonEventUtilValidation1117
     * @tc.desc    Settings split mode at 117 probe 1117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingCommonEventUtilValidation1117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 117;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1117') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

