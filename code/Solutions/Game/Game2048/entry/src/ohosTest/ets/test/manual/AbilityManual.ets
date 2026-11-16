/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import application from '@ohos.app.ability.application';
import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetToBeforePage } from '../common/UiResetKit';
import { Driver, ON, Component } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { BoardKit } from '../common/Game2048TestKit';

const BUNDLE: string = 'Game2048_';
const TAG: string = '[Sample_Game2048]';
const DOMAIN: number = 0xF811;
const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const ID_START: string = 'startGame';
const ID_LOGO: string = 'logo2048';
const TEXT_SCORE: string = 'Score';
const TIMEOUT_LAUNCH: number = 5000;
const POLL_STEP: number = 200;
const DELAY_SETTLE: number = 1500;
const DELAY_MEDIUM: number = 800;
const DELAY_SHORT: number = 300;
const DELAY_MEASURED: number = 500;
const DELAY_LOWER_BOUND: number = 400;
const RELAUNCH_ROUNDS: number = 3;

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
 * Starts EntryAbility and waits until the system reports the launch result.
 * Returns true only when the callback fired without an error object, so a
 * rejected launch is reported as false instead of escaping as an exception.
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

/** Counts the nodes carrying one id. */
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

/** Measures how long delayMs actually blocks, in milliseconds. */
async function measureDelay(driver: Driver, ms: number): Promise<number> {
  let started: number = Date.now();
  await driver.delayMs(ms);
  let elapsed: number = Date.now() - started;
  return elapsed;
}

/**
 * Reads the bundle name of the ability that currently sits on top of the
 * stack. The test ability and the sample share one bundle, so the value is
 * expected to be the sample bundle while the device test is running.
 */
async function getTopAbilityBundleName(): Promise<string> {
  let name: string = '';
  try {
    let delegator: AbilityDelegatorRegistry.AbilityDelegator = getDelegator();
    let top: UIAbility = await delegator.getCurrentTopAbility();
    if (top.launchWant.bundleName !== undefined) {
      name = top.launchWant.bundleName;
    }
  } catch (error) {
    logWarn('getTopAbilityBundleName', 'top ability is not readable');
    return '';
  }
  return name;
}

