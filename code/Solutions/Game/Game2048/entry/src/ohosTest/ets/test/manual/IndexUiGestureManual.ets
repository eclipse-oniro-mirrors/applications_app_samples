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
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import { BoardKit } from '../common/Game2048TestKit';
import { resetToBeforePage } from '../common/UiResetKit';
/** Prefix used by every UI case name and log line. */
const BUNDLE: string = 'Game2048_';

/**
 * Index 页四向手势测试套件。
 *
 * 被测行为来自 Index.ets 的 Grid 手势组：当 gameStatus 为 RUNNING(1) 时，
 * PanGesture 的 Left/Right/Up/Down 四个方向分别驱动 GameRule.move。
 * 页面初始 gameStatus 为 BEFORE(-1)，此时 startGame 按钮可见；点击后按钮
 * 消失，仅保留 logo2048、Score 与 Max 三块固定表头。
 *
 * 本套件只验证手势层的可操作性契约：
 *   1. 每次滑动后页面仍然存活，startGame 不再出现；
 *   2. 连续滑动不会崩溃，Score/Max/logo2048 始终可见；
 *   3. 滑动坐标由屏幕宽高比例换算，适配不同分辨率；
 *   4. 不做方块数值的精确断言，因为每次有效滑动都会随机补一个 2 或 4。
 */

const SUITE: string = 'indexUiGestureTest';
const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const START_ID: string = 'startGame';
const LOGO_ID: string = 'logo2048';
const SCORE_TEXT: string = 'Score';
const MAX_TEXT: string = 'Max';
const RESET_TEXT: string = 'Reset';
const SWIPE_SPEED: number = 600;
const FAST_SPEED: number = 1000;
const MIN_SPEED: number = 200;
const SETTLE_DELAY: number = 1000;
const STEP_DELAY: number = 500;
const SWIPE_CYCLES: number = 10;

/** 横向手势的起点与终点占屏幕宽度的比例。 */
const H_LEFT_FROM: number = 0.85;
const H_LEFT_TO: number = 0.15;
/** 横向手势固定落在屏幕高度的该比例处，保证起点在棋盘内。 */
const H_Y_RATIO: number = 0.35;
/** 纵向手势的起点与终点占屏幕高度的比例，两端都落在棋盘内。 */
const V_TOP: number = 0.30;
const V_BOTTOM: number = 0.55;
/** 纵向手势固定落在屏幕宽度的该比例处。 */
const V_X_RATIO: number = 0.50;
/** 短滑动只跨越屏幕宽度的十分之一。 */
const SHORT_FROM: number = 0.60;
const SHORT_TO: number = 0.50;
/** 长滑动跨越屏幕宽度的十分之九。 */
const LONG_FROM: number = 0.95;
const LONG_TO: number = 0.05;

/**
 * 通过 AbilityDelegator 拉起游戏 Ability。
 * 回调错误为 null 表示系统没有报告启动失败。
 */
function launchGame(): Promise<BusinessError | null> {
  let want: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };
  return new Promise<BusinessError | null>((resolve: (value: BusinessError | null) => void) => {
    AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want, (err: BusinessError | null) => {
      resolve(err);
    });
  });
}

/** 判断指定 id 的组件当前是否出现在界面上。 */
async function isIdPresent(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (error) {
    BoardKit.warn(SUITE, 'id absent: ' + id + ' ' + JSON.stringify(error));
    return false;
  }
}

/** 判断指定文案的组件当前是否出现在界面上。 */
async function isTextPresent(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (error) {
    BoardKit.warn(SUITE, 'text absent: ' + text + ' ' + JSON.stringify(error));
    return false;
  }
}

/**
 * 让页面进入 RUNNING 状态。
 *
 * 首次运行时页面显示 Start 按钮；如果本地存档里保存的是 OVER 状态，
 * 页面会直接弹出 Game Over 对话框并显示 Reset 按钮，此时点击 Reset
 * 同样会走 gameStart 流程。两种入口都收口到这里，避免用例之间互相依赖。
 */
