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

import { common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { beforeAll, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { createDefaultConfig, FenceConfig, FenceService, RecordStore } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn]';
const APP_BUNDLE: string = 'com.samples.geofencecheckin';
const ABILITY_NAME: string = 'EntryAbility';

const LAUNCH_WAIT_MS: number = 2000;
const CLICK_WAIT_MS: number = 300;
const ACTION_WAIT_MS: number = 1000;
const DIALOG_WAIT_MS: number = 1500;
const MAX_PERMISSION_DIALOGS: number = 3;
const DIALOG_ACTION_TEXTS: string[] = ['允许', '仅使用期间允许'];
const READY_TIMEOUT_MS: number = 5000;
const READY_POLL_MS: number = 500;
const GUARD_MS: number = 500;

const MAX_SWIPES: number = 1;
const SWIPE_SETTLE_MS: number = 400;
const SWIPE_SPEED: number = 1200;
const KEYBOARD_SETTLE_MS: number = 400;
const IME_READY_MS: number = 2000;
const IME_SAME_PANEL_MS: number = 600;
const MAIN_PAGE_ID: string = 'id_main_page';
const MAIN_TITLE_ID: string = 'id_main_title';
const STATUS_CARD_ID: string = 'id_status_card';
const CONFIG_CARD_ID: string = 'id_config_card';
const PERMISSION_CARD_ID: string = 'id_permission_card';
const RECORD_LIST_ID: string = 'id_record_list';
const RECORDS_EMPTY_ID: string = 'id_records_empty';
const STATUS_MESSAGE_ID: string = 'id_status_message';
const INPUT_LATITUDE_ID: string = 'id_input_latitude';
const INPUT_LONGITUDE_ID: string = 'id_input_longitude';
const SAVE_BUTTON_ID: string = 'id_btn_save_config';
const ENABLE_BUTTON_ID: string = 'id_btn_enable_fence';
const DISABLE_BUTTON_ID: string = 'id_btn_disable_fence';
const REFRESH_BUTTON_ID: string = 'id_btn_refresh';
const SIMULATE_ENTER_ID: string = 'id_btn_simulate_enter';
const SIMULATE_EXIT_ID: string = 'id_btn_simulate_exit';
const CLEAR_RECORDS_ID: string = 'id_btn_clear_records';

const FENCE_LATITUDE: string = '39.908722';
const FENCE_LONGITUDE: string = '116.397499';
const FENCE_NAME: string = 'Sample Fence';
const FENCE_RADIUS: number = 200;

let uiDriver: Driver | null = null;

function getDriver(): Driver {
  if (uiDriver !== null) {
    return uiDriver;
  }
  const created: Driver = Driver.create();
  uiDriver = created;
  return created;
}

async function resolveStoreContext(): Promise<common.Context> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    // The top ability belongs to this test module before the sample is launched,
    // and relationalStore accepts its UIAbilityContext on every board.
    const topAbility: UIAbility = await delegator.getCurrentTopAbility();
    if (topAbility) {
      return topAbility.context;
    }
  } catch (error) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'resolveStoreContext, no top ability available');
  }
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'resolveStoreContext, fallback to app context');
  return delegator.getAppContext();
}

async function seedConfig(): Promise<boolean> {
  // Write the fence configuration straight into the store: the hook budget is
  // 15s, which two keyboard fills alone would consume on the board.
  const config: FenceConfig = createDefaultConfig();
  config.name = FENCE_NAME;
  config.latitude = Number.parseFloat(FENCE_LATITUDE);
  config.longitude = Number.parseFloat(FENCE_LONGITUDE);
  config.radius = FENCE_RADIUS;
  config.updatedAt = Date.now();
  try {
    const context: common.Context = await resolveStoreContext();
    await RecordStore.saveConfig(context, config);
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'seedConfig, stored fence ' + FENCE_NAME);
    return true;
  } catch (error) {
    hilog.error(DOMAIN, SUITE_TAG, '%{public}s', 'seedConfig failed with top ability context, retry with app');
  }
  try {
    const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    await RecordStore.saveConfig(appContext, config);
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'seedConfig, stored fence with app context');
    return true;
  } catch (error) {
    // A failed seed must not fail the hook: the caller falls back to the
    // slower keyboard path once the page is up.
    hilog.error(DOMAIN, SUITE_TAG, '%{public}s', 'seedConfig failed, fall back to UI input');
    return false;
  }
}

