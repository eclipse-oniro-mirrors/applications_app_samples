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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component, Driver, ON } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF813;
const TAG: string = 'WindowStartIconAdUiTest';

const BUNDLE: string = 'com.samples.windowstarticon';
const ABILITY: string = 'EntryAbility';
const COUNTDOWN_TOTAL_MS: number = 6000;
const AUTO_REDIRECT_WAIT_MS: number = 12000;

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

/**
 * Checks component existence without leaking findComponent failures.
 */
async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

/**
 * Clicks a component by testable id and waits for the render settle time.
 */
async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

/**
 * On-screen bounds of a component in px.
 */
interface ComponentBox {
  left: number;
  top: number;
  right: number;
  bottom: number;
}

/**
 * Reads the on-screen bounds of a component by id.
 */
async function readBounds(driver: Driver, id: string): Promise<ComponentBox> {
  const component: Component = await driver.findComponent(ON.id(id));
  const rect = await component.getBounds();
  const box: ComponentBox = {
    left: rect.left,
    top: rect.top,
    right: rect.right,
    bottom: rect.bottom
  };
  return box;
}

/**
 * Polls until a component appears or the timeout expires.
 */
async function waitFor(driver: Driver, id: string, timeoutMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await exists(driver, id)) {
      return true;
    }
    await sleep(300);
  }
  return await exists(driver, id);
}

// Force-stopping the bundle also kills the test runner in the same process.
async function restartEntryAbility(): Promise<boolean> {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(500);
  const driver: Driver = Driver.create();
  if (await exists(driver, 'skipButton')) {
    expect(await clickId(driver, 'skipButton')).assertTrue();
  }
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  expect(ability.context.abilityInfo.name).assertEqual(ABILITY);
  await ability.context.terminateSelf();
  await sleep(500);
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await exists(driver, 'skipButton');
}

