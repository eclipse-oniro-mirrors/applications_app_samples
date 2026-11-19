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
import {
  AppItemInfo,
  CardItemInfo,
  FormCardItem,
  GridLayoutItemInfo,
  MissionInfo
} from '@ohos/base';

function createApp(index: number): AppItemInfo {
  const app: AppItemInfo = new AppItemInfo();
  app.appId = 'app-' + index;
  app.appName = 'App' + index;
  app.appIconId = 100 + index;
  app.appLabelId = 'label_' + index;
  app.bundleName = 'com.samples.bean' + index;
  app.abilityName = 'EntryAbility';
  app.isSystemApp = index % 2 === 0;
  app.isUninstallAble = index % 3 === 0;
  app.badgeNumber = index % 10;
  app.moduleName = 'entry';
  app.typeId = index % 2;
  app.area = [1, 1];
  app.page = index % 3;
  app.column = index % 5;
  app.row = index % 6;
  return app;
}

function createCard(index: number): CardItemInfo {
  const card: CardItemInfo = new CardItemInfo();
  card.cardId = index;
  card.bundleName = 'com.samples.card' + index;
  card.abilityName = 'FormAbility';
  card.moduleName = 'entry';
  card.cardName = 'Card' + index;
  card.cardDimension = index % 4;
  card.area = [index % 4 + 1, index % 3 + 1];
  card.formConfigAbility = 'FormConfig';
  card.appLabelId = 'card_label_' + index;
  card.appName = 'CardApp' + index;
  card.supportDimensions = [1, 2, 3, 4];
  return card;
}

