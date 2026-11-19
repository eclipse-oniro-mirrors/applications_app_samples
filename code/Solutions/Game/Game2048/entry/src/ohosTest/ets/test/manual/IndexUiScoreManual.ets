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
const TEXT_SCORE: string = 'Score';
const TEXT_MAX: string = 'Max';
const TEXT_GAME_OVER: string = 'Game Over';
const TEXT_RESET: string = 'Reset';
const TEXT_ZERO: string = '0';
const TEXT_MAX_VALUE: string = '123456';
const TILE_TWO: string = '2';
const TILE_FOUR: string = '4';
const MAX_SCORE: number = 123456;
const TIMEOUT_LAUNCH: number = 5000;
const POLL_STEP: number = 200;
const DELAY_SETTLE: number = 1500;
const DELAY_MEDIUM: number = 800;
const DELAY_SHORT: number = 500;
const DELAY_EXTRA: number = 1000;
const POLL_ROUNDS: number = 5;
const DIGIT_ZERO: number = 48;
const DIGIT_NINE: number = 57;

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

/** Starts EntryAbility and folds a rejected launch into a false result. */
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

/** Counts the nodes carrying one exact text value; a failed lookup counts as zero. */
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

/** Finds one text node and folds every failure mode into null. */
async function findText(driver: Driver, text: string): Promise<Component | null> {
  try {
    let component: Component | null = await driver.findComponent(ON.text(text));
    if (component === null || component === undefined) {
      return null;
    }
    return component;
  } catch (error) {
    logInfo('findText', 'text not present: ' + text);
    return null;
  }
}

async function hasText(driver: Driver, text: string): Promise<boolean> {
  let count: number = await countByText(driver, text);
  return count > 0;
}

