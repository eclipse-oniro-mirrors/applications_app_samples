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

export default function settingAuthSessionSuite() {
  describe('SettingAuthSessionSuite', () => {
    let m: SettingsModel = new SettingsModel();

    beforeEach(() => {
      m = new SettingsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1118
     * @tc.name    SettingAuthSession1118
     * @tc.desc    Settings navbar width for 1438 probe 1118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1438;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1118') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1119
     * @tc.name    SettingAuthSession1119
     * @tc.desc    Settings split mode at 119 probe 1119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 119;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1119') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1120
     * @tc.name    SettingAuthSession1120
     * @tc.desc    Settings navbar width for 1440 probe 1120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1440;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1120') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1121
     * @tc.name    SettingAuthSession1121
     * @tc.desc    Settings split mode at 121 probe 1121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 121;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1121') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1122
     * @tc.name    SettingAuthSession1122
     * @tc.desc    Settings navbar width for 1442 probe 1122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1442;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1122') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1123
     * @tc.name    SettingAuthSession1123
     * @tc.desc    Settings split mode at 123 probe 1123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 123;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1123') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1124
     * @tc.name    SettingAuthSession1124
     * @tc.desc    Settings navbar width for 1444 probe 1124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1444;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1124') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1125
     * @tc.name    SettingAuthSession1125
     * @tc.desc    Settings split mode at 125 probe 1125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 125;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1125') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1126
     * @tc.name    SettingAuthSession1126
     * @tc.desc    Settings navbar width for 1446 probe 1126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1446;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1126') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1127
     * @tc.name    SettingAuthSession1127
     * @tc.desc    Settings split mode at 127 probe 1127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 127;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1127') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1128
     * @tc.name    SettingAuthSession1128
     * @tc.desc    Settings navbar width for 1448 probe 1128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1448;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1128') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1129
     * @tc.name    SettingAuthSession1129
     * @tc.desc    Settings split mode at 129 probe 1129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 129;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1129') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1130
     * @tc.name    SettingAuthSession1130
     * @tc.desc    Settings navbar width for 1450 probe 1130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1450;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1130') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1131
     * @tc.name    SettingAuthSession1131
     * @tc.desc    Settings split mode at 131 probe 1131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 131;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1131') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1132
     * @tc.name    SettingAuthSession1132
     * @tc.desc    Settings navbar width for 1452 probe 1132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1452;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1132') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1133
     * @tc.name    SettingAuthSession1133
     * @tc.desc    Settings split mode at 133 probe 1133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 133;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1133') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1134
     * @tc.name    SettingAuthSession1134
     * @tc.desc    Settings navbar width for 1454 probe 1134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1454;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1134') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1135
     * @tc.name    SettingAuthSession1135
     * @tc.desc    Settings split mode at 135 probe 1135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 135;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1135') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1136
     * @tc.name    SettingAuthSession1136
     * @tc.desc    Settings navbar width for 1456 probe 1136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1456;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1136') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1137
     * @tc.name    SettingAuthSession1137
     * @tc.desc    Settings split mode at 137 probe 1137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 137;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1137') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1138
     * @tc.name    SettingAuthSession1138
     * @tc.desc    Settings navbar width for 1458 probe 1138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1458;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1138') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1139
     * @tc.name    SettingAuthSession1139
     * @tc.desc    Settings split mode at 139 probe 1139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 139;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1139') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1140
     * @tc.name    SettingAuthSession1140
     * @tc.desc    Settings navbar width for 1460 probe 1140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1460;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1140') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1141
     * @tc.name    SettingAuthSession1141
     * @tc.desc    Settings split mode at 141 probe 1141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 141;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1141') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1142
     * @tc.name    SettingAuthSession1142
     * @tc.desc    Settings navbar width for 1462 probe 1142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1462;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1142') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1143
     * @tc.name    SettingAuthSession1143
     * @tc.desc    Settings split mode at 143 probe 1143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 143;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1143') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1144
     * @tc.name    SettingAuthSession1144
     * @tc.desc    Settings navbar width for 1464 probe 1144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1464;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1144') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1145
     * @tc.name    SettingAuthSession1145
     * @tc.desc    Settings split mode at 145 probe 1145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 145;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1145') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1146
     * @tc.name    SettingAuthSession1146
     * @tc.desc    Settings navbar width for 1466 probe 1146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1466;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1146') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1147
     * @tc.name    SettingAuthSession1147
     * @tc.desc    Settings split mode at 147 probe 1147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 147;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1147') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1148
     * @tc.name    SettingAuthSession1148
     * @tc.desc    Settings navbar width for 1468 probe 1148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1468;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1148') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1149
     * @tc.name    SettingAuthSession1149
     * @tc.desc    Settings split mode at 149 probe 1149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 149;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1149') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1150
     * @tc.name    SettingAuthSession1150
     * @tc.desc    Settings navbar width for 1470 probe 1150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1470;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1150') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1151
     * @tc.name    SettingAuthSession1151
     * @tc.desc    Settings split mode at 151 probe 1151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 151;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1151') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1152
     * @tc.name    SettingAuthSession1152
     * @tc.desc    Settings navbar width for 1472 probe 1152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1472;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1152') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1153
     * @tc.name    SettingAuthSession1153
     * @tc.desc    Settings split mode at 153 probe 1153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 153;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1153') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1154
     * @tc.name    SettingAuthSession1154
     * @tc.desc    Settings navbar width for 1474 probe 1154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1474;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1154') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1155
     * @tc.name    SettingAuthSession1155
     * @tc.desc    Settings split mode at 155 probe 1155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 155;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1155') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1156
     * @tc.name    SettingAuthSession1156
     * @tc.desc    Settings navbar width for 1476 probe 1156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1476;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1156') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1157
     * @tc.name    SettingAuthSession1157
     * @tc.desc    Settings split mode at 157 probe 1157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 157;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1157') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1158
     * @tc.name    SettingAuthSession1158
     * @tc.desc    Settings navbar width for 1478 probe 1158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1478;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1158') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1159
     * @tc.name    SettingAuthSession1159
     * @tc.desc    Settings split mode at 159 probe 1159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 159;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1159') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1160
     * @tc.name    SettingAuthSession1160
     * @tc.desc    Settings navbar width for 1480 probe 1160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1480;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1160') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1161
     * @tc.name    SettingAuthSession1161
     * @tc.desc    Settings split mode at 161 probe 1161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 161;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1161') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1162
     * @tc.name    SettingAuthSession1162
     * @tc.desc    Settings navbar width for 1482 probe 1162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1482;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1162') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1163
     * @tc.name    SettingAuthSession1163
     * @tc.desc    Settings split mode at 163 probe 1163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 163;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1163') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1164
     * @tc.name    SettingAuthSession1164
     * @tc.desc    Settings navbar width for 1484 probe 1164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1484;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1164') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1165
     * @tc.name    SettingAuthSession1165
     * @tc.desc    Settings split mode at 165 probe 1165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 165;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1165') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1166
     * @tc.name    SettingAuthSession1166
     * @tc.desc    Settings navbar width for 1486 probe 1166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1486;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1166') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1167
     * @tc.name    SettingAuthSession1167
     * @tc.desc    Settings split mode at 167 probe 1167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 167;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1167') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1168
     * @tc.name    SettingAuthSession1168
     * @tc.desc    Settings navbar width for 1488 probe 1168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1488;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1168') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1169
     * @tc.name    SettingAuthSession1169
     * @tc.desc    Settings split mode at 169 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 169;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1169') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1170
     * @tc.name    SettingAuthSession1170
     * @tc.desc    Settings navbar width for 1490 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1490;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1170') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1171
     * @tc.name    SettingAuthSession1171
     * @tc.desc    Settings split mode at 171 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 171;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1171') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1172
     * @tc.name    SettingAuthSession1172
     * @tc.desc    Settings navbar width for 1492 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1492;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1172') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1173
     * @tc.name    SettingAuthSession1173
     * @tc.desc    Settings split mode at 173 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 173;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1173') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1174
     * @tc.name    SettingAuthSession1174
     * @tc.desc    Settings navbar width for 1494 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1494;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1174') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1175
     * @tc.name    SettingAuthSession1175
     * @tc.desc    Settings split mode at 175 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 175;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1175') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1176
     * @tc.name    SettingAuthSession1176
     * @tc.desc    Settings navbar width for 1496 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1496;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1176') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1177
     * @tc.name    SettingAuthSession1177
     * @tc.desc    Settings split mode at 177 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 177;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1177') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1178
     * @tc.name    SettingAuthSession1178
     * @tc.desc    Settings navbar width for 1498 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1498;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1178') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1179
     * @tc.name    SettingAuthSession1179
     * @tc.desc    Settings split mode at 179 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 179;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1179') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1180
     * @tc.name    SettingAuthSession1180
     * @tc.desc    Settings navbar width for 1500 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1500;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1180') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1181
     * @tc.name    SettingAuthSession1181
     * @tc.desc    Settings split mode at 181 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 181;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1181') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1182
     * @tc.name    SettingAuthSession1182
     * @tc.desc    Settings navbar width for 1502 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1502;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1182') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1183
     * @tc.name    SettingAuthSession1183
     * @tc.desc    Settings split mode at 183 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 183;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1183') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1184
     * @tc.name    SettingAuthSession1184
     * @tc.desc    Settings navbar width for 1504 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1504;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1184') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1185
     * @tc.name    SettingAuthSession1185
     * @tc.desc    Settings split mode at 185 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 185;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1185') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1186
     * @tc.name    SettingAuthSession1186
     * @tc.desc    Settings navbar width for 1506 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1506;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1186') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1187
     * @tc.name    SettingAuthSession1187
     * @tc.desc    Settings split mode at 187 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 187;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1187') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1188
     * @tc.name    SettingAuthSession1188
     * @tc.desc    Settings navbar width for 1508 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1508;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1188') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1189
     * @tc.name    SettingAuthSession1189
     * @tc.desc    Settings split mode at 189 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 189;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1189') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1190
     * @tc.name    SettingAuthSession1190
     * @tc.desc    Settings navbar width for 1510 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1510;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1190') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1191
     * @tc.name    SettingAuthSession1191
     * @tc.desc    Settings split mode at 191 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 191;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1191') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1192
     * @tc.name    SettingAuthSession1192
     * @tc.desc    Settings navbar width for 1512 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1512;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1192') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1193
     * @tc.name    SettingAuthSession1193
     * @tc.desc    Settings split mode at 193 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 193;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1193') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1194
     * @tc.name    SettingAuthSession1194
     * @tc.desc    Settings navbar width for 1514 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1514;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1194') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1195
     * @tc.name    SettingAuthSession1195
     * @tc.desc    Settings split mode at 195 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 195;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1195') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1196
     * @tc.name    SettingAuthSession1196
     * @tc.desc    Settings navbar width for 1516 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1516;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1196') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1197
     * @tc.name    SettingAuthSession1197
     * @tc.desc    Settings split mode at 197 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 197;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1197') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1198
     * @tc.name    SettingAuthSession1198
     * @tc.desc    Settings navbar width for 1518 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1518;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1198') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1199
     * @tc.name    SettingAuthSession1199
     * @tc.desc    Settings split mode at 199 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 199;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1199') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1200
     * @tc.name    SettingAuthSession1200
     * @tc.desc    Settings navbar width for 1520 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1520;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1200') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1201
     * @tc.name    SettingAuthSession1201
     * @tc.desc    Settings split mode at 201 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 201;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1201') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1202
     * @tc.name    SettingAuthSession1202
     * @tc.desc    Settings navbar width for 1522 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1522;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1202') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1203
     * @tc.name    SettingAuthSession1203
     * @tc.desc    Settings split mode at 203 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 203;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1203') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1204
     * @tc.name    SettingAuthSession1204
     * @tc.desc    Settings navbar width for 1524 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1524;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1204') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1205
     * @tc.name    SettingAuthSession1205
     * @tc.desc    Settings split mode at 205 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 205;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1205') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1206
     * @tc.name    SettingAuthSession1206
     * @tc.desc    Settings navbar width for 1526 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1526;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1206') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1207
     * @tc.name    SettingAuthSession1207
     * @tc.desc    Settings split mode at 207 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 207;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1207') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1208
     * @tc.name    SettingAuthSession1208
     * @tc.desc    Settings navbar width for 1528 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1528;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1208') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1209
     * @tc.name    SettingAuthSession1209
     * @tc.desc    Settings split mode at 209 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 209;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1209') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1210
     * @tc.name    SettingAuthSession1210
     * @tc.desc    Settings navbar width for 1530 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1530;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1210') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1211
     * @tc.name    SettingAuthSession1211
     * @tc.desc    Settings split mode at 211 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 211;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1211') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1212
     * @tc.name    SettingAuthSession1212
     * @tc.desc    Settings navbar width for 1532 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1532;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1212') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1213
     * @tc.name    SettingAuthSession1213
     * @tc.desc    Settings split mode at 213 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 213;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1213') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1214
     * @tc.name    SettingAuthSession1214
     * @tc.desc    Settings navbar width for 1534 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1534;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1214') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1215
     * @tc.name    SettingAuthSession1215
     * @tc.desc    Settings split mode at 215 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 215;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1215') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1216
     * @tc.name    SettingAuthSession1216
     * @tc.desc    Settings navbar width for 1536 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1536;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1216') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1217
     * @tc.name    SettingAuthSession1217
     * @tc.desc    Settings split mode at 217 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 217;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1217') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1218
     * @tc.name    SettingAuthSession1218
     * @tc.desc    Settings navbar width for 1538 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1538;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1218') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1219
     * @tc.name    SettingAuthSession1219
     * @tc.desc    Settings split mode at 219 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 219;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1219') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1220
     * @tc.name    SettingAuthSession1220
     * @tc.desc    Settings navbar width for 1540 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1540;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1220') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1221
     * @tc.name    SettingAuthSession1221
     * @tc.desc    Settings split mode at 221 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 221;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1221') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1222
     * @tc.name    SettingAuthSession1222
     * @tc.desc    Settings navbar width for 1542 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1542;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1222') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1223
     * @tc.name    SettingAuthSession1223
     * @tc.desc    Settings split mode at 223 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 223;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1223') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1224
     * @tc.name    SettingAuthSession1224
     * @tc.desc    Settings navbar width for 1544 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1544;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1224') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1225
     * @tc.name    SettingAuthSession1225
     * @tc.desc    Settings split mode at 225 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 225;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1225') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1226
     * @tc.name    SettingAuthSession1226
     * @tc.desc    Settings navbar width for 1546 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1546;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1226') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1227
     * @tc.name    SettingAuthSession1227
     * @tc.desc    Settings split mode at 227 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 227;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1227') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1228
     * @tc.name    SettingAuthSession1228
     * @tc.desc    Settings navbar width for 1548 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 1548;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(m.getEntry('nohit1228') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_SETTING_1229
     * @tc.name    SettingAuthSession1229
     * @tc.desc    Settings split mode at 229 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('SettingAuthSession1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 229;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getEntry('nohit1229') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