export default function beanMatrixExtendedTest() {
  describe('LauncherBeanMatrixExtendedTest', () => {

    /**
     * @tc.name   testBeanApp0001
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0001
     * @tc.desc   Test AppItemInfo field retention for matrix item 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(0);
      expect(app.appId).assertEqual('app-0');
      expect(app.appName).assertEqual('App0');
      expect(app.appIconId).assertEqual(100);
      expect(app.appLabelId).assertEqual('label_0');
      expect(app.bundleName).assertEqual('com.samples.bean0');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(true);
      expect(app.badgeNumber).assertEqual(0);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(0);
      expect(app.column).assertEqual(0);
      expect(app.row).assertEqual(0);
    })

    /**
     * @tc.name   testBeanCard0001
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0001
     * @tc.desc   Test CardItemInfo field retention for matrix item 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(0);
      expect(card.cardId).assertEqual(0);
      expect(card.bundleName).assertEqual('com.samples.card0');
      expect(card.cardName).assertEqual('Card0');
      expect(card.cardDimension).assertEqual(0);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_0');
      expect(card.appName).assertEqual('CardApp0');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0002
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0002
     * @tc.desc   Test AppItemInfo field retention for matrix item 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(1);
      expect(app.appId).assertEqual('app-1');
      expect(app.appName).assertEqual('App1');
      expect(app.appIconId).assertEqual(101);
      expect(app.appLabelId).assertEqual('label_1');
      expect(app.bundleName).assertEqual('com.samples.bean1');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(1);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(1);
      expect(app.column).assertEqual(1);
      expect(app.row).assertEqual(1);
    })

    /**
     * @tc.name   testBeanCard0002
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0002
     * @tc.desc   Test CardItemInfo field retention for matrix item 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(1);
      expect(card.cardId).assertEqual(1);
      expect(card.bundleName).assertEqual('com.samples.card1');
      expect(card.cardName).assertEqual('Card1');
      expect(card.cardDimension).assertEqual(1);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_1');
      expect(card.appName).assertEqual('CardApp1');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0003
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0003
     * @tc.desc   Test AppItemInfo field retention for matrix item 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(2);
      expect(app.appId).assertEqual('app-2');
      expect(app.appName).assertEqual('App2');
      expect(app.appIconId).assertEqual(102);
      expect(app.appLabelId).assertEqual('label_2');
      expect(app.bundleName).assertEqual('com.samples.bean2');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(2);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(2);
      expect(app.column).assertEqual(2);
      expect(app.row).assertEqual(2);
    })

    /**
     * @tc.name   testBeanCard0003
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0003
     * @tc.desc   Test CardItemInfo field retention for matrix item 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(2);
      expect(card.cardId).assertEqual(2);
      expect(card.bundleName).assertEqual('com.samples.card2');
      expect(card.cardName).assertEqual('Card2');
      expect(card.cardDimension).assertEqual(2);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_2');
      expect(card.appName).assertEqual('CardApp2');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0004
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0004
     * @tc.desc   Test AppItemInfo field retention for matrix item 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(3);
      expect(app.appId).assertEqual('app-3');
      expect(app.appName).assertEqual('App3');
      expect(app.appIconId).assertEqual(103);
      expect(app.appLabelId).assertEqual('label_3');
      expect(app.bundleName).assertEqual('com.samples.bean3');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(true);
      expect(app.badgeNumber).assertEqual(3);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(0);
      expect(app.column).assertEqual(3);
      expect(app.row).assertEqual(3);
    })

    /**
     * @tc.name   testBeanCard0004
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0004
     * @tc.desc   Test CardItemInfo field retention for matrix item 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(3);
      expect(card.cardId).assertEqual(3);
      expect(card.bundleName).assertEqual('com.samples.card3');
      expect(card.cardName).assertEqual('Card3');
      expect(card.cardDimension).assertEqual(3);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_3');
      expect(card.appName).assertEqual('CardApp3');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0005
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0005
     * @tc.desc   Test AppItemInfo field retention for matrix item 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(4);
      expect(app.appId).assertEqual('app-4');
      expect(app.appName).assertEqual('App4');
      expect(app.appIconId).assertEqual(104);
      expect(app.appLabelId).assertEqual('label_4');
      expect(app.bundleName).assertEqual('com.samples.bean4');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(4);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(1);
      expect(app.column).assertEqual(4);
      expect(app.row).assertEqual(4);
    })

    /**
     * @tc.name   testBeanCard0005
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0005
     * @tc.desc   Test CardItemInfo field retention for matrix item 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(4);
      expect(card.cardId).assertEqual(4);
      expect(card.bundleName).assertEqual('com.samples.card4');
      expect(card.cardName).assertEqual('Card4');
      expect(card.cardDimension).assertEqual(0);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_4');
      expect(card.appName).assertEqual('CardApp4');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0006
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0006
     * @tc.desc   Test AppItemInfo field retention for matrix item 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(5);
      expect(app.appId).assertEqual('app-5');
      expect(app.appName).assertEqual('App5');
      expect(app.appIconId).assertEqual(105);
      expect(app.appLabelId).assertEqual('label_5');
      expect(app.bundleName).assertEqual('com.samples.bean5');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(5);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(2);
      expect(app.column).assertEqual(0);
      expect(app.row).assertEqual(5);
    })

    /**
     * @tc.name   testBeanCard0006
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0006
     * @tc.desc   Test CardItemInfo field retention for matrix item 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(5);
      expect(card.cardId).assertEqual(5);
      expect(card.bundleName).assertEqual('com.samples.card5');
      expect(card.cardName).assertEqual('Card5');
      expect(card.cardDimension).assertEqual(1);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_5');
      expect(card.appName).assertEqual('CardApp5');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0007
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0007
     * @tc.desc   Test AppItemInfo field retention for matrix item 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(6);
      expect(app.appId).assertEqual('app-6');
      expect(app.appName).assertEqual('App6');
      expect(app.appIconId).assertEqual(106);
      expect(app.appLabelId).assertEqual('label_6');
      expect(app.bundleName).assertEqual('com.samples.bean6');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(true);
      expect(app.badgeNumber).assertEqual(6);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(0);
      expect(app.column).assertEqual(1);
      expect(app.row).assertEqual(0);
    })

    /**
     * @tc.name   testBeanCard0007
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0007
     * @tc.desc   Test CardItemInfo field retention for matrix item 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(6);
      expect(card.cardId).assertEqual(6);
      expect(card.bundleName).assertEqual('com.samples.card6');
      expect(card.cardName).assertEqual('Card6');
      expect(card.cardDimension).assertEqual(2);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_6');
      expect(card.appName).assertEqual('CardApp6');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0008
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0008
     * @tc.desc   Test AppItemInfo field retention for matrix item 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(7);
      expect(app.appId).assertEqual('app-7');
      expect(app.appName).assertEqual('App7');
      expect(app.appIconId).assertEqual(107);
      expect(app.appLabelId).assertEqual('label_7');
      expect(app.bundleName).assertEqual('com.samples.bean7');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(7);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(1);
      expect(app.column).assertEqual(2);
      expect(app.row).assertEqual(1);
    })

    /**
     * @tc.name   testBeanCard0008
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0008
     * @tc.desc   Test CardItemInfo field retention for matrix item 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(7);
      expect(card.cardId).assertEqual(7);
      expect(card.bundleName).assertEqual('com.samples.card7');
      expect(card.cardName).assertEqual('Card7');
      expect(card.cardDimension).assertEqual(3);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_7');
      expect(card.appName).assertEqual('CardApp7');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0009
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0009
     * @tc.desc   Test AppItemInfo field retention for matrix item 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(8);
      expect(app.appId).assertEqual('app-8');
      expect(app.appName).assertEqual('App8');
      expect(app.appIconId).assertEqual(108);
      expect(app.appLabelId).assertEqual('label_8');
      expect(app.bundleName).assertEqual('com.samples.bean8');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(8);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(2);
      expect(app.column).assertEqual(3);
      expect(app.row).assertEqual(2);
    })

    /**
     * @tc.name   testBeanCard0009
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0009
     * @tc.desc   Test CardItemInfo field retention for matrix item 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(8);
      expect(card.cardId).assertEqual(8);
      expect(card.bundleName).assertEqual('com.samples.card8');
      expect(card.cardName).assertEqual('Card8');
      expect(card.cardDimension).assertEqual(0);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_8');
      expect(card.appName).assertEqual('CardApp8');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0010
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0010
     * @tc.desc   Test AppItemInfo field retention for matrix item 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(9);
      expect(app.appId).assertEqual('app-9');
      expect(app.appName).assertEqual('App9');
      expect(app.appIconId).assertEqual(109);
      expect(app.appLabelId).assertEqual('label_9');
      expect(app.bundleName).assertEqual('com.samples.bean9');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(true);
      expect(app.badgeNumber).assertEqual(9);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(0);
      expect(app.column).assertEqual(4);
      expect(app.row).assertEqual(3);
    })

    /**
     * @tc.name   testBeanCard0010
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0010
     * @tc.desc   Test CardItemInfo field retention for matrix item 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(9);
      expect(card.cardId).assertEqual(9);
      expect(card.bundleName).assertEqual('com.samples.card9');
      expect(card.cardName).assertEqual('Card9');
      expect(card.cardDimension).assertEqual(1);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_9');
      expect(card.appName).assertEqual('CardApp9');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0011
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0011
     * @tc.desc   Test AppItemInfo field retention for matrix item 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(10);
      expect(app.appId).assertEqual('app-10');
      expect(app.appName).assertEqual('App10');
      expect(app.appIconId).assertEqual(110);
      expect(app.appLabelId).assertEqual('label_10');
      expect(app.bundleName).assertEqual('com.samples.bean10');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(0);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(1);
      expect(app.column).assertEqual(0);
      expect(app.row).assertEqual(4);
    })

    /**
     * @tc.name   testBeanCard0011
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0011
     * @tc.desc   Test CardItemInfo field retention for matrix item 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(10);
      expect(card.cardId).assertEqual(10);
      expect(card.bundleName).assertEqual('com.samples.card10');
      expect(card.cardName).assertEqual('Card10');
      expect(card.cardDimension).assertEqual(2);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_10');
      expect(card.appName).assertEqual('CardApp10');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0012
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0012
     * @tc.desc   Test AppItemInfo field retention for matrix item 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(11);
      expect(app.appId).assertEqual('app-11');
      expect(app.appName).assertEqual('App11');
      expect(app.appIconId).assertEqual(111);
      expect(app.appLabelId).assertEqual('label_11');
      expect(app.bundleName).assertEqual('com.samples.bean11');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(1);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(2);
      expect(app.column).assertEqual(1);
      expect(app.row).assertEqual(5);
    })

    /**
     * @tc.name   testBeanCard0012
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0012
     * @tc.desc   Test CardItemInfo field retention for matrix item 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(11);
      expect(card.cardId).assertEqual(11);
      expect(card.bundleName).assertEqual('com.samples.card11');
      expect(card.cardName).assertEqual('Card11');
      expect(card.cardDimension).assertEqual(3);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_11');
      expect(card.appName).assertEqual('CardApp11');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0013
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0013
     * @tc.desc   Test AppItemInfo field retention for matrix item 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(12);
      expect(app.appId).assertEqual('app-12');
      expect(app.appName).assertEqual('App12');
      expect(app.appIconId).assertEqual(112);
      expect(app.appLabelId).assertEqual('label_12');
      expect(app.bundleName).assertEqual('com.samples.bean12');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(true);
      expect(app.badgeNumber).assertEqual(2);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(0);
      expect(app.column).assertEqual(2);
      expect(app.row).assertEqual(0);
    })

    /**
     * @tc.name   testBeanCard0013
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0013
     * @tc.desc   Test CardItemInfo field retention for matrix item 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(12);
      expect(card.cardId).assertEqual(12);
      expect(card.bundleName).assertEqual('com.samples.card12');
      expect(card.cardName).assertEqual('Card12');
      expect(card.cardDimension).assertEqual(0);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_12');
      expect(card.appName).assertEqual('CardApp12');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0014
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0014
     * @tc.desc   Test AppItemInfo field retention for matrix item 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(13);
      expect(app.appId).assertEqual('app-13');
      expect(app.appName).assertEqual('App13');
      expect(app.appIconId).assertEqual(113);
      expect(app.appLabelId).assertEqual('label_13');
      expect(app.bundleName).assertEqual('com.samples.bean13');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(false);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(3);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(1);
      expect(app.page).assertEqual(1);
      expect(app.column).assertEqual(3);
      expect(app.row).assertEqual(1);
    })

    /**
     * @tc.name   testBeanCard0014
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0014
     * @tc.desc   Test CardItemInfo field retention for matrix item 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(13);
      expect(card.cardId).assertEqual(13);
      expect(card.bundleName).assertEqual('com.samples.card13');
      expect(card.cardName).assertEqual('Card13');
      expect(card.cardDimension).assertEqual(1);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_13');
      expect(card.appName).assertEqual('CardApp13');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testBeanApp0015
     * @tc.number SUB_LAUNCHER_EXT_BEAN_APP_0015
     * @tc.desc   Test AppItemInfo field retention for matrix item 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanApp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(14);
      expect(app.appId).assertEqual('app-14');
      expect(app.appName).assertEqual('App14');
      expect(app.appIconId).assertEqual(114);
      expect(app.appLabelId).assertEqual('label_14');
      expect(app.bundleName).assertEqual('com.samples.bean14');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertEqual(true);
      expect(app.isUninstallAble).assertEqual(false);
      expect(app.badgeNumber).assertEqual(4);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.page).assertEqual(2);
      expect(app.column).assertEqual(4);
      expect(app.row).assertEqual(2);
    })

    /**
     * @tc.name   testBeanCard0015
     * @tc.number SUB_LAUNCHER_EXT_BEAN_CARD_0015
     * @tc.desc   Test CardItemInfo field retention for matrix item 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBeanCard0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = createCard(14);
      expect(card.cardId).assertEqual(14);
      expect(card.bundleName).assertEqual('com.samples.card14');
      expect(card.cardName).assertEqual('Card14');
      expect(card.cardDimension).assertEqual(2);
      expect(card.area?.length).assertEqual(2);
      expect(card.formConfigAbility).assertEqual('FormConfig');
      expect(card.appLabelId).assertEqual('card_label_14');
      expect(card.appName).assertEqual('CardApp14');
      expect(card.supportDimensions.length).assertEqual(4);
    })
  })
}