export default function startupAdUiTest(): void {
  describe('StartupAdUiTest', () => {
    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1001
     * @tc.name      testWindowStartIconAdUi1001
     * @tc.desc      Verify an entry ability restart exposes every core advertising page component.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1001 begin');
      const actual21: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual21}`);
      expect(actual21).assertTrue();
      const driver: Driver = Driver.create();
      const actual1: boolean = await exists(driver, 'advertisingRoot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'advertisingRoot')=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists(driver, 'skipButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'skipButton')=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'countdownText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'countdownText')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'advertisingImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'advertisingImage')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'advertisingTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'advertisingTitle')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'advertisingDescription');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'advertisingDescription')=${actual6}`);
      expect(actual6).assertTrue();
      log('testWindowStartIconAdUi1001 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1002
     * @tc.name      testWindowStartIconAdUi1002
     * @tc.desc      Verify the countdown text shows a number within the six second budget.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1002 begin');
      const actual22: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual22}`);
      expect(actual22).assertTrue();
      const driver: Driver = Driver.create();
      const component: Component = await driver.findComponent(ON.id('countdownText'));
      const text: string = await component.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      const value: number = parseInt(text, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(value)=${Number.isFinite(value)}`);
      expect(Number.isFinite(value)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual value=${value}, expected=1`);
      expect(value).assertLargerOrEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLessOrEqual value=${value}, expected=6`);
      expect(value).assertLessOrEqual(6);
      log('testWindowStartIconAdUi1002 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1003
     * @tc.name      testWindowStartIconAdUi1003
     * @tc.desc      Verify the advertising image is laid out with a positive area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1003 begin');
      const actual23: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual23}`);
      expect(actual23).assertTrue();
      const driver: Driver = Driver.create();
      const bounds: ComponentBox = await readBounds(driver, 'advertisingImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger bounds.right - bounds.left=${bounds.right - bounds.left}`);
      expect(bounds.right - bounds.left).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger bounds.bottom - bounds.top=${bounds.bottom - bounds.top}`);
      expect(bounds.bottom - bounds.top).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger bounds.right=${bounds.right}, expected=bounds.left`);
      expect(bounds.right).assertLarger(bounds.left);
      log('testWindowStartIconAdUi1003 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1004
     * @tc.name      testWindowStartIconAdUi1004
     * @tc.desc      Verify the title renders above the description with positive areas.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1004 begin');
      const actual24: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual24}`);
      expect(actual24).assertTrue();
      const driver: Driver = Driver.create();
      const title: ComponentBox = await readBounds(driver, 'advertisingTitle');
      const description: ComponentBox = await readBounds(driver, 'advertisingDescription');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger title.right - title.left=${title.right - title.left}`);
      expect(title.right - title.left).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${description.right - description.left}, expected=0`);
      expect(description.right - description.left).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger description.top=${description.top}, expected=title.top`);
      expect(description.top).assertLarger(title.top);
      log('testWindowStartIconAdUi1004 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1005
     * @tc.name      testWindowStartIconAdUi1005
     * @tc.desc      Verify the skip pill keeps its designed 2.4 aspect ratio on screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1005 begin');
      const actual25: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual25}`);
      expect(actual25).assertTrue();
      const driver: Driver = Driver.create();
      const bounds: ComponentBox = await readBounds(driver, 'skipButton');
      const width: number = bounds.right - bounds.left;
      const height: number = bounds.bottom - bounds.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=0`);
      expect(width).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger height=${height}, expected=0`);
      expect(height).assertLarger(0);
      const ratio: number = width / height;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual ratio=${ratio}, expected=1.9`);
      expect(ratio).assertLargerOrEqual(1.9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLessOrEqual ratio=${ratio}, expected=2.9`);
      expect(ratio).assertLessOrEqual(2.9);
      log('testWindowStartIconAdUi1005 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1006
     * @tc.name      testWindowStartIconAdUi1006
     * @tc.desc      Verify the countdown expiry redirects to the hello world page unattended.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1006 begin');
      const actual26: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual26}`);
      expect(actual26).assertTrue();
      const driver: Driver = Driver.create();
      const redirected: boolean = await waitFor(driver, 'HelloWorld', AUTO_REDIRECT_WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue redirected=${redirected}`);
      expect(redirected).assertTrue();
      const actual7: boolean = await exists(driver, 'HelloWorld');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'HelloWorld')=${actual7}`);
      expect(actual7).assertTrue();
      log('testWindowStartIconAdUi1006 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1007
     * @tc.name      testWindowStartIconAdUi1007
     * @tc.desc      Verify advertising page components are removed after the redirect.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1007 begin');
      const actual27: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual27}`);
      expect(actual27).assertTrue();
      const driver: Driver = Driver.create();
      const actual8: boolean = await waitFor(driver, 'HelloWorld', AUTO_REDIRECT_WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'skipButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'skipButton')=${actual9}`);
      expect(actual9).assertFalse();
      const actual10: boolean = await exists(driver, 'countdownText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'countdownText')=${actual10}`);
      expect(actual10).assertFalse();
      const actual11: boolean = await exists(driver, 'advertisingImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'advertisingImage')=${actual11}`);
      expect(actual11).assertFalse();
      log('testWindowStartIconAdUi1007 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1008
     * @tc.name      testWindowStartIconAdUi1008
     * @tc.desc      Verify the redirected home page shows the hello world greeting.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1008 begin');
      const actual28: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual28}`);
      expect(actual28).assertTrue();
      const driver: Driver = Driver.create();
      const actual12: boolean = await waitFor(driver, 'HelloWorld', AUTO_REDIRECT_WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual12}`);
      expect(actual12).assertTrue();
      const component: Component = await driver.findComponent(ON.id('HelloWorld'));
      const text: string = await component.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='Hello World'`);
      expect(text).assertEqual('Hello World');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text.length=${text.length}, expected=11`);
      expect(text.length).assertEqual(11);
      log('testWindowStartIconAdUi1008 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1009
     * @tc.name      testWindowStartIconAdUi1009
     * @tc.desc      Verify tapping the skip pill leaves the ad page immediately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1009 begin');
      const actual29: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual29}`);
      expect(actual29).assertTrue();
      const driver: Driver = Driver.create();
      const actual13: boolean = await clickId(driver, 'skipButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'skipButton')=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await waitFor(driver, 'HelloWorld', COUNTDOWN_TOTAL_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitFor(driver, 'HelloWorld', COUNTDOWN_TOTAL_MS)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'skipButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'skipButton')=${actual15}`);
      expect(actual15).assertFalse();
      log('testWindowStartIconAdUi1009 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADUI_1010
     * @tc.name      testWindowStartIconAdUi1010
     * @tc.desc      Verify a second entry ability restart still offers and honors the skip action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdUi1010 begin');
      const actual30: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual30}`);
      expect(actual30).assertTrue();
      const actual16: boolean = await restartEntryAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restartEntryAbility()=${actual16}`);
      expect(actual16).assertTrue();
      const driver: Driver = Driver.create();
      const actual17: boolean = await exists(driver, 'skipButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'skipButton')=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await clickId(driver, 'skipButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'skipButton')=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await waitFor(driver, 'HelloWorld', COUNTDOWN_TOTAL_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitFor(driver, 'HelloWorld', COUNTDOWN_TOTAL_MS)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, 'advertisingImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'advertisingImage')=${actual20}`);
      expect(actual20).assertFalse();
      log('testWindowStartIconAdUi1010 end');
    })
  })
}
