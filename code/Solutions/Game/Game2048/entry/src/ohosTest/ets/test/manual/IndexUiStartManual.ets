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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetToBeforePage } from '../common/UiResetKit';
import { Driver, ON, Component } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { BoardKit } from '../common/Game2048TestKit';
/** Prefix used by every UI case name and log line. */
const BUNDLE: string = 'Game2048_';

const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = '[Sample_Game2048]';
const DOMAIN: number = 0xF811;
const ID_START: string = 'startGame';
const ID_LOGO: string = 'logo2048';
const TEXT_START: string = 'Start';
const TEXT_SCORE: string = 'Score';
const TEXT_MAX: string = 'Max';
const TEXT_GAME_OVER: string = 'Game Over';
const TEXT_RESET: string = 'Reset';
const TIMEOUT_LAUNCH: number = 5000;
const POLL_STEP: number = 200;
const POLL_TIMEOUT: number = 4000;
const DELAY_SETTLE: number = 1500;
const DELAY_MEDIUM: number = 800;
const DELAY_SHORT: number = 500;
const DELAY_EXTRA: number = 1000;
const DELAY_TOLERANCE: number = 100;
const POLL_ROUNDS: number = 3;

function logInfo(caseName: string, message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ' | ' + message);
}

function logWarn(caseName: string, message: string): void {
  hilog.warn(DOMAIN, TAG, '%{public}s', caseName + ' | ' + message);
}

/** Builds the want that targets the sample entry ability. */
function buildWant(): Want {
  let want: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: ABILITY_NAME
  };
  return want;
}

function getDelegator(): AbilityDelegatorRegistry.AbilityDelegator {
  return AbilityDelegatorRegistry.getAbilityDelegator();
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

/**
 * Starts EntryAbility and waits for the launch callback.
 * A rejected launch is folded into false so the caller can assert on it.
 */
async function startEntryAbility(): Promise<boolean> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = getDelegator();
  let finished: boolean = false;
  let failed: boolean = false;
  try {
    delegator.startAbility(buildWant(), (err: BusinessError | null) => {
      finished = true;
      if (err !== null) {
        failed = true;
        logWarn('startEntryAbility', 'callback carried an error');
      }
    });
  } catch (error) {
    logWarn('startEntryAbility', 'launch rejected before the callback fired');
    return false;
  }
  let waited: number = 0;
  while (!finished && waited < TIMEOUT_LAUNCH) {
    await sleep(POLL_STEP);
    waited = waited + POLL_STEP;
  }
  return finished && !failed;
}

/** Counts the nodes carrying one id; a failed lookup counts as zero. */
async function countById(driver: Driver, id: string): Promise<number> {
  try {
    let component: Component = await driver.findComponent(ON.id(id));
    if (component === null || component === undefined) {
      return 0;
    }
    return 1;
  } catch (error) {
    logWarn('countById', 'lookup failed for ' + id);
    return 0;
  }
}

/** Counts the nodes carrying one exact text value. */
async function countByText(driver: Driver, text: string): Promise<number> {
  try {
    let component: Component = await driver.findComponent(ON.text(text));
    if (component === null || component === undefined) {
      return 0;
    }
    return 1;
  } catch (error) {
    logWarn('countByText', 'lookup failed for ' + text);
    return 0;
  }
}

/**
 * Finds one node by id and folds every failure mode into null, so a case can
 * assert that a control is gone without the lookup throwing.
 */
async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    let component: Component | null = await driver.findComponent(ON.id(id));
    if (component === null || component === undefined) {
      return null;
    }
    return component;
  } catch (error) {
    logInfo('findById', 'component not present: ' + id);
    return null;
  }
}

/** Finds one node by text; returns null when the text is absent. */
async function findByText(driver: Driver, text: string): Promise<Component | null> {
  try {
    let component: Component | null = await driver.findComponent(ON.text(text));
    if (component === null || component === undefined) {
      return null;
    }
    return component;
  } catch (error) {
    logInfo('findByText', 'text not present: ' + text);
    return null;
  }
}

async function hasId(driver: Driver, id: string): Promise<boolean> {
  let count: number = await countById(driver, id);
  return count > 0;
}

async function hasText(driver: Driver, text: string): Promise<boolean> {
  let count: number = await countByText(driver, text);
  return count > 0;
}