async function startOrReset(driver: Driver, caseName: string): Promise<boolean> {
  await driver.delayMs(STEP_DELAY);
  let startPresent: boolean = await isIdPresent(driver, START_ID);
  if (startPresent) {
    BoardKit.log(caseName, 'start button present, clicking it');
    await (await driver.findComponent(ON.id(START_ID))).click();
    await driver.delayMs(SETTLE_DELAY);
  } else {
    let resetPresent: boolean = await isTextPresent(driver, RESET_TEXT);
    if (resetPresent) {
      BoardKit.log(caseName, 'reset button present, clicking it');
      await (await driver.findComponent(ON.text(RESET_TEXT))).click();
      await driver.delayMs(SETTLE_DELAY);
    } else {
      BoardKit.log(caseName, 'game is already running');
    }
  }
  await driver.delayMs(STEP_DELAY);
  let stillStart: boolean = await isIdPresent(driver, START_ID);
  return !stillStart;
}

/**
 * 断言页面处于可继续操作的对局状态。
 * 表头三件套必须存在，且 Start 按钮必须已经隐藏。
 */
async function expectRunningPage(driver: Driver, caseName: string): Promise<void> {
  await driver.delayMs(STEP_DELAY);
  let scorePresent: boolean = await isTextPresent(driver, SCORE_TEXT);
  let maxPresent: boolean = await isTextPresent(driver, MAX_TEXT);
  let logoPresent: boolean = await isIdPresent(driver, LOGO_ID);
  let startPresent: boolean = await isIdPresent(driver, START_ID);
  expect(scorePresent).assertTrue();
  expect(maxPresent).assertTrue();
  expect(logoPresent).assertTrue();
  expect(startPresent).assertFalse();
  BoardKit.log(caseName, 'page alive | score header yes | max header yes | logo yes');
}

/**
 * 按屏幕宽高比例执行一次横向滑动。
 * 起止坐标都四舍五入到整数像素，避免不同设备上的小数误差。
 */
async function swipeHorizontalByRatio(driver: Driver, fromRatio: number, toRatio: number,
  yRatio: number, speed: number): Promise<void> {
  let displayWidth: number = (await driver.getDisplaySize()).x;
  let displayHeight: number = (await driver.getDisplaySize()).y;
  let startX: number = Math.round(displayWidth * fromRatio);
  let endX: number = Math.round(displayWidth * toRatio);
  let swipeY: number = Math.round(displayHeight * yRatio);
  BoardKit.log(SUITE, 'horizontal swipe ' + startX + '->' + endX + ' at y ' + swipeY);
  await driver.swipe(startX, swipeY, endX, swipeY, speed);
}

/** 按屏幕宽高比例执行一次纵向滑动。 */
async function swipeVerticalByRatio(driver: Driver, fromRatio: number, toRatio: number,
  xRatio: number, speed: number): Promise<void> {
  let displayWidth: number = (await driver.getDisplaySize()).x;
  let displayHeight: number = (await driver.getDisplaySize()).y;
  let swipeX: number = Math.round(displayWidth * xRatio);
  let startY: number = Math.round(displayHeight * fromRatio);
  let endY: number = Math.round(displayHeight * toRatio);
  BoardKit.log(SUITE, 'vertical swipe ' + startY + '->' + endY + ' at x ' + swipeX);
  await driver.swipe(swipeX, startY, swipeX, endY, speed);
}

/** 左滑：从右侧百分之八十五处滑到左侧百分之十五处。 */
async function swipeLeft(driver: Driver, speed: number): Promise<void> {
  await swipeHorizontalByRatio(driver, H_LEFT_FROM, H_LEFT_TO, H_Y_RATIO, speed);
}

/** 右滑：从左侧百分之十五处滑到右侧百分之八十五处。 */
async function swipeRight(driver: Driver, speed: number): Promise<void> {
  await swipeHorizontalByRatio(driver, H_LEFT_TO, H_LEFT_FROM, H_Y_RATIO, speed);
}

/** 上滑：从高度百分之五十五处滑到百分之三十处。 */
async function swipeUp(driver: Driver, speed: number): Promise<void> {
  await swipeVerticalByRatio(driver, V_BOTTOM, V_TOP, V_X_RATIO, speed);
}