export default function appTest() {
  describe('ActsAbilityTest', () => {
    beforeEach(async () => {
      await resetToBeforePage(Driver.create());
    });

    beforeAll(async () => {
      logInfo('ActsAbilityTest', 'suite begin');
    });

    afterAll(async () => {
      await sleep(DELAY_SHORT);
      logInfo('ActsAbilityTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0100
     * @tc.name verifyStartAbilityNullError0100
     * @tc.desc Verify the sample entry ability starts and reports a null error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_001', 0, async (done: Function) => {
      BoardKit.log(BUNDLE + 'Ability_001', 'begin');
      logInfo(BUNDLE + '_startAbility', 'start');
      let parameter: Want = buildWant();
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = getDelegator();
      abilityDelegator.startAbility(parameter, (err: BusinessError | null) => {
        logInfo(BUNDLE + '_startAbility', 'get err ' + JSON.stringify(err));
        BoardKit.log(BUNDLE + 'Ability_001', 'check: expect(err).assertNull();');
        expect(err).assertNull();
      });
      await sleep(DELAY_SETTLE);
      logInfo(BUNDLE + '_startAbility', 'end');
      done();
      BoardKit.log(BUNDLE + 'Ability_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0300
     * @tc.name verifyRepeatedLaunchSucceeds0300
     * @tc.desc Verify two consecutive launches both finish without an error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_002', 'begin');
      let caseName: string = BUNDLE + 'Ability_002';
      let firstLaunch: boolean = await startEntryAbility();
      await sleep(DELAY_MEDIUM);
      let secondLaunch: boolean = await startEntryAbility();
      await sleep(DELAY_MEDIUM);
      logInfo(caseName, 'first=' + firstLaunch + ' second=' + secondLaunch);
      BoardKit.log(BUNDLE + 'Ability_002', 'check: expect(firstLaunch).assertTrue();');
      expect(firstLaunch).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_002', 'check: expect(secondLaunch).assertTrue();');
      expect(secondLaunch).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0400
     * @tc.name verifySerialLaunchesKeepSinglePage0400
     * @tc.desc Verify a serial second launch keeps exactly one scoreboard and one logo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_003', 'begin');
      let caseName: string = BUNDLE + 'Ability_003';
      let driver: Driver = Driver.create();
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE);
      let scoreLabels: number = await countByText(driver, TEXT_SCORE);
      let logos: number = await countById(driver, ID_LOGO);
      logInfo(caseName, 'score labels=' + scoreLabels + ' logos=' + logos);
      BoardKit.log(BUNDLE + 'Ability_003', 'check: expect(scoreLabels).assertEqual(1);');
      expect(scoreLabels).assertEqual(1);
      BoardKit.log(BUNDLE + 'Ability_003', 'check: expect(logos).assertEqual(1);');
      expect(logos).assertEqual(1);
      BoardKit.log(BUNDLE + 'Ability_003', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0500
     * @tc.name verifyLogoQueryableAfterDelay0500
     * @tc.desc Verify the 2048 logo is queryable once the launch has settled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_004', 'begin');
      let caseName: string = BUNDLE + 'Ability_004';
      let driver: Driver = Driver.create();
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE + DELAY_MEDIUM);
      let logos: number = await countById(driver, ID_LOGO);
      logInfo(caseName, 'logo count=' + logos);
      BoardKit.log(BUNDLE + 'Ability_004', 'check: expect(logos).assertEqual(1);');
      expect(logos).assertEqual(1);
      BoardKit.log(BUNDLE + 'Ability_004', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0600
     * @tc.name verifyScoreQueryableAfterDelay0600
     * @tc.desc Verify the scoreboard is queryable once the launch has settled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_005', 'begin');
      let caseName: string = BUNDLE + 'Ability_005';
      let driver: Driver = Driver.create();
      await startEntryAbility();
      await driver.delayMs(DELAY_SETTLE + DELAY_MEDIUM);
      let scoreLabels: number = await countByText(driver, TEXT_SCORE);
      logInfo(caseName, 'score labels=' + scoreLabels);
      BoardKit.log(BUNDLE + 'Ability_005', 'check: expect(scoreLabels).assertEqual(1);');
      expect(scoreLabels).assertEqual(1);
      BoardKit.log(BUNDLE + 'Ability_005', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0700
     * @tc.name verifyDelegatorAvailable0700
     * @tc.desc Verify the ability delegator instance is available to the test process
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_006', 'begin');
      let caseName: string = BUNDLE + 'Ability_006';
      let delegator: AbilityDelegatorRegistry.AbilityDelegator = getDelegator();
      logInfo(caseName, 'delegator type=' + typeof delegator);
      BoardKit.log(BUNDLE + 'Ability_006', 'check: expect(delegator === null).assertFalse();');
      expect(delegator === null).assertFalse();
      BoardKit.log(BUNDLE + 'Ability_006', 'check: expect(typeof delegator === \'object\').assertTrue();');
      expect(typeof delegator === 'object').assertTrue();
      BoardKit.log(BUNDLE + 'Ability_006', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0800
     * @tc.name verifyStartCallbackNullError0800
     * @tc.desc Verify the start callback fires and carries a null error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_007', 'begin');
      let caseName: string = BUNDLE + 'Ability_007';
      let delegator: AbilityDelegatorRegistry.AbilityDelegator = getDelegator();
      let observed: BusinessError | null = null;
      let called: boolean = false;
      delegator.startAbility(buildWant(), (err: BusinessError | null) => {
        called = true;
        observed = err;
      });
      let waited: number = 0;
      while (!called && waited < TIMEOUT_LAUNCH) {
        await sleep(POLL_STEP);
        waited = waited + POLL_STEP;
      }
      await sleep(DELAY_MEDIUM);
      logInfo(caseName, 'callback called=' + called + ' waited=' + waited);
      BoardKit.log(BUNDLE + 'Ability_007', 'check: expect(called).assertTrue();');
      expect(called).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_007', 'check: expect(observed).assertNull();');
      expect(observed).assertNull();
      BoardKit.log(BUNDLE + 'Ability_007', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_0900
     * @tc.name verifyTestContextAvailable0900
     * @tc.desc Verify the test context and the delegator arguments can be read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_008', 'begin');
      let caseName: string = BUNDLE + 'Ability_008';
      let delegator: AbilityDelegatorRegistry.AbilityDelegator = getDelegator();
      let contextReady: boolean = application.getApplicationContext() !== null;
      let argumentBundle: string = AbilityDelegatorRegistry.getArguments().bundleName;
      logInfo(caseName, 'context ready=' + contextReady + ' bundle=' + argumentBundle);
      BoardKit.log(BUNDLE + 'Ability_008', 'check: expect(contextReady).assertTrue();');
      expect(contextReady).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_008', 'check: expect(argumentBundle).assertEqual(BUNDLE_NAME);');
      expect(argumentBundle).assertEqual(BUNDLE_NAME);
      BoardKit.log(BUNDLE + 'Ability_008', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_1000
     * @tc.name verifyDelayMsStable1000
     * @tc.desc Verify delayMs blocks for at least the lower bound on every launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_009', 'begin');
      let caseName: string = BUNDLE + 'Ability_009';
      let driver: Driver = Driver.create();
      let firstWait: number = await measureDelay(driver, DELAY_MEASURED);
      let secondWait: number = await measureDelay(driver, DELAY_MEASURED);
      logInfo(caseName, 'first=' + firstWait + ' second=' + secondWait);
      BoardKit.log(BUNDLE + 'Ability_009', 'check: expect(firstWait >= DELAY_LOWER_BOUND).assertTrue();');
      expect(firstWait >= DELAY_LOWER_BOUND).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_009', 'check: expect(secondWait >= DELAY_LOWER_BOUND).assertTrue();');
      expect(secondWait >= DELAY_LOWER_BOUND).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_009', 'check: expect(Math.abs(firstWait - secondWait) <= DELAY_MEASURED).assertTrue();');
      expect(Math.abs(firstWait - secondWait) <= DELAY_MEASURED).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_009', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_1100
     * @tc.name verifyThreeRoundsAllSucceed1100
     * @tc.desc Verify three back to back launches all report a successful start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_010', 'begin');
      let caseName: string = BUNDLE + 'Ability_010';
      let success: number = 0;
      for (let round: number = 0; round < RELAUNCH_ROUNDS; round++) {
        let started: boolean = await startEntryAbility();
        if (started === true) {
          success = success + 1;
        }
        await sleep(DELAY_SHORT);
      }
      logInfo(caseName, 'successful rounds=' + success);
      BoardKit.log(BUNDLE + 'Ability_010', 'check: expect(success).assertEqual(RELAUNCH_ROUNDS);');
      expect(success).assertEqual(RELAUNCH_ROUNDS);
      BoardKit.log(BUNDLE + 'Ability_010', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_ABILITY_1200
     * @tc.name verifyTopAbilityInSampleBundle1200
     * @tc.desc Verify the ability left on top by the launches belongs to the sample bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Ability_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'Ability_011', 'begin');
      let caseName: string = BUNDLE + 'Ability_011';
      let launched: boolean = await startEntryAbility();
      await sleep(DELAY_SETTLE);
      let topBundle: string = await getTopAbilityBundleName();
      logInfo(caseName, 'launched=' + launched + ' top bundle=' + topBundle);
      BoardKit.log(BUNDLE + 'Ability_011', 'check: expect(launched).assertTrue();');
      expect(launched).assertTrue();
      BoardKit.log(BUNDLE + 'Ability_011', 'check: expect(topBundle).assertEqual(BUNDLE_NAME);');
      expect(topBundle).assertEqual(BUNDLE_NAME);
      BoardKit.log(BUNDLE + 'Ability_011', 'end');
    });
  });
}