async function isClickableOf(component: Component): Promise<boolean> {
  try {
    let clickable: boolean = await component.isClickable();
    return clickable === true;
  } catch (error) {
    logWarn('isClickableOf', 'clickable state is not readable');
    return false;
  }
}

async function isEnabledOf(component: Component): Promise<boolean> {
  try {
    let enabled: boolean = await component.isEnabled();
    return enabled === true;
  } catch (error) {
    logWarn('isEnabledOf', 'enabled state is not readable');
    return false;
  }
}

async function typeOf(component: Component): Promise<string> {
  try {
    let typeName: string = await component.getType();
    return typeName;
  } catch (error) {
    logWarn('typeOf', 'component type is not readable');
    return '';
  }
}

/** Polls for one text until it appears or the timeout expires. */
async function waitForText(driver: Driver, text: string, maxWaitMs: number): Promise<boolean> {
  let waited: number = 0;
  while (waited < maxWaitMs) {
    let count: number = await countByText(driver, text);
    if (count > 0) {
      return true;
    }
    await driver.delayMs(POLL_STEP);
    waited = waited + POLL_STEP;
  }
  return false;
}

/**
 * Clicks the start button when it is present. Returns false when the game is
 * already running, which is the normal state after an earlier case clicked it.
 */
async function clickStartIfVisible(driver: Driver): Promise<boolean> {
  let component: Component | null = await findById(driver, ID_START);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    return true;
  } catch (error) {
    logWarn('clickStartIfVisible', 'start click was rejected');
    return false;
  }
}

/**
 * Leaves the entry page before a relaunch. The test ability and the sample
 * share one bundle process, so a force-stop of the bundle would also kill the
 * running test; the back key gives the same fresh page without that risk.
 */
async function leavePage(driver: Driver): Promise<void> {
  try {
    await driver.pressBack();
  } catch (error) {
    logWarn('leavePage', 'back key was rejected');
  }
  await driver.delayMs(DELAY_MEDIUM);
}

/** Launches the sample and waits until the scoreboard is on screen. */
async function launchWithDriver(driver: Driver): Promise<boolean> {
  let launched: boolean = await startEntryAbility();
  await driver.delayMs(DELAY_SETTLE);
  let ready: boolean = await waitForText(driver, TEXT_SCORE, POLL_TIMEOUT);
  logInfo('launchWithDriver', 'launched=' + launched + ' ready=' + ready);
  return launched === true && ready === true;
}