/** 下滑：从高度百分之三十处滑到百分之五十五处。 */
async function swipeDown(driver: Driver, speed: number): Promise<void> {
  await swipeVerticalByRatio(driver, V_TOP, V_BOTTOM, V_X_RATIO, speed);
}

/** 左滑但省略速度参数，用于验证默认速度分支。 */
async function swipeLeftDefaultSpeed(driver: Driver): Promise<void> {
  let displayWidth: number = (await driver.getDisplaySize()).x;
  let displayHeight: number = (await driver.getDisplaySize()).y;
  let startX: number = Math.round(displayWidth * H_LEFT_FROM);
  let endX: number = Math.round(displayWidth * H_LEFT_TO);
  let swipeY: number = Math.round(displayHeight * H_Y_RATIO);
  BoardKit.log(SUITE, 'default speed swipe ' + startX + '->' + endX);
  await driver.swipe(startX, swipeY, endX, swipeY);
}

export default function indexUiGestureTest() {
  describe('indexUiGestureTest', () => {
    beforeEach(async () => {
      await resetToBeforePage(Driver.create());
    });

    beforeAll(async () => {
      BoardKit.log(SUITE, 'suite begin');
      await resetToBeforePage(Driver.create());
    });

    afterAll(() => {
      BoardKit.log(SUITE, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0100
     * @tc.name indexUiGestureLaunchReportsNoError0100
     * @tc.desc Verify the entry ability is launched without a delegator error and the logo renders
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_001', 'begin');
      BoardKit.log(SUITE, 'case 0100 begin');
      let launchError: BusinessError | null = await launchGame();
      BoardKit.log(BUNDLE + 'UiGesture_001', 'check: expect(launchError).assertNull();');
      expect(launchError).assertNull();
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let logoPresent: boolean = await isIdPresent(driver, LOGO_ID);
      BoardKit.log(BUNDLE + 'UiGesture_001', 'check: expect(logoPresent).assertTrue();');
      expect(logoPresent).assertTrue();
      BoardKit.log(BUNDLE + 'UiGesture_001', 'check: expect(launchError === null).assertTrue();');
      expect(launchError === null).assertTrue();
      BoardKit.log(SUITE, 'case 0100 end');
      BoardKit.log(BUNDLE + 'UiGesture_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0200
     * @tc.name indexUiGestureStartButtonStartsRunning0200
     * @tc.desc Verify clicking Start hides the start button and leaves the score and max headers visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_002', 'begin');
      BoardKit.log(SUITE, 'case 0200 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0200');
      BoardKit.log(BUNDLE + 'UiGesture_002', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await expectRunningPage(driver, 'case 0200');
      let startPresent: boolean = await isIdPresent(driver, START_ID);
      BoardKit.log(BUNDLE + 'UiGesture_002', 'check: expect(startPresent).assertFalse();');
      expect(startPresent).assertFalse();
      BoardKit.log(BUNDLE + 'UiGesture_002', 'check: expect(startPresent === false).assertTrue();');
      expect(startPresent === false).assertTrue();
      BoardKit.log(SUITE, 'case 0200 end');
      BoardKit.log(BUNDLE + 'UiGesture_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0300
     * @tc.name indexUiGestureLeftSwipeKeepsPage0300
     * @tc.desc Verify a left swipe keeps the running page and keeps the start button hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_003', 'begin');
      BoardKit.log(SUITE, 'case 0300 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0300');
      BoardKit.log(BUNDLE + 'UiGesture_003', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0300');
      BoardKit.log(SUITE, 'case 0300 end');
      BoardKit.log(BUNDLE + 'UiGesture_003', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0400
     * @tc.name indexUiGestureRightSwipeKeepsPage0400
     * @tc.desc Verify a right swipe keeps the running page and keeps the start button hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_004', 'begin');
      BoardKit.log(SUITE, 'case 0400 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0400');
      BoardKit.log(BUNDLE + 'UiGesture_004', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0400');
      BoardKit.log(SUITE, 'case 0400 end');
      BoardKit.log(BUNDLE + 'UiGesture_004', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0500
     * @tc.name indexUiGestureUpSwipeKeepsPage0500
     * @tc.desc Verify an upward swipe keeps the running page and keeps the start button hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_005', 'begin');
      BoardKit.log(SUITE, 'case 0500 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0500');
      BoardKit.log(BUNDLE + 'UiGesture_005', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0500');
      BoardKit.log(SUITE, 'case 0500 end');
      BoardKit.log(BUNDLE + 'UiGesture_005', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0600
     * @tc.name indexUiGestureDownSwipeKeepsPage0600
     * @tc.desc Verify a downward swipe keeps the running page and keeps the start button hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_006', 'begin');
      BoardKit.log(SUITE, 'case 0600 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0600');
      BoardKit.log(BUNDLE + 'UiGesture_006', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0600');
      BoardKit.log(SUITE, 'case 0600 end');
      BoardKit.log(BUNDLE + 'UiGesture_006', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0700
     * @tc.name indexUiGestureSwipeUsesDisplayRatios0700
     * @tc.desc Verify swipe coordinates are derived from the display size and stay inside the screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_007', 'begin');
      BoardKit.log(SUITE, 'case 0700 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0700');
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      let displayWidth: number = (await driver.getDisplaySize()).x;
      let displayHeight: number = (await driver.getDisplaySize()).y;
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(displayWidth > 0).assertTrue();');
      expect(displayWidth > 0).assertTrue();
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(displayHeight > 0).assertTrue();');
      expect(displayHeight > 0).assertTrue();
      let secondWidth: number = (await driver.getDisplaySize()).x;
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(secondWidth).assertEqual(displayWidth);');
      expect(secondWidth).assertEqual(displayWidth);
      let startX: number = Math.round(displayWidth * H_LEFT_FROM);
      let endX: number = Math.round(displayWidth * H_LEFT_TO);
      let swipeY: number = Math.round(displayHeight * H_Y_RATIO);
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(startX > endX).assertTrue();');
      expect(startX > endX).assertTrue();
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(startX <= displayWidth).assertTrue();');
      expect(startX <= displayWidth).assertTrue();
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(endX >= 0).assertTrue();');
      expect(endX >= 0).assertTrue();
      BoardKit.log(BUNDLE + 'UiGesture_007', 'check: expect(swipeY < displayHeight).assertTrue();');
      expect(swipeY < displayHeight).assertTrue();
      await driver.swipe(startX, swipeY, endX, swipeY, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0700');
      BoardKit.log(SUITE, 'case 0700 end');
      BoardKit.log(BUNDLE + 'UiGesture_007', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0800
     * @tc.name indexUiGestureLeftSwipeTwice0800
     * @tc.desc Verify two consecutive left swipes each leave the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_008', 'begin');
      BoardKit.log(SUITE, 'case 0800 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0800');
      BoardKit.log(BUNDLE + 'UiGesture_008', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0800');
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0800');
      BoardKit.log(SUITE, 'case 0800 end');
      BoardKit.log(BUNDLE + 'UiGesture_008', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_0900
     * @tc.name indexUiGestureRightSwipeTwice0900
     * @tc.desc Verify two consecutive right swipes each leave the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_009', 'begin');
      BoardKit.log(SUITE, 'case 0900 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 0900');
      BoardKit.log(BUNDLE + 'UiGesture_009', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0900');
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 0900');
      BoardKit.log(SUITE, 'case 0900 end');
      BoardKit.log(BUNDLE + 'UiGesture_009', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1000
     * @tc.name indexUiGestureUpSwipeTwice1000
     * @tc.desc Verify two consecutive upward swipes each leave the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_010', 'begin');
      BoardKit.log(SUITE, 'case 1000 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1000');
      BoardKit.log(BUNDLE + 'UiGesture_010', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1000');
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1000');
      BoardKit.log(SUITE, 'case 1000 end');
      BoardKit.log(BUNDLE + 'UiGesture_010', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1100
     * @tc.name indexUiGestureDownSwipeTwice1100
     * @tc.desc Verify two consecutive downward swipes each leave the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_011', 'begin');
      BoardKit.log(SUITE, 'case 1100 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1100');
      BoardKit.log(BUNDLE + 'UiGesture_011', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1100');
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1100');
      BoardKit.log(SUITE, 'case 1100 end');
      BoardKit.log(BUNDLE + 'UiGesture_011', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1200
     * @tc.name indexUiGestureAlternateHorizontal1200
     * @tc.desc Verify four alternating left and right swipes keep the page responsive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_012', 'begin');
      BoardKit.log(SUITE, 'case 1200 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1200');
      BoardKit.log(BUNDLE + 'UiGesture_012', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1200');
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1200');
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1200');
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1200');
      BoardKit.log(SUITE, 'case 1200 end');
      BoardKit.log(BUNDLE + 'UiGesture_012', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1300
     * @tc.name indexUiGestureAlternateVertical1300
     * @tc.desc Verify four alternating up and down swipes keep the page responsive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_013', 'begin');
      BoardKit.log(SUITE, 'case 1300 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1300');
      BoardKit.log(BUNDLE + 'UiGesture_013', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1300');
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1300');
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1300');
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1300');
      BoardKit.log(SUITE, 'case 1300 end');
      BoardKit.log(BUNDLE + 'UiGesture_013', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1400
     * @tc.name indexUiGestureClockwiseCycle1400
     * @tc.desc Verify a clockwise left-up-right-down cycle keeps the running page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_014', 'begin');
      BoardKit.log(SUITE, 'case 1400 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1400');
      BoardKit.log(BUNDLE + 'UiGesture_014', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1400');
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1400');
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1400');
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1400');
      BoardKit.log(SUITE, 'case 1400 end');
      BoardKit.log(BUNDLE + 'UiGesture_014', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1500
     * @tc.name indexUiGestureCounterClockwiseCycle1500
     * @tc.desc Verify a counter clockwise left-down-right-up cycle keeps the running page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_015', 'begin');
      BoardKit.log(SUITE, 'case 1500 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1500');
      BoardKit.log(BUNDLE + 'UiGesture_015', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1500');
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1500');
      await swipeRight(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1500');
      await swipeUp(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1500');
      BoardKit.log(SUITE, 'case 1500 end');
      BoardKit.log(BUNDLE + 'UiGesture_015', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1600
     * @tc.name indexUiGestureTenConsecutiveSwipes1600
     * @tc.desc Verify ten consecutive swipes across the four directions do not crash the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_016', 'begin');
      BoardKit.log(SUITE, 'case 1600 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1600');
      BoardKit.log(BUNDLE + 'UiGesture_016', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      let directions: string[] = ['left', 'right', 'up', 'down'];
      BoardKit.log(BUNDLE + 'UiGesture_016', 'check: expect(directions.length).assertEqual(4);');
      expect(directions.length).assertEqual(4);
      let completed: number = 0;
      for (let index: number = 0; index < SWIPE_CYCLES; index++) {
        let direction: string = directions[index % directions.length];
        if (direction === 'left') {
          await swipeLeft(driver, SWIPE_SPEED);
        } else if (direction === 'right') {
          await swipeRight(driver, SWIPE_SPEED);
        } else if (direction === 'up') {
          await swipeUp(driver, SWIPE_SPEED);
        } else {
          await swipeDown(driver, SWIPE_SPEED);
        }
        completed = completed + 1;
        await driver.delayMs(STEP_DELAY);
      }
      BoardKit.log(BUNDLE + 'UiGesture_016', 'check: expect(completed).assertEqual(SWIPE_CYCLES);');
      expect(completed).assertEqual(SWIPE_CYCLES);
      BoardKit.log(BUNDLE + 'UiGesture_016', 'check: expect(completed === 10).assertTrue();');
      expect(completed === 10).assertTrue();
      await expectRunningPage(driver, 'case 1600');
      BoardKit.log(SUITE, 'case 1600 end');
      BoardKit.log(BUNDLE + 'UiGesture_016', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1700
     * @tc.name indexUiGestureDefaultSpeedSwipe1700
     * @tc.desc Verify a swipe that omits the speed argument still keeps the running page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_017', 'begin');
      BoardKit.log(SUITE, 'case 1700 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1700');
      BoardKit.log(BUNDLE + 'UiGesture_017', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeftDefaultSpeed(driver);
      await expectRunningPage(driver, 'case 1700');
      BoardKit.log(SUITE, 'case 1700 end');
      BoardKit.log(BUNDLE + 'UiGesture_017', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1800
     * @tc.name indexUiGestureShortSwipeKeepsPage1800
     * @tc.desc Verify a short swipe crossing ten percent of the width leaves the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_018', 'begin');
      BoardKit.log(SUITE, 'case 1800 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1800');
      BoardKit.log(BUNDLE + 'UiGesture_018', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeHorizontalByRatio(driver, SHORT_FROM, SHORT_TO, H_Y_RATIO, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1800');
      BoardKit.log(SUITE, 'case 1800 end');
      BoardKit.log(BUNDLE + 'UiGesture_018', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_1900
     * @tc.name indexUiGestureLongSwipeKeepsPage1900
     * @tc.desc Verify a long swipe crossing ninety percent of the width leaves the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_019', 'begin');
      BoardKit.log(SUITE, 'case 1900 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 1900');
      BoardKit.log(BUNDLE + 'UiGesture_019', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeHorizontalByRatio(driver, LONG_FROM, LONG_TO, H_Y_RATIO, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 1900');
      BoardKit.log(SUITE, 'case 1900 end');
      BoardKit.log(BUNDLE + 'UiGesture_019', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_2000
     * @tc.name indexUiGestureFastSwipeKeepsPage2000
     * @tc.desc Verify a swipe at the fast speed keeps the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_020', 'begin');
      BoardKit.log(SUITE, 'case 2000 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 2000');
      BoardKit.log(BUNDLE + 'UiGesture_020', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeUp(driver, FAST_SPEED);
      await expectRunningPage(driver, 'case 2000');
      BoardKit.log(SUITE, 'case 2000 end');
      BoardKit.log(BUNDLE + 'UiGesture_020', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_2100
     * @tc.name indexUiGestureMinSpeedSwipeKeepsPage2100
     * @tc.desc Verify a swipe at the minimum accepted speed keeps the page alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_021', 'begin');
      BoardKit.log(SUITE, 'case 2100 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 2100');
      BoardKit.log(BUNDLE + 'UiGesture_021', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeRight(driver, MIN_SPEED);
      await expectRunningPage(driver, 'case 2100');
      BoardKit.log(SUITE, 'case 2100 end');
      BoardKit.log(BUNDLE + 'UiGesture_021', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIGESTURE_2200
     * @tc.name indexUiGestureClickAfterSwipes2200
     * @tc.desc Verify a tap after several swipes raises no exception and keeps the start button hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiGesture_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiGesture_022', 'begin');
      BoardKit.log(SUITE, 'case 2200 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(SETTLE_DELAY);
      let running: boolean = await startOrReset(driver, 'case 2200');
      BoardKit.log(BUNDLE + 'UiGesture_022', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      await swipeLeft(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 2200');
      await swipeDown(driver, SWIPE_SPEED);
      await expectRunningPage(driver, 'case 2200');
      let displayWidth: number = (await driver.getDisplaySize()).x;
      let displayHeight: number = (await driver.getDisplaySize()).y;
      let tapX: number = Math.round(displayWidth * V_X_RATIO);
      let tapY: number = Math.round(displayHeight * H_Y_RATIO);
      await driver.click(tapX, tapY);
      await driver.delayMs(STEP_DELAY);
      await expectRunningPage(driver, 'case 2200');
      let startPresent: boolean = await isIdPresent(driver, START_ID);
      BoardKit.log(BUNDLE + 'UiGesture_022', 'check: expect(startPresent).assertFalse();');
      expect(startPresent).assertFalse();
      BoardKit.log(SUITE, 'case 2200 end');
      BoardKit.log(BUNDLE + 'UiGesture_022', 'end');
    });
  });
}
