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

export default function launcherPlusBeansTest() {
  describe('LauncherPlusBeansTest', () => {

    /**
     * @tc.name   testLauncherPlusBeans0001
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0001
     * @tc.desc   Assign launcher bean values for sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-1';
      app.appName = 'LauncherApp1';
      app.bundleName = 'com.launcher.app1';
      app.abilityName = 'Ability1';
      app.badgeNumber = 1;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-1');
      expect(app.appName).assertEqual('LauncherApp1');
      expect(app.bundleName).assertEqual('com.launcher.app1');
      expect(app.badgeNumber).assertEqual(1);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 1;
      card.cardName = 'Card1';
      card.bundleName = 'com.launcher.card1';
      card.abilityName = 'FormAbility1';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(1);
      expect(card.cardName).assertEqual('Card1');
      expect(card.bundleName).assertEqual('com.launcher.card1');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 1;
      mission.bundleName = 'com.launcher.mission1';
      mission.abilityName = 'MissionAbility1';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(1);
      expect(mission.bundleName).assertEqual('com.launcher.mission1');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0002
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0002
     * @tc.desc   Assign launcher bean values for sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-2';
      app.appName = 'LauncherApp2';
      app.bundleName = 'com.launcher.app2';
      app.abilityName = 'Ability2';
      app.badgeNumber = 2;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-2');
      expect(app.appName).assertEqual('LauncherApp2');
      expect(app.bundleName).assertEqual('com.launcher.app2');
      expect(app.badgeNumber).assertEqual(2);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 2;
      card.cardName = 'Card2';
      card.bundleName = 'com.launcher.card2';
      card.abilityName = 'FormAbility2';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(2);
      expect(card.cardName).assertEqual('Card2');
      expect(card.bundleName).assertEqual('com.launcher.card2');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 2;
      mission.bundleName = 'com.launcher.mission2';
      mission.abilityName = 'MissionAbility2';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(2);
      expect(mission.bundleName).assertEqual('com.launcher.mission2');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0003
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0003
     * @tc.desc   Assign launcher bean values for sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-3';
      app.appName = 'LauncherApp3';
      app.bundleName = 'com.launcher.app3';
      app.abilityName = 'Ability3';
      app.badgeNumber = 3;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-3');
      expect(app.appName).assertEqual('LauncherApp3');
      expect(app.bundleName).assertEqual('com.launcher.app3');
      expect(app.badgeNumber).assertEqual(3);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 3;
      card.cardName = 'Card3';
      card.bundleName = 'com.launcher.card3';
      card.abilityName = 'FormAbility3';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(3);
      expect(card.cardName).assertEqual('Card3');
      expect(card.bundleName).assertEqual('com.launcher.card3');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 3;
      mission.bundleName = 'com.launcher.mission3';
      mission.abilityName = 'MissionAbility3';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(3);
      expect(mission.bundleName).assertEqual('com.launcher.mission3');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0004
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0004
     * @tc.desc   Assign launcher bean values for sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-4';
      app.appName = 'LauncherApp4';
      app.bundleName = 'com.launcher.app4';
      app.abilityName = 'Ability4';
      app.badgeNumber = 4;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-4');
      expect(app.appName).assertEqual('LauncherApp4');
      expect(app.bundleName).assertEqual('com.launcher.app4');
      expect(app.badgeNumber).assertEqual(4);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 4;
      card.cardName = 'Card4';
      card.bundleName = 'com.launcher.card4';
      card.abilityName = 'FormAbility4';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(4);
      expect(card.cardName).assertEqual('Card4');
      expect(card.bundleName).assertEqual('com.launcher.card4');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 4;
      mission.bundleName = 'com.launcher.mission4';
      mission.abilityName = 'MissionAbility4';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(4);
      expect(mission.bundleName).assertEqual('com.launcher.mission4');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0005
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0005
     * @tc.desc   Assign launcher bean values for sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-5';
      app.appName = 'LauncherApp5';
      app.bundleName = 'com.launcher.app5';
      app.abilityName = 'Ability5';
      app.badgeNumber = 5;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-5');
      expect(app.appName).assertEqual('LauncherApp5');
      expect(app.bundleName).assertEqual('com.launcher.app5');
      expect(app.badgeNumber).assertEqual(5);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 5;
      card.cardName = 'Card5';
      card.bundleName = 'com.launcher.card5';
      card.abilityName = 'FormAbility5';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(5);
      expect(card.cardName).assertEqual('Card5');
      expect(card.bundleName).assertEqual('com.launcher.card5');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 5;
      mission.bundleName = 'com.launcher.mission5';
      mission.abilityName = 'MissionAbility5';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(5);
      expect(mission.bundleName).assertEqual('com.launcher.mission5');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0006
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0006
     * @tc.desc   Assign launcher bean values for sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-6';
      app.appName = 'LauncherApp6';
      app.bundleName = 'com.launcher.app6';
      app.abilityName = 'Ability6';
      app.badgeNumber = 6;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-6');
      expect(app.appName).assertEqual('LauncherApp6');
      expect(app.bundleName).assertEqual('com.launcher.app6');
      expect(app.badgeNumber).assertEqual(6);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 6;
      card.cardName = 'Card6';
      card.bundleName = 'com.launcher.card6';
      card.abilityName = 'FormAbility6';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(6);
      expect(card.cardName).assertEqual('Card6');
      expect(card.bundleName).assertEqual('com.launcher.card6');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 6;
      mission.bundleName = 'com.launcher.mission6';
      mission.abilityName = 'MissionAbility6';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(6);
      expect(mission.bundleName).assertEqual('com.launcher.mission6');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0007
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0007
     * @tc.desc   Assign launcher bean values for sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-7';
      app.appName = 'LauncherApp7';
      app.bundleName = 'com.launcher.app7';
      app.abilityName = 'Ability7';
      app.badgeNumber = 7;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-7');
      expect(app.appName).assertEqual('LauncherApp7');
      expect(app.bundleName).assertEqual('com.launcher.app7');
      expect(app.badgeNumber).assertEqual(7);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 7;
      card.cardName = 'Card7';
      card.bundleName = 'com.launcher.card7';
      card.abilityName = 'FormAbility7';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(7);
      expect(card.cardName).assertEqual('Card7');
      expect(card.bundleName).assertEqual('com.launcher.card7');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 7;
      mission.bundleName = 'com.launcher.mission7';
      mission.abilityName = 'MissionAbility7';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(7);
      expect(mission.bundleName).assertEqual('com.launcher.mission7');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0008
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0008
     * @tc.desc   Assign launcher bean values for sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-8';
      app.appName = 'LauncherApp8';
      app.bundleName = 'com.launcher.app8';
      app.abilityName = 'Ability8';
      app.badgeNumber = 8;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-8');
      expect(app.appName).assertEqual('LauncherApp8');
      expect(app.bundleName).assertEqual('com.launcher.app8');
      expect(app.badgeNumber).assertEqual(8);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 8;
      card.cardName = 'Card8';
      card.bundleName = 'com.launcher.card8';
      card.abilityName = 'FormAbility8';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(8);
      expect(card.cardName).assertEqual('Card8');
      expect(card.bundleName).assertEqual('com.launcher.card8');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 8;
      mission.bundleName = 'com.launcher.mission8';
      mission.abilityName = 'MissionAbility8';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(8);
      expect(mission.bundleName).assertEqual('com.launcher.mission8');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0009
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0009
     * @tc.desc   Assign launcher bean values for sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-9';
      app.appName = 'LauncherApp9';
      app.bundleName = 'com.launcher.app9';
      app.abilityName = 'Ability9';
      app.badgeNumber = 9;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-9');
      expect(app.appName).assertEqual('LauncherApp9');
      expect(app.bundleName).assertEqual('com.launcher.app9');
      expect(app.badgeNumber).assertEqual(9);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 9;
      card.cardName = 'Card9';
      card.bundleName = 'com.launcher.card9';
      card.abilityName = 'FormAbility9';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(9);
      expect(card.cardName).assertEqual('Card9');
      expect(card.bundleName).assertEqual('com.launcher.card9');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 9;
      mission.bundleName = 'com.launcher.mission9';
      mission.abilityName = 'MissionAbility9';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(9);
      expect(mission.bundleName).assertEqual('com.launcher.mission9');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0010
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0010
     * @tc.desc   Assign launcher bean values for sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-10';
      app.appName = 'LauncherApp10';
      app.bundleName = 'com.launcher.app10';
      app.abilityName = 'Ability10';
      app.badgeNumber = 0;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-10');
      expect(app.appName).assertEqual('LauncherApp10');
      expect(app.bundleName).assertEqual('com.launcher.app10');
      expect(app.badgeNumber).assertEqual(0);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 10;
      card.cardName = 'Card10';
      card.bundleName = 'com.launcher.card10';
      card.abilityName = 'FormAbility10';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(10);
      expect(card.cardName).assertEqual('Card10');
      expect(card.bundleName).assertEqual('com.launcher.card10');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 10;
      mission.bundleName = 'com.launcher.mission10';
      mission.abilityName = 'MissionAbility10';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(10);
      expect(mission.bundleName).assertEqual('com.launcher.mission10');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0011
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0011
     * @tc.desc   Assign launcher bean values for sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-11';
      app.appName = 'LauncherApp11';
      app.bundleName = 'com.launcher.app11';
      app.abilityName = 'Ability11';
      app.badgeNumber = 1;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-11');
      expect(app.appName).assertEqual('LauncherApp11');
      expect(app.bundleName).assertEqual('com.launcher.app11');
      expect(app.badgeNumber).assertEqual(1);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 11;
      card.cardName = 'Card11';
      card.bundleName = 'com.launcher.card11';
      card.abilityName = 'FormAbility11';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(11);
      expect(card.cardName).assertEqual('Card11');
      expect(card.bundleName).assertEqual('com.launcher.card11');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 11;
      mission.bundleName = 'com.launcher.mission11';
      mission.abilityName = 'MissionAbility11';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(11);
      expect(mission.bundleName).assertEqual('com.launcher.mission11');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0012
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0012
     * @tc.desc   Assign launcher bean values for sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-12';
      app.appName = 'LauncherApp12';
      app.bundleName = 'com.launcher.app12';
      app.abilityName = 'Ability12';
      app.badgeNumber = 2;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-12');
      expect(app.appName).assertEqual('LauncherApp12');
      expect(app.bundleName).assertEqual('com.launcher.app12');
      expect(app.badgeNumber).assertEqual(2);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 12;
      card.cardName = 'Card12';
      card.bundleName = 'com.launcher.card12';
      card.abilityName = 'FormAbility12';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(12);
      expect(card.cardName).assertEqual('Card12');
      expect(card.bundleName).assertEqual('com.launcher.card12');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 12;
      mission.bundleName = 'com.launcher.mission12';
      mission.abilityName = 'MissionAbility12';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(12);
      expect(mission.bundleName).assertEqual('com.launcher.mission12');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0013
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0013
     * @tc.desc   Assign launcher bean values for sample 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-13';
      app.appName = 'LauncherApp13';
      app.bundleName = 'com.launcher.app13';
      app.abilityName = 'Ability13';
      app.badgeNumber = 3;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-13');
      expect(app.appName).assertEqual('LauncherApp13');
      expect(app.bundleName).assertEqual('com.launcher.app13');
      expect(app.badgeNumber).assertEqual(3);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 13;
      card.cardName = 'Card13';
      card.bundleName = 'com.launcher.card13';
      card.abilityName = 'FormAbility13';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(13);
      expect(card.cardName).assertEqual('Card13');
      expect(card.bundleName).assertEqual('com.launcher.card13');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 13;
      mission.bundleName = 'com.launcher.mission13';
      mission.abilityName = 'MissionAbility13';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(13);
      expect(mission.bundleName).assertEqual('com.launcher.mission13');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0014
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0014
     * @tc.desc   Assign launcher bean values for sample 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-14';
      app.appName = 'LauncherApp14';
      app.bundleName = 'com.launcher.app14';
      app.abilityName = 'Ability14';
      app.badgeNumber = 4;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-14');
      expect(app.appName).assertEqual('LauncherApp14');
      expect(app.bundleName).assertEqual('com.launcher.app14');
      expect(app.badgeNumber).assertEqual(4);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 14;
      card.cardName = 'Card14';
      card.bundleName = 'com.launcher.card14';
      card.abilityName = 'FormAbility14';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(14);
      expect(card.cardName).assertEqual('Card14');
      expect(card.bundleName).assertEqual('com.launcher.card14');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 14;
      mission.bundleName = 'com.launcher.mission14';
      mission.abilityName = 'MissionAbility14';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(14);
      expect(mission.bundleName).assertEqual('com.launcher.mission14');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0015
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0015
     * @tc.desc   Assign launcher bean values for sample 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-15';
      app.appName = 'LauncherApp15';
      app.bundleName = 'com.launcher.app15';
      app.abilityName = 'Ability15';
      app.badgeNumber = 5;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-15');
      expect(app.appName).assertEqual('LauncherApp15');
      expect(app.bundleName).assertEqual('com.launcher.app15');
      expect(app.badgeNumber).assertEqual(5);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 15;
      card.cardName = 'Card15';
      card.bundleName = 'com.launcher.card15';
      card.abilityName = 'FormAbility15';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(15);
      expect(card.cardName).assertEqual('Card15');
      expect(card.bundleName).assertEqual('com.launcher.card15');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 15;
      mission.bundleName = 'com.launcher.mission15';
      mission.abilityName = 'MissionAbility15';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(15);
      expect(mission.bundleName).assertEqual('com.launcher.mission15');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0016
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0016
     * @tc.desc   Assign launcher bean values for sample 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-16';
      app.appName = 'LauncherApp16';
      app.bundleName = 'com.launcher.app16';
      app.abilityName = 'Ability16';
      app.badgeNumber = 6;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-16');
      expect(app.appName).assertEqual('LauncherApp16');
      expect(app.bundleName).assertEqual('com.launcher.app16');
      expect(app.badgeNumber).assertEqual(6);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 16;
      card.cardName = 'Card16';
      card.bundleName = 'com.launcher.card16';
      card.abilityName = 'FormAbility16';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(16);
      expect(card.cardName).assertEqual('Card16');
      expect(card.bundleName).assertEqual('com.launcher.card16');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 16;
      mission.bundleName = 'com.launcher.mission16';
      mission.abilityName = 'MissionAbility16';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(16);
      expect(mission.bundleName).assertEqual('com.launcher.mission16');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0017
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0017
     * @tc.desc   Assign launcher bean values for sample 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-17';
      app.appName = 'LauncherApp17';
      app.bundleName = 'com.launcher.app17';
      app.abilityName = 'Ability17';
      app.badgeNumber = 7;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-17');
      expect(app.appName).assertEqual('LauncherApp17');
      expect(app.bundleName).assertEqual('com.launcher.app17');
      expect(app.badgeNumber).assertEqual(7);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 17;
      card.cardName = 'Card17';
      card.bundleName = 'com.launcher.card17';
      card.abilityName = 'FormAbility17';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(17);
      expect(card.cardName).assertEqual('Card17');
      expect(card.bundleName).assertEqual('com.launcher.card17');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 17;
      mission.bundleName = 'com.launcher.mission17';
      mission.abilityName = 'MissionAbility17';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(17);
      expect(mission.bundleName).assertEqual('com.launcher.mission17');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0018
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0018
     * @tc.desc   Assign launcher bean values for sample 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-18';
      app.appName = 'LauncherApp18';
      app.bundleName = 'com.launcher.app18';
      app.abilityName = 'Ability18';
      app.badgeNumber = 8;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-18');
      expect(app.appName).assertEqual('LauncherApp18');
      expect(app.bundleName).assertEqual('com.launcher.app18');
      expect(app.badgeNumber).assertEqual(8);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 18;
      card.cardName = 'Card18';
      card.bundleName = 'com.launcher.card18';
      card.abilityName = 'FormAbility18';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(18);
      expect(card.cardName).assertEqual('Card18');
      expect(card.bundleName).assertEqual('com.launcher.card18');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 18;
      mission.bundleName = 'com.launcher.mission18';
      mission.abilityName = 'MissionAbility18';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(18);
      expect(mission.bundleName).assertEqual('com.launcher.mission18');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0019
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0019
     * @tc.desc   Assign launcher bean values for sample 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-19';
      app.appName = 'LauncherApp19';
      app.bundleName = 'com.launcher.app19';
      app.abilityName = 'Ability19';
      app.badgeNumber = 9;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-19');
      expect(app.appName).assertEqual('LauncherApp19');
      expect(app.bundleName).assertEqual('com.launcher.app19');
      expect(app.badgeNumber).assertEqual(9);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 19;
      card.cardName = 'Card19';
      card.bundleName = 'com.launcher.card19';
      card.abilityName = 'FormAbility19';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(19);
      expect(card.cardName).assertEqual('Card19');
      expect(card.bundleName).assertEqual('com.launcher.card19');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 19;
      mission.bundleName = 'com.launcher.mission19';
      mission.abilityName = 'MissionAbility19';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(19);
      expect(mission.bundleName).assertEqual('com.launcher.mission19');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0020
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0020
     * @tc.desc   Assign launcher bean values for sample 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-20';
      app.appName = 'LauncherApp20';
      app.bundleName = 'com.launcher.app20';
      app.abilityName = 'Ability20';
      app.badgeNumber = 0;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-20');
      expect(app.appName).assertEqual('LauncherApp20');
      expect(app.bundleName).assertEqual('com.launcher.app20');
      expect(app.badgeNumber).assertEqual(0);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 20;
      card.cardName = 'Card20';
      card.bundleName = 'com.launcher.card20';
      card.abilityName = 'FormAbility20';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(20);
      expect(card.cardName).assertEqual('Card20');
      expect(card.bundleName).assertEqual('com.launcher.card20');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 20;
      mission.bundleName = 'com.launcher.mission20';
      mission.abilityName = 'MissionAbility20';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(20);
      expect(mission.bundleName).assertEqual('com.launcher.mission20');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0021
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0021
     * @tc.desc   Assign launcher bean values for sample 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-21';
      app.appName = 'LauncherApp21';
      app.bundleName = 'com.launcher.app21';
      app.abilityName = 'Ability21';
      app.badgeNumber = 1;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-21');
      expect(app.appName).assertEqual('LauncherApp21');
      expect(app.bundleName).assertEqual('com.launcher.app21');
      expect(app.badgeNumber).assertEqual(1);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 21;
      card.cardName = 'Card21';
      card.bundleName = 'com.launcher.card21';
      card.abilityName = 'FormAbility21';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(21);
      expect(card.cardName).assertEqual('Card21');
      expect(card.bundleName).assertEqual('com.launcher.card21');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 21;
      mission.bundleName = 'com.launcher.mission21';
      mission.abilityName = 'MissionAbility21';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(21);
      expect(mission.bundleName).assertEqual('com.launcher.mission21');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0022
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0022
     * @tc.desc   Assign launcher bean values for sample 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-22';
      app.appName = 'LauncherApp22';
      app.bundleName = 'com.launcher.app22';
      app.abilityName = 'Ability22';
      app.badgeNumber = 2;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-22');
      expect(app.appName).assertEqual('LauncherApp22');
      expect(app.bundleName).assertEqual('com.launcher.app22');
      expect(app.badgeNumber).assertEqual(2);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 22;
      card.cardName = 'Card22';
      card.bundleName = 'com.launcher.card22';
      card.abilityName = 'FormAbility22';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(22);
      expect(card.cardName).assertEqual('Card22');
      expect(card.bundleName).assertEqual('com.launcher.card22');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 22;
      mission.bundleName = 'com.launcher.mission22';
      mission.abilityName = 'MissionAbility22';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(22);
      expect(mission.bundleName).assertEqual('com.launcher.mission22');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0023
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0023
     * @tc.desc   Assign launcher bean values for sample 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-23';
      app.appName = 'LauncherApp23';
      app.bundleName = 'com.launcher.app23';
      app.abilityName = 'Ability23';
      app.badgeNumber = 3;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-23');
      expect(app.appName).assertEqual('LauncherApp23');
      expect(app.bundleName).assertEqual('com.launcher.app23');
      expect(app.badgeNumber).assertEqual(3);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 23;
      card.cardName = 'Card23';
      card.bundleName = 'com.launcher.card23';
      card.abilityName = 'FormAbility23';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(23);
      expect(card.cardName).assertEqual('Card23');
      expect(card.bundleName).assertEqual('com.launcher.card23');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 23;
      mission.bundleName = 'com.launcher.mission23';
      mission.abilityName = 'MissionAbility23';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(23);
      expect(mission.bundleName).assertEqual('com.launcher.mission23');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0024
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0024
     * @tc.desc   Assign launcher bean values for sample 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-24';
      app.appName = 'LauncherApp24';
      app.bundleName = 'com.launcher.app24';
      app.abilityName = 'Ability24';
      app.badgeNumber = 4;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-24');
      expect(app.appName).assertEqual('LauncherApp24');
      expect(app.bundleName).assertEqual('com.launcher.app24');
      expect(app.badgeNumber).assertEqual(4);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 24;
      card.cardName = 'Card24';
      card.bundleName = 'com.launcher.card24';
      card.abilityName = 'FormAbility24';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(24);
      expect(card.cardName).assertEqual('Card24');
      expect(card.bundleName).assertEqual('com.launcher.card24');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 24;
      mission.bundleName = 'com.launcher.mission24';
      mission.abilityName = 'MissionAbility24';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(24);
      expect(mission.bundleName).assertEqual('com.launcher.mission24');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0025
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0025
     * @tc.desc   Assign launcher bean values for sample 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-25';
      app.appName = 'LauncherApp25';
      app.bundleName = 'com.launcher.app25';
      app.abilityName = 'Ability25';
      app.badgeNumber = 5;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-25');
      expect(app.appName).assertEqual('LauncherApp25');
      expect(app.bundleName).assertEqual('com.launcher.app25');
      expect(app.badgeNumber).assertEqual(5);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 25;
      card.cardName = 'Card25';
      card.bundleName = 'com.launcher.card25';
      card.abilityName = 'FormAbility25';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(25);
      expect(card.cardName).assertEqual('Card25');
      expect(card.bundleName).assertEqual('com.launcher.card25');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 25;
      mission.bundleName = 'com.launcher.mission25';
      mission.abilityName = 'MissionAbility25';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(25);
      expect(mission.bundleName).assertEqual('com.launcher.mission25');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0026
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0026
     * @tc.desc   Assign launcher bean values for sample 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-26';
      app.appName = 'LauncherApp26';
      app.bundleName = 'com.launcher.app26';
      app.abilityName = 'Ability26';
      app.badgeNumber = 6;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-26');
      expect(app.appName).assertEqual('LauncherApp26');
      expect(app.bundleName).assertEqual('com.launcher.app26');
      expect(app.badgeNumber).assertEqual(6);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 26;
      card.cardName = 'Card26';
      card.bundleName = 'com.launcher.card26';
      card.abilityName = 'FormAbility26';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(26);
      expect(card.cardName).assertEqual('Card26');
      expect(card.bundleName).assertEqual('com.launcher.card26');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 26;
      mission.bundleName = 'com.launcher.mission26';
      mission.abilityName = 'MissionAbility26';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(26);
      expect(mission.bundleName).assertEqual('com.launcher.mission26');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0027
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0027
     * @tc.desc   Assign launcher bean values for sample 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-27';
      app.appName = 'LauncherApp27';
      app.bundleName = 'com.launcher.app27';
      app.abilityName = 'Ability27';
      app.badgeNumber = 7;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-27');
      expect(app.appName).assertEqual('LauncherApp27');
      expect(app.bundleName).assertEqual('com.launcher.app27');
      expect(app.badgeNumber).assertEqual(7);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 27;
      card.cardName = 'Card27';
      card.bundleName = 'com.launcher.card27';
      card.abilityName = 'FormAbility27';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(27);
      expect(card.cardName).assertEqual('Card27');
      expect(card.bundleName).assertEqual('com.launcher.card27');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 27;
      mission.bundleName = 'com.launcher.mission27';
      mission.abilityName = 'MissionAbility27';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(27);
      expect(mission.bundleName).assertEqual('com.launcher.mission27');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0028
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0028
     * @tc.desc   Assign launcher bean values for sample 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-28';
      app.appName = 'LauncherApp28';
      app.bundleName = 'com.launcher.app28';
      app.abilityName = 'Ability28';
      app.badgeNumber = 8;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-28');
      expect(app.appName).assertEqual('LauncherApp28');
      expect(app.bundleName).assertEqual('com.launcher.app28');
      expect(app.badgeNumber).assertEqual(8);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 28;
      card.cardName = 'Card28';
      card.bundleName = 'com.launcher.card28';
      card.abilityName = 'FormAbility28';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(28);
      expect(card.cardName).assertEqual('Card28');
      expect(card.bundleName).assertEqual('com.launcher.card28');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 28;
      mission.bundleName = 'com.launcher.mission28';
      mission.abilityName = 'MissionAbility28';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(28);
      expect(mission.bundleName).assertEqual('com.launcher.mission28');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0029
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0029
     * @tc.desc   Assign launcher bean values for sample 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-29';
      app.appName = 'LauncherApp29';
      app.bundleName = 'com.launcher.app29';
      app.abilityName = 'Ability29';
      app.badgeNumber = 9;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-29');
      expect(app.appName).assertEqual('LauncherApp29');
      expect(app.bundleName).assertEqual('com.launcher.app29');
      expect(app.badgeNumber).assertEqual(9);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 29;
      card.cardName = 'Card29';
      card.bundleName = 'com.launcher.card29';
      card.abilityName = 'FormAbility29';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(29);
      expect(card.cardName).assertEqual('Card29');
      expect(card.bundleName).assertEqual('com.launcher.card29');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 29;
      mission.bundleName = 'com.launcher.mission29';
      mission.abilityName = 'MissionAbility29';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(29);
      expect(mission.bundleName).assertEqual('com.launcher.mission29');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0030
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0030
     * @tc.desc   Assign launcher bean values for sample 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-30';
      app.appName = 'LauncherApp30';
      app.bundleName = 'com.launcher.app30';
      app.abilityName = 'Ability30';
      app.badgeNumber = 0;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-30');
      expect(app.appName).assertEqual('LauncherApp30');
      expect(app.bundleName).assertEqual('com.launcher.app30');
      expect(app.badgeNumber).assertEqual(0);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 30;
      card.cardName = 'Card30';
      card.bundleName = 'com.launcher.card30';
      card.abilityName = 'FormAbility30';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(30);
      expect(card.cardName).assertEqual('Card30');
      expect(card.bundleName).assertEqual('com.launcher.card30');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 30;
      mission.bundleName = 'com.launcher.mission30';
      mission.abilityName = 'MissionAbility30';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(30);
      expect(mission.bundleName).assertEqual('com.launcher.mission30');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0031
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0031
     * @tc.desc   Assign launcher bean values for sample 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-31';
      app.appName = 'LauncherApp31';
      app.bundleName = 'com.launcher.app31';
      app.abilityName = 'Ability31';
      app.badgeNumber = 1;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-31');
      expect(app.appName).assertEqual('LauncherApp31');
      expect(app.bundleName).assertEqual('com.launcher.app31');
      expect(app.badgeNumber).assertEqual(1);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 31;
      card.cardName = 'Card31';
      card.bundleName = 'com.launcher.card31';
      card.abilityName = 'FormAbility31';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(31);
      expect(card.cardName).assertEqual('Card31');
      expect(card.bundleName).assertEqual('com.launcher.card31');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 31;
      mission.bundleName = 'com.launcher.mission31';
      mission.abilityName = 'MissionAbility31';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(31);
      expect(mission.bundleName).assertEqual('com.launcher.mission31');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0032
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0032
     * @tc.desc   Assign launcher bean values for sample 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-32';
      app.appName = 'LauncherApp32';
      app.bundleName = 'com.launcher.app32';
      app.abilityName = 'Ability32';
      app.badgeNumber = 2;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-32');
      expect(app.appName).assertEqual('LauncherApp32');
      expect(app.bundleName).assertEqual('com.launcher.app32');
      expect(app.badgeNumber).assertEqual(2);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 32;
      card.cardName = 'Card32';
      card.bundleName = 'com.launcher.card32';
      card.abilityName = 'FormAbility32';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(32);
      expect(card.cardName).assertEqual('Card32');
      expect(card.bundleName).assertEqual('com.launcher.card32');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 32;
      mission.bundleName = 'com.launcher.mission32';
      mission.abilityName = 'MissionAbility32';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(32);
      expect(mission.bundleName).assertEqual('com.launcher.mission32');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0033
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0033
     * @tc.desc   Assign launcher bean values for sample 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-33';
      app.appName = 'LauncherApp33';
      app.bundleName = 'com.launcher.app33';
      app.abilityName = 'Ability33';
      app.badgeNumber = 3;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-33');
      expect(app.appName).assertEqual('LauncherApp33');
      expect(app.bundleName).assertEqual('com.launcher.app33');
      expect(app.badgeNumber).assertEqual(3);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 33;
      card.cardName = 'Card33';
      card.bundleName = 'com.launcher.card33';
      card.abilityName = 'FormAbility33';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(33);
      expect(card.cardName).assertEqual('Card33');
      expect(card.bundleName).assertEqual('com.launcher.card33');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 33;
      mission.bundleName = 'com.launcher.mission33';
      mission.abilityName = 'MissionAbility33';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(33);
      expect(mission.bundleName).assertEqual('com.launcher.mission33');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0034
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0034
     * @tc.desc   Assign launcher bean values for sample 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-34';
      app.appName = 'LauncherApp34';
      app.bundleName = 'com.launcher.app34';
      app.abilityName = 'Ability34';
      app.badgeNumber = 4;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-34');
      expect(app.appName).assertEqual('LauncherApp34');
      expect(app.bundleName).assertEqual('com.launcher.app34');
      expect(app.badgeNumber).assertEqual(4);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 34;
      card.cardName = 'Card34';
      card.bundleName = 'com.launcher.card34';
      card.abilityName = 'FormAbility34';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(34);
      expect(card.cardName).assertEqual('Card34');
      expect(card.bundleName).assertEqual('com.launcher.card34');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 34;
      mission.bundleName = 'com.launcher.mission34';
      mission.abilityName = 'MissionAbility34';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(34);
      expect(mission.bundleName).assertEqual('com.launcher.mission34');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0035
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0035
     * @tc.desc   Assign launcher bean values for sample 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-35';
      app.appName = 'LauncherApp35';
      app.bundleName = 'com.launcher.app35';
      app.abilityName = 'Ability35';
      app.badgeNumber = 5;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-35');
      expect(app.appName).assertEqual('LauncherApp35');
      expect(app.bundleName).assertEqual('com.launcher.app35');
      expect(app.badgeNumber).assertEqual(5);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 35;
      card.cardName = 'Card35';
      card.bundleName = 'com.launcher.card35';
      card.abilityName = 'FormAbility35';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(35);
      expect(card.cardName).assertEqual('Card35');
      expect(card.bundleName).assertEqual('com.launcher.card35');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 35;
      mission.bundleName = 'com.launcher.mission35';
      mission.abilityName = 'MissionAbility35';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(35);
      expect(mission.bundleName).assertEqual('com.launcher.mission35');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0036
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0036
     * @tc.desc   Assign launcher bean values for sample 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-36';
      app.appName = 'LauncherApp36';
      app.bundleName = 'com.launcher.app36';
      app.abilityName = 'Ability36';
      app.badgeNumber = 6;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-36');
      expect(app.appName).assertEqual('LauncherApp36');
      expect(app.bundleName).assertEqual('com.launcher.app36');
      expect(app.badgeNumber).assertEqual(6);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 36;
      card.cardName = 'Card36';
      card.bundleName = 'com.launcher.card36';
      card.abilityName = 'FormAbility36';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(36);
      expect(card.cardName).assertEqual('Card36');
      expect(card.bundleName).assertEqual('com.launcher.card36');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 36;
      mission.bundleName = 'com.launcher.mission36';
      mission.abilityName = 'MissionAbility36';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(36);
      expect(mission.bundleName).assertEqual('com.launcher.mission36');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0037
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0037
     * @tc.desc   Assign launcher bean values for sample 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-37';
      app.appName = 'LauncherApp37';
      app.bundleName = 'com.launcher.app37';
      app.abilityName = 'Ability37';
      app.badgeNumber = 7;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-37');
      expect(app.appName).assertEqual('LauncherApp37');
      expect(app.bundleName).assertEqual('com.launcher.app37');
      expect(app.badgeNumber).assertEqual(7);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 37;
      card.cardName = 'Card37';
      card.bundleName = 'com.launcher.card37';
      card.abilityName = 'FormAbility37';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(37);
      expect(card.cardName).assertEqual('Card37');
      expect(card.bundleName).assertEqual('com.launcher.card37');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 37;
      mission.bundleName = 'com.launcher.mission37';
      mission.abilityName = 'MissionAbility37';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(37);
      expect(mission.bundleName).assertEqual('com.launcher.mission37');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0038
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0038
     * @tc.desc   Assign launcher bean values for sample 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-38';
      app.appName = 'LauncherApp38';
      app.bundleName = 'com.launcher.app38';
      app.abilityName = 'Ability38';
      app.badgeNumber = 8;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-38');
      expect(app.appName).assertEqual('LauncherApp38');
      expect(app.bundleName).assertEqual('com.launcher.app38');
      expect(app.badgeNumber).assertEqual(8);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 38;
      card.cardName = 'Card38';
      card.bundleName = 'com.launcher.card38';
      card.abilityName = 'FormAbility38';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(38);
      expect(card.cardName).assertEqual('Card38');
      expect(card.bundleName).assertEqual('com.launcher.card38');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 38;
      mission.bundleName = 'com.launcher.mission38';
      mission.abilityName = 'MissionAbility38';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(38);
      expect(mission.bundleName).assertEqual('com.launcher.mission38');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0039
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0039
     * @tc.desc   Assign launcher bean values for sample 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-39';
      app.appName = 'LauncherApp39';
      app.bundleName = 'com.launcher.app39';
      app.abilityName = 'Ability39';
      app.badgeNumber = 9;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-39');
      expect(app.appName).assertEqual('LauncherApp39');
      expect(app.bundleName).assertEqual('com.launcher.app39');
      expect(app.badgeNumber).assertEqual(9);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 39;
      card.cardName = 'Card39';
      card.bundleName = 'com.launcher.card39';
      card.abilityName = 'FormAbility39';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(39);
      expect(card.cardName).assertEqual('Card39');
      expect(card.bundleName).assertEqual('com.launcher.card39');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 39;
      mission.bundleName = 'com.launcher.mission39';
      mission.abilityName = 'MissionAbility39';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(39);
      expect(mission.bundleName).assertEqual('com.launcher.mission39');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0040
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0040
     * @tc.desc   Assign launcher bean values for sample 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-40';
      app.appName = 'LauncherApp40';
      app.bundleName = 'com.launcher.app40';
      app.abilityName = 'Ability40';
      app.badgeNumber = 0;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-40');
      expect(app.appName).assertEqual('LauncherApp40');
      expect(app.bundleName).assertEqual('com.launcher.app40');
      expect(app.badgeNumber).assertEqual(0);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 40;
      card.cardName = 'Card40';
      card.bundleName = 'com.launcher.card40';
      card.abilityName = 'FormAbility40';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(40);
      expect(card.cardName).assertEqual('Card40');
      expect(card.bundleName).assertEqual('com.launcher.card40');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 40;
      mission.bundleName = 'com.launcher.mission40';
      mission.abilityName = 'MissionAbility40';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(40);
      expect(mission.bundleName).assertEqual('com.launcher.mission40');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0041
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0041
     * @tc.desc   Assign launcher bean values for sample 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-41';
      app.appName = 'LauncherApp41';
      app.bundleName = 'com.launcher.app41';
      app.abilityName = 'Ability41';
      app.badgeNumber = 1;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-41');
      expect(app.appName).assertEqual('LauncherApp41');
      expect(app.bundleName).assertEqual('com.launcher.app41');
      expect(app.badgeNumber).assertEqual(1);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 41;
      card.cardName = 'Card41';
      card.bundleName = 'com.launcher.card41';
      card.abilityName = 'FormAbility41';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(41);
      expect(card.cardName).assertEqual('Card41');
      expect(card.bundleName).assertEqual('com.launcher.card41');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 41;
      mission.bundleName = 'com.launcher.mission41';
      mission.abilityName = 'MissionAbility41';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(41);
      expect(mission.bundleName).assertEqual('com.launcher.mission41');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0042
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0042
     * @tc.desc   Assign launcher bean values for sample 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-42';
      app.appName = 'LauncherApp42';
      app.bundleName = 'com.launcher.app42';
      app.abilityName = 'Ability42';
      app.badgeNumber = 2;
      app.isSystemApp = true;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-42');
      expect(app.appName).assertEqual('LauncherApp42');
      expect(app.bundleName).assertEqual('com.launcher.app42');
      expect(app.badgeNumber).assertEqual(2);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 42;
      card.cardName = 'Card42';
      card.bundleName = 'com.launcher.card42';
      card.abilityName = 'FormAbility42';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(42);
      expect(card.cardName).assertEqual('Card42');
      expect(card.bundleName).assertEqual('com.launcher.card42');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 42;
      mission.bundleName = 'com.launcher.mission42';
      mission.abilityName = 'MissionAbility42';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(42);
      expect(mission.bundleName).assertEqual('com.launcher.mission42');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0043
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0043
     * @tc.desc   Assign launcher bean values for sample 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-43';
      app.appName = 'LauncherApp43';
      app.bundleName = 'com.launcher.app43';
      app.abilityName = 'Ability43';
      app.badgeNumber = 3;
      app.isSystemApp = false;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-43');
      expect(app.appName).assertEqual('LauncherApp43');
      expect(app.bundleName).assertEqual('com.launcher.app43');
      expect(app.badgeNumber).assertEqual(3);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 43;
      card.cardName = 'Card43';
      card.bundleName = 'com.launcher.card43';
      card.abilityName = 'FormAbility43';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(43);
      expect(card.cardName).assertEqual('Card43');
      expect(card.bundleName).assertEqual('com.launcher.card43');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 43;
      mission.bundleName = 'com.launcher.mission43';
      mission.abilityName = 'MissionAbility43';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(43);
      expect(mission.bundleName).assertEqual('com.launcher.mission43');
      expect(mission.lockedState).assertEqual(false);
    })

    /**
     * @tc.name   testLauncherPlusBeans0044
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0044
     * @tc.desc   Assign launcher bean values for sample 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-44';
      app.appName = 'LauncherApp44';
      app.bundleName = 'com.launcher.app44';
      app.abilityName = 'Ability44';
      app.badgeNumber = 4;
      app.isSystemApp = true;
      app.isUninstallAble = false;
      expect(app.appId).assertEqual('app-44');
      expect(app.appName).assertEqual('LauncherApp44');
      expect(app.bundleName).assertEqual('com.launcher.app44');
      expect(app.badgeNumber).assertEqual(4);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 44;
      card.cardName = 'Card44';
      card.bundleName = 'com.launcher.card44';
      card.abilityName = 'FormAbility44';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(44);
      expect(card.cardName).assertEqual('Card44');
      expect(card.bundleName).assertEqual('com.launcher.card44');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 44;
      mission.bundleName = 'com.launcher.mission44';
      mission.abilityName = 'MissionAbility44';
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(44);
      expect(mission.bundleName).assertEqual('com.launcher.mission44');
      expect(mission.lockedState).assertEqual(true);
    })

    /**
     * @tc.name   testLauncherPlusBeans0045
     * @tc.number SUB_LAUNCHER_PLUS_BEANS_0045
     * @tc.desc   Assign launcher bean values for sample 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusBeans0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-45';
      app.appName = 'LauncherApp45';
      app.bundleName = 'com.launcher.app45';
      app.abilityName = 'Ability45';
      app.badgeNumber = 5;
      app.isSystemApp = false;
      app.isUninstallAble = true;
      expect(app.appId).assertEqual('app-45');
      expect(app.appName).assertEqual('LauncherApp45');
      expect(app.bundleName).assertEqual('com.launcher.app45');
      expect(app.badgeNumber).assertEqual(5);
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 45;
      card.cardName = 'Card45';
      card.bundleName = 'com.launcher.card45';
      card.abilityName = 'FormAbility45';
      card.moduleName = 'entry';
      expect(card.cardId).assertEqual(45);
      expect(card.cardName).assertEqual('Card45');
      expect(card.bundleName).assertEqual('com.launcher.card45');
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 45;
      mission.bundleName = 'com.launcher.mission45';
      mission.abilityName = 'MissionAbility45';
      mission.lockedState = false;
      expect(mission.missionId).assertEqual(45);
      expect(mission.bundleName).assertEqual('com.launcher.mission45');
      expect(mission.lockedState).assertEqual(false);
    })
  })
}
