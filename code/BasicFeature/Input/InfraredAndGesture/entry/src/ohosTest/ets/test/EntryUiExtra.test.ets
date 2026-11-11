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

/** Suite-level tag, only used by the beforeAll bracket log of this suite. */
const SUITE_TAG: string = '[Sample_MeetingScene_EntryExtra]';
/** Hilog domain shared with the other MeetingScene UI suites. */
const DOMAIN: number = 0xF811;
/** Bundle keyword prefixed to every log line so this suite can be grepped alone. */
const BUNDLE: string = 'MeetingScene_EntryExtra_';
/** Bundle name of the sample under test. */
const BUNDLE_NAME: string = 'com.samples.infraredandgesture';
/** Entry ability of the sample under test. */
const ABILITY_NAME: string = 'EntryAbility';
/** Device type value reported by tablets; every other value uses the phone page set. */
const TABLET_DEVICE: string = 'tablet';
/** Upper bound for every component wait; a case never waits without a limit. */
const WAIT_TIMEOUT_MS: number = 3000;
/** Delay after startAbility before the landing page is expected to be ready. */
const LAUNCH_DELAY_MS: number = 2000;
/** Short pause after a tap so state-driven UI refreshes before existence checks. */
const CLICK_SETTLE_MS: number = 350;
/** Fast programmatic scroll speed, in px/s, to keep long forms inside the case budget. */
const SCROLL_SPEED: number = 20000;

/** Root container id of the phone console home. */
const CONSOLE_ROOT: string = 'id_console_root';
/** Root container id of the tablet orchestration home. */
const ORCH_ROOT: string = 'id_orch_root';
/** Root container id of the redirect placeholder of the entry page. */
const INDEX_ROOT: string = 'id_index_root';
/** Root container id of the phone room configuration page. */
const ROOM_CONFIG_ROOT: string = 'id_room_config_root';
/** Root container id of the phone scene editor page. */
const SCENE_EDITOR_ROOT: string = 'id_scene_editor_root';
/** Root container id of the phone settings page. */
const SETTINGS_ROOT: string = 'id_settings_root';
/** Root container id of the tablet room configuration page. */
const RC_ROOT: string = 'id_rc_root';
/** Root container id of the tablet scene editor page. */
const OEN_ROOT: string = 'id_oen_root';
/** Root container id of the tablet configuration transfer page. */
const XFER_ROOT: string = 'id_xfer_root';
/** Seeded room id shipped with the demo configuration. */
const SEED_ROOM_ID: string = 'room-default';
/** Seeded projector device id shipped with the demo configuration. */
const SEED_PROJECTOR_ID: string = 'dev-projector';
/** Seeded screen device id shipped with the demo configuration. */
const SEED_SCREEN_ID: string = 'dev-screen';
/** Seeded light device id shipped with the demo configuration. */
const SEED_LIGHT_ID: string = 'dev-light';
/** Seeded air conditioner device id shipped with the demo configuration. */
const SEED_AC_ID: string = 'dev-ac';
/** Seeded scene id shipped with the demo configuration. */
const SEED_SCENE_ID: string = 'scene-meeting';
/** First seeded scene step id. */
const SEED_STEP_0: string = 'step-meeting-0';
/** Second seeded scene step id. */
const SEED_STEP_1: string = 'step-meeting-1';
/** Third seeded scene step id. */
const SEED_STEP_2: string = 'step-meeting-2';
/** Fourth seeded scene step id. */
const SEED_STEP_3: string = 'step-meeting-3';
/** Scroll container id of the phone console home. */
const CONSOLE_SCROLL: string = 'id_console_scroll';
/** Scroll container id of the phone room configuration page. */
const ROOM_SCROLL: string = 'id_room_scroll';
/** Scroll container id of the phone scene editor page. */
const SCENE_SCROLL: string = 'id_scene_scroll';
/** Scroll container id of the tablet orchestration home. */
const INDEX_SCROLL: string = 'id_index_scroll';
/** Close button id of the entry redirect placeholder (declared for guard checks). */
const ENTERING_HINT: string = 'id_entering_console';

async function waitForId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null =
    await driver.waitForComponent(ON.id(id), WAIT_TIMEOUT_MS);
  return component !== null;
}

async function findNow(driver: Driver, id: string): Promise<Component | null> {
  return driver.findComponent(ON.id(id));
}

/** Returns whether the id exists right now, without waiting for it. */
async function idExists(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findNow(driver, id);
  return component !== null;
}

/** Taps the component with the given id and reports whether it was found. */
async function clickId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findNow(driver, id);
  if (component === null) {
    return false;
  }
  await component.click();
  return true;
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

/** Waits for the current form's home root of either device form. */
async function waitForAnyHome(driver: Driver, isTablet: boolean): Promise<boolean> {
  const primary: boolean = await waitForId(driver, isTablet ? ORCH_ROOT : CONSOLE_ROOT);
  if (primary) {
    return true;
  }
  return waitForId(driver, isTablet ? CONSOLE_ROOT : ORCH_ROOT);
}

/** Types text into the component with the given id; reports whether it was found. */
async function inputId(driver: Driver, id: string, text: string): Promise<boolean> {
  const component: Component | null = await findNow(driver, id);
  if (component === null) {
    return false;
  }
  await component.inputText(text);
  return true;
}

/** Clears the text of the component with the given id; reports whether it was found. */
async function clearId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findNow(driver, id);
  if (component === null) {
    return false;
  }
  await component.clearText();
  return true;
}

/** Opens the phone room configuration page and waits for its root. */
async function openPhoneRoomConfig(driver: Driver): Promise<boolean> {
  const tapped: boolean = await clickId(driver, 'id_nav_room_config');
  if (!tapped) {
    return false;
  }
  return waitForId(driver, ROOM_CONFIG_ROOT);
}

/** Opens the phone scene editor page and waits for its root. */
async function openPhoneSceneEditor(driver: Driver): Promise<boolean> {
  const tapped: boolean = await clickId(driver, 'id_nav_scene_editor');
  if (!tapped) {
    return false;
  }
  return waitForId(driver, SCENE_EDITOR_ROOT);
}

/** Opens the phone settings page and waits for its root. */
async function openPhoneSettings(driver: Driver): Promise<boolean> {
  const tapped: boolean = await clickId(driver, 'id_nav_settings');
  if (!tapped) {
    return false;
  }
  return waitForId(driver, SETTINGS_ROOT);
}

/** Opens the tablet transfer page and waits for its root. */
async function openTabletTransfer(driver: Driver): Promise<boolean> {
  const tapped: boolean = await clickId(driver, 'id_index_transfer');
  if (!tapped) {
    return false;
  }
  return waitForId(driver, XFER_ROOT);
}

/** Opens the tablet room configuration page of the seeded room and waits for its root. */
async function openTabletRoomConfig(driver: Driver): Promise<boolean> {
  const tapped: boolean = await clickId(driver, 'id_index_room_enter_' + SEED_ROOM_ID);
  if (!tapped) {
    return false;
  }
  return waitForId(driver, RC_ROOT);
}

/** Enters the tablet scene editor through the room page and waits for its root. */
async function openTabletSceneEditor(driver: Driver): Promise<boolean> {
  const roomOpened: boolean = await openTabletRoomConfig(driver);
  if (!roomOpened) {
    return false;
  }
  const tapped: boolean = await clickId(driver, 'id_rc_scene_entry');
  if (!tapped) {
    return false;
  }
  return waitForId(driver, OEN_ROOT);
}

/** Asserts a list of ids one by one and logs the outcome of each probe. */
async function assertIdsPresent(driver: Driver, ids: string[], tag: string): Promise<void> {
  for (let i = 0; i < ids.length; i++) {
    const found: boolean = await waitForId(driver, ids[i]);
    hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', id=' + ids[i] +
      ', found=' + found.toString());
    expect(found).assertTrue();
  }
}

/** Counts how many of the given ids exist right now. */
async function countExisting(driver: Driver, ids: string[]): Promise<number> {
  let count: number = 0;
  for (let i = 0; i < ids.length; i++) {
    const found: boolean = await idExists(driver, ids[i]);
    if (found) {
      count++;
    }
  }
  return count;
}