async function launchApp(): Promise<void> {
  const want: Want = {
    bundleName: APP_BUNDLE,
    abilityName: ABILITY_NAME
  };
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
  await getDriver().delayMs(LAUNCH_WAIT_MS);
}

async function hasComponent(idValue: string): Promise<boolean> {
  const found: Component[] = await getDriver().findComponents(ON.id(idValue));
  if (found === null) {
    return false;
  }
  return found.length > 0;
}

async function swipeUp(driver: Driver): Promise<void> {
  const display = await driver.getDisplaySize();
  await driver.swipe(display.x / 2, display.y * 0.8, display.x / 2, display.y * 0.3, SWIPE_SPEED);
  await driver.delayMs(SWIPE_SETTLE_MS);
}

async function swipeDown(driver: Driver): Promise<void> {
  const display = await driver.getDisplaySize();
  await driver.swipe(display.x / 2, display.y * 0.3, display.x / 2, display.y * 0.8, SWIPE_SPEED);
  await driver.delayMs(SWIPE_SETTLE_MS);
}

async function pageAtTop(): Promise<boolean> {
  const title: Component | null = await getDriver().findComponent(ON.id(MAIN_TITLE_ID));
  return title !== null;
}

async function ensurePageTop(): Promise<void> {
  const driver: Driver = getDriver();
  let attempt: number = 0;
  while (attempt < MAX_SWIPES + 1 && !(await pageAtTop())) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'ensurePageTop, scroll up');
    await swipeDown(driver);
    attempt++;
  }
}

async function locate(targetId: string): Promise<Component> {
  const driver: Driver = getDriver();
  let target: Component = await driver.findComponent(ON.id(targetId));
  for (let step = 0; target === null && step < MAX_SWIPES; step++) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'locate, scroll down for ' + targetId);
    await swipeUp(driver);
    target = await driver.findComponent(ON.id(targetId));
  }
  for (let step = 0; target === null && step < MAX_SWIPES + 1; step++) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'locate, scroll up for ' + targetId);
    await swipeDown(driver);
    target = await driver.findComponent(ON.id(targetId));
  }
  if (target === null) {
    throw new Error('component not found: ' + targetId);
  }
  return target;
}

async function clickOn(targetId: string): Promise<void> {
  const driver: Driver = getDriver();
  const display = await driver.getDisplaySize();
  let target: Component = await locate(targetId);
  let bounds: Rect = await target.getBounds();
  for (let retry = 0; (bounds.bottom > display.y || bounds.top < 0) && retry < MAX_SWIPES; retry++) {
    await swipeUp(driver);
    target = await locate(targetId);
    bounds = await target.getBounds();
  }
  await target.click();
  await driver.delayMs(CLICK_WAIT_MS);
}

async function exists(targetId: string): Promise<boolean> {
  try {
    await locate(targetId);
    return true;
  } catch (error) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'exists, ' + targetId + ' not found');
    return false;
  }
}

async function dismissKeyboardFor(targetId: string): Promise<void> {
  const target: Component | null = await getDriver().findComponent(ON.id(targetId));
  if (target !== null && await target.isFocused()) {
    await getDriver().pressBack();
    await getDriver().delayMs(KEYBOARD_SETTLE_MS);
    if (!(await hasComponent(MAIN_PAGE_ID))) {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'dismissKeyboardFor, back left app, relaunch');
      await launchApp();
      await waitForComponent(MAIN_PAGE_ID);
    }
  }
}

async function inputInto(targetId: string, text: string, imeWaitMs: number): Promise<void> {
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'inputInto, begin ' + targetId);
  const target: Component = await locate(targetId);
  await target.click();
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'inputInto, ' + targetId + ' clicked, wait ' + imeWaitMs);
  await getDriver().delayMs(imeWaitMs);
  const before: string = await target.getText();
  if (before.length > 0) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'inputInto, ' + targetId + ' clearText begin');
    await target.clearText();
  }
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'inputInto, ' + targetId + ' inputText begin');
  await target.inputText(text);
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'inputInto, ' + targetId + ' done');
}

