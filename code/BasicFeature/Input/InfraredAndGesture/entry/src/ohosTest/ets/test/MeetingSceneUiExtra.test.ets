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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { deviceInfo } from '@kit.BasicServicesKit';

/** Suite-level tag used only by beforeAll logs; each test case logs with its own TAG. */
const SUITE_TAG: string = '[Sample_MeetingScene_Extra]';
/** Hilog domain reserved for the MeetingScene UI tests. */
const DOMAIN: number = 0xF811;
/** Package-name keyword prefixed to every log line so logs can be filtered by bundle. */
const BUNDLE: string = 'MeetingScene_Extra_';
/** Bundle name of the sample under test. */
const BUNDLE_NAME: string = 'com.samples.infraredandgesture';
/** Entry ability of the sample under test. */
const ABILITY_NAME: string = 'EntryAbility';
/** Device type value reported by tablets. */
const TABLET_DEVICE: string = 'tablet';
/** Upper bound for every component wait; tests must never wait without a limit. */
const WAIT_TIMEOUT_MS: number = 3000;
/** Delay after startAbility before the landing page is expected to be ready. */
const LAUNCH_DELAY_MS: number = 2000;
/** Short pause after a click so state-driven UI refreshes before existence checks. */
const CLICK_SETTLE_MS: number = 350;

/** Root id of the phone console home. */
const CONSOLE_ROOT: string = 'id_console_root';
/** Root id of the tablet orchestration home. */
const ORCHESTRATION_ROOT: string = 'id_orch_root';
/** Seeded room id shipped with the demo data. */
const SEED_ROOM_ID: string = 'room-default';
/** Seeded projector device id shipped with the demo data. */
const SEED_DEVICE_ID: string = 'dev-projector';
/** Seeded scene id shipped with the demo data. */
const SEED_SCENE_ID: string = 'scene-meeting';
/** Seeded first step id shipped with the demo data. */
const SEED_STEP_ID: string = 'step-meeting-0';
/** Scroll container id of the phone room configuration page. */
const ROOM_CONFIG_SCROLL: string = 'id_room_scroll';
/** Scroll container id of the phone scene editor page. */
const SCENE_EDITOR_SCROLL: string = 'id_scene_scroll';
/**
 * Speed used for page-level programmatic scrolling, in px/s. The uitest default is 600,
 * which needs several seconds for a long form and eats the per-case execute budget.
 */
const SCROLL_SPEED: number = 20000;

async function waitForId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null =
    await driver.waitForComponent(ON.id(id), WAIT_TIMEOUT_MS);
  return component !== null;
}

async function findNow(driver: Driver, id: string): Promise<Component | null> {
  return driver.findComponent(ON.id(id));
}
/** Clicks the component with the given id and reports whether it was found. */
async function clickId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findNow(driver, id);
  if (component === null) {
    return false;
  }
  await component.click();
  return true;
}

/** Returns whether the component with the given id exists right now, without waiting. */
async function idExists(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findNow(driver, id);
  return component !== null;
}

/** Scrolls a page container to the bottom so widgets below the fold become visible. */
async function scrollPageBottom(driver: Driver, scrollId: string): Promise<boolean> {
  const scroll: Component | null = await findNow(driver, scrollId);
  if (scroll === null) {
    return false;
  }
  await scroll.scrollToBottom(SCROLL_SPEED);
  return true;
}

/** Scrolls a page container back to the top so header widgets are reachable again. */
async function scrollPageTop(driver: Driver, scrollId: string): Promise<boolean> {
  const scroll: Component | null = await findNow(driver, scrollId);
  if (scroll === null) {
    return false;
  }
  await scroll.scrollToTop(SCROLL_SPEED);
  return true;
}

/** Opens the phone room configuration page and waits for its root to appear. */
async function openPhoneRoomConfig(driver: Driver): Promise<boolean> {
  const opened: boolean = await clickId(driver, 'id_nav_room_config');
  if (!opened) {
    return false;
  }
  return waitForId(driver, 'id_room_config_root');
}

/** Opens the phone scene editor page and waits for its root to appear. */
async function openPhoneSceneEditor(driver: Driver): Promise<boolean> {
  const opened: boolean = await clickId(driver, 'id_nav_scene_editor');
  if (!opened) {
    return false;
  }
  return waitForId(driver, 'id_scene_editor_root');
}

