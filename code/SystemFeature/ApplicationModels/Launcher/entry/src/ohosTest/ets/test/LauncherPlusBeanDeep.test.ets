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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { AppItemInfo, CardItemInfo, MissionInfo } from '@ohos/base';

export default function launcherPlusBeanDeepTest() {
  describe('LauncherPlusBeanDeepTest', () => {

    /**
     * @tc.name   testLauncherPlusBeanDeep0001
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0001
     * @tc.desc   Assign deep launcher bean values 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-1';
      app.appName = 'DeepApp1';
      app.appIconId = 1001;
      app.appLabelId = 'label-1';
      app.bundleName = 'com.deep.launcher1';
      app.abilityName = 'DeepAbility1';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [1, 1];
      app.page = 1;
      app.column = 1;
      app.row = 1;
      expect(app.appId).assertEqual('deep-1');
      expect(app.appIconId).assertEqual(1001);
      expect(app.bundleName).assertEqual('com.deep.launcher1');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 101;
      mission.bundleName = 'com.deep.mission1';
      mission.abilityName = 'DeepMissionAbility1';
      mission.appName = 'MissionApp1';
      mission.appIconId = 201;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(101);
      expect(mission.appName).assertEqual('MissionApp1');
      expect(mission.appIconId).assertEqual(201);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0002
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0002
     * @tc.desc   Assign deep launcher bean values 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-2';
      app.appName = 'DeepApp2';
      app.appIconId = 1002;
      app.appLabelId = 'label-2';
      app.bundleName = 'com.deep.launcher2';
      app.abilityName = 'DeepAbility2';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [2, 2];
      app.page = 2;
      app.column = 2;
      app.row = 2;
      expect(app.appId).assertEqual('deep-2');
      expect(app.appIconId).assertEqual(1002);
      expect(app.bundleName).assertEqual('com.deep.launcher2');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 102;
      mission.bundleName = 'com.deep.mission2';
      mission.abilityName = 'DeepMissionAbility2';
      mission.appName = 'MissionApp2';
      mission.appIconId = 202;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(102);
      expect(mission.appName).assertEqual('MissionApp2');
      expect(mission.appIconId).assertEqual(202);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0003
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0003
     * @tc.desc   Assign deep launcher bean values 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-3';
      app.appName = 'DeepApp3';
      app.appIconId = 1003;
      app.appLabelId = 'label-3';
      app.bundleName = 'com.deep.launcher3';
      app.abilityName = 'DeepAbility3';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [3, 3];
      app.page = 0;
      app.column = 3;
      app.row = 3;
      expect(app.appId).assertEqual('deep-3');
      expect(app.appIconId).assertEqual(1003);
      expect(app.bundleName).assertEqual('com.deep.launcher3');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 103;
      mission.bundleName = 'com.deep.mission3';
      mission.abilityName = 'DeepMissionAbility3';
      mission.appName = 'MissionApp3';
      mission.appIconId = 203;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(103);
      expect(mission.appName).assertEqual('MissionApp3');
      expect(mission.appIconId).assertEqual(203);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0004
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0004
     * @tc.desc   Assign deep launcher bean values 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-4';
      app.appName = 'DeepApp4';
      app.appIconId = 1004;
      app.appLabelId = 'label-4';
      app.bundleName = 'com.deep.launcher4';
      app.abilityName = 'DeepAbility4';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [0, 4];
      app.page = 1;
      app.column = 4;
      app.row = 4;
      expect(app.appId).assertEqual('deep-4');
      expect(app.appIconId).assertEqual(1004);
      expect(app.bundleName).assertEqual('com.deep.launcher4');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 104;
      mission.bundleName = 'com.deep.mission4';
      mission.abilityName = 'DeepMissionAbility4';
      mission.appName = 'MissionApp4';
      mission.appIconId = 204;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(104);
      expect(mission.appName).assertEqual('MissionApp4');
      expect(mission.appIconId).assertEqual(204);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0005
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0005
     * @tc.desc   Assign deep launcher bean values 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-5';
      app.appName = 'DeepApp5';
      app.appIconId = 1005;
      app.appLabelId = 'label-5';
      app.bundleName = 'com.deep.launcher5';
      app.abilityName = 'DeepAbility5';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [1, 0];
      app.page = 2;
      app.column = 0;
      app.row = 5;
      expect(app.appId).assertEqual('deep-5');
      expect(app.appIconId).assertEqual(1005);
      expect(app.bundleName).assertEqual('com.deep.launcher5');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 105;
      mission.bundleName = 'com.deep.mission5';
      mission.abilityName = 'DeepMissionAbility5';
      mission.appName = 'MissionApp5';
      mission.appIconId = 205;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(105);
      expect(mission.appName).assertEqual('MissionApp5');
      expect(mission.appIconId).assertEqual(205);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0006
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0006
     * @tc.desc   Assign deep launcher bean values 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-6';
      app.appName = 'DeepApp6';
      app.appIconId = 1006;
      app.appLabelId = 'label-6';
      app.bundleName = 'com.deep.launcher6';
      app.abilityName = 'DeepAbility6';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [2, 1];
      app.page = 0;
      app.column = 1;
      app.row = 0;
      expect(app.appId).assertEqual('deep-6');
      expect(app.appIconId).assertEqual(1006);
      expect(app.bundleName).assertEqual('com.deep.launcher6');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 106;
      mission.bundleName = 'com.deep.mission6';
      mission.abilityName = 'DeepMissionAbility6';
      mission.appName = 'MissionApp6';
      mission.appIconId = 206;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(106);
      expect(mission.appName).assertEqual('MissionApp6');
      expect(mission.appIconId).assertEqual(206);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0007
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0007
     * @tc.desc   Assign deep launcher bean values 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-7';
      app.appName = 'DeepApp7';
      app.appIconId = 1007;
      app.appLabelId = 'label-7';
      app.bundleName = 'com.deep.launcher7';
      app.abilityName = 'DeepAbility7';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [3, 2];
      app.page = 1;
      app.column = 2;
      app.row = 1;
      expect(app.appId).assertEqual('deep-7');
      expect(app.appIconId).assertEqual(1007);
      expect(app.bundleName).assertEqual('com.deep.launcher7');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 107;
      mission.bundleName = 'com.deep.mission7';
      mission.abilityName = 'DeepMissionAbility7';
      mission.appName = 'MissionApp7';
      mission.appIconId = 207;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(107);
      expect(mission.appName).assertEqual('MissionApp7');
      expect(mission.appIconId).assertEqual(207);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0008
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0008
     * @tc.desc   Assign deep launcher bean values 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-8';
      app.appName = 'DeepApp8';
      app.appIconId = 1008;
      app.appLabelId = 'label-8';
      app.bundleName = 'com.deep.launcher8';
      app.abilityName = 'DeepAbility8';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [0, 3];
      app.page = 2;
      app.column = 3;
      app.row = 2;
      expect(app.appId).assertEqual('deep-8');
      expect(app.appIconId).assertEqual(1008);
      expect(app.bundleName).assertEqual('com.deep.launcher8');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 108;
      mission.bundleName = 'com.deep.mission8';
      mission.abilityName = 'DeepMissionAbility8';
      mission.appName = 'MissionApp8';
      mission.appIconId = 208;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(108);
      expect(mission.appName).assertEqual('MissionApp8');
      expect(mission.appIconId).assertEqual(208);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0009
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0009
     * @tc.desc   Assign deep launcher bean values 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-9';
      app.appName = 'DeepApp9';
      app.appIconId = 1009;
      app.appLabelId = 'label-9';
      app.bundleName = 'com.deep.launcher9';
      app.abilityName = 'DeepAbility9';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [1, 4];
      app.page = 0;
      app.column = 4;
      app.row = 3;
      expect(app.appId).assertEqual('deep-9');
      expect(app.appIconId).assertEqual(1009);
      expect(app.bundleName).assertEqual('com.deep.launcher9');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 109;
      mission.bundleName = 'com.deep.mission9';
      mission.abilityName = 'DeepMissionAbility9';
      mission.appName = 'MissionApp9';
      mission.appIconId = 209;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(109);
      expect(mission.appName).assertEqual('MissionApp9');
      expect(mission.appIconId).assertEqual(209);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0010
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0010
     * @tc.desc   Assign deep launcher bean values 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-10';
      app.appName = 'DeepApp10';
      app.appIconId = 1010;
      app.appLabelId = 'label-10';
      app.bundleName = 'com.deep.launcher10';
      app.abilityName = 'DeepAbility10';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [2, 0];
      app.page = 1;
      app.column = 0;
      app.row = 4;
      expect(app.appId).assertEqual('deep-10');
      expect(app.appIconId).assertEqual(1010);
      expect(app.bundleName).assertEqual('com.deep.launcher10');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 110;
      mission.bundleName = 'com.deep.mission10';
      mission.abilityName = 'DeepMissionAbility10';
      mission.appName = 'MissionApp10';
      mission.appIconId = 210;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(110);
      expect(mission.appName).assertEqual('MissionApp10');
      expect(mission.appIconId).assertEqual(210);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0011
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0011
     * @tc.desc   Assign deep launcher bean values 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-11';
      app.appName = 'DeepApp11';
      app.appIconId = 1011;
      app.appLabelId = 'label-11';
      app.bundleName = 'com.deep.launcher11';
      app.abilityName = 'DeepAbility11';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [3, 1];
      app.page = 2;
      app.column = 1;
      app.row = 5;
      expect(app.appId).assertEqual('deep-11');
      expect(app.appIconId).assertEqual(1011);
      expect(app.bundleName).assertEqual('com.deep.launcher11');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 111;
      mission.bundleName = 'com.deep.mission11';
      mission.abilityName = 'DeepMissionAbility11';
      mission.appName = 'MissionApp11';
      mission.appIconId = 211;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(111);
      expect(mission.appName).assertEqual('MissionApp11');
      expect(mission.appIconId).assertEqual(211);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0012
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0012
     * @tc.desc   Assign deep launcher bean values 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-12';
      app.appName = 'DeepApp12';
      app.appIconId = 1012;
      app.appLabelId = 'label-12';
      app.bundleName = 'com.deep.launcher12';
      app.abilityName = 'DeepAbility12';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [0, 2];
      app.page = 0;
      app.column = 2;
      app.row = 0;
      expect(app.appId).assertEqual('deep-12');
      expect(app.appIconId).assertEqual(1012);
      expect(app.bundleName).assertEqual('com.deep.launcher12');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 112;
      mission.bundleName = 'com.deep.mission12';
      mission.abilityName = 'DeepMissionAbility12';
      mission.appName = 'MissionApp12';
      mission.appIconId = 212;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(112);
      expect(mission.appName).assertEqual('MissionApp12');
      expect(mission.appIconId).assertEqual(212);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0013
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0013
     * @tc.desc   Assign deep launcher bean values 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-13';
      app.appName = 'DeepApp13';
      app.appIconId = 1013;
      app.appLabelId = 'label-13';
      app.bundleName = 'com.deep.launcher13';
      app.abilityName = 'DeepAbility13';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [1, 3];
      app.page = 1;
      app.column = 3;
      app.row = 1;
      expect(app.appId).assertEqual('deep-13');
      expect(app.appIconId).assertEqual(1013);
      expect(app.bundleName).assertEqual('com.deep.launcher13');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 113;
      mission.bundleName = 'com.deep.mission13';
      mission.abilityName = 'DeepMissionAbility13';
      mission.appName = 'MissionApp13';
      mission.appIconId = 213;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(113);
      expect(mission.appName).assertEqual('MissionApp13');
      expect(mission.appIconId).assertEqual(213);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0014
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0014
     * @tc.desc   Assign deep launcher bean values 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-14';
      app.appName = 'DeepApp14';
      app.appIconId = 1014;
      app.appLabelId = 'label-14';
      app.bundleName = 'com.deep.launcher14';
      app.abilityName = 'DeepAbility14';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [2, 4];
      app.page = 2;
      app.column = 4;
      app.row = 2;
      expect(app.appId).assertEqual('deep-14');
      expect(app.appIconId).assertEqual(1014);
      expect(app.bundleName).assertEqual('com.deep.launcher14');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 114;
      mission.bundleName = 'com.deep.mission14';
      mission.abilityName = 'DeepMissionAbility14';
      mission.appName = 'MissionApp14';
      mission.appIconId = 214;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(114);
      expect(mission.appName).assertEqual('MissionApp14');
      expect(mission.appIconId).assertEqual(214);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0015
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0015
     * @tc.desc   Assign deep launcher bean values 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-15';
      app.appName = 'DeepApp15';
      app.appIconId = 1015;
      app.appLabelId = 'label-15';
      app.bundleName = 'com.deep.launcher15';
      app.abilityName = 'DeepAbility15';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [3, 0];
      app.page = 0;
      app.column = 0;
      app.row = 3;
      expect(app.appId).assertEqual('deep-15');
      expect(app.appIconId).assertEqual(1015);
      expect(app.bundleName).assertEqual('com.deep.launcher15');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 115;
      mission.bundleName = 'com.deep.mission15';
      mission.abilityName = 'DeepMissionAbility15';
      mission.appName = 'MissionApp15';
      mission.appIconId = 215;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(115);
      expect(mission.appName).assertEqual('MissionApp15');
      expect(mission.appIconId).assertEqual(215);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0016
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0016
     * @tc.desc   Assign deep launcher bean values 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-16';
      app.appName = 'DeepApp16';
      app.appIconId = 1016;
      app.appLabelId = 'label-16';
      app.bundleName = 'com.deep.launcher16';
      app.abilityName = 'DeepAbility16';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [0, 1];
      app.page = 1;
      app.column = 1;
      app.row = 4;
      expect(app.appId).assertEqual('deep-16');
      expect(app.appIconId).assertEqual(1016);
      expect(app.bundleName).assertEqual('com.deep.launcher16');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 116;
      mission.bundleName = 'com.deep.mission16';
      mission.abilityName = 'DeepMissionAbility16';
      mission.appName = 'MissionApp16';
      mission.appIconId = 216;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(116);
      expect(mission.appName).assertEqual('MissionApp16');
      expect(mission.appIconId).assertEqual(216);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0017
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0017
     * @tc.desc   Assign deep launcher bean values 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-17';
      app.appName = 'DeepApp17';
      app.appIconId = 1017;
      app.appLabelId = 'label-17';
      app.bundleName = 'com.deep.launcher17';
      app.abilityName = 'DeepAbility17';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [1, 2];
      app.page = 2;
      app.column = 2;
      app.row = 5;
      expect(app.appId).assertEqual('deep-17');
      expect(app.appIconId).assertEqual(1017);
      expect(app.bundleName).assertEqual('com.deep.launcher17');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 117;
      mission.bundleName = 'com.deep.mission17';
      mission.abilityName = 'DeepMissionAbility17';
      mission.appName = 'MissionApp17';
      mission.appIconId = 217;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(117);
      expect(mission.appName).assertEqual('MissionApp17');
      expect(mission.appIconId).assertEqual(217);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0018
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0018
     * @tc.desc   Assign deep launcher bean values 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-18';
      app.appName = 'DeepApp18';
      app.appIconId = 1018;
      app.appLabelId = 'label-18';
      app.bundleName = 'com.deep.launcher18';
      app.abilityName = 'DeepAbility18';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [2, 3];
      app.page = 0;
      app.column = 3;
      app.row = 0;
      expect(app.appId).assertEqual('deep-18');
      expect(app.appIconId).assertEqual(1018);
      expect(app.bundleName).assertEqual('com.deep.launcher18');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 118;
      mission.bundleName = 'com.deep.mission18';
      mission.abilityName = 'DeepMissionAbility18';
      mission.appName = 'MissionApp18';
      mission.appIconId = 218;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(118);
      expect(mission.appName).assertEqual('MissionApp18');
      expect(mission.appIconId).assertEqual(218);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0019
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0019
     * @tc.desc   Assign deep launcher bean values 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-19';
      app.appName = 'DeepApp19';
      app.appIconId = 1019;
      app.appLabelId = 'label-19';
      app.bundleName = 'com.deep.launcher19';
      app.abilityName = 'DeepAbility19';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [3, 4];
      app.page = 1;
      app.column = 4;
      app.row = 1;
      expect(app.appId).assertEqual('deep-19');
      expect(app.appIconId).assertEqual(1019);
      expect(app.bundleName).assertEqual('com.deep.launcher19');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 119;
      mission.bundleName = 'com.deep.mission19';
      mission.abilityName = 'DeepMissionAbility19';
      mission.appName = 'MissionApp19';
      mission.appIconId = 219;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(119);
      expect(mission.appName).assertEqual('MissionApp19');
      expect(mission.appIconId).assertEqual(219);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0020
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0020
     * @tc.desc   Assign deep launcher bean values 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-20';
      app.appName = 'DeepApp20';
      app.appIconId = 1020;
      app.appLabelId = 'label-20';
      app.bundleName = 'com.deep.launcher20';
      app.abilityName = 'DeepAbility20';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [0, 0];
      app.page = 2;
      app.column = 0;
      app.row = 2;
      expect(app.appId).assertEqual('deep-20');
      expect(app.appIconId).assertEqual(1020);
      expect(app.bundleName).assertEqual('com.deep.launcher20');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 120;
      mission.bundleName = 'com.deep.mission20';
      mission.abilityName = 'DeepMissionAbility20';
      mission.appName = 'MissionApp20';
      mission.appIconId = 220;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(120);
      expect(mission.appName).assertEqual('MissionApp20');
      expect(mission.appIconId).assertEqual(220);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0021
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0021
     * @tc.desc   Assign deep launcher bean values 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-21';
      app.appName = 'DeepApp21';
      app.appIconId = 1021;
      app.appLabelId = 'label-21';
      app.bundleName = 'com.deep.launcher21';
      app.abilityName = 'DeepAbility21';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [1, 1];
      app.page = 0;
      app.column = 1;
      app.row = 3;
      expect(app.appId).assertEqual('deep-21');
      expect(app.appIconId).assertEqual(1021);
      expect(app.bundleName).assertEqual('com.deep.launcher21');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 121;
      mission.bundleName = 'com.deep.mission21';
      mission.abilityName = 'DeepMissionAbility21';
      mission.appName = 'MissionApp21';
      mission.appIconId = 221;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(121);
      expect(mission.appName).assertEqual('MissionApp21');
      expect(mission.appIconId).assertEqual(221);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0022
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0022
     * @tc.desc   Assign deep launcher bean values 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-22';
      app.appName = 'DeepApp22';
      app.appIconId = 1022;
      app.appLabelId = 'label-22';
      app.bundleName = 'com.deep.launcher22';
      app.abilityName = 'DeepAbility22';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [2, 2];
      app.page = 1;
      app.column = 2;
      app.row = 4;
      expect(app.appId).assertEqual('deep-22');
      expect(app.appIconId).assertEqual(1022);
      expect(app.bundleName).assertEqual('com.deep.launcher22');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 122;
      mission.bundleName = 'com.deep.mission22';
      mission.abilityName = 'DeepMissionAbility22';
      mission.appName = 'MissionApp22';
      mission.appIconId = 222;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(122);
      expect(mission.appName).assertEqual('MissionApp22');
      expect(mission.appIconId).assertEqual(222);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0023
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0023
     * @tc.desc   Assign deep launcher bean values 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-23';
      app.appName = 'DeepApp23';
      app.appIconId = 1023;
      app.appLabelId = 'label-23';
      app.bundleName = 'com.deep.launcher23';
      app.abilityName = 'DeepAbility23';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [3, 3];
      app.page = 2;
      app.column = 3;
      app.row = 5;
      expect(app.appId).assertEqual('deep-23');
      expect(app.appIconId).assertEqual(1023);
      expect(app.bundleName).assertEqual('com.deep.launcher23');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 123;
      mission.bundleName = 'com.deep.mission23';
      mission.abilityName = 'DeepMissionAbility23';
      mission.appName = 'MissionApp23';
      mission.appIconId = 223;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(123);
      expect(mission.appName).assertEqual('MissionApp23');
      expect(mission.appIconId).assertEqual(223);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0024
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0024
     * @tc.desc   Assign deep launcher bean values 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-24';
      app.appName = 'DeepApp24';
      app.appIconId = 1024;
      app.appLabelId = 'label-24';
      app.bundleName = 'com.deep.launcher24';
      app.abilityName = 'DeepAbility24';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [0, 4];
      app.page = 0;
      app.column = 4;
      app.row = 0;
      expect(app.appId).assertEqual('deep-24');
      expect(app.appIconId).assertEqual(1024);
      expect(app.bundleName).assertEqual('com.deep.launcher24');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 124;
      mission.bundleName = 'com.deep.mission24';
      mission.abilityName = 'DeepMissionAbility24';
      mission.appName = 'MissionApp24';
      mission.appIconId = 224;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(124);
      expect(mission.appName).assertEqual('MissionApp24');
      expect(mission.appIconId).assertEqual(224);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0025
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0025
     * @tc.desc   Assign deep launcher bean values 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-25';
      app.appName = 'DeepApp25';
      app.appIconId = 1025;
      app.appLabelId = 'label-25';
      app.bundleName = 'com.deep.launcher25';
      app.abilityName = 'DeepAbility25';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [1, 0];
      app.page = 1;
      app.column = 0;
      app.row = 1;
      expect(app.appId).assertEqual('deep-25');
      expect(app.appIconId).assertEqual(1025);
      expect(app.bundleName).assertEqual('com.deep.launcher25');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 125;
      mission.bundleName = 'com.deep.mission25';
      mission.abilityName = 'DeepMissionAbility25';
      mission.appName = 'MissionApp25';
      mission.appIconId = 225;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(125);
      expect(mission.appName).assertEqual('MissionApp25');
      expect(mission.appIconId).assertEqual(225);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0026
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0026
     * @tc.desc   Assign deep launcher bean values 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-26';
      app.appName = 'DeepApp26';
      app.appIconId = 1026;
      app.appLabelId = 'label-26';
      app.bundleName = 'com.deep.launcher26';
      app.abilityName = 'DeepAbility26';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [2, 1];
      app.page = 2;
      app.column = 1;
      app.row = 2;
      expect(app.appId).assertEqual('deep-26');
      expect(app.appIconId).assertEqual(1026);
      expect(app.bundleName).assertEqual('com.deep.launcher26');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 126;
      mission.bundleName = 'com.deep.mission26';
      mission.abilityName = 'DeepMissionAbility26';
      mission.appName = 'MissionApp26';
      mission.appIconId = 226;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(126);
      expect(mission.appName).assertEqual('MissionApp26');
      expect(mission.appIconId).assertEqual(226);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0027
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0027
     * @tc.desc   Assign deep launcher bean values 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-27';
      app.appName = 'DeepApp27';
      app.appIconId = 1027;
      app.appLabelId = 'label-27';
      app.bundleName = 'com.deep.launcher27';
      app.abilityName = 'DeepAbility27';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [3, 2];
      app.page = 0;
      app.column = 2;
      app.row = 3;
      expect(app.appId).assertEqual('deep-27');
      expect(app.appIconId).assertEqual(1027);
      expect(app.bundleName).assertEqual('com.deep.launcher27');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 127;
      mission.bundleName = 'com.deep.mission27';
      mission.abilityName = 'DeepMissionAbility27';
      mission.appName = 'MissionApp27';
      mission.appIconId = 227;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(127);
      expect(mission.appName).assertEqual('MissionApp27');
      expect(mission.appIconId).assertEqual(227);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0028
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0028
     * @tc.desc   Assign deep launcher bean values 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-28';
      app.appName = 'DeepApp28';
      app.appIconId = 1028;
      app.appLabelId = 'label-28';
      app.bundleName = 'com.deep.launcher28';
      app.abilityName = 'DeepAbility28';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [0, 3];
      app.page = 1;
      app.column = 3;
      app.row = 4;
      expect(app.appId).assertEqual('deep-28');
      expect(app.appIconId).assertEqual(1028);
      expect(app.bundleName).assertEqual('com.deep.launcher28');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 128;
      mission.bundleName = 'com.deep.mission28';
      mission.abilityName = 'DeepMissionAbility28';
      mission.appName = 'MissionApp28';
      mission.appIconId = 228;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(128);
      expect(mission.appName).assertEqual('MissionApp28');
      expect(mission.appIconId).assertEqual(228);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0029
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0029
     * @tc.desc   Assign deep launcher bean values 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-29';
      app.appName = 'DeepApp29';
      app.appIconId = 1029;
      app.appLabelId = 'label-29';
      app.bundleName = 'com.deep.launcher29';
      app.abilityName = 'DeepAbility29';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [1, 4];
      app.page = 2;
      app.column = 4;
      app.row = 5;
      expect(app.appId).assertEqual('deep-29');
      expect(app.appIconId).assertEqual(1029);
      expect(app.bundleName).assertEqual('com.deep.launcher29');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 129;
      mission.bundleName = 'com.deep.mission29';
      mission.abilityName = 'DeepMissionAbility29';
      mission.appName = 'MissionApp29';
      mission.appIconId = 229;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(129);
      expect(mission.appName).assertEqual('MissionApp29');
      expect(mission.appIconId).assertEqual(229);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0030
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0030
     * @tc.desc   Assign deep launcher bean values 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-30';
      app.appName = 'DeepApp30';
      app.appIconId = 1030;
      app.appLabelId = 'label-30';
      app.bundleName = 'com.deep.launcher30';
      app.abilityName = 'DeepAbility30';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [2, 0];
      app.page = 0;
      app.column = 0;
      app.row = 0;
      expect(app.appId).assertEqual('deep-30');
      expect(app.appIconId).assertEqual(1030);
      expect(app.bundleName).assertEqual('com.deep.launcher30');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 130;
      mission.bundleName = 'com.deep.mission30';
      mission.abilityName = 'DeepMissionAbility30';
      mission.appName = 'MissionApp30';
      mission.appIconId = 230;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(130);
      expect(mission.appName).assertEqual('MissionApp30');
      expect(mission.appIconId).assertEqual(230);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0031
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0031
     * @tc.desc   Assign deep launcher bean values 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-31';
      app.appName = 'DeepApp31';
      app.appIconId = 1031;
      app.appLabelId = 'label-31';
      app.bundleName = 'com.deep.launcher31';
      app.abilityName = 'DeepAbility31';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [3, 1];
      app.page = 1;
      app.column = 1;
      app.row = 1;
      expect(app.appId).assertEqual('deep-31');
      expect(app.appIconId).assertEqual(1031);
      expect(app.bundleName).assertEqual('com.deep.launcher31');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 131;
      mission.bundleName = 'com.deep.mission31';
      mission.abilityName = 'DeepMissionAbility31';
      mission.appName = 'MissionApp31';
      mission.appIconId = 231;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(131);
      expect(mission.appName).assertEqual('MissionApp31');
      expect(mission.appIconId).assertEqual(231);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0032
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0032
     * @tc.desc   Assign deep launcher bean values 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-32';
      app.appName = 'DeepApp32';
      app.appIconId = 1032;
      app.appLabelId = 'label-32';
      app.bundleName = 'com.deep.launcher32';
      app.abilityName = 'DeepAbility32';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [0, 2];
      app.page = 2;
      app.column = 2;
      app.row = 2;
      expect(app.appId).assertEqual('deep-32');
      expect(app.appIconId).assertEqual(1032);
      expect(app.bundleName).assertEqual('com.deep.launcher32');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 132;
      mission.bundleName = 'com.deep.mission32';
      mission.abilityName = 'DeepMissionAbility32';
      mission.appName = 'MissionApp32';
      mission.appIconId = 232;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(132);
      expect(mission.appName).assertEqual('MissionApp32');
      expect(mission.appIconId).assertEqual(232);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0033
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0033
     * @tc.desc   Assign deep launcher bean values 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-33';
      app.appName = 'DeepApp33';
      app.appIconId = 1033;
      app.appLabelId = 'label-33';
      app.bundleName = 'com.deep.launcher33';
      app.abilityName = 'DeepAbility33';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [1, 3];
      app.page = 0;
      app.column = 3;
      app.row = 3;
      expect(app.appId).assertEqual('deep-33');
      expect(app.appIconId).assertEqual(1033);
      expect(app.bundleName).assertEqual('com.deep.launcher33');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 133;
      mission.bundleName = 'com.deep.mission33';
      mission.abilityName = 'DeepMissionAbility33';
      mission.appName = 'MissionApp33';
      mission.appIconId = 233;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(133);
      expect(mission.appName).assertEqual('MissionApp33');
      expect(mission.appIconId).assertEqual(233);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0034
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0034
     * @tc.desc   Assign deep launcher bean values 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-34';
      app.appName = 'DeepApp34';
      app.appIconId = 1034;
      app.appLabelId = 'label-34';
      app.bundleName = 'com.deep.launcher34';
      app.abilityName = 'DeepAbility34';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [2, 4];
      app.page = 1;
      app.column = 4;
      app.row = 4;
      expect(app.appId).assertEqual('deep-34');
      expect(app.appIconId).assertEqual(1034);
      expect(app.bundleName).assertEqual('com.deep.launcher34');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 134;
      mission.bundleName = 'com.deep.mission34';
      mission.abilityName = 'DeepMissionAbility34';
      mission.appName = 'MissionApp34';
      mission.appIconId = 234;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(134);
      expect(mission.appName).assertEqual('MissionApp34');
      expect(mission.appIconId).assertEqual(234);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0035
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0035
     * @tc.desc   Assign deep launcher bean values 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-35';
      app.appName = 'DeepApp35';
      app.appIconId = 1035;
      app.appLabelId = 'label-35';
      app.bundleName = 'com.deep.launcher35';
      app.abilityName = 'DeepAbility35';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [3, 0];
      app.page = 2;
      app.column = 0;
      app.row = 5;
      expect(app.appId).assertEqual('deep-35');
      expect(app.appIconId).assertEqual(1035);
      expect(app.bundleName).assertEqual('com.deep.launcher35');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 135;
      mission.bundleName = 'com.deep.mission35';
      mission.abilityName = 'DeepMissionAbility35';
      mission.appName = 'MissionApp35';
      mission.appIconId = 235;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(135);
      expect(mission.appName).assertEqual('MissionApp35');
      expect(mission.appIconId).assertEqual(235);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0036
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0036
     * @tc.desc   Assign deep launcher bean values 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-36';
      app.appName = 'DeepApp36';
      app.appIconId = 1036;
      app.appLabelId = 'label-36';
      app.bundleName = 'com.deep.launcher36';
      app.abilityName = 'DeepAbility36';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [0, 1];
      app.page = 0;
      app.column = 1;
      app.row = 0;
      expect(app.appId).assertEqual('deep-36');
      expect(app.appIconId).assertEqual(1036);
      expect(app.bundleName).assertEqual('com.deep.launcher36');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 136;
      mission.bundleName = 'com.deep.mission36';
      mission.abilityName = 'DeepMissionAbility36';
      mission.appName = 'MissionApp36';
      mission.appIconId = 236;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(136);
      expect(mission.appName).assertEqual('MissionApp36');
      expect(mission.appIconId).assertEqual(236);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0037
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0037
     * @tc.desc   Assign deep launcher bean values 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-37';
      app.appName = 'DeepApp37';
      app.appIconId = 1037;
      app.appLabelId = 'label-37';
      app.bundleName = 'com.deep.launcher37';
      app.abilityName = 'DeepAbility37';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [1, 2];
      app.page = 1;
      app.column = 2;
      app.row = 1;
      expect(app.appId).assertEqual('deep-37');
      expect(app.appIconId).assertEqual(1037);
      expect(app.bundleName).assertEqual('com.deep.launcher37');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 137;
      mission.bundleName = 'com.deep.mission37';
      mission.abilityName = 'DeepMissionAbility37';
      mission.appName = 'MissionApp37';
      mission.appIconId = 237;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(137);
      expect(mission.appName).assertEqual('MissionApp37');
      expect(mission.appIconId).assertEqual(237);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0038
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0038
     * @tc.desc   Assign deep launcher bean values 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-38';
      app.appName = 'DeepApp38';
      app.appIconId = 1038;
      app.appLabelId = 'label-38';
      app.bundleName = 'com.deep.launcher38';
      app.abilityName = 'DeepAbility38';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [2, 3];
      app.page = 2;
      app.column = 3;
      app.row = 2;
      expect(app.appId).assertEqual('deep-38');
      expect(app.appIconId).assertEqual(1038);
      expect(app.bundleName).assertEqual('com.deep.launcher38');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 138;
      mission.bundleName = 'com.deep.mission38';
      mission.abilityName = 'DeepMissionAbility38';
      mission.appName = 'MissionApp38';
      mission.appIconId = 238;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(138);
      expect(mission.appName).assertEqual('MissionApp38');
      expect(mission.appIconId).assertEqual(238);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0039
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0039
     * @tc.desc   Assign deep launcher bean values 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-39';
      app.appName = 'DeepApp39';
      app.appIconId = 1039;
      app.appLabelId = 'label-39';
      app.bundleName = 'com.deep.launcher39';
      app.abilityName = 'DeepAbility39';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [3, 4];
      app.page = 0;
      app.column = 4;
      app.row = 3;
      expect(app.appId).assertEqual('deep-39');
      expect(app.appIconId).assertEqual(1039);
      expect(app.bundleName).assertEqual('com.deep.launcher39');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 139;
      mission.bundleName = 'com.deep.mission39';
      mission.abilityName = 'DeepMissionAbility39';
      mission.appName = 'MissionApp39';
      mission.appIconId = 239;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(139);
      expect(mission.appName).assertEqual('MissionApp39');
      expect(mission.appIconId).assertEqual(239);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0040
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0040
     * @tc.desc   Assign deep launcher bean values 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-40';
      app.appName = 'DeepApp40';
      app.appIconId = 1040;
      app.appLabelId = 'label-40';
      app.bundleName = 'com.deep.launcher40';
      app.abilityName = 'DeepAbility40';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [0, 0];
      app.page = 1;
      app.column = 0;
      app.row = 4;
      expect(app.appId).assertEqual('deep-40');
      expect(app.appIconId).assertEqual(1040);
      expect(app.bundleName).assertEqual('com.deep.launcher40');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 140;
      mission.bundleName = 'com.deep.mission40';
      mission.abilityName = 'DeepMissionAbility40';
      mission.appName = 'MissionApp40';
      mission.appIconId = 240;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(140);
      expect(mission.appName).assertEqual('MissionApp40');
      expect(mission.appIconId).assertEqual(240);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0041
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0041
     * @tc.desc   Assign deep launcher bean values 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-41';
      app.appName = 'DeepApp41';
      app.appIconId = 1041;
      app.appLabelId = 'label-41';
      app.bundleName = 'com.deep.launcher41';
      app.abilityName = 'DeepAbility41';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [1, 1];
      app.page = 2;
      app.column = 1;
      app.row = 5;
      expect(app.appId).assertEqual('deep-41');
      expect(app.appIconId).assertEqual(1041);
      expect(app.bundleName).assertEqual('com.deep.launcher41');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 141;
      mission.bundleName = 'com.deep.mission41';
      mission.abilityName = 'DeepMissionAbility41';
      mission.appName = 'MissionApp41';
      mission.appIconId = 241;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(141);
      expect(mission.appName).assertEqual('MissionApp41');
      expect(mission.appIconId).assertEqual(241);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0042
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0042
     * @tc.desc   Assign deep launcher bean values 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-42';
      app.appName = 'DeepApp42';
      app.appIconId = 1042;
      app.appLabelId = 'label-42';
      app.bundleName = 'com.deep.launcher42';
      app.abilityName = 'DeepAbility42';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [2, 2];
      app.page = 0;
      app.column = 2;
      app.row = 0;
      expect(app.appId).assertEqual('deep-42');
      expect(app.appIconId).assertEqual(1042);
      expect(app.bundleName).assertEqual('com.deep.launcher42');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(2);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 142;
      mission.bundleName = 'com.deep.mission42';
      mission.abilityName = 'DeepMissionAbility42';
      mission.appName = 'MissionApp42';
      mission.appIconId = 242;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(142);
      expect(mission.appName).assertEqual('MissionApp42');
      expect(mission.appIconId).assertEqual(242);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0043
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0043
     * @tc.desc   Assign deep launcher bean values 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-43';
      app.appName = 'DeepApp43';
      app.appIconId = 1043;
      app.appLabelId = 'label-43';
      app.bundleName = 'com.deep.launcher43';
      app.abilityName = 'DeepAbility43';
      app.moduleName = 'entry';
      app.typeId = 1;
      app.area = [3, 3];
      app.page = 1;
      app.column = 3;
      app.row = 1;
      expect(app.appId).assertEqual('deep-43');
      expect(app.appIconId).assertEqual(1043);
      expect(app.bundleName).assertEqual('com.deep.launcher43');
      expect(app.typeId).assertEqual(1);
      expect(app.area[0]).assertEqual(3);
      expect(app.page).assertEqual(1);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 143;
      mission.bundleName = 'com.deep.mission43';
      mission.abilityName = 'DeepMissionAbility43';
      mission.appName = 'MissionApp43';
      mission.appIconId = 243;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(143);
      expect(mission.appName).assertEqual('MissionApp43');
      expect(mission.appIconId).assertEqual(243);
      expect(mission.lockedState).assertEqual(false);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0044
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0044
     * @tc.desc   Assign deep launcher bean values 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-44';
      app.appName = 'DeepApp44';
      app.appIconId = 1044;
      app.appLabelId = 'label-44';
      app.bundleName = 'com.deep.launcher44';
      app.abilityName = 'DeepAbility44';
      app.moduleName = 'entry';
      app.typeId = 2;
      app.area = [0, 4];
      app.page = 2;
      app.column = 4;
      app.row = 2;
      expect(app.appId).assertEqual('deep-44');
      expect(app.appIconId).assertEqual(1044);
      expect(app.bundleName).assertEqual('com.deep.launcher44');
      expect(app.typeId).assertEqual(2);
      expect(app.area[0]).assertEqual(0);
      expect(app.page).assertEqual(2);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 144;
      mission.bundleName = 'com.deep.mission44';
      mission.abilityName = 'DeepMissionAbility44';
      mission.appName = 'MissionApp44';
      mission.appIconId = 244;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(144);
      expect(mission.appName).assertEqual('MissionApp44');
      expect(mission.appIconId).assertEqual(244);
      expect(mission.lockedState).assertEqual(true);
    })
    /**
     * @tc.name   testLauncherPlusBeanDeep0045
     * @tc.number SUB_LAUNCHER_PLUS_BEAN_DEEP_0045
     * @tc.desc   Assign deep launcher bean values 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeanDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'deep-45';
      app.appName = 'DeepApp45';
      app.appIconId = 1045;
      app.appLabelId = 'label-45';
      app.bundleName = 'com.deep.launcher45';
      app.abilityName = 'DeepAbility45';
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [1, 0];
      app.page = 0;
      app.column = 0;
      app.row = 3;
      expect(app.appId).assertEqual('deep-45');
      expect(app.appIconId).assertEqual(1045);
      expect(app.bundleName).assertEqual('com.deep.launcher45');
      expect(app.typeId).assertEqual(0);
      expect(app.area[0]).assertEqual(1);
      expect(app.page).assertEqual(0);
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 145;
      mission.bundleName = 'com.deep.mission45';
      mission.abilityName = 'DeepMissionAbility45';
      mission.appName = 'MissionApp45';
      mission.appIconId = 245;
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(145);
      expect(mission.appName).assertEqual('MissionApp45');
      expect(mission.appIconId).assertEqual(245);
      expect(mission.lockedState).assertEqual(false);
    })
  })
}