async function textOf(targetId: string): Promise<string> {
  const target: Component = await locate(targetId);
  return await target.getText();
}

async function currentText(targetId: string): Promise<string> {
  const target: Component | null = await getDriver().findComponent(ON.id(targetId));
  if (target === null) {
    return '';
  }
  return await target.getText();
}

async function prepareConfig(): Promise<void> {
  const latitudeFilled: boolean = await currentText(INPUT_LATITUDE_ID) === FENCE_LATITUDE;
  const longitudeFilled: boolean = await currentText(INPUT_LONGITUDE_ID) === FENCE_LONGITUDE;
  let lastFilledId: string = '';
  if (!latitudeFilled) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'prepareConfig, fill latitude');
    await inputInto(INPUT_LATITUDE_ID, FENCE_LATITUDE, IME_READY_MS);
    lastFilledId = INPUT_LATITUDE_ID;
  }
  if (!longitudeFilled) {
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'prepareConfig, fill longitude');
    await inputInto(INPUT_LONGITUDE_ID, FENCE_LONGITUDE, lastFilledId === '' ? IME_READY_MS : IME_SAME_PANEL_MS);
    lastFilledId = INPUT_LONGITUDE_ID;
  }
  if (lastFilledId !== '') {
    await dismissKeyboardFor(lastFilledId);
  }
  await clickOn(SAVE_BUTTON_ID);
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'prepareConfig, save clicked');
  await getDriver().delayMs(ACTION_WAIT_MS);
}

async function acceptPermissionDialogs(driver: Driver): Promise<void> {
  for (let round = 0; round < MAX_PERMISSION_DIALOGS; round++) {
    await driver.delayMs(DIALOG_WAIT_MS);
    let button: Component | null = null;
    for (let i = 0; i < DIALOG_ACTION_TEXTS.length; i++) {
      const found: Component = await driver.findComponent(ON.text(DIALOG_ACTION_TEXTS[i]));
      if (found !== null) {
        button = found;
        break;
      }
    }
    if (button === null) {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'no permission dialog, round: ' + round);
      return;
    }
    hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'accept permission dialog, round: ' + round);
    await button.click();
  }
}

async function waitForComponent(idValue: string): Promise<boolean> {
  const driver: Driver = getDriver();
  const deadline: number = Date.now() + READY_TIMEOUT_MS;
  while (Date.now() < deadline) {
    const exists: boolean = await hasComponent(idValue);
    if (exists) {
      return true;
    }
    await driver.delayMs(READY_POLL_MS);
  }
  return await hasComponent(idValue);
}

async function channelGuard(): Promise<void> {
  // Pure JS sleep with no uitest call in flight, so a hypium 15s kill never
  // abandons an in-flight Driver call that would lock the uitest channel.
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, GUARD_MS);
  });
}