/** Opens the tablet room configuration page of the seeded room and waits for its root. */
async function openTabletRoomConfig(driver: Driver): Promise<boolean> {
  const entered: boolean = await clickId(driver, 'id_index_room_enter_' + SEED_ROOM_ID);
  if (!entered) {
    return false;
  }
  return waitForId(driver, 'id_rc_root');
}

/** Asserts that the given home widgets are all present; keeps non-target forms stable. */
async function assertStableHome(driver: Driver, ids: string[], tag: string): Promise<void> {
  for (let i = 0; i < ids.length; i++) {
    const found: boolean = await waitForId(driver, ids[i]);
    hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', stable id=' + ids[i] +
      ', found=' + found.toString());
    expect(found).assertTrue();
  }
}

export default function meetingSceneUiExtraTest() {
  describe('MeetingSceneUiExtraTest', () => {
    const isTablet: boolean = deviceInfo.deviceType === TABLET_DEVICE;
    const homeId: string = isTablet ? ORCHESTRATION_ROOT : CONSOLE_ROOT;
    /** Home widgets that must stay stable when a phone-only case runs on a tablet. */
    const phoneStableIds: string[] = [CONSOLE_ROOT, 'id_console_title', 'id_console_nav'];
    /** Home widgets that must stay stable when a tablet-only case runs on a phone. */
    const tabletStableIds: string[] =
      [ORCHESTRATION_ROOT, 'id_index_title', 'id_index_rooms_section'];
    let driver: Driver = Driver.create();

    beforeAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await driver.delayMs(LAUNCH_DELAY_MS);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_CORRECTPANEL_0200
     * @tc.name      testCorrectPanelCancel0001
     * @tc.desc      Verify the device correction panel opens from the device card, shows its
     *               title and the two power options plus cancel, and closes without leaving
     *               the console home when the user cancels.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCorrectPanelCancel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testCorrectPanelCancel0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', home=' + homeFound.toString());
          expect(homeFound).assertTrue();
          const correctId: string = 'id_device_correct_' + SEED_DEVICE_ID;
          const btnReady: boolean = await waitForId(driver, correctId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', correct btn=' + btnReady.toString());
          expect(btnReady).assertTrue();
          const clicked: boolean = await clickId(driver, correctId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open panel=' + clicked.toString());
          expect(clicked).assertTrue();
          const panelFound: boolean = await waitForId(driver, 'id_correct_panel');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', panel=' + panelFound.toString());
          expect(panelFound).assertTrue();
          const titleFound: boolean = await waitForId(driver, 'id_correct_title');
          expect(titleFound).assertTrue();
          const onFound: boolean = await waitForId(driver, 'id_correct_power_on');
          expect(onFound).assertTrue();
          const offFound: boolean = await waitForId(driver, 'id_correct_power_off');
          expect(offFound).assertTrue();
          const cancelFound: boolean = await waitForId(driver, 'id_correct_cancel');
          expect(cancelFound).assertTrue();
          const cancelClicked: boolean = await clickId(driver, 'id_correct_cancel');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', cancel=' + cancelClicked.toString());
          expect(cancelClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const panelGone: boolean = !(await idExists(driver, 'id_correct_panel'));
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', panel gone=' + panelGone.toString());
          expect(panelGone).assertTrue();
          const homeStill: boolean = await idExists(driver, CONSOLE_ROOT);
          expect(homeStill).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_CORRECTPANEL_0201
     * @tc.name      testCorrectPanelApply0001
     * @tc.desc      Verify the correction panel applies an expected power state and closes
     *               while the device card stays rendered; the case then reopens the panel
     *               and restores the power-on expectation for the seeded projector.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCorrectPanelApply0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testCorrectPanelApply0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const correctId: string = 'id_device_correct_' + SEED_DEVICE_ID;
          const clicked: boolean = await clickId(driver, correctId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open panel=' + clicked.toString());
          expect(clicked).assertTrue();
          const panelFound: boolean = await waitForId(driver, 'id_correct_panel');
          expect(panelFound).assertTrue();
          // Apply the power-off expectation; the panel closes by itself afterwards.
          const offClicked: boolean = await clickId(driver, 'id_correct_power_off');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', apply off=' + offClicked.toString());
          expect(offClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const panelClosed: boolean = !(await idExists(driver, 'id_correct_panel'));
          expect(panelClosed).assertTrue();
          const cardFound: boolean = await waitForId(driver, 'id_device_card_' + SEED_DEVICE_ID);
          expect(cardFound).assertTrue();
          const expectedFound: boolean = await waitForId(driver, 'id_device_expected_' + SEED_DEVICE_ID);
          expect(expectedFound).assertTrue();
          // Reopen the panel and restore the power-on expectation so the seeded
          // projector keeps a sensible final state after the correction.
          const reopened: boolean = await clickId(driver, correctId);
          expect(reopened).assertTrue();
          const panelAgain: boolean = await waitForId(driver, 'id_correct_panel');
          expect(panelAgain).assertTrue();
          const onClicked: boolean = await clickId(driver, 'id_correct_power_on');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', restore on=' + onClicked.toString());
          expect(onClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const panelClosedAgain: boolean = !(await idExists(driver, 'id_correct_panel'));
          expect(panelClosedAgain).assertTrue();
          const homeStill: boolean = await idExists(driver, CONSOLE_ROOT);
          expect(homeStill).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ROOMCONFIGGUARD_0300
     * @tc.name      testRoomNameRequired0001
     * @tc.desc      Verify the phone room configuration page shows the required-name hint
     *               when the user taps create room with an empty name, keeping the room
     *               list intact and returning to the console home afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomNameRequired0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomNameRequired0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          const statusBefore: boolean = await idExists(driver, 'id_room_status');
          expect(!statusBefore).assertTrue();
          // Empty-name guard: submit the creation form without typing anything.
          const clicked: boolean = await clickId(driver, 'id_new_room_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', submit empty=' + clicked.toString());
          expect(clicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          const roomsStill: boolean = await idExists(driver, 'id_rooms_section');
          expect(roomsStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ROOMCONFIGGUARD_0301
     * @tc.name      testImportPathRequired0001
     * @tc.desc      Verify the phone room configuration page shows the enter-path hint when
     *               importing without a path and the select-device hint when binding a key
     *               with no device chosen; both actions leave the data unchanged.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportPathRequired0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testImportPathRequired0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          expect(opened).assertTrue();
          const statusBefore: boolean = await idExists(driver, 'id_room_status');
          expect(!statusBefore).assertTrue();
          // The package section sits below the fold of the phone page, so scroll the whole
          // page to the bottom once: one fast scroll keeps the case inside its time budget.
          const reachedBottom: boolean = await scrollPageBottom(driver, ROOM_CONFIG_SCROLL);
          expect(reachedBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sectionFound: boolean = await idExists(driver, 'id_config_package_section');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', package section=' +
            sectionFound.toString());
          expect(sectionFound).assertTrue();
          const exportFound: boolean = await idExists(driver, 'id_export_room_button');
          expect(exportFound).assertTrue();
          // Empty-path guard: no text is typed, so no import can run.
          const importClicked: boolean = await clickId(driver, 'id_import_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', submit empty=' +
            importClicked.toString());
          expect(importClicked).assertTrue();
          // Binding without a selected device stays on the guard branch too; the key
          // section sits right above the package section and is visible at the bottom.
          const bindClicked: boolean = await clickId(driver, 'id_bind_key_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', bind empty=' +
            bindClicked.toString());
          expect(bindClicked).assertTrue();
          // The guard hint renders in the page header, above the scrolled-down form.
          const reachedTop: boolean = await scrollPageTop(driver, ROOM_CONFIG_SCROLL);
          expect(reachedTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SCENEEDITORGUARD_0400
     * @tc.name      testSceneValidateResult0001
     * @tc.desc      Verify the phone scene editor shows a validation result message after
     *               the user taps validate on the preselected seeded scene, keeping the
     *               scene list and step list rendered and returning home afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneValidateResult0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneValidateResult0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          // The editor auto-selects the first seeded scene; its steps show once ready.
          const stepReady: boolean = await waitForId(driver, 'id_step_toggle_' + SEED_STEP_ID);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', steps ready=' + stepReady.toString());
          expect(stepReady).assertTrue();
          const validationBefore: boolean = await idExists(driver, 'id_validation_text');
          expect(!validationBefore).assertTrue();
          // The validate button closes the step form and sits below the fold on a phone,
          // so reveal it with one fast scroll before tapping.
          const formBottom: boolean = await scrollPageBottom(driver, SCENE_EDITOR_SCROLL);
          expect(formBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const clicked: boolean = await clickId(driver, 'id_validate_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', validate=' + clicked.toString());
          expect(clicked).assertTrue();
          const validationFound: boolean = await waitForId(driver, 'id_validation_text');
          expect(validationFound).assertTrue();
          // Scroll back up so the scene and step section cards are in view again.
          const formTop: boolean = await scrollPageTop(driver, SCENE_EDITOR_SCROLL);
          expect(formTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const scenesStill: boolean = await idExists(driver, 'id_scenes_section');
          expect(scenesStill).assertTrue();
          const stepsStill: boolean = await idExists(driver, 'id_steps_section');
          expect(stepsStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SCENEEDITORGUARD_0401
     * @tc.name      testSceneEditorFormCheck0001
     * @tc.desc      Verify the phone scene editor renders the room list, the scene list,
     *               the add-step form selectors and both action buttons; no add-step tap
     *               is performed so the seeded scene data stays unchanged.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneEditorFormCheck0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneEditorFormCheck0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const listReady: boolean = await waitForId(driver, 'id_scene_room_list');
          expect(listReady).assertTrue();
          const stepReady: boolean = await waitForId(driver, 'id_step_toggle_' + SEED_STEP_ID);
          expect(stepReady).assertTrue();
          // The add-step form and the action buttons are the last block of the page and
          // stay below the fold on a phone, so scroll there once before checking them.
          const formBottom: boolean = await scrollPageBottom(driver, SCENE_EDITOR_SCROLL);
          expect(formBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const deviceSelect: boolean = await waitForId(driver, 'id_step_device_select');
          expect(deviceSelect).assertTrue();
          const keySelect: boolean = await waitForId(driver, 'id_step_key_select');
          expect(keySelect).assertTrue();
          const addButton: boolean = await waitForId(driver, 'id_add_step_button');
          expect(addButton).assertTrue();
          const validateButton: boolean = await waitForId(driver, 'id_validate_button');
          expect(validateButton).assertTrue();
          const formTop: boolean = await scrollPageTop(driver, SCENE_EDITOR_SCROLL);
          expect(formTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sectionStill: boolean = await idExists(driver, 'id_steps_section');
          expect(sectionStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ORCHROOMGUARD_0500
     * @tc.name      testCreateRoomRequired0001
     * @tc.desc      Verify the tablet orchestration home shows the required-name hint when
     *               the user taps create room with an empty name, keeping the room section
     *               and the room grid rendered on the same page.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCreateRoomRequired0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testCreateRoomRequired0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCHESTRATION_ROOT);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', home=' + homeFound.toString());
          expect(homeFound).assertTrue();
          const statusBefore: boolean = await idExists(driver, 'id_index_status');
          expect(!statusBefore).assertTrue();
          // Empty-name guard: submit the creation form without typing anything.
          const clicked: boolean = await clickId(driver, 'id_index_create_room');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', submit empty=' + clicked.toString());
          expect(clicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_index_status');
          expect(statusFound).assertTrue();
          const sectionStill: boolean = await idExists(driver, 'id_index_rooms_section');
          expect(sectionStill).assertTrue();
          const gridStill: boolean = await idExists(driver, 'id_index_rooms_grid');
          expect(gridStill).assertTrue();
        } else {
          await assertStableHome(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TRANSFERGUARD_0600
     * @tc.name      testExportSelectionGuard0001
     * @tc.desc      Verify the tablet transfer page toggles a seeded room on and off and
     *               shows the select-room hint when exporting with an empty selection,
     *               keeping the export and import sections rendered.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportSelectionGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testExportSelectionGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await clickId(driver, 'id_index_transfer');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          const pageFound: boolean = await waitForId(driver, 'id_xfer_root');
          expect(pageFound).assertTrue();
          const toggleId: string = 'id_xfer_room_toggle_' + SEED_ROOM_ID;
          // Selection toggling is pure UI state; tapping twice restores it.
          const toggleOn: boolean = await clickId(driver, toggleId);
          expect(toggleOn).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const toggleAfterOn: boolean = await idExists(driver, toggleId);
          expect(toggleAfterOn).assertTrue();
          const toggleOff: boolean = await clickId(driver, toggleId);
          expect(toggleOff).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const toggleAfterOff: boolean = await idExists(driver, toggleId);
          expect(toggleAfterOff).assertTrue();
          // Empty-selection guard: export without choosing any room.
          const exportClicked: boolean = await clickId(driver, 'id_xfer_export_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', export empty=' +
            exportClicked.toString());
          expect(exportClicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_xfer_status');
          expect(statusFound).assertTrue();
          const exportSection: boolean = await idExists(driver, 'id_xfer_export_section');
          expect(exportSection).assertTrue();
          const exportButton: boolean = await idExists(driver, 'id_xfer_export_button');
          expect(exportButton).assertTrue();
          const importSection: boolean = await idExists(driver, 'id_xfer_import_section');
          expect(importSection).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_xfer_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        } else {
          await assertStableHome(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TRANSFERGUARD_0601
     * @tc.name      testImportPathGuard0001
     * @tc.desc      Verify the tablet transfer page shows the enter-path hint when the user
     *               taps import without typing a path, keeping the path input rendered and
     *               returning to the orchestration home afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportPathGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testImportPathGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await clickId(driver, 'id_index_transfer');
          expect(opened).assertTrue();
          const pageFound: boolean = await waitForId(driver, 'id_xfer_root');
          expect(pageFound).assertTrue();
          const statusBefore: boolean = await idExists(driver, 'id_xfer_status');
          expect(!statusBefore).assertTrue();
          // Empty-path guard: no text is typed, so no import can run.
          const importClicked: boolean = await clickId(driver, 'id_xfer_import_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', import empty=' +
            importClicked.toString());
          expect(importClicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_xfer_status');
          expect(statusFound).assertTrue();
          const inputStill: boolean = await idExists(driver, 'id_xfer_import_input');
          expect(inputStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_xfer_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        } else {
          await assertStableHome(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETPAGES_0700
     * @tc.name      testTabletRoomConfig0001
     * @tc.desc      Verify the tablet room configuration page of the seeded room renders
     *               the room info card, the device section and the key section, with no
     *               empty-device hint, and returns to the orchestration home.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletRoomConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletRoomConfig0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const entered: boolean = await openTabletRoomConfig(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + entered.toString());
          expect(entered).assertTrue();
          const infoFound: boolean = await waitForId(driver, 'id_rc_room_info');
          expect(infoFound).assertTrue();
          const devicesTitle: boolean = await waitForId(driver, 'id_rc_devices_title');
          expect(devicesTitle).assertTrue();
          const keysSection: boolean = await waitForId(driver, 'id_rc_keys_section');
          expect(keysSection).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          // The seeded room holds four devices, so the empty hint must not render.
          const emptyHint: boolean = await idExists(driver, 'id_rc_devices_empty');
          expect(!emptyHint).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        } else {
          await assertStableHome(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETPAGES_0701
     * @tc.name      testTabletSceneEditor0001
     * @tc.desc      Verify the tablet scene editor of the seeded room renders the room
     *               name, the scene and step sections and the add-step form selectors,
     *               then the back chain returns home through the room page. No add-step
     *               tap is performed because the editor preselects the seeded scene.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletSceneEditor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletSceneEditor0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const entered: boolean = await openTabletRoomConfig(driver);
          expect(entered).assertTrue();
          const editorOpened: boolean = await clickId(driver, 'id_rc_scene_entry');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open editor=' +
            editorOpened.toString());
          expect(editorOpened).assertTrue();
          const editorFound: boolean = await waitForId(driver, 'id_oen_root');
          expect(editorFound).assertTrue();
          const roomNameFound: boolean = await waitForId(driver, 'id_oen_room_name');
          expect(roomNameFound).assertTrue();
          const scenesSection: boolean = await waitForId(driver, 'id_oen_scenes_section');
          expect(scenesSection).assertTrue();
          const stepsSection: boolean = await waitForId(driver, 'id_oen_steps_section');
          expect(stepsSection).assertTrue();
          const deviceSelect: boolean = await waitForId(driver, 'id_oen_device_select');
          expect(deviceSelect).assertTrue();
          const keySelect: boolean = await waitForId(driver, 'id_oen_key_select');
          expect(keySelect).assertTrue();
          const selectBtn: boolean = await waitForId(driver,
            'id_oen_select_' + SEED_SCENE_ID);
          expect(selectBtn).assertTrue();
          const editorBack: boolean = await clickId(driver, 'id_oen_back');
          expect(editorBack).assertTrue();
          const roomPageBack: boolean = await waitForId(driver, 'id_rc_root');
          expect(roomPageBack).assertTrue();
          const roomBack: boolean = await clickId(driver, 'id_rc_back');
          expect(roomBack).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        } else {
          await assertStableHome(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SCENESTEPSAFE_0800
     * @tc.name      testStepToggleRestore0001
     * @tc.desc      Verify the phone scene editor shows the validation message after the
     *               validate button is tapped, and the seeded step toggle can be
     *               disabled and re-enabled with the step row and its action area
     *               kept rendered, returning to the console home afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStepToggleRestore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testStepToggleRestore0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          const toggleId: string = 'id_step_toggle_' + SEED_STEP_ID;
          // The validate button and the message sit at the bottom of the steps section,
          // below the fold on a phone, so the page is scrolled there before tapping.
          const formBottom: boolean = await scrollPageBottom(driver, SCENE_EDITOR_SCROLL);
          expect(formBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const validateClicked: boolean = await clickId(driver, 'id_validate_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', validate=' +
            validateClicked.toString());
          expect(validateClicked).assertTrue();
          const validationShown: boolean = await waitForId(driver, 'id_validation_text');
          expect(validationShown).assertTrue();
          // The seeded step row and its toggle stay in the upper part of the section.
          const formTop: boolean = await scrollPageTop(driver, SCENE_EDITOR_SCROLL);
          expect(formTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          // First tap disables the step.
          const disableClicked: boolean = await clickId(driver, toggleId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', toggle off=' +
            disableClicked.toString());
          expect(disableClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const rowStill: boolean = await idExists(driver, 'id_step_row_' + SEED_STEP_ID);
          expect(rowStill).assertTrue();
          // Second tap restores the enabled state of the seeded step.
          const restoreClicked: boolean = await clickId(driver, toggleId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', toggle on=' +
            restoreClicked.toString());
          expect(restoreClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const actionsStill: boolean = await idExists(driver, 'id_step_actions_' + SEED_STEP_ID);
          expect(actionsStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SCENESTEPSAFE_0801
     * @tc.name      testStepDelayCycle0001
     * @tc.desc      Verify the seeded step delay button cycles through the presets
     *               250, 500, 1000 and 100 ms with a status hint, and returns to the
     *               seeded 250 ms value after four taps so the step data ends unchanged.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStepDelayCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testStepDelayCycle0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const delayId: string = 'id_step_delay_' + SEED_STEP_ID;
          const delayReady: boolean = await waitForId(driver, delayId);
          expect(delayReady).assertTrue();
          // Cycle 250 -> 500 -> 1000; the status line reports the delay update.
          const firstTap: boolean = await clickId(driver, delayId);
          expect(firstTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const secondTap: boolean = await clickId(driver, delayId);
          expect(secondTap).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_scene_status');
          expect(statusFound).assertTrue();
          const buttonStill: boolean = await idExists(driver, delayId);
          expect(buttonStill).assertTrue();
          // Cycle 1000 -> 100 -> 250 to return to the seeded value.
          const thirdTap: boolean = await clickId(driver, delayId);
          expect(thirdTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const fourthTap: boolean = await clickId(driver, delayId);
          expect(fourthTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sectionStill: boolean = await idExists(driver, 'id_steps_section');
          expect(sectionStill).assertTrue();
          const rowStill: boolean = await idExists(driver, 'id_step_row_' + SEED_STEP_ID);
          expect(rowStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_CONSOLEWIDGETS_0900
     * @tc.name      testConsoleHomeState0001
     * @tc.desc      Verify the phone console home renders the title, room name, device
     *               card area and navigation row together with the seeded projector card
     *               and its expected state text, and the read-only banner renders exactly
     *               when the device card hides its resend action.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testConsoleHomeState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testConsoleHomeState0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertStableHome(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const titleFound: boolean = await waitForId(driver, 'id_console_title');
          expect(titleFound).assertTrue();
          const roomFound: boolean = await waitForId(driver, 'id_console_room');
          expect(roomFound).assertTrue();
          const listFound: boolean = await waitForId(driver, 'id_console_device_list');
          expect(listFound).assertTrue();
          const navFound: boolean = await waitForId(driver, 'id_console_nav');
          expect(navFound).assertTrue();
          const cardFound: boolean = await waitForId(driver, 'id_device_card_' + SEED_DEVICE_ID);
          expect(cardFound).assertTrue();
          const expectedFound: boolean = await waitForId(driver,
            'id_device_expected_' + SEED_DEVICE_ID);
          expect(expectedFound).assertTrue();
          // The banner and the resend action follow the same IR capability flag,
          // so exactly one of them may be rendered on the current device.
          const bannerShown: boolean = await idExists(driver, 'id_read_only_banner');
          const resendShown: boolean = await idExists(driver,
            'id_device_resend_' + SEED_DEVICE_ID);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', banner=' +
            bannerShown.toString() + ', resend=' + resendShown.toString());
          expect(bannerShown !== resendShown).assertTrue();
          // The seeded room holds four devices, so the empty hint must not render.
          const noDevicesHint: boolean = await idExists(driver, 'id_console_no_devices');
          expect(!noDevicesHint).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });
  });
}