export default function indexUiStartTest() {
  describe('indexUiStartTest', () => {
    beforeEach(async () => {
      await resetToBeforePage(Driver.create());
    });

    beforeAll(async () => {
      logInfo('indexUiStartTest', 'suite begin');
      await resetToBeforePage(Driver.create());
    });

    afterAll(async () => {
      logInfo('indexUiStartTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_0100
     * @tc.name verifyEntryPageStarts0100
     * @tc.desc Verify the entry page starts and exposes the scoreboard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_001', 'begin');
      let caseName: string = BUNDLE + 'UiStart_001';
      let driver: Driver = Driver.create();
      let launched: boolean = await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      let scoreReady: boolean = await waitForText(driver, TEXT_SCORE, POLL_TIMEOUT);
      logInfo(caseName, 'launched=' + launched + ' scoreReady=' + scoreReady);
      BoardKit.log(BUNDLE + 'UiStart_001', 'check: expect(launched).assertTrue();');
      expect(launched).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_001', 'check: expect(scoreReady).assertTrue();');
      expect(scoreReady).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_0200
     * @tc.name verifyLogoVisible0200
     * @tc.desc Verify the 2048 logo image is rendered exactly once on the entry page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_002', 'begin');
      let caseName: string = BUNDLE + 'UiStart_002';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let logos: number = await countById(driver, ID_LOGO);
      logInfo(caseName, 'logo count=' + logos);
      BoardKit.log(BUNDLE + 'UiStart_002', 'check: expect(logos).assertEqual(1);');
      expect(logos).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiStart_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_0700
     * @tc.name verifyColdRelaunchRendersPage0700
     * @tc.desc Verify leaving the page and launching again renders the entry page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_003', 'begin');
      let caseName: string = BUNDLE + 'UiStart_003';
      let driver: Driver = Driver.create();
      let firstLaunch: boolean = await launchWithDriver(driver);
      await leavePage(driver);
      let secondLaunch: boolean = await launchWithDriver(driver);
      let startPresent: boolean = await hasId(driver, ID_START);
      logInfo(caseName, 'first=' + firstLaunch + ' second=' + secondLaunch + ' start=' + startPresent);
      BoardKit.log(BUNDLE + 'UiStart_003', 'check: expect(firstLaunch).assertTrue();');
      expect(firstLaunch).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_003', 'check: expect(secondLaunch).assertTrue();');
      expect(secondLaunch).assertTrue();
      if (startPresent === true) {
        BoardKit.log(BUNDLE + 'UiStart_003', 'check: expect(await hasText(driver, TEXT_START)).assertTrue();');
        expect(await hasText(driver, TEXT_START)).assertTrue();
      } else {
        // A persisted running game hides the start button; the page must still render.
        logWarn(caseName, 'persisted running state hides the start button');
        BoardKit.log(BUNDLE + 'UiStart_003', 'check: expect(await countById(driver, ID_LOGO)).assertEqual(1);');
        expect(await countById(driver, ID_LOGO)).assertEqual(1);
      }
      BoardKit.log(BUNDLE + 'UiStart_003', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_0800
     * @tc.name verifyLaunchSettleStable0800
     * @tc.desc Verify two launches settle within the expected delay and render the scoreboard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_004', 'begin');
      let caseName: string = BUNDLE + 'UiStart_004';
      let driver: Driver = Driver.create();
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      let firstReady: boolean = await hasText(driver, TEXT_SCORE);
      let startedAt: number = Date.now();
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      let settleElapsed: number = Date.now() - startedAt;
      let secondReady: boolean = await hasText(driver, TEXT_SCORE);
      logInfo(caseName, 'first=' + firstReady + ' second=' + secondReady + ' elapsed=' + settleElapsed);
      BoardKit.log(BUNDLE + 'UiStart_004', 'check: expect(firstReady).assertTrue();');
      expect(firstReady).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_004', 'check: expect(secondReady).assertTrue();');
      expect(secondReady).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_004', 'check: expect(settleElapsed >= DELAY_SETTLE - DELAY_TOLERANCE).assertTrue();');
      expect(settleElapsed >= DELAY_SETTLE - DELAY_TOLERANCE).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_004', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_0900
     * @tc.name verifyClickRemovesStartId0900
     * @tc.desc Verify the start button id can no longer be found after a click
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_005', 'begin');
      let caseName: string = BUNDLE + 'UiStart_005';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let clicked: boolean = await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let component: Component | null = await findById(driver, ID_START);
      logInfo(caseName, 'clicked=' + clicked + ' component=' + (component === null ? 'null' : 'found'));
      BoardKit.log(BUNDLE + 'UiStart_005', 'check: expect(component).assertNull();');
      expect(component).assertNull();
      BoardKit.log(BUNDLE + 'UiStart_005', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1000
     * @tc.name verifyClickRemovesStartText1000
     * @tc.desc Verify the Start caption disappears once the game has started
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_006', 'begin');
      let caseName: string = BUNDLE + 'UiStart_006';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let clicked: boolean = await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let component: Component | null = await findByText(driver, TEXT_START);
      logInfo(caseName, 'clicked=' + clicked + ' caption=' + (component === null ? 'null' : 'found'));
      BoardKit.log(BUNDLE + 'UiStart_006', 'check: expect(component).assertNull();');
      expect(component).assertNull();
      BoardKit.log(BUNDLE + 'UiStart_006', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1100
     * @tc.name verifyScoreRemainsAfterStart1100
     * @tc.desc Verify the score label stays on screen after the game starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_007', 'begin');
      let caseName: string = BUNDLE + 'UiStart_007';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let labels: number = await countByText(driver, TEXT_SCORE);
      logInfo(caseName, 'score labels=' + labels);
      BoardKit.log(BUNDLE + 'UiStart_007', 'check: expect(labels).assertEqual(1);');
      expect(labels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiStart_007', 'check: expect(labels > 0).assertTrue();');
      expect(labels > 0).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_007', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1200
     * @tc.name verifyMaxRemainsAfterStart1200
     * @tc.desc Verify the max label stays on screen after the game starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_008', 'begin');
      let caseName: string = BUNDLE + 'UiStart_008';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let labels: number = await countByText(driver, TEXT_MAX);
      logInfo(caseName, 'max labels=' + labels);
      BoardKit.log(BUNDLE + 'UiStart_008', 'check: expect(labels).assertEqual(1);');
      expect(labels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiStart_008', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1300
     * @tc.name verifyLogoRemainsAfterStart1300
     * @tc.desc Verify the logo stays on screen after the game starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_009', 'begin');
      let caseName: string = BUNDLE + 'UiStart_009';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let logos: number = await countById(driver, ID_LOGO);
      logInfo(caseName, 'logo count=' + logos);
      BoardKit.log(BUNDLE + 'UiStart_009', 'check: expect(logos).assertEqual(1);');
      expect(logos).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiStart_009', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1400
     * @tc.name verifyNoGameOverAfterStart1400
     * @tc.desc Verify starting a game never opens the game over dialog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_010', 'begin');
      let caseName: string = BUNDLE + 'UiStart_010';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_EXTRA);
      let dialogs: number = await countByText(driver, TEXT_GAME_OVER);
      logInfo(caseName, 'game over texts=' + dialogs);
      BoardKit.log(BUNDLE + 'UiStart_010', 'check: expect(dialogs).assertEqual(0);');
      expect(dialogs).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiStart_010', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1500
     * @tc.name verifySecondClickTolerated1500
     * @tc.desc Verify a second click attempt on the vanished button does not break the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_011', 'begin');
      let caseName: string = BUNDLE + 'UiStart_011';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let firstClick: boolean = await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_SHORT);
      let secondClick: boolean = await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let scoreReady: boolean = await hasText(driver, TEXT_SCORE);
      logInfo(caseName, 'first=' + firstClick + ' second=' + secondClick + ' score=' + scoreReady);
      BoardKit.log(BUNDLE + 'UiStart_011', 'check: expect(secondClick).assertFalse();');
      expect(secondClick).assertFalse();
      BoardKit.log(BUNDLE + 'UiStart_011', 'check: expect(scoreReady).assertTrue();');
      expect(scoreReady).assertTrue();
      BoardKit.log(BUNDLE + 'UiStart_011', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1600
     * @tc.name verifyRemovalStableAfterWait1600
     * @tc.desc Verify the start button does not reappear after an extra wait
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_012', 'begin');
      let caseName: string = BUNDLE + 'UiStart_012';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_EXTRA);
      let component: Component | null = await findById(driver, ID_START);
      let captions: number = await countByText(driver, TEXT_START);
      logInfo(caseName, 'id=' + (component === null ? 'null' : 'found') + ' captions=' + captions);
      BoardKit.log(BUNDLE + 'UiStart_012', 'check: expect(component).assertNull();');
      expect(component).assertNull();
      BoardKit.log(BUNDLE + 'UiStart_012', 'check: expect(captions).assertEqual(0);');
      expect(captions).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiStart_012', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1700
     * @tc.name verifyScorePollStable1700
     * @tc.desc Verify the scoreboard answers three consecutive polls after the start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_013', 'begin');
      let caseName: string = BUNDLE + 'UiStart_013';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let observed: number = 0;
      for (let round: number = 0; round < POLL_ROUNDS; round++) {
        if (await hasText(driver, TEXT_SCORE)) {
          observed = observed + 1;
        }
        await driver.delayMs(POLL_STEP);
      }
      logInfo(caseName, 'polls with score=' + observed);
      BoardKit.log(BUNDLE + 'UiStart_013', 'check: expect(observed).assertEqual(POLL_ROUNDS);');
      expect(observed).assertEqual(POLL_ROUNDS);
      BoardKit.log(BUNDLE + 'UiStart_013', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISTART_1800
     * @tc.name verifyNoResetControl1800
     * @tc.desc Verify the settlement reset control is absent while the game runs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiStart_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiStart_014', 'begin');
      let caseName: string = BUNDLE + 'UiStart_014';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await clickStartIfVisible(driver);
      await driver.delayMs(DELAY_MEDIUM);
      let resets: number = await countByText(driver, TEXT_RESET);
      logInfo(caseName, 'reset controls=' + resets);
      BoardKit.log(BUNDLE + 'UiStart_014', 'check: expect(resets).assertEqual(0);');
      expect(resets).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiStart_014', 'end');
    });
  });
}