export default function entryUiExtraTest() {
  describe('EntryUiExtraTest', () => {
    const isTablet: boolean = deviceInfo.deviceType === TABLET_DEVICE;
    /** Home root that must be shown on the current device form. */
    const homeId: string = isTablet ? ORCH_ROOT : CONSOLE_ROOT;
    /** Widgets of the phone console home that must stay stable on a tablet run. */
    const phoneStableIds: string[] =
      [CONSOLE_ROOT, 'id_console_header', 'id_console_title', 'id_console_nav'];
    /** Widgets of the tablet orchestration home that must stay stable on a phone run. */
    const tabletStableIds: string[] =
      [ORCH_ROOT, 'id_index_title', 'id_index_notice', 'id_index_rooms_section'];
    /** Seeded devices rendered as device cards on the phone console home. */
    const seedDeviceIds: string[] = [SEED_PROJECTOR_ID, SEED_SCREEN_ID, SEED_LIGHT_ID, SEED_AC_ID];
    /** Seeded scene steps rendered by the phone scene editor. */
    const seedStepIds: string[] = [SEED_STEP_0, SEED_STEP_1, SEED_STEP_2, SEED_STEP_3];
    let driver: Driver = Driver.create();

    beforeAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await driver.delayMs(LAUNCH_DELAY_MS);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ENTRYGUARD_1000
     * @tc.name      testEntryRouteForm0001
     * @tc.desc      Verify the entry page routes to exactly one page set: the console home
     *               on phones or the orchestration home on tablets, that the other set is
     *               absent at the same time, and that a re-launch of the ability keeps the
     *               same routing decision.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEntryRouteForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testEntryRouteForm0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const routed: boolean = await waitForId(driver, homeId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', deviceType=' +
          deviceInfo.deviceType + ', home=' + homeId + ', routed=' + routed.toString());
        expect(routed).assertTrue();
        // The routed root must be the one derived from the reported device form.
        expect(homeId).assertEqual(isTablet ? ORCH_ROOT : CONSOLE_ROOT);
        const otherRootExists: boolean =
          await idExists(driver, isTablet ? CONSOLE_ROOT : ORCH_ROOT);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', other root=' +
          otherRootExists.toString());
        expect(!otherRootExists).assertTrue();
        // The redirect placeholder must be gone once routing finished.
        const placeholderGone: boolean = !(await idExists(driver, INDEX_ROOT));
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', placeholder gone=' +
          placeholderGone.toString());
        expect(placeholderGone).assertTrue();
        // Re-launching the ability must land on the same home root again.
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
        await driver.delayMs(LAUNCH_DELAY_MS);
        const routedAgain: boolean = await waitForId(driver, homeId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', routed again=' +
          routedAgain.toString());
        expect(routedAgain).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ENTRYGUARD_1001
     * @tc.name      testEntryHomeWidgets0001
     * @tc.desc      Verify the routed home root coexists with a full set of home widgets on
     *               each form: title, header, content and scroll containers on the phone
     *               console, title, notice row, room section and scroll on the tablet home.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEntryHomeWidgets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testEntryHomeWidgets0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
          await assertIdsPresent(driver,
            ['id_index_content', INDEX_SCROLL, 'id_index_rooms_title', 'id_index_rooms_grid'], TAG);
          const noticeRow: boolean = await idExists(driver, 'id_index_notice_row');
          expect(noticeRow).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
          await assertIdsPresent(driver,
            ['id_console_content', CONSOLE_SCROLL, 'id_console_devices_title',
              'id_console_device_list'], TAG);
          const roomLabel: boolean = await idExists(driver, 'id_console_room');
          expect(roomLabel).assertTrue();
        }
        // Sending the home scroll container to the bottom and back must not drop the root.
        const scrollId: string = isTablet ? INDEX_SCROLL : CONSOLE_SCROLL;
        const toBottom: boolean = await scrollPageBottom(driver, scrollId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scroll bottom=' +
          toBottom.toString());
        expect(toBottom).assertTrue();
        await driver.delayMs(CLICK_SETTLE_MS);
        const toTop: boolean = await scrollPageTop(driver, scrollId);
        expect(toTop).assertTrue();
        await driver.delayMs(CLICK_SETTLE_MS);
        const homeStill: boolean = await idExists(driver, homeId);
        expect(homeStill).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ENTRYGUARD_1002
     * @tc.name      testEntryCrossFormGuard0001
     * @tc.desc      Verify the page set of the other device form is never mounted: the phone
     *               console ids stay absent on a tablet and the tablet orchestration ids
     *               stay absent on a phone, checked twice with a settle pause in between.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEntryCrossFormGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testEntryCrossFormGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const foreignIds: string[] = isTablet ?
          ['id_console_title', 'id_console_header', 'id_console_nav', CONSOLE_SCROLL] :
          ['id_index_title', 'id_index_notice', 'id_index_rooms_grid', INDEX_SCROLL];
        const foreignCount: number = await countExisting(driver, foreignIds);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', foreign=' +
          (isTablet ? 'phone' : 'tablet') + ', present=' + foreignCount.toString());
        expect(foreignCount).assertEqual(0);
        await driver.delayMs(CLICK_SETTLE_MS);
        const foreignCountAgain: number = await countExisting(driver, foreignIds);
        expect(foreignCountAgain).assertEqual(0);
        const homeFound: boolean = await waitForId(driver, homeId);
        expect(homeFound).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ENTRYGUARD_1003
     * @tc.name      testEntryStableStartId0001
     * @tc.desc      Verify a non-target case keeps the visible page set stable: when a phone
     *               only page is skipped because the run is on a tablet (or the reverse),
     *               the start page widgets are probed and must all still be mounted.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEntryStableStartId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testEntryStableStartId0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const startIds: string[] = isTablet ? tabletStableIds : phoneStableIds;
        await assertIdsPresent(driver, startIds, TAG);
        // The entry redirect placeholder must never reappear after the landing page loaded.
        const placeholder: boolean = await idExists(driver, INDEX_ROOT);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', placeholder=' +
          placeholder.toString());
        expect(!placeholder).assertTrue();
        const hint: boolean = await idExists(driver, ENTERING_HINT);
        expect(!hint).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONECONSOLE_1100
     * @tc.name      testConsoleDeviceCards0001
     * @tc.desc      Verify the phone console home renders one card per seeded device with the
     *               name, type and expected-state widgets of every card, and that the empty
     *               hint stays hidden while the seeded room holds devices.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testConsoleDeviceCards0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testConsoleDeviceCards0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const listFound: boolean = await waitForId(driver, 'id_console_device_list');
          expect(listFound).assertTrue();
          for (let i = 0; i < seedDeviceIds.length; i++) {
            const deviceId: string = seedDeviceIds[i];
            const cardIds: string[] = [
              'id_device_card_' + deviceId,
              'id_device_header_' + deviceId,
              'id_device_name_' + deviceId,
              'id_device_type_' + deviceId,
              'id_device_expected_' + deviceId,
              'id_device_meta_' + deviceId,
              'id_device_correct_' + deviceId
            ];
            const cardCount: number = await countExisting(driver, cardIds);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', device=' + deviceId +
              ', widgets=' + cardCount.toString());
            expect(cardCount).assertEqual(cardIds.length);
          }
          const emptyHint: boolean = await idExists(driver, 'id_console_no_devices');
          expect(!emptyHint).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONECONSOLE_1101
     * @tc.name      testConsoleSceneBar0001
     * @tc.desc      Verify the phone console renders the scene bar with the seeded scene
     *               button, and that the read-only banner, the scene bar and the resend
     *               action follow their documented visibility guards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testConsoleSceneBar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testConsoleSceneBar0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const barFound: boolean = await waitForId(driver, 'id_scene_bar');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scene bar=' +
            barFound.toString());
          expect(barFound).assertTrue();
          const itemFound: boolean = await waitForId(driver, 'id_scene_item_' + SEED_SCENE_ID);
          expect(itemFound).assertTrue();
          const buttonFound: boolean = await waitForId(driver, 'id_scene_' + SEED_SCENE_ID);
          expect(buttonFound).assertTrue();
          // The banner and the resend action share the same IR capability flag.
          const bannerShown: boolean = await idExists(driver, 'id_read_only_banner');
          const bannerText: boolean = await idExists(driver, 'id_read_only_text');
          const resendShown: boolean = await idExists(driver,
            'id_device_resend_' + SEED_PROJECTOR_ID);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', banner=' +
            bannerShown.toString() + ', text=' + bannerText.toString() +
            ', resend=' + resendShown.toString());
          expect(bannerShown).assertEqual(bannerText);
          expect(bannerShown !== resendShown).assertTrue();
          // The run progress panel only exists after a run, so it must be absent now.
          const progress: boolean = await idExists(driver, 'id_run_progress_panel');
          expect(!progress).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONECONSOLE_1102
     * @tc.name      testConsoleToastGuard0001
     * @tc.desc      Verify the console send-result toast is not mounted on a freshly opened
     *               console page, so no result message leaks from an earlier run, and that
     *               the three navigation entries are present at the same time.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConsoleToastGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testConsoleToastGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const toastShown: boolean = await idExists(driver, 'id_send_toast');
          const toastText: boolean = await idExists(driver, 'id_send_toast_text');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', toast=' +
            toastShown.toString() + ', text=' + toastText.toString());
          expect(!toastShown).assertTrue();
          expect(!toastText).assertTrue();
          const navIds: string[] =
            ['id_console_nav', 'id_nav_room_config', 'id_nav_scene_editor', 'id_nav_settings'];
          const navCount: number = await countExisting(driver, navIds);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', nav widgets=' +
            navCount.toString());
          expect(navCount).assertEqual(navIds.length);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONEROOMNAME_1200
     * @tc.name      testRoomNameBlankGuard0001
     * @tc.desc      Verify the phone room configuration page rejects a whitespace-only room
     *               name: after typing blanks into the name input the create action still
     *               shows the required-name hint and the seeded room row stays intact.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomNameBlankGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomNameBlankGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          const statusBefore: boolean = await idExists(driver, 'id_room_status');
          expect(!statusBefore).assertTrue();
          const typed: boolean = await inputId(driver, 'id_new_room_input', '   ');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', typed blanks=' + typed.toString());
          expect(typed).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const clicked: boolean = await clickId(driver, 'id_new_room_button');
          expect(clicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          // The seeded room row must survive the rejected creation.
          const seedRow: boolean = await idExists(driver, 'id_room_row_' + SEED_ROOM_ID);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', seed row=' +
            seedRow.toString());
          expect(seedRow).assertTrue();
          await clearId(driver, 'id_new_room_input');
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONEROOMNAME_1201
     * @tc.name      testRoomCreateRollback0001
     * @tc.desc      Verify a created room appears next to the seeded rows and that the
     *               seeded row keeps its name, enter and delete widgets, so the phone
     *               room list stays intact around the insertion.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomCreateRollback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomCreateRollback0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          expect(opened).assertTrue();
          const statusBefore: boolean = await idExists(driver, 'id_room_status');
          expect(!statusBefore).assertTrue();
          // The seeded room renders its full row of name, enter and delete widgets.
          const seedRowsBefore: number = await countExisting(driver,
            ['id_room_row_' + SEED_ROOM_ID, 'id_room_enter_' + SEED_ROOM_ID,
              'id_room_name_' + SEED_ROOM_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', seed widgets before=' +
            seedRowsBefore.toString());
          expect(seedRowsBefore).assertEqual(3);
          const typed: boolean = await inputId(driver, 'id_new_room_input', 'case-room-placeholder');
          expect(typed).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const created: boolean = await clickId(driver, 'id_new_room_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', create=' + created.toString());
          expect(created).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          // The inserted row renders with the typed name.
          const newRow: Component | null =
            await driver.waitForComponent(ON.text('case-room-placeholder'), WAIT_TIMEOUT_MS);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', new row=' +
            (newRow !== null).toString());
          expect(newRow !== null).assertTrue();
          // The created row does not disturb the seeded row widgets.
          const roomRows: number = await countExisting(driver,
            ['id_room_row_' + SEED_ROOM_ID, 'id_room_enter_' + SEED_ROOM_ID,
              'id_room_name_' + SEED_ROOM_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', seed widgets=' +
            roomRows.toString());
          expect(roomRows).assertEqual(3);
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONEROOMNAME_1202
     * @tc.name      testRoomDeviceSelectGuard0001
     * @tc.desc      Verify the phone room configuration page keeps the key section in its
     *               select-device state before any device is chosen, that the seeded device
     *               rows are listed and that selecting one replaces the hint by a key list
     *               or the no-keys hint.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomDeviceSelectGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomDeviceSelectGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          expect(opened).assertTrue();
          const currentRoom: boolean = await waitForId(driver, 'id_current_room');
          expect(currentRoom).assertTrue();
          const hintFound: boolean = await waitForId(driver, 'id_keys_hint');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', keys hint=' +
            hintFound.toString());
          expect(hintFound).assertTrue();
          const deviceRows: number = await countExisting(driver,
            ['id_device_row_' + SEED_PROJECTOR_ID, 'id_device_row_' + SEED_SCREEN_ID,
              'id_device_row_' + SEED_LIGHT_ID, 'id_device_row_' + SEED_AC_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', device rows=' +
            deviceRows.toString());
          expect(deviceRows).assertEqual(4);
          const selected: boolean = await clickId(driver, 'id_device_select_' + SEED_PROJECTOR_ID);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', select device=' +
            selected.toString());
          expect(selected).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const hintGone: boolean = !(await idExists(driver, 'id_keys_hint'));
          expect(hintGone).assertTrue();
          // After a selection the section shows either the bound keys or the no-keys hint.
          const keysEmpty: boolean = await idExists(driver, 'id_keys_empty');
          const sectionFound: boolean = await idExists(driver, 'id_keys_section');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', keys empty=' +
            keysEmpty.toString() + ', section=' + sectionFound.toString());
          expect(sectionFound).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONEROOMNAME_1203
     * @tc.name      testRoomAddDeviceGuard0001
     * @tc.desc      Verify the add-device form of the phone room page rejects an empty device
     *               name with the enter-name hint, keeps every seeded device row, and that
     *               the type cycle button keeps the form mounted while cycling all types.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomAddDeviceGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomAddDeviceGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          expect(opened).assertTrue();
          const sectionFound: boolean = await waitForId(driver, 'id_devices_section');
          expect(sectionFound).assertTrue();
          // Empty-name guard: submit the add-device form without typing anything.
          const addClicked: boolean = await clickId(driver, 'id_add_device_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', add empty=' +
            addClicked.toString());
          expect(addClicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          const deviceRows: number = await countExisting(driver,
            ['id_device_row_' + SEED_PROJECTOR_ID, 'id_device_row_' + SEED_SCREEN_ID,
              'id_device_row_' + SEED_LIGHT_ID, 'id_device_row_' + SEED_AC_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', device rows=' +
            deviceRows.toString());
          expect(deviceRows).assertEqual(4);
          // Cycling the device type is pure UI state and must not unmount the form row.
          const cycleFound: boolean = await waitForId(driver, 'id_device_type_cycle');
          expect(cycleFound).assertTrue();
          const cycle1: boolean = await clickId(driver, 'id_device_type_cycle');
          expect(cycle1).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const cycle2: boolean = await clickId(driver, 'id_device_type_cycle');
          expect(cycle2).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const rowStill: boolean = await idExists(driver, 'id_new_device_row');
          expect(rowStill).assertTrue();
          const inputStill: boolean = await idExists(driver, 'id_new_device_input');
          expect(inputStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONEROOMNAME_1204
     * @tc.name      testRoomBindGuardOrder0001
     * @tc.desc      Verify the bind-key guard order on the phone room page: with no device
     *               selected the bind action reports the select-device hint, and the key
     *               library selectors plus the read-only test-send hint stay rendered.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomBindGuardOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomBindGuardOrder0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          expect(opened).assertTrue();
          // The bind action sits at the bottom of the keys card; reveal it once.
          const toBottom: boolean = await scrollPageBottom(driver, ROOM_SCROLL);
          expect(toBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const bindFound: boolean = await waitForId(driver, 'id_bind_key_button');
          expect(bindFound).assertTrue();
          const bindClicked: boolean = await clickId(driver, 'id_bind_key_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', bind without device=' +
            bindClicked.toString());
          expect(bindClicked).assertTrue();
          const selectors: number = await countExisting(driver,
            ['id_semantic_select', 'id_brand_select', 'id_code_select']);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', selectors=' +
            selectors.toString());
          expect(selectors).assertEqual(3);
          // Exactly one of the test-send button and the read-only hint must exist.
          const sendButton: boolean = await idExists(driver, 'id_test_send_button');
          const readOnlyHint: boolean = await idExists(driver, 'id_test_send_read_only');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', send=' +
            sendButton.toString() + ', readOnly=' + readOnlyHint.toString());
          expect(sendButton !== readOnlyHint).assertTrue();
          const toTop: boolean = await scrollPageTop(driver, ROOM_SCROLL);
          expect(toTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const statusFound: boolean = await idExists(driver, 'id_room_status');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status=' +
            statusFound.toString());
          expect(statusFound).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONEROOMNAME_1205
     * @tc.name      testRoomPackageGuard0001
     * @tc.desc      Verify the package section of the phone room page: export with a selected
     *               room keeps the section mounted, import with an empty or whitespace path
     *               reports the enter-path hint and never produces an import summary.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoomPackageGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testRoomPackageGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneRoomConfig(driver);
          expect(opened).assertTrue();
          const toBottom: boolean = await scrollPageBottom(driver, ROOM_SCROLL);
          expect(toBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sectionFound: boolean = await waitForId(driver, 'id_config_package_section');
          expect(sectionFound).assertTrue();
          const titleFound: boolean = await idExists(driver, 'id_config_package_title');
          expect(titleFound).assertTrue();
          const exportFound: boolean = await idExists(driver, 'id_export_room_button');
          expect(exportFound).assertTrue();
          const importInput: boolean = await idExists(driver, 'id_import_path_input');
          expect(importInput).assertTrue();
          const importClicked: boolean = await clickId(driver, 'id_import_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', import empty=' +
            importClicked.toString());
          expect(importClicked).assertTrue();
          const toTop: boolean = await scrollPageTop(driver, ROOM_SCROLL);
          expect(toTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          // A rejected empty path must not create an import summary.
          const summary: boolean = await idExists(driver, 'id_import_summary');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', import summary=' +
            summary.toString());
          expect(!summary).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1300
     * @tc.name      testSceneRoomSwitchGuard0001
     * @tc.desc      Verify the room switcher of the phone scene editor: the seeded room is
     *               preselected, its chip re-selects the same room without dropping the scene
     *               list, the step list or the validation area.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneRoomSwitchGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneRoomSwitchGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          const roomList: boolean = await waitForId(driver, 'id_scene_room_list');
          expect(roomList).assertTrue();
          const chipId: string = 'id_scene_room_' + SEED_ROOM_ID;
          const chipFound: boolean = await waitForId(driver, chipId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room chip=' +
            chipFound.toString());
          expect(chipFound).assertTrue();
          const reselected: boolean = await clickId(driver, chipId);
          expect(reselected).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sceneRow: boolean = await waitForId(driver, 'id_scene_row_' + SEED_SCENE_ID);
          expect(sceneRow).assertTrue();
          const stepFound: boolean = await waitForId(driver, 'id_step_row_' + SEED_STEP_0);
          expect(stepFound).assertTrue();
          const sections: number = await countExisting(driver,
            ['id_scene_rooms_section', 'id_scenes_section', 'id_steps_section']);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', sections=' +
            sections.toString());
          expect(sections).assertEqual(3);
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1301
     * @tc.name      testSceneStepListShape0001
     * @tc.desc      Verify the phone scene editor renders one row per seeded step, each row
     *               carrying its number, device, key, delay button and the four action
     *               chips, and that the validation message is hidden before any run.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneStepListShape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testSceneStepListShape0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const validationBefore: boolean = await idExists(driver, 'id_validation_text');
          expect(!validationBefore).assertTrue();
          for (let i = 0; i < seedStepIds.length; i++) {
            const stepId: string = seedStepIds[i];
            const rowIds: string[] = [
              'id_step_row_' + stepId,
              'id_step_line_' + stepId,
              'id_step_no_' + stepId,
              'id_step_device_' + stepId,
              'id_step_key_' + stepId,
              'id_step_delay_' + stepId,
              'id_step_actions_' + stepId,
              'id_step_toggle_' + stepId,
              'id_step_up_' + stepId,
              'id_step_down_' + stepId,
              'id_step_remove_' + stepId
            ];
            const rowCount: number = await countExisting(driver, rowIds);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', step=' + stepId +
              ', widgets=' + rowCount.toString());
            expect(rowCount).assertEqual(rowIds.length);
          }
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1302
     * @tc.name      testSceneBoundaryButtons0001
     * @tc.desc      Verify the boundary semantics of the seeded step order: moving the first
     *               step up and the last step down are silently ignored, so both rows keep
     *               their identity and the step list shape stays complete.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneBoundaryButtons0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneBoundaryButtons0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const firstUp: boolean = await waitForId(driver, 'id_step_up_' + SEED_STEP_0);
          expect(firstUp).assertTrue();
          // Moving the first row up is out of range: the handler returns without a write.
          const upClicked: boolean = await clickId(driver, 'id_step_up_' + SEED_STEP_0);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', first up=' +
            upClicked.toString());
          expect(upClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          // The last seeded row is the fourth one; scrolling down reveals its chips.
          const toBottom: boolean = await scrollPageBottom(driver, SCENE_SCROLL);
          expect(toBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const lastDown: boolean = await idExists(driver, 'id_step_down_' + SEED_STEP_3);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', last down=' +
            lastDown.toString());
          expect(lastDown).assertTrue();
          const downClicked: boolean = await clickId(driver, 'id_step_down_' + SEED_STEP_3);
          expect(downClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          // Neither out-of-range tap may create a status message or validation text.
          const statusShown: boolean = await idExists(driver, 'id_scene_status');
          const validationShown: boolean = await idExists(driver, 'id_validation_text');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status=' +
            statusShown.toString() + ', validation=' + validationShown.toString());
          expect(!statusShown).assertTrue();
          expect(!validationShown).assertTrue();
          const toTop: boolean = await scrollPageTop(driver, SCENE_SCROLL);
          expect(toTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const rows: number = await countExisting(driver,
            ['id_step_row_' + SEED_STEP_0, 'id_step_row_' + SEED_STEP_1,
              'id_step_row_' + SEED_STEP_2, 'id_step_row_' + SEED_STEP_3]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', rows=' + rows.toString());
          expect(rows).assertEqual(4);
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1303
     * @tc.name      testSceneDelayCycleFull0001
     * @tc.desc      Verify the seeded step delay button runs through the full preset ring of
     *               four values with an equal number of taps, ending on the seeded value and
     *               leaving the step row and its action chips untouched.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneDelayCycleFull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneDelayCycleFull0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const delayId: string = 'id_step_delay_' + SEED_STEP_1;
          const delayFound: boolean = await waitForId(driver, delayId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', delay btn=' +
            delayFound.toString());
          expect(delayFound).assertTrue();
          // Four taps walk the ring back to the seeded 250 ms value.
          for (let tap: number = 1; tap <= 4; tap++) {
            const tapped: boolean = await clickId(driver, delayId);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', tap=' +
              tap.toString() + ', ok=' + tapped.toString());
            expect(tapped).assertTrue();
            await driver.delayMs(CLICK_SETTLE_MS);
            const stillThere: boolean = await idExists(driver, delayId);
            expect(stillThere).assertTrue();
          }
          const statusFound: boolean = await idExists(driver, 'id_scene_status');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status=' +
            statusFound.toString());
          expect(statusFound).assertTrue();
          const chips: number = await countExisting(driver,
            ['id_step_actions_' + SEED_STEP_1, 'id_step_toggle_' + SEED_STEP_1,
              'id_step_remove_' + SEED_STEP_1]);
          expect(chips).assertEqual(3);
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1304
     * @tc.name      testSceneStepToggleTwice0001
     * @tc.desc      Verify the seeded step toggle switches the row to the disabled state and
     *               back within two taps, that the row keeps all of its widgets in between
     *               and that no validation message is produced by the toggles.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneStepToggleTwice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneStepToggleTwice0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const toggleId: string = 'id_step_toggle_' + SEED_STEP_2;
          const toggleFound: boolean = await waitForId(driver, toggleId);
          expect(toggleFound).assertTrue();
          const disableTap: boolean = await clickId(driver, toggleId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', toggle off=' +
            disableTap.toString());
          expect(disableTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const rowAfterOff: boolean = await idExists(driver, 'id_step_row_' + SEED_STEP_2);
          expect(rowAfterOff).assertTrue();
          const lineAfterOff: boolean = await idExists(driver, 'id_step_line_' + SEED_STEP_2);
          expect(lineAfterOff).assertTrue();
          const enableTap: boolean = await clickId(driver, toggleId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', toggle on=' +
            enableTap.toString());
          expect(enableTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const actionsAfterOn: boolean = await idExists(driver,
            'id_step_actions_' + SEED_STEP_2);
          expect(actionsAfterOn).assertTrue();
          const validation: boolean = await idExists(driver, 'id_validation_text');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', validation=' +
            validation.toString());
          expect(!validation).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1305
     * @tc.name      testSceneValidationReset0001
     * @tc.desc      Verify the validation text of the phone scene editor is cleared by the
     *               next step edit: validating shows the message, then toggling a step wipes
     *               it again, proving the reset path runs after every mutating action.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneValidationReset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneValidationReset0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSceneEditor(driver);
          expect(opened).assertTrue();
          const toBottom: boolean = await scrollPageBottom(driver, SCENE_SCROLL);
          expect(toBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const validated: boolean = await clickId(driver, 'id_validate_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', validate=' +
            validated.toString());
          expect(validated).assertTrue();
          const validationShown: boolean = await waitForId(driver, 'id_validation_text');
          expect(validationShown).assertTrue();
          const toTop: boolean = await scrollPageTop(driver, SCENE_SCROLL);
          expect(toTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const toggled: boolean = await clickId(driver, 'id_step_toggle_' + SEED_STEP_0);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', toggle=' +
            toggled.toString());
          expect(toggled).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const validationGone: boolean = !(await idExists(driver, 'id_validation_text'));
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', validation gone=' +
            validationGone.toString());
          expect(validationGone).assertTrue();
          const rowStill: boolean = await idExists(driver, 'id_step_row_' + SEED_STEP_0);
          expect(rowStill).assertTrue();
          // Restore the seeded enabled state of the first step.
          const restored: boolean = await clickId(driver, 'id_step_toggle_' + SEED_STEP_0);
          expect(restored).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const backClicked: boolean = await clickId(driver, 'id_scene_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESCENE_1306
     * @tc.name      testSceneEditorReentry0001
     * @tc.desc      Verify the phone scene editor survives a leave-and-reenter cycle: the
     *               page is closed with the back button and opened again, and the preselected
     *               scene, the step rows and the status area behave the same way twice.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneEditorReentry0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSceneEditorReentry0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          for (let round: number = 1; round <= 2; round++) {
            const homeFound: boolean = await waitForId(driver, homeId);
            expect(homeFound).assertTrue();
            const opened: boolean = await openPhoneSceneEditor(driver);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', round=' +
              round.toString() + ', open=' + opened.toString());
            expect(opened).assertTrue();
            const header: boolean = await waitForId(driver, 'id_scene_header');
            expect(header).assertTrue();
            const sceneRow: boolean = await waitForId(driver, 'id_scene_name_' + SEED_SCENE_ID);
            expect(sceneRow).assertTrue();
            const steps: number = await countExisting(driver,
              ['id_step_row_' + SEED_STEP_0, 'id_step_row_' + SEED_STEP_3]);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', round=' +
              round.toString() + ', step rows=' + steps.toString());
            expect(steps).assertEqual(2);
            const backClicked: boolean = await clickId(driver, 'id_scene_back');
            expect(backClicked).assertTrue();
            const homeBack: boolean = await waitForId(driver, homeId);
            expect(homeBack).assertTrue();
          }
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESETTINGS_1400
     * @tc.name      testSettingsPageShape0001
     * @tc.desc      Verify the phone settings page renders its header, the send-log section and
     *               the log panel, that exactly one of the log list and the empty hint is shown,
     *               and that an invalid state text is not mounted on entry.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsPageShape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSettingsPageShape0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const opened: boolean = await openPhoneSettings(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' + opened.toString());
          expect(opened).assertTrue();
          await assertIdsPresent(driver,
            ['id_settings_header', 'id_settings_title', 'id_send_logs_section',
              'id_send_logs_title', 'id_send_log_panel'], TAG);
          const listShown: boolean = await idExists(driver, 'id_log_list');
          const emptyShown: boolean = await idExists(driver, 'id_log_empty');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', list=' +
            listShown.toString() + ', empty=' + emptyShown.toString());
          expect(listShown !== emptyShown).assertTrue();
          const statusShown: boolean = await idExists(driver, 'id_settings_status');
          expect(!statusShown).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_settings_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, homeId);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_PHONESETTINGS_1401
     * @tc.name      testSettingsBackChain0001
     * @tc.desc      Verify the phone navigation chain console -> settings -> room page ->
     *               scene editor keeps the console root alive underneath, so the back button
     *               of every sub page returns to the same console instance.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsBackChain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testSettingsBackChain0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const homeFound: boolean = await waitForId(driver, homeId);
          expect(homeFound).assertTrue();
          const settingsOpened: boolean = await openPhoneSettings(driver);
          expect(settingsOpened).assertTrue();
          const settingsBack: boolean = await clickId(driver, 'id_settings_back');
          expect(settingsBack).assertTrue();
          const homeAfterSettings: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(homeAfterSettings).assertTrue();
          const roomOpened: boolean = await openPhoneRoomConfig(driver);
          expect(roomOpened).assertTrue();
          const roomBack: boolean = await clickId(driver, 'id_room_back');
          expect(roomBack).assertTrue();
          const homeAfterRoom: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(homeAfterRoom).assertTrue();
          const sceneOpened: boolean = await openPhoneSceneEditor(driver);
          expect(sceneOpened).assertTrue();
          const sceneBack: boolean = await clickId(driver, 'id_scene_back');
          expect(sceneBack).assertTrue();
          const homeAfterScene: boolean = await waitForId(driver, CONSOLE_ROOT);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', home after scene=' +
            homeAfterScene.toString());
          expect(homeAfterScene).assertTrue();
          // The console content must be intact after the whole chain.
          const contentIds: number = await countExisting(driver,
            ['id_console_title', 'id_console_device_list', 'id_console_nav']);
          expect(contentIds).assertEqual(3);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETORCH_1500
     * @tc.name      testOrchestrationRoomCard0001
     * @tc.desc      Verify the tablet orchestration home renders one card per seeded room with
     *               its name, device counter, scene counter and enter button, and that the
     *               empty hint stays hidden while rooms exist.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOrchestrationRoomCard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testOrchestrationRoomCard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const gridFound: boolean = await waitForId(driver, 'id_index_rooms_grid');
          expect(gridFound).assertTrue();
          const cardIds: string[] = [
            'id_index_room_' + SEED_ROOM_ID,
            'id_index_room_line_' + SEED_ROOM_ID,
            'id_index_room_name_' + SEED_ROOM_ID,
            'id_index_room_devices_' + SEED_ROOM_ID,
            'id_index_room_scenes_' + SEED_ROOM_ID,
            'id_index_room_enter_' + SEED_ROOM_ID
          ];
          const cardCount: number = await countExisting(driver, cardIds);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room widgets=' +
            cardCount.toString());
          expect(cardCount).assertEqual(cardIds.length);
          const emptyHint: boolean = await idExists(driver, 'id_index_rooms_empty');
          expect(!emptyHint).assertTrue();
          const statusShown: boolean = await idExists(driver, 'id_index_status');
          expect(!statusShown).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETORCH_1501
     * @tc.name      testOrchestrationCreateGuard0001
     * @tc.desc      Verify the tablet room creation form shows the required-name hint for an
     *               empty name and for a whitespace-only name, and that the seeded room card
     *               survives both rejected submissions.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOrchestrationCreateGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testOrchestrationCreateGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const inputFound: boolean = await waitForId(driver, 'id_index_new_room_input');
          expect(inputFound).assertTrue();
          const emptySubmit: boolean = await clickId(driver, 'id_index_create_room');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', empty submit=' +
            emptySubmit.toString());
          expect(emptySubmit).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_index_status');
          expect(statusFound).assertTrue();
          const typed: boolean = await inputId(driver, 'id_index_new_room_input', '  ');
          expect(typed).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const blankSubmit: boolean = await clickId(driver, 'id_index_create_room');
          expect(blankSubmit).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const statusStill: boolean = await idExists(driver, 'id_index_status');
          expect(statusStill).assertTrue();
          const seedCard: boolean = await idExists(driver,
            'id_index_room_name_' + SEED_ROOM_ID);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', seed card=' +
            seedCard.toString());
          expect(seedCard).assertTrue();
          await clearId(driver, 'id_index_new_room_input');
          const rowStill: boolean = await idExists(driver, 'id_index_new_room_row');
          expect(rowStill).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETORCH_1502
     * @tc.name      testOrchestrationScrollStable0001
     * @tc.desc      Verify the tablet home keeps its room section and grid mounted while the
     *               page scroll container moves to the bottom and back, and that the transfer
     *               button is reachable in both positions.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOrchestrationScrollStable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testOrchestrationScrollStable0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const toBottom: boolean = await scrollPageBottom(driver, INDEX_SCROLL);
          expect(toBottom).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sectionBottom: boolean = await idExists(driver, 'id_index_rooms_section');
          expect(sectionBottom).assertTrue();
          const buttonBottom: boolean = await idExists(driver, 'id_index_transfer');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', transfer@bottom=' +
            buttonBottom.toString());
          const toTop: boolean = await scrollPageTop(driver, INDEX_SCROLL);
          expect(toTop).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const sectionTop: boolean = await idExists(driver, 'id_index_rooms_section');
          expect(sectionTop).assertTrue();
          const buttonTop: boolean = await idExists(driver, 'id_index_transfer');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', transfer@top=' +
            buttonTop.toString());
          expect(buttonTop).assertTrue();
          const gridTop: boolean = await idExists(driver, 'id_index_rooms_grid');
          expect(gridTop).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETROOM_1600
     * @tc.name      testTabletRoomInfoGuard0001
     * @tc.desc      Verify the tablet room configuration page preloads the seeded room name and
     *               note into the info card inputs, that the room actions are present, and
     *               that clearing the name and saving reports the required-name hint without
     *               leaving the page.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletRoomInfoGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletRoomInfoGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const entered: boolean = await openTabletRoomConfig(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' +
            entered.toString());
          expect(entered).assertTrue();
          await assertIdsPresent(driver,
            ['id_rc_room_info', 'id_rc_room_info_title', 'id_rc_room_name_input',
              'id_rc_room_note_input', 'id_rc_room_actions', 'id_rc_room_save'], TAG);
          const statusBefore: boolean = await idExists(driver, 'id_rc_status');
          expect(!statusBefore).assertTrue();
          // An empty room name must be rejected by the required-name guard.
          const cleared: boolean = await clearId(driver, 'id_rc_room_name_input');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', clear name=' +
            cleared.toString());
          expect(cleared).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const saved: boolean = await clickId(driver, 'id_rc_room_save');
          expect(saved).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_rc_status');
          expect(statusFound).assertTrue();
          const pageStill: boolean = await idExists(driver, RC_ROOT);
          expect(pageStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETROOM_1601
     * @tc.name      testTabletRoomDeviceDetail0001
     * @tc.desc      Verify the tablet device section lists the seeded devices and that tapping
     *               the edit button of one device opens the detail form with its name, type,
     *               brand, model and template widgets plus the save, template and delete
     *               actions.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletRoomDeviceDetail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletRoomDeviceDetail0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const entered: boolean = await openTabletRoomConfig(driver);
          expect(entered).assertTrue();
          const sectionFound: boolean = await waitForId(driver, 'id_rc_devices_section');
          expect(sectionFound).assertTrue();
          const gridFound: boolean = await waitForId(driver, 'id_rc_device_grid');
          expect(gridFound).assertTrue();
          const deviceRows: number = await countExisting(driver,
            ['id_rc_device_row_' + SEED_PROJECTOR_ID, 'id_rc_device_row_' + SEED_SCREEN_ID,
              'id_rc_device_row_' + SEED_LIGHT_ID, 'id_rc_device_row_' + SEED_AC_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', device rows=' +
            deviceRows.toString());
          expect(deviceRows).assertEqual(4);
          const editId: string = 'id_rc_device_edit_' + SEED_PROJECTOR_ID;
          const editFound: boolean = await waitForId(driver, editId);
          expect(editFound).assertTrue();
          const tapped: boolean = await clickId(driver, editId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', edit tap=' +
            tapped.toString());
          expect(tapped).assertTrue();
          const detailFound: boolean = await waitForId(driver, 'id_rc_device_detail');
          expect(detailFound).assertTrue();
          const detailWidgets: number = await countExisting(driver,
            ['id_rc_device_detail_title', 'id_rc_device_name_input',
              'id_rc_device_type_select', 'id_rc_device_brand_input',
              'id_rc_device_model_input', 'id_rc_template_select',
              'id_rc_device_save', 'id_rc_device_template', 'id_rc_device_delete',
              'id_rc_device_actions']);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', detail widgets=' +
            detailWidgets.toString());
          expect(detailWidgets).assertEqual(10);
          const keysHint: boolean = await idExists(driver, 'id_rc_keys_hint');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', keys hint after select=' +
            keysHint.toString());
          expect(!keysHint).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETROOM_1602
     * @tc.name      testTabletRoomAddDeviceGuard0001
     * @tc.desc      Verify the add-device form of the tablet room page rejects an empty name
     *               with the enter-name hint, keeps every seeded device row mounted, and
     *               leaves the new-device row usable afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletRoomAddDeviceGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletRoomAddDeviceGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const entered: boolean = await openTabletRoomConfig(driver);
          expect(entered).assertTrue();
          const rowFound: boolean = await waitForId(driver, 'id_rc_new_device_row');
          expect(rowFound).assertTrue();
          const addClicked: boolean = await clickId(driver, 'id_rc_add_device');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', add empty=' +
            addClicked.toString());
          expect(addClicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_rc_status');
          expect(statusFound).assertTrue();
          const deviceRows: number = await countExisting(driver,
            ['id_rc_device_row_' + SEED_PROJECTOR_ID, 'id_rc_device_row_' + SEED_SCREEN_ID,
              'id_rc_device_row_' + SEED_LIGHT_ID, 'id_rc_device_row_' + SEED_AC_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', device rows=' +
            deviceRows.toString());
          expect(deviceRows).assertEqual(4);
          const inputStill: boolean = await idExists(driver, 'id_rc_new_device_input');
          expect(inputStill).assertTrue();
          const typeStill: boolean = await idExists(driver, 'id_rc_new_device_type');
          expect(typeStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETROOM_1603
     * @tc.name      testTabletRoomKeySection0001
     * @tc.desc      Verify the tablet key section starts in the select-device hint state, that
     *               the semantic, brand and code selectors plus the bind action are rendered,
     *               and that the bind action without a device keeps the hint in place.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletRoomKeySection0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletRoomKeySection0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const entered: boolean = await openTabletRoomConfig(driver);
          expect(entered).assertTrue();
          const keysSection: boolean = await waitForId(driver, 'id_rc_keys_section');
          expect(keysSection).assertTrue();
          const hintFound: boolean = await waitForId(driver, 'id_rc_keys_hint');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', keys hint=' +
            hintFound.toString());
          expect(hintFound).assertTrue();
          const selectors: number = await countExisting(driver,
            ['id_rc_semantic_select', 'id_rc_brand_select', 'id_rc_code_select',
              'id_rc_bind_key']);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', key widgets=' +
            selectors.toString());
          expect(selectors).assertEqual(4);
          const bindClicked: boolean = await clickId(driver, 'id_rc_bind_key');
          expect(bindClicked).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const statusFound: boolean = await idExists(driver, 'id_rc_status');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status=' +
            statusFound.toString());
          expect(statusFound).assertTrue();
          const sectionStill: boolean = await idExists(driver, 'id_rc_keys_section');
          expect(sectionStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETSCENE_1700
     * @tc.name      testTabletSceneSelectList0001
     * @tc.desc      Verify the tablet scene editor renders the room name, the scene grid with
     *               the seeded scene and its select button, the name form with rename and new
     *               actions, and the step section for the preselected scene.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTabletSceneSelectList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testTabletSceneSelectList0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletSceneEditor(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open editor=' +
            opened.toString());
          expect(opened).assertTrue();
          await assertIdsPresent(driver,
            ['id_oen_room_name', 'id_oen_scenes_section', 'id_oen_scene_grid',
              'id_oen_name_input', 'id_oen_rename', 'id_oen_new', 'id_oen_name_row',
              'id_oen_steps_section'], TAG);
          const cardCount: number = await countExisting(driver,
            ['id_oen_row_' + SEED_SCENE_ID, 'id_oen_name_' + SEED_SCENE_ID,
              'id_oen_select_' + SEED_SCENE_ID, 'id_oen_delete_' + SEED_SCENE_ID]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scene card widgets=' +
            cardCount.toString());
          expect(cardCount).assertEqual(4);
          const backClicked: boolean = await clickId(driver, 'id_oen_back');
          expect(backClicked).assertTrue();
          const roomBack: boolean = await waitForId(driver, RC_ROOT);
          expect(roomBack).assertTrue();
          const roomBackClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(roomBackClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETSCENE_1701
     * @tc.name      testTabletSceneStepShape0001
     * @tc.desc      Verify every seeded step of the tablet scene editor renders its number,
     *               device, key, delay label, toggle and the up, down, remove actions, and
     *               that the seeded scene is already selected on entry.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTabletSceneStepShape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testTabletSceneStepShape0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletSceneEditor(driver);
          expect(opened).assertTrue();
          const selectRow: boolean = await waitForId(driver, 'id_oen_row_' + SEED_SCENE_ID);
          expect(selectRow).assertTrue();
          const validationBefore: boolean = await idExists(driver, 'id_oen_validation');
          expect(!validationBefore).assertTrue();
          for (let i = 0; i < seedStepIds.length; i++) {
            const stepId: string = seedStepIds[i];
            const rowIds: string[] = [
              'id_oen_step_row_' + stepId,
              'id_oen_step_line_' + stepId,
              'id_oen_step_no_' + stepId,
              'id_oen_step_device_' + stepId,
              'id_oen_step_key_' + stepId,
              'id_oen_step_delay_' + stepId,
              'id_oen_step_actions_' + stepId,
              'id_oen_step_toggle_' + stepId,
              'id_oen_step_up_' + stepId,
              'id_oen_step_down_' + stepId,
              'id_oen_step_remove_' + stepId
            ];
            const rowCount: number = await countExisting(driver, rowIds);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', step=' + stepId +
              ', widgets=' + rowCount.toString());
            expect(rowCount).assertEqual(rowIds.length);
          }
          const backClicked: boolean = await clickId(driver, 'id_oen_back');
          expect(backClicked).assertTrue();
          const roomBack: boolean = await waitForId(driver, RC_ROOT);
          expect(roomBack).assertTrue();
          const roomBackClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(roomBackClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETSCENE_1702
     * @tc.name      testTabletSceneDelayBounds0001
     * @tc.desc      Verify the tablet step delay plus and minus buttons clamp the seeded value
     *               inside the configured bounds: three plus taps and three minus taps leave
     *               the step row mounted, the delay label present and the list unchanged.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletSceneDelayBounds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletSceneDelayBounds0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletSceneEditor(driver);
          expect(opened).assertTrue();
          const plusId: string = 'id_oen_step_plus_' + SEED_STEP_0;
          const minusId: string = 'id_oen_step_minus_' + SEED_STEP_0;
          const plusFound: boolean = await waitForId(driver, plusId);
          expect(plusFound).assertTrue();
          const minusFound: boolean = await waitForId(driver, minusId);
          expect(minusFound).assertTrue();
          for (let tap: number = 1; tap <= 3; tap++) {
            const plusTap: boolean = await clickId(driver, plusId);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', plus tap=' +
              tap.toString() + ', ok=' + plusTap.toString());
            expect(plusTap).assertTrue();
            await driver.delayMs(CLICK_SETTLE_MS);
          }
          for (let tap: number = 1; tap <= 3; tap++) {
            const minusTap: boolean = await clickId(driver, minusId);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', minus tap=' +
              tap.toString() + ', ok=' + minusTap.toString());
            expect(minusTap).assertTrue();
            await driver.delayMs(CLICK_SETTLE_MS);
          }
          const rowStill: boolean = await idExists(driver, 'id_oen_step_row_' + SEED_STEP_0);
          expect(rowStill).assertTrue();
          const delayStill: boolean = await idExists(driver, 'id_oen_step_delay_' + SEED_STEP_0);
          expect(delayStill).assertTrue();
          const rows: number = await countExisting(driver,
            ['id_oen_step_row_' + SEED_STEP_0, 'id_oen_step_row_' + SEED_STEP_3]);
          expect(rows).assertEqual(2);
          const backClicked: boolean = await clickId(driver, 'id_oen_back');
          expect(backClicked).assertTrue();
          const roomBack: boolean = await waitForId(driver, RC_ROOT);
          expect(roomBack).assertTrue();
          const roomBackClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(roomBackClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETSCENE_1703
     * @tc.name      testTabletSceneSaveValidate0001
     * @tc.desc      Verify the save-and-validate action of the tablet scene editor reports a
     *               result through the validation text and the status line, and that both the
     *               scene grid and the step list stay mounted afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTabletSceneSaveValidate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTabletSceneSaveValidate0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletSceneEditor(driver);
          expect(opened).assertTrue();
          const actionRow: boolean = await waitForId(driver, 'id_oen_step_action_row');
          expect(actionRow).assertTrue();
          const validationBefore: boolean = await idExists(driver, 'id_oen_validation');
          expect(!validationBefore).assertTrue();
          const saved: boolean = await clickId(driver, 'id_oen_save_validate');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', save+validate=' +
            saved.toString());
          expect(saved).assertTrue();
          const validationFound: boolean = await waitForId(driver, 'id_oen_validation');
          expect(validationFound).assertTrue();
          const statusFound: boolean = await idExists(driver, 'id_oen_status');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status=' +
            statusFound.toString());
          expect(statusFound).assertTrue();
          const scenesStill: boolean = await idExists(driver, 'id_oen_scene_grid');
          expect(scenesStill).assertTrue();
          const stepsStill: boolean = await idExists(driver, 'id_oen_steps_section');
          expect(stepsStill).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_oen_back');
          expect(backClicked).assertTrue();
          const roomBack: boolean = await waitForId(driver, RC_ROOT);
          expect(roomBack).assertTrue();
          const roomBackClicked: boolean = await clickId(driver, 'id_rc_back');
          expect(roomBackClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETXFER_1800
     * @tc.name      testTransferSelectToggleSet0001
     * @tc.desc      Verify the tablet transfer page toggles room selection independently: the
     *               seeded room toggles on, stays toggled on when another toggle target is
     *               absent, and returns to unselected after a second tap so the selection set
     *               ends empty.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTransferSelectToggleSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTransferSelectToggleSet0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletTransfer(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open page=' +
            opened.toString());
          expect(opened).assertTrue();
          const toggleId: string = 'id_xfer_room_toggle_' + SEED_ROOM_ID;
          const rowFound: boolean = await waitForId(driver,
            'id_xfer_room_row_' + SEED_ROOM_ID);
          expect(rowFound).assertTrue();
          const nameFound: boolean = await idExists(driver,
            'id_xfer_room_name_' + SEED_ROOM_ID);
          expect(nameFound).assertTrue();
          const firstTap: boolean = await clickId(driver, toggleId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', select=' +
            firstTap.toString());
          expect(firstTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const toggleAfterOn: boolean = await idExists(driver, toggleId);
          expect(toggleAfterOn).assertTrue();
          const secondTap: boolean = await clickId(driver, toggleId);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', deselect=' +
            secondTap.toString());
          expect(secondTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const toggleAfterOff: boolean = await idExists(driver, toggleId);
          expect(toggleAfterOff).assertTrue();
          // With an empty selection the export guard must report a status text.
          const exportClicked: boolean = await clickId(driver, 'id_xfer_export_button');
          expect(exportClicked).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_xfer_status');
          expect(statusFound).assertTrue();
          const pathGone: boolean = !(await idExists(driver, 'id_xfer_export_path'));
          const summaryGone: boolean = !(await idExists(driver, 'id_xfer_export_summary'));
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', path gone=' +
            pathGone.toString() + ', summary gone=' + summaryGone.toString());
          expect(pathGone).assertTrue();
          expect(summaryGone).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_xfer_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETXFER_1801
     * @tc.name      testTransferImportGuard0001
     * @tc.desc      Verify the import section of the tablet transfer page shows the enter-path
     *               hint for an empty and for a whitespace-only path, keeps the warning text
     *               and the path input rendered, and never produces a failed-items list.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTransferImportGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTransferImportGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletTransfer(driver);
          expect(opened).assertTrue();
          await assertIdsPresent(driver,
            ['id_xfer_import_section', 'id_xfer_import_title', 'id_xfer_import_warning',
              'id_xfer_import_input', 'id_xfer_import_button'], TAG);
          const statusBefore: boolean = await idExists(driver, 'id_xfer_status');
          expect(!statusBefore).assertTrue();
          const emptyImport: boolean = await clickId(driver, 'id_xfer_import_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', import empty=' +
            emptyImport.toString());
          expect(emptyImport).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_xfer_status');
          expect(statusFound).assertTrue();
          const typed: boolean = await inputId(driver, 'id_xfer_import_input', '   ');
          expect(typed).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const blankImport: boolean = await clickId(driver, 'id_xfer_import_button');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', import blank=' +
            blankImport.toString());
          expect(blankImport).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const failedShown: boolean = await idExists(driver, 'id_xfer_failed_title');
          const summaryShown: boolean = await idExists(driver, 'id_xfer_import_summary');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', failed=' +
            failedShown.toString() + ', summary=' + summaryShown.toString());
          expect(!failedShown).assertTrue();
          expect(!summaryShown).assertTrue();
          await clearId(driver, 'id_xfer_import_input');
          const backClicked: boolean = await clickId(driver, 'id_xfer_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_TABLETXFER_1802
     * @tc.name      testTransferMultiToggle0001
     * @tc.desc      Verify the transfer page tolerates repeated selection changes: five taps on
     *               the same room toggle end on the selected state, the export section keeps
     *               its button and hint, and a following tap deselects it again.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTransferMultiToggle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testTransferMultiToggle0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        if (isTablet) {
          const homeFound: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeFound).assertTrue();
          const opened: boolean = await openTabletTransfer(driver);
          expect(opened).assertTrue();
          const toggleId: string = 'id_xfer_room_toggle_' + SEED_ROOM_ID;
          const toggleFound: boolean = await waitForId(driver, toggleId);
          expect(toggleFound).assertTrue();
          for (let tap: number = 1; tap <= 5; tap++) {
            const tapped: boolean = await clickId(driver, toggleId);
            hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', tap=' +
              tap.toString() + ', ok=' + tapped.toString());
            expect(tapped).assertTrue();
            await driver.delayMs(CLICK_SETTLE_MS);
            const stillThere: boolean = await idExists(driver, toggleId);
            expect(stillThere).assertTrue();
          }
          const exportWidgets: number = await countExisting(driver,
            ['id_xfer_export_section', 'id_xfer_export_title', 'id_xfer_export_hint',
              'id_xfer_export_button']);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', export widgets=' +
            exportWidgets.toString());
          expect(exportWidgets).assertEqual(4);
          // A sixth tap brings the selection back to the empty state.
          const sixthTap: boolean = await clickId(driver, toggleId);
          expect(sixthTap).assertTrue();
          await driver.delayMs(CLICK_SETTLE_MS);
          const importSection: boolean = await idExists(driver, 'id_xfer_import_section');
          expect(importSection).assertTrue();
          const backClicked: boolean = await clickId(driver, 'id_xfer_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_FORMGUARD_1900
     * @tc.name      testFormPageSetIsolation0001
     * @tc.desc      Verify the two page sets never mix: from the current home the matching
     *               secondary page is opened, its root coexists with no root of the other form,
     *               and the back action returns to the same home root.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFormPageSetIsolation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        const TAG: string = 'testFormPageSetIsolation0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const homeFound: boolean = await waitForAnyHome(driver, isTablet);
        expect(homeFound).assertTrue();
        if (isTablet) {
          const opened: boolean = await openTabletTransfer(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', tablet page=' +
            opened.toString());
          expect(opened).assertTrue();
          const foreignPages: number = await countExisting(driver,
            [ROOM_CONFIG_ROOT, SETTINGS_ROOT, SCENE_EDITOR_ROOT]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', phone pages=' +
            foreignPages.toString());
          expect(foreignPages).assertEqual(0);
          const backClicked: boolean = await clickId(driver, 'id_xfer_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
        } else {
          const opened: boolean = await openPhoneRoomConfig(driver);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', phone page=' +
            opened.toString());
          expect(opened).assertTrue();
          const foreignPages: number = await countExisting(driver,
            [RC_ROOT, OEN_ROOT, XFER_ROOT]);
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', tablet pages=' +
            foreignPages.toString());
          expect(foreignPages).assertEqual(0);
          const backClicked: boolean = await clickId(driver, 'id_room_back');
          expect(backClicked).assertTrue();
          const homeBack: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(homeBack).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_FORMGUARD_1901
     * @tc.name      testFormGuardStableBoth0001
     * @tc.desc      Verify that a case whose target form is not the running one still leaves a
     *               complete start page behind: all home widgets of the current form are probed
     *               twice with a settle pause, and the foreign home root stays absent.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormGuardStableBoth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testFormGuardStableBoth0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const startIds: string[] = isTablet ? tabletStableIds : phoneStableIds;
        await assertIdsPresent(driver, startIds, TAG);
        await driver.delayMs(CLICK_SETTLE_MS);
        await assertIdsPresent(driver, startIds, TAG);
        const foreignHome: boolean =
          await idExists(driver, isTablet ? CONSOLE_ROOT : ORCH_ROOT);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', foreign home=' +
          foreignHome.toString());
        expect(!foreignHome).assertTrue();
        const pages: number = await countExisting(driver,
          [ROOM_CONFIG_ROOT, SCENE_EDITOR_ROOT, SETTINGS_ROOT, RC_ROOT, OEN_ROOT, XFER_ROOT]);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', sub pages=' +
          pages.toString());
        expect(pages).assertEqual(0);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_FORMGUARD_1902
     * @tc.name      testFormRecoveryAfterGuard0001
     * @tc.desc      Verify the home stays fully interactive after a rejected form submit: on a
     *               phone a rejected room creation is followed by opening and closing the
     *               settings page, and on a tablet by a transfer round trip; the home widgets
     *               must all be back afterwards.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormRecoveryAfterGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testFormRecoveryAfterGuard0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const homeFound: boolean = await waitForAnyHome(driver, isTablet);
        expect(homeFound).assertTrue();
        if (isTablet) {
          const transferOpened: boolean = await openTabletTransfer(driver);
          expect(transferOpened).assertTrue();
          const transferBack: boolean = await clickId(driver, 'id_xfer_back');
          expect(transferBack).assertTrue();
          const homeBack: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeBack).assertTrue();
          await assertIdsPresent(driver, tabletStableIds, TAG);
        } else {
          const roomOpened: boolean = await openPhoneRoomConfig(driver);
          expect(roomOpened).assertTrue();
          const rejectedCreate: boolean = await clickId(driver, 'id_new_room_button');
          expect(rejectedCreate).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          const roomBack: boolean = await clickId(driver, 'id_room_back');
          expect(roomBack).assertTrue();
          const homeBack: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(homeBack).assertTrue();
          const settingsOpened: boolean = await openPhoneSettings(driver);
          expect(settingsOpened).assertTrue();
          const settingsBack: boolean = await clickId(driver, 'id_settings_back');
          expect(settingsBack).assertTrue();
          const finalHome: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(finalHome).assertTrue();
          await assertIdsPresent(driver, phoneStableIds, TAG);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_FORMGUARD_1903
     * @tc.name      testFormGuardNoStaleTips0001
     * @tc.desc      Verify no guard hint leaks across pages: after a rejected submit on the
     *               current form the page is left and re-entered, and the hint state of the
     *               re-entered page must match the pristine state of a fresh page.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormGuardNoStaleTips0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const TAG: string = 'testFormGuardNoStaleTips0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const homeFound: boolean = await waitForAnyHome(driver, isTablet);
        expect(homeFound).assertTrue();
        if (isTablet) {
          const firstOpen: boolean = await openTabletRoomConfig(driver);
          expect(firstOpen).assertTrue();
          const rejectedAdd: boolean = await clickId(driver, 'id_rc_add_device');
          expect(rejectedAdd).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_rc_status');
          expect(statusFound).assertTrue();
          const firstBack: boolean = await clickId(driver, 'id_rc_back');
          expect(firstBack).assertTrue();
          const homeAgain: boolean = await waitForId(driver, ORCH_ROOT);
          expect(homeAgain).assertTrue();
          const secondOpen: boolean = await openTabletRoomConfig(driver);
          expect(secondOpen).assertTrue();
          const statusFresh: boolean = await idExists(driver, 'id_rc_status');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status on reentry=' +
            statusFresh.toString());
          expect(!statusFresh).assertTrue();
          const secondBack: boolean = await clickId(driver, 'id_rc_back');
          expect(secondBack).assertTrue();
          const finalHome: boolean = await waitForId(driver, ORCH_ROOT);
          expect(finalHome).assertTrue();
        } else {
          const firstOpen: boolean = await openPhoneRoomConfig(driver);
          expect(firstOpen).assertTrue();
          const rejectedCreate: boolean = await clickId(driver, 'id_new_room_button');
          expect(rejectedCreate).assertTrue();
          const statusFound: boolean = await waitForId(driver, 'id_room_status');
          expect(statusFound).assertTrue();
          const firstBack: boolean = await clickId(driver, 'id_room_back');
          expect(firstBack).assertTrue();
          const homeAgain: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(homeAgain).assertTrue();
          const secondOpen: boolean = await openPhoneRoomConfig(driver);
          expect(secondOpen).assertTrue();
          const statusFresh: boolean = await idExists(driver, 'id_room_status');
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', status on reentry=' +
            statusFresh.toString());
          expect(!statusFresh).assertTrue();
          const secondBack: boolean = await clickId(driver, 'id_room_back');
          expect(secondBack).assertTrue();
          const finalHome: boolean = await waitForId(driver, CONSOLE_ROOT);
          expect(finalHome).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_FORMGUARD_1904
     * @tc.name      testFormHomeWidgetsCount0001
     * @tc.desc      Verify the number of mounted home widgets of the current form equals the
     *               expected count for that form, so a partially rendered home page (a broken
     *               routing result) fails the case instead of passing by accident.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFormHomeWidgetsCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const TAG: string = 'testFormHomeWidgetsCount0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const homeFound: boolean = await waitForAnyHome(driver, isTablet);
        expect(homeFound).assertTrue();
        const ids: string[] = isTablet ?
          [ORCH_ROOT, 'id_index_title', 'id_index_notice', 'id_index_notice_row',
            'id_index_transfer', 'id_index_rooms_section', 'id_index_rooms_title',
            'id_index_rooms_grid', 'id_index_new_room_row', 'id_index_content', INDEX_SCROLL] :
          [CONSOLE_ROOT, 'id_console_title', 'id_console_room', 'id_console_header',
            'id_console_devices_title', 'id_console_device_list', 'id_console_nav',
            'id_console_content', CONSOLE_SCROLL];
        const mounted: number = await countExisting(driver, ids);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', form=' +
          (isTablet ? 'tablet' : 'phone') + ', mounted=' + mounted.toString() +
          '/' + ids.length.toString());
        expect(mounted).assertEqual(ids.length);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_FORMGUARD_1905
     * @tc.name      testFormGuardHomeIdUnique0001
     * @tc.desc      Verify the routed home root is the single home root present: probing both
     *               home roots yields exactly one hit, and the losing root stays unmounted for
     *               the whole probe window.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFormGuardHomeIdUnique0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const TAG: string = 'testFormGuardHomeIdUnique0001';
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
        const consoleHit: boolean = await waitForId(driver, CONSOLE_ROOT);
        const orchHit: boolean = await waitForId(driver, ORCH_ROOT);
        const hits: number = (consoleHit ? 1 : 0) + (orchHit ? 1 : 0);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', console=' +
          consoleHit.toString() + ', orch=' + orchHit.toString() + ', hits=' +
          hits.toString());
        expect(hits).assertEqual(1);
        expect(consoleHit).assertEqual(!isTablet);
        expect(orchHit).assertEqual(isTablet);
        await driver.delayMs(CLICK_SETTLE_MS);
        const consoleAgain: boolean = await idExists(driver, CONSOLE_ROOT);
        const orchAgain: boolean = await idExists(driver, ORCH_ROOT);
        expect(consoleAgain).assertEqual(consoleHit);
        expect(orchAgain).assertEqual(orchHit);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
      });
  });
}