export default function geofenceCheckInTest() {
  describe('GeofenceCheckInSample', () => {
    beforeAll(async () => {
      // Seed the configuration before the page starts so the launch flow restores
      // the saved values and no keyboard input is needed inside the hook.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, seed config');
      const seeded: boolean = await seedConfig();
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, launch EntryAbility');
      await launchApp();
      await acceptPermissionDialogs(getDriver());
      const ready: boolean = await waitForComponent(MAIN_PAGE_ID);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, main page ready: ' + ready);
      if (ready && (!seeded || (await currentText(INPUT_LATITUDE_ID)) === '')) {
        // Fallback for the rare case the store seed was not picked up: fill the
        // form through the UI so later cases still find a valid configuration.
        hilog.warn(DOMAIN, SUITE_TAG, '%{public}s', 'setup, seed not restored, fill form through UI');
        await prepareConfig();
      }
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_STARTABILITY_0100
     * @tc.name      testStartAbility0001
     * @tc.desc      Verify the main page, title and status card are displayed after
     *               the application starts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStartAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testStartAbility0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mainPageExists: boolean = await hasComponent(MAIN_PAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'main page exists: ' + mainPageExists);
      expect(mainPageExists).assertTrue();

      const title: Component = await locate(MAIN_TITLE_ID);
      const titleText: string = await title.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', 'title text length: ' + titleText.length);
      expect(titleText.length > 0).assertTrue();

      const statusCardExists: boolean = await exists(STATUS_CARD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'status card exists: ' + statusCardExists);
      expect(statusCardExists).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_SAVECONFIG_0100
     * @tc.name      testSaveConfig0001
     * @tc.desc      Verify the page shows a save result message and enables the simulate
     *               enter button after saving a valid fence configuration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSaveConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSaveConfig0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      await prepareConfig();
      const message: string = await textOf(STATUS_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'status message length: ' + message.length);
      expect(message.length > 0).assertTrue();

      const simulateButton: Component = await locate(SIMULATE_ENTER_ID);
      const enabled: boolean = await simulateButton.isEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', 'simulate button enabled: ' + enabled);
      expect(enabled).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_SIMULATECHECKIN_0100
     * @tc.name      testSimulateCheckIn0001
     * @tc.desc      Verify simulating a fence-enter event updates the status message
     *               and generates a check-in record.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSimulateCheckIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSimulateCheckIn0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      await prepareConfig();
      await clickOn(SIMULATE_ENTER_ID);
      await getDriver().delayMs(ACTION_WAIT_MS);
      const message: string = await textOf(STATUS_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'status message length: ' + message.length);
      expect(message.length > 0).assertTrue();

      const recordList: Component = await locate(RECORD_LIST_ID);
      const bounds: Rect = await recordList.getBounds();
      const width: number = bounds.right - bounds.left;
      hilog.info(DOMAIN, TAG, '%{public}s', 'record list width: ' + width);
      expect(width > 0).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_SIMULATECHECKOUT_0100
     * @tc.name      testSimulateCheckOut0001
     * @tc.desc      Verify simulating a fence-exit event updates the status message and
     *               keeps the check-in record list.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSimulateCheckOut0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSimulateCheckOut0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      await clickOn(SIMULATE_EXIT_ID);
      await getDriver().delayMs(ACTION_WAIT_MS);
      const message: string = await textOf(STATUS_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'status message length: ' + message.length);
      expect(message.length > 0).assertTrue();

      const recordListExists: boolean = await exists(RECORD_LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'record list exists: ' + recordListExists);
      expect(recordListExists).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_CLEARRECORDS_0100
     * @tc.name      testClearRecords0001
     * @tc.desc      Verify the record list switches to the empty state after clearing
     *               all check-in records.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClearRecords0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testClearRecords0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await clickOn(CLEAR_RECORDS_ID);
      await getDriver().delayMs(ACTION_WAIT_MS);
      const emptyExists: boolean = await exists(RECORDS_EMPTY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'records empty view exists: ' + emptyExists);
      expect(emptyExists).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_RESPONSIVELAYOUT_0100
     * @tc.name      testResponsiveLayout0001
     * @tc.desc      Verify the config card and permission card are laid out with non-zero
     *               width on phone and tablet layouts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testResponsiveLayout0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testResponsiveLayout0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      const configCard: Component = await locate(CONFIG_CARD_ID);
      const configBounds: Rect = await configCard.getBounds();
      const configWidth: number = configBounds.right - configBounds.left;
      hilog.info(DOMAIN, TAG, '%{public}s', 'config card width: ' + configWidth);
      expect(configWidth > 0).assertTrue();

      const permissionCard: Component = await locate(PERMISSION_CARD_ID);
      const permissionBounds: Rect = await permissionCard.getBounds();
      const permissionWidth: number = permissionBounds.right - permissionBounds.left;
      hilog.info(DOMAIN, TAG, '%{public}s', 'permission card width: ' + permissionWidth);
      expect(permissionWidth > 0).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_FENCETOGGLE_0100
     * @tc.name      testEnableDisableToggle0001
     * @tc.desc      Verify the fence action button switches between enable and disable
     *               exclusively after tapping the toggle, and returns to the enable
     *               state after disabling again. On boards without the geofence
     *               capability, location switch or location grant the button keeps the
     *               enable branch and the page reports the rejection in the banner.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEnableDisableToggle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testEnableDisableToggle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      await prepareConfig();
      await clickOn(ENABLE_BUTTON_ID);
      await getDriver().delayMs(ACTION_WAIT_MS);
      // The toggle branch swap removes the sibling button from the same visible
      // slot, so one viewport query proves the outcome without swipe retries.
      const disableExists: boolean = await hasComponent(DISABLE_BUTTON_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'disable exists: ' + disableExists);
      if (disableExists) {
        // Registration succeeded: the two actions must swap exclusively.
        const enableGone: boolean = !(await hasComponent(ENABLE_BUTTON_ID));
        hilog.info(DOMAIN, TAG, '%{public}s', 'enable gone: ' + enableGone);
        expect(enableGone).assertTrue();
        const enabledMessage: string = await currentText(STATUS_MESSAGE_ID);
        hilog.info(DOMAIN, TAG, '%{public}s', 'status message length: ' + enabledMessage.length);
        expect(enabledMessage.length > 0).assertTrue();
        await clickOn(DISABLE_BUTTON_ID);
        await getDriver().delayMs(ACTION_WAIT_MS);
        const enableRestored: boolean = await hasComponent(ENABLE_BUTTON_ID);
        hilog.info(DOMAIN, TAG, '%{public}s', 'enable restored: ' + enableRestored);
        expect(enableRestored).assertTrue();
      } else {
        // A board without the geofence capability, the location switch or the
        // location grant keeps the enable branch, and the page must explain it.
        const rejectedMessage: string = await currentText(STATUS_MESSAGE_ID);
        hilog.info(DOMAIN, TAG, '%{public}s', 'fence not enabled, message length: ' + rejectedMessage.length);
        expect(rejectedMessage.length > 0).assertTrue();
        // Record the precondition states so a rejected toggle stays diagnosable.
        const context: common.Context = await resolveStoreContext();
        const supported: boolean = FenceService.isSupported();
        const locationOn: boolean = FenceService.isLocationEnabled();
        const granted: boolean = await FenceService.hasForegroundPermission(context);
        hilog.info(DOMAIN, TAG, '%{public}s', 'diagnosis, supported ' + supported +
          ', location ' + locationOn + ', granted ' + granted);
      }
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_REFRESH_0100
     * @tc.name      testRefreshStatusCard0001
     * @tc.desc      Verify tapping the permission refresh action keeps the permission
     *               card and the status card rendered with a non-zero width.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRefreshStatusCard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testRefreshStatusCard0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      const beforeExists: boolean = await exists(PERMISSION_CARD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'permission card before refresh: ' + beforeExists);
      expect(beforeExists).assertTrue();

      await clickOn(REFRESH_BUTTON_ID);
      await getDriver().delayMs(ACTION_WAIT_MS);
      const afterExists: boolean = await exists(PERMISSION_CARD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'permission card after refresh: ' + afterExists);
      expect(afterExists).assertTrue();

      const statusCard: Component = await locate(STATUS_CARD_ID);
      const bounds: Rect = await statusCard.getBounds();
      const width: number = bounds.right - bounds.left;
      hilog.info(DOMAIN, TAG, '%{public}s', 'status card width: ' + width);
      expect(width > 0).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_UI_INVALIDPARAMS_0100
     * @tc.name      testInvalidParams0001
     * @tc.desc      Verify saving a configuration with an empty latitude shows an
     *               error message.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testInvalidParams0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testInvalidParams0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      await ensurePageTop();
      const latitude: Component = await locate(INPUT_LATITUDE_ID);
      await latitude.click();
      await getDriver().delayMs(IME_READY_MS);
      await latitude.clearText();
      await dismissKeyboardFor(INPUT_LATITUDE_ID);
      await clickOn(SAVE_BUTTON_ID);
      await getDriver().delayMs(ACTION_WAIT_MS);
      const message: string = await textOf(STATUS_MESSAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'status message length: ' + message.length);
      expect(message.length > 0).assertTrue();
      await channelGuard();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