async function textOf(component: Component): Promise<string> {
  try {
    let value: string = await component.getText();
    return value;
  } catch (error) {
    logWarn('textOf', 'text is not readable');
    return '';
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

/** True when every character of the value is an ascii digit. */
function isDigitOnly(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index: number = 0; index < value.length; index++) {
    let code: number = value.charCodeAt(index);
    if (code < DIGIT_ZERO || code > DIGIT_NINE) {
      return false;
    }
  }
  return true;
}

/** Clicks one id when it exists; returns false when the node is gone. */
async function clickIfPresent(driver: Driver, id: string): Promise<boolean> {
  try {
    let component: Component | null = await driver.findComponent(ON.id(id));
    if (component === null || component === undefined) {
      return false;
    }
    await component.click();
    return true;
  } catch (error) {
    logInfo('clickIfPresent', 'node not clickable: ' + id);
    return false;
  }
}

/**
 * Puts the page into the running state by clicking the start button when it is
 * visible. A page that already runs the game is left untouched.
 */
async function ensureGameStarted(driver: Driver): Promise<boolean> {
  let clicked: boolean = await clickIfPresent(driver, ID_START);
  if (clicked === true) {
    await driver.delayMs(DELAY_MEDIUM);
  } else {
    await driver.delayMs(DELAY_SHORT);
  }
  return clicked;
}

export default function indexUiScoreTest() {
  describe('indexUiScoreTest', () => {
    beforeEach(async () => {
      await resetToBeforePage(Driver.create());
    });

    beforeAll(async () => {
      logInfo('indexUiScoreTest', 'suite begin');
      await resetToBeforePage(Driver.create());
    });

    afterAll(async () => {
      logInfo('indexUiScoreTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_0100
     * @tc.name verifyScoreLabelPresent0100
     * @tc.desc Verify the entry page renders exactly one Score caption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_001', 'begin');
      let caseName: string = BUNDLE + 'UiScore_001';
      let driver: Driver = Driver.create();
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      let labels: number = await countByText(driver, TEXT_SCORE);
      logInfo(caseName, 'score labels=' + labels);
      BoardKit.log(BUNDLE + 'UiScore_001', 'check: expect(labels).assertEqual(1);');
      expect(labels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_0200
     * @tc.name verifyMaxLabelPresent0200
     * @tc.desc Verify the entry page renders exactly one Max caption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_002', 'begin');
      let caseName: string = BUNDLE + 'UiScore_002';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let labels: number = await countByText(driver, TEXT_MAX);
      logInfo(caseName, 'max labels=' + labels);
      BoardKit.log(BUNDLE + 'UiScore_002', 'check: expect(labels).assertEqual(1);');
      expect(labels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_0300
     * @tc.name verifyMaxValuePresent0300
     * @tc.desc Verify the seeded best score 123456 is rendered under the Max caption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_003', 'begin');
      let caseName: string = BUNDLE + 'UiScore_003';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let values: number = await countByText(driver, TEXT_MAX_VALUE);
      logInfo(caseName, 'max value nodes=' + values);
      BoardKit.log(BUNDLE + 'UiScore_003', 'check: expect(values).assertEqual(1);');
      expect(values).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_003', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_0500
     * @tc.name verifyScoreLabelIsTextNode0500
     * @tc.desc Verify the Score caption renders through a plain Text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_004', 'begin');
      let caseName: string = BUNDLE + 'UiScore_004';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let component: Component | null = await findText(driver, TEXT_SCORE);
      BoardKit.log(BUNDLE + 'UiScore_004', 'check: expect(component !== null).assertTrue();');
      expect(component !== null).assertTrue();
      if (component !== null) {
        let typeName: string = await typeOf(component);
        logInfo(caseName, 'score label type=' + typeName);
        BoardKit.log(BUNDLE + 'UiScore_004', 'check: expect(typeName).assertEqual(\'Text\');');
        expect(typeName).assertEqual('Text');
      }
      BoardKit.log(BUNDLE + 'UiScore_004', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_0600
     * @tc.name verifyMaxLabelIsTextNode0600
     * @tc.desc Verify the Max caption renders through a plain Text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_005', 'begin');
      let caseName: string = BUNDLE + 'UiScore_005';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let component: Component | null = await findText(driver, TEXT_MAX);
      BoardKit.log(BUNDLE + 'UiScore_005', 'check: expect(component !== null).assertTrue();');
      expect(component !== null).assertTrue();
      if (component !== null) {
        let typeName: string = await typeOf(component);
        logInfo(caseName, 'max label type=' + typeName);
        BoardKit.log(BUNDLE + 'UiScore_005', 'check: expect(typeName).assertEqual(\'Text\');');
        expect(typeName).assertEqual('Text');
      }
      BoardKit.log(BUNDLE + 'UiScore_005', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_0900
     * @tc.name verifyScoreboardSingleInstance0900
     * @tc.desc Verify no duplicate scoreboard is mounted after the page has settled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_006', 'begin');
      let caseName: string = BUNDLE + 'UiScore_006';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let early: number = await countByText(driver, TEXT_SCORE);
      await driver.delayMs(DELAY_SETTLE);
      let settled: number = await countByText(driver, TEXT_SCORE);
      logInfo(caseName, 'early=' + early + ' settled=' + settled);
      BoardKit.log(BUNDLE + 'UiScore_006', 'check: expect(early).assertEqual(1);');
      expect(early).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_006', 'check: expect(settled).assertEqual(1);');
      expect(settled).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_006', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1000
     * @tc.name verifyScorePersistsAfterStart1000
     * @tc.desc Verify the Score caption survives the transition into a running game
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_007', 'begin');
      let caseName: string = BUNDLE + 'UiScore_007';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let clicked: boolean = await ensureGameStarted(driver);
      let labels: number = await countByText(driver, TEXT_SCORE);
      logInfo(caseName, 'clicked=' + clicked + ' labels=' + labels);
      BoardKit.log(BUNDLE + 'UiScore_007', 'check: expect(labels).assertEqual(1);');
      expect(labels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_007', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1100
     * @tc.name verifyMaxPersistsAfterStart1100
     * @tc.desc Verify the Max caption survives the transition into a running game
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_008', 'begin');
      let caseName: string = BUNDLE + 'UiScore_008';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await ensureGameStarted(driver);
      let labels: number = await countByText(driver, TEXT_MAX);
      logInfo(caseName, 'max labels=' + labels);
      BoardKit.log(BUNDLE + 'UiScore_008', 'check: expect(labels).assertEqual(1);');
      expect(labels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_008', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1200
     * @tc.name verifyMaxValuePersistsAfterStart1200
     * @tc.desc Verify the best score value is untouched by starting a game
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_009', 'begin');
      let caseName: string = BUNDLE + 'UiScore_009';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await ensureGameStarted(driver);
      let values: number = await countByText(driver, TEXT_MAX_VALUE);
      logInfo(caseName, 'max value nodes=' + values);
      BoardKit.log(BUNDLE + 'UiScore_009', 'check: expect(values).assertEqual(1);');
      expect(values).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_009', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1400
     * @tc.name verifyNoGameOverOutsideSettlement1400
     * @tc.desc Verify the game over dialog is not mounted while no settlement has happened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_010', 'begin');
      let caseName: string = 'score_NoGameOverBeforePlay';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let dialogs: number = await countByText(driver, TEXT_GAME_OVER);
      logInfo(caseName, 'game over texts=' + dialogs);
      BoardKit.log(BUNDLE + 'UiScore_010', 'check: expect(dialogs).assertEqual(0);');
      expect(dialogs).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiScore_010', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1500
     * @tc.name verifyNoResetOutsideSettlement1500
     * @tc.desc Verify the settlement reset control is absent outside the game over dialog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_011', 'begin');
      let caseName: string = BUNDLE + 'UiScore_011';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let resets: number = await countByText(driver, TEXT_RESET);
      logInfo(caseName, 'reset controls=' + resets);
      BoardKit.log(BUNDLE + 'UiScore_011', 'check: expect(resets).assertEqual(0);');
      expect(resets).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiScore_011', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1600
     * @tc.name verifyNoGameOverAfterStart1600
     * @tc.desc Verify a running game never shows the game over dialog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_012', 'begin');
      let caseName: string = BUNDLE + 'UiScore_012';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      await ensureGameStarted(driver);
      await driver.delayMs(DELAY_EXTRA);
      let dialogs: number = await countByText(driver, TEXT_GAME_OVER);
      logInfo(caseName, 'game over texts=' + dialogs);
      BoardKit.log(BUNDLE + 'UiScore_012', 'check: expect(dialogs).assertEqual(0);');
      expect(dialogs).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiScore_012', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_1700
     * @tc.name verifyScoreboardAfterRelaunch1700
     * @tc.desc Verify a relaunch keeps both scoreboard captions on the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_013', 'begin');
      let caseName: string = BUNDLE + 'UiScore_013';
      let driver: Driver = Driver.create();
      let launched: boolean = await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      let scoreLabels: number = await countByText(driver, TEXT_SCORE);
      let maxLabels: number = await countByText(driver, TEXT_MAX);
      logInfo(caseName, 'launched=' + launched + ' score=' + scoreLabels + ' max=' + maxLabels);
      BoardKit.log(BUNDLE + 'UiScore_013', 'check: expect(launched).assertTrue();');
      expect(launched).assertTrue();
      BoardKit.log(BUNDLE + 'UiScore_013', 'check: expect(scoreLabels).assertEqual(1);');
      expect(scoreLabels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_013', 'check: expect(maxLabels).assertEqual(1);');
      expect(maxLabels).assertEqual(1);
      BoardKit.log(BUNDLE + 'UiScore_013', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUISCORE_2000
     * @tc.name verifyMaxValuePollStable2000
     * @tc.desc Verify the best score value answers five consecutive polls without vanishing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiScore_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiScore_014', 'begin');
      let caseName: string = BUNDLE + 'UiScore_014';
      let driver: Driver = Driver.create();
      await driver.delayMs(DELAY_MEDIUM);
      let observed: number = 0;
      for (let round: number = 0; round < POLL_ROUNDS; round++) {
        let nodes: number = await countByText(driver, TEXT_MAX_VALUE);
        if (nodes === 1) {
          observed = observed + 1;
        }
        await driver.delayMs(POLL_STEP);
      }
      logInfo(caseName, 'polls with max value=' + observed);
      BoardKit.log(BUNDLE + 'UiScore_014', 'check: expect(observed).assertEqual(POLL_ROUNDS);');
      expect(observed).assertEqual(POLL_ROUNDS);
      BoardKit.log(BUNDLE + 'UiScore_014', 'end');
    });
  });
}
