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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, On, Component, Rect } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import application from '@ohos.app.ability.application';
import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';
import { BoardKit } from '../common/Game2048TestKit';
import { resetToBeforePage } from '../common/UiResetKit';
/** Prefix used by every UI case name and log line. */
const BUNDLE: string = 'Game2048_';

const CASE_NAME: string = 'indexUiElementsTest';
const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const PREF_STORE: string = 'mystore';
const LAUNCH_DELAY: number = 2000;
const QUERY_DELAY: number = 800;
const SETTLE_DELAY: number = 2000;
const MISSING_ID: string = 'notExistId_2048';
const MISSING_TEXT: string = 'NotExistText2048';
const LOGO_ID: string = 'logo2048';
const START_ID: string = 'startGame';
const REPEAT_LOGO_QUERIES: number = 5;
const REPEAT_START_QUERIES: number = 3;

/**
 * 清除上一次运行留在 mystore 中的棋局数据，保证每次进入页面都是 BEFORE 状态。
 * 页面在 aboutToAppear 中会回读 gameData，若残留就会隐藏 Start 按钮。
 */
async function clearSavedGame(): Promise<void> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context: common.Context = application.getApplicationContext();
  let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
  await store.delete('gameData');
  await store.delete('score');
  await store.delete('gameStatus');
  await store.flush();
  BoardKit.log(CASE_NAME, 'saved game cleared');
}

/**
 * 拉起被测页面并等待首帧渲染完成。
 */
async function launchGamePage(): Promise<void> {
  let driver: Driver = Driver.create();
  await resetToBeforePage(driver);
  BoardKit.log(CASE_NAME, 'game page launched');
}

/**
 * 退出页面，使下一次 startAbility 重新走 aboutToAppear 的读取分支。
 * 只有当被测页面（或其终局弹窗）仍在屏幕上时才按返回键，
 * 避免在测试框架自身的 Ability 上执行返回导致用例进程被关闭。
 */
async function closeGamePage(driver: Driver): Promise<void> {
  let attempts: number = 0;
  while (attempts < 2) {
    let logos: Component[] = await findAll(driver, ON.id(LOGO_ID));
    let titles: Component[] = await findAll(driver, ON.text('Game Over'));
    if (logos.length === 0 && titles.length === 0) {
      break;
    }
    await driver.pressBack();
    await driver.delayMs(QUERY_DELAY);
    attempts = attempts + 1;
  }
}

/**
 * 关掉当前页面再重新拉起，用于获得全新首帧。
 */
async function reopenGamePage(driver: Driver): Promise<void> {
  await closeGamePage(driver);
  await launchGamePage();
}

/**
 * 收集当前快照中与给定条件匹配的全部组件。
 * 用数组长度代替对 undefined 的判断，避免可空比较在 ArkTS 中的类型限制。
 */
async function findAll(driver: Driver, on: On): Promise<Component[]> {
  let matches: Component[] = [];
  try {
    let one: Component = await driver.findComponent(on);
    if (one !== null && one !== undefined) {
      matches.push(one);
    }
  } catch (error) {
    BoardKit.warn(CASE_NAME, 'single lookup failed');
  }
  return matches;
}

/**
 * 返回第一个匹配组件，没有匹配时返回 null。
 * 让“元素缺失”可以写成 assertNull 断言，而不是依赖抛异常。
 */
async function findOrNull(driver: Driver, on: On): Promise<Component | null> {
  let matches: Component[] = await findAll(driver, on);
  if (matches.length === 0) {
    return null;
  }
  return matches[0];
}

export default function indexUiElementsTest() {
  describe('indexUiElementsTest', () => {
    beforeEach(async () => {
      await resetToBeforePage(Driver.create());
    });

    beforeAll(async () => {
      BoardKit.log(CASE_NAME, 'suite begin');
      await resetToBeforePage(Driver.create());
    });

    afterAll(async () => {
      BoardKit.log(CASE_NAME, 'suite end');
      await clearSavedGame();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIELEMENTS_1200
     * @tc.name indexUiElementsMissingIdIsNotResolvable1200
     * @tc.desc Verify an unknown id yields either an empty result or a caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiElements_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiElements_001', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let threw: boolean = false;
      try {
        await driver.findComponent(ON.id(MISSING_ID));
      } catch (error) {
        threw = true;
        BoardKit.warn(CASE_NAME, 'findComponent threw for ' + MISSING_ID);
      }
      let matches: Component[] = await findAll(driver, ON.id(MISSING_ID));
      BoardKit.log(BUNDLE + 'UiElements_001', 'check: expect(matches.length).assertEqual(0);');
      expect(matches.length).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiElements_001', 'check: expect(threw === true || matches.length === 0).assertTrue();');
      expect(threw === true || matches.length === 0).assertTrue();
      BoardKit.log(CASE_NAME, 'missing id threw=' + threw);
      BoardKit.log(BUNDLE + 'UiElements_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIELEMENTS_1300
     * @tc.name indexUiElementsMissingTextIsNotResolvable1300
     * @tc.desc Verify an unknown caption resolves to null instead of a component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiElements_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiElements_002', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let absent: Component | null = await findOrNull(driver, ON.text(MISSING_TEXT));
      BoardKit.log(BUNDLE + 'UiElements_002', 'check: expect(absent).assertNull();');
      expect(absent).assertNull();
      let matches: Component[] = await findAll(driver, ON.text(MISSING_TEXT));
      BoardKit.log(BUNDLE + 'UiElements_002', 'check: expect(matches.length).assertEqual(0);');
      expect(matches.length).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiElements_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIELEMENTS_1800
     * @tc.name indexUiElementsNegativeQueryStaysEmpty1800
     * @tc.desc Verify the unknown id keeps resolving to nothing after the settle delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiElements_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiElements_003', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let firstAbsent: Component | null = await findOrNull(driver, ON.id(MISSING_ID));
      BoardKit.log(BUNDLE + 'UiElements_003', 'check: expect(firstAbsent).assertNull();');
      expect(firstAbsent).assertNull();
      await driver.delayMs(SETTLE_DELAY);
      let secondAbsent: Component | null = await findOrNull(driver, ON.id(MISSING_ID));
      BoardKit.log(BUNDLE + 'UiElements_003', 'check: expect(secondAbsent).assertNull();');
      expect(secondAbsent).assertNull();
      let matches: Component[] = await findAll(driver, ON.id(MISSING_ID));
      BoardKit.log(BUNDLE + 'UiElements_003', 'check: expect(matches.length).assertEqual(0);');
      expect(matches.length).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiElements_003', 'end');
    });

  });
}
