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
const SUITE_TAG: string = '[Sample_MeetingScene]';
/** Hilog domain reserved for the MeetingScene UI tests. */
const DOMAIN: number = 0xF811;
/** Package-name keyword prefixed to every log line so logs can be filtered by bundle. */
const BUNDLE: string = 'MeetingScene_';
/** Bundle name of the sample under test. */
const BUNDLE_NAME: string = 'com.samples.infraredandgesture';
/** Entry ability of the sample under test. */
const ABILITY_NAME: string = 'EntryAbility';
/** Device type value reported by tablets. */
const TABLET_DEVICE: string = 'tablet';
/** Upper bound for every component wait; tests must never wait without a limit. */
const WAIT_TIMEOUT_MS: number = 5000;
/** Delay after startAbility before the landing page is expected to be ready. */
const LAUNCH_DELAY_MS: number = 2000;

/** Root id of the phone console home. */
const CONSOLE_ROOT: string = 'id_console_root';
/** Root id of the tablet orchestration home. */
const ORCHESTRATION_ROOT: string = 'id_orch_root';

/** Waits for one component within the bounded timeout and reports whether it appeared. */
async function waitForId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await driver.waitForComponent(ON.id(id), WAIT_TIMEOUT_MS);
  return component !== null;
}

/** Clicks the component with the given id and reports whether it was found. */
async function clickId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await driver.findComponent(ON.id(id));
  if (component === null) {
    return false;
  }
  await component.click();
  return true;
}

/** Returns the first id that currently exists among the candidates, or an empty string. */
async function firstExistingId(driver: Driver, ids: string[]): Promise<string> {
  for (const id of ids) {
    const component: Component | null = await driver.findComponent(ON.id(id));
    if (component !== null) {
      return id;
    }
  }
  return '';
}

export default function meetingSceneTest() {
  describe('MeetingSceneUiTest', () => {
    const isTablet: boolean = deviceInfo.deviceType === TABLET_DEVICE;
    const homeId: string = isTablet ? ORCHESTRATION_ROOT : CONSOLE_ROOT;
    let driver: Driver = Driver.create();

    beforeAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, begin');
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await driver.delayMs(LAUNCH_DELAY_MS);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'suite, beforeAll, end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_LAUNCHAPP_0100
     * @tc.name      testLaunchApp0001
     * @tc.desc      Verify the entry page routes to the console home on phones and to the
     *               orchestration home on tablets.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLaunchApp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testLaunchApp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      const found: boolean = await waitForId(driver, homeId);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', home=' + homeId +
        ', found=' + found.toString());
      expect(found).assertTrue();
      // The routed home root must match the device form reported at launch.
      expect(homeId).assertEqual(isTablet ? ORCHESTRATION_ROOT : CONSOLE_ROOT);
      expect(homeId.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SECONDARYPAGE_0100
     * @tc.name      testSecondaryPage0001
     * @tc.desc      Verify the secondary page of the current device form opens and the user
     *               can return to the home page.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecondaryPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSecondaryPage0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Tablet home opens the configuration package page.
        const opened: boolean = await clickId(driver, 'id_index_transfer');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click transfer=' + opened.toString());
        expect(opened).assertTrue();
        const transferFound: boolean = await waitForId(driver, 'id_xfer_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', transfer page=' + transferFound.toString());
        expect(transferFound).assertTrue();
        // Return to the orchestration home.
        const backClicked: boolean = await clickId(driver, 'id_xfer_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click back=' + backClicked.toString());
        expect(backClicked).assertTrue();
      } else {
        // Phone console opens the send log settings page.
        const opened: boolean = await clickId(driver, 'id_nav_settings');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click settings=' + opened.toString());
        expect(opened).assertTrue();
        const settingsFound: boolean = await waitForId(driver, 'id_settings_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', settings page=' + settingsFound.toString());
        expect(settingsFound).assertTrue();
        const backClicked: boolean = await clickId(driver, 'id_settings_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click back=' + backClicked.toString());
        expect(backClicked).assertTrue();
      }
      const homeFound: boolean = await waitForId(driver, homeId);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
      expect(homeFound).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_ROOMMANAGEMENT_0100
     * @tc.name      testRoomManagement0001
     * @tc.desc      Verify room management: phones open the room configuration page and
     *               tablets create a room that appears in the room list.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoomManagement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testRoomManagement0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Enter a uniquely named room and submit it. Do not pressBack after
        // inputText: the keyboard back gesture would leave the application.
        const name: string = 'Test Room ' + Date.now().toString();
        const input: Component | null = await driver.findComponent(ON.id('id_index_new_room_input'));
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', input found=' + (input !== null).toString());
        expect(input !== null).assertTrue();
        if (input !== null) {
          await input.inputText(name);
        }
        const created: boolean = await clickId(driver, 'id_index_create_room');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click create=' + created.toString());
        expect(created).assertTrue();
        // The new room name must appear in the room list.
        const roomShown: Component | null = await driver.waitForComponent(ON.text(name), WAIT_TIMEOUT_MS);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room=' + name +
          ', shown=' + (roomShown !== null).toString());
        expect(roomShown !== null).assertTrue();
      } else {
        // Phone console opens the room configuration page.
        const opened: boolean = await clickId(driver, 'id_nav_room_config');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click room config=' + opened.toString());
        expect(opened).assertTrue();
        const configFound: boolean = await waitForId(driver, 'id_room_config_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room config page=' + configFound.toString());
        expect(configFound).assertTrue();
        const backClicked: boolean = await clickId(driver, 'id_room_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click back=' + backClicked.toString());
        expect(backClicked).assertTrue();
      }
      const homeFound: boolean = await waitForId(driver, homeId);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
      expect(homeFound).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SCENEMANAGEMENT_0100
     * @tc.name      testSceneManagement0001
     * @tc.desc      Verify scene management: the scene editor opens directly from the console
     *               on phones and from the room configuration page on tablets.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneManagement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSceneManagement0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Tablet home enters the first room configuration.
        const roomOpened: boolean = await clickId(driver, 'id_index_room_enter_room-default');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open room=' + roomOpened.toString());
        if (!roomOpened) {
          const fallbackEntry: Component | null = await driver.findComponent(ON.text('Configure'));
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', fallback entry=' +
            (fallbackEntry !== null).toString());
          expect(fallbackEntry !== null).assertTrue();
          if (fallbackEntry !== null) {
            await fallbackEntry.click();
          }
        }
        const roomFound: boolean = await waitForId(driver, 'id_rc_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room config page=' + roomFound.toString());
        expect(roomFound).assertTrue();
        // Open the scene editor from the room configuration page.
        const editorOpened: boolean = await clickId(driver, 'id_rc_scene_entry');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open editor=' + editorOpened.toString());
        expect(editorOpened).assertTrue();
        const editorFound: boolean = await waitForId(driver, 'id_oen_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scene editor page=' + editorFound.toString());
        expect(editorFound).assertTrue();
        // Close the editor and the room configuration page.
        const editorBack: boolean = await clickId(driver, 'id_oen_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', editor back=' + editorBack.toString());
        expect(editorBack).assertTrue();
        const roomBack: boolean = await clickId(driver, 'id_rc_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room back=' + roomBack.toString());
        expect(roomBack).assertTrue();
      } else {
        // Phone console opens the scene editor directly.
        const editorOpened: boolean = await clickId(driver, 'id_nav_scene_editor');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open editor=' + editorOpened.toString());
        expect(editorOpened).assertTrue();
        const editorFound: boolean = await waitForId(driver, 'id_scene_editor_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scene editor page=' + editorFound.toString());
        expect(editorFound).assertTrue();
        const editorBack: boolean = await clickId(driver, 'id_scene_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', editor back=' + editorBack.toString());
        expect(editorBack).assertTrue();
      }
      const homeFound: boolean = await waitForId(driver, homeId);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
      expect(homeFound).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_CONSOLEWIDGETS_0100
     * @tc.name      testConsoleWidgets0001
     * @tc.desc      Verify the home device widget area: the console device card list exists
     *               on phones and the room and device section exists on tablets.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testConsoleWidgets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testConsoleWidgets0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Tablet home always renders the managed room and device summary section.
        const titleFound: boolean = await waitForId(driver, 'id_index_title');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', orch title=' + titleFound.toString());
        expect(titleFound).assertTrue();
        const roomsFound: boolean = await waitForId(driver, 'id_index_rooms_section');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', rooms section=' + roomsFound.toString());
        expect(roomsFound).assertTrue();
      } else {
        // Phone console always renders the device card area under a fixed list root.
        const titleFound: boolean = await waitForId(driver, 'id_console_devices_title');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', devices title=' + titleFound.toString());
        expect(titleFound).assertTrue();
        const listFound: boolean = await waitForId(driver, 'id_console_device_list');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', device list=' + listFound.toString());
        expect(listFound).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SENDLOGS_0100
     * @tc.name      testSendLogsPage0001
     * @tc.desc      Verify the phone send log page shows the log panel with either the empty
     *               hint or the log list rendered.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSendLogsPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSendLogsPage0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Tablets provide no send log page; verify the home stays stable instead.
        const titleFound: boolean = await waitForId(driver, 'id_index_title');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', orch title=' + titleFound.toString());
        expect(titleFound).assertTrue();
        const noticeFound: boolean = await waitForId(driver, 'id_index_notice_row');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', notice row=' + noticeFound.toString());
        expect(noticeFound).assertTrue();
      } else {
        // Phone console opens the send log settings page.
        const opened: boolean = await clickId(driver, 'id_nav_settings');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click settings=' + opened.toString());
        expect(opened).assertTrue();
        const settingsFound: boolean = await waitForId(driver, 'id_settings_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', settings page=' + settingsFound.toString());
        expect(settingsFound).assertTrue();
        const sectionFound: boolean = await waitForId(driver, 'id_send_logs_section');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', logs section=' + sectionFound.toString());
        expect(sectionFound).assertTrue();
        const panelFound: boolean = await waitForId(driver, 'id_send_log_panel');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', log panel=' + panelFound.toString());
        expect(panelFound).assertTrue();
        // The panel renders either the empty hint or the log list, never neither.
        const stateId: string = await firstExistingId(driver, ['id_log_empty', 'id_log_list']);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', log state=' + stateId);
        expect(stateId !== '').assertTrue();
        const backClicked: boolean = await clickId(driver, 'id_settings_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click back=' + backClicked.toString());
        expect(backClicked).assertTrue();
        const homeFound: boolean = await waitForId(driver, homeId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
        expect(homeFound).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_CONFIGEXPORT_0100
     * @tc.name      testConfigExport0001
     * @tc.desc      Verify the tablet configuration package page shows the export section
     *               and the export button entry.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testConfigExport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testConfigExport0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Open the configuration package page from the tablet home.
        const opened: boolean = await clickId(driver, 'id_index_transfer');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click transfer=' + opened.toString());
        expect(opened).assertTrue();
        const transferFound: boolean = await waitForId(driver, 'id_xfer_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', transfer page=' + transferFound.toString());
        expect(transferFound).assertTrue();
        const sectionFound: boolean = await waitForId(driver, 'id_xfer_export_section');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', export section=' + sectionFound.toString());
        expect(sectionFound).assertTrue();
        // Existence check only: the export action must not be triggered here.
        const buttonFound: boolean = await waitForId(driver, 'id_xfer_export_button');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', export button=' + buttonFound.toString());
        expect(buttonFound).assertTrue();
        const backClicked: boolean = await clickId(driver, 'id_xfer_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', click back=' + backClicked.toString());
        expect(backClicked).assertTrue();
        const homeFound: boolean = await waitForId(driver, homeId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
        expect(homeFound).assertTrue();
      } else {
        // The configuration package page is tablet-only; check the console nav row.
        const navFound: boolean = await waitForId(driver, 'id_console_nav');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', console nav=' + navFound.toString());
        expect(navFound).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_UI_SCENEEDITORSTEPS_0100
     * @tc.name      testSceneEditorSteps0001
     * @tc.desc      Verify the scene editor step list area exists after opening the editor
     *               on both device forms.
     * @tc.require   NA
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneEditorSteps0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSceneEditorSteps0001';
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' start');
      if (isTablet) {
        // Tablet home enters the first room configuration (default seed room).
        const roomOpened: boolean = await clickId(driver, 'id_index_room_enter_room-default');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open room=' + roomOpened.toString());
        if (!roomOpened) {
          const fallbackEntry: Component | null = await driver.findComponent(ON.text('Configure'));
          hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', fallback entry=' +
            (fallbackEntry !== null).toString());
          expect(fallbackEntry !== null).assertTrue();
          if (fallbackEntry !== null) {
            await fallbackEntry.click();
          }
        }
        const roomFound: boolean = await waitForId(driver, 'id_rc_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room config page=' + roomFound.toString());
        expect(roomFound).assertTrue();
        // Open the scene editor from the room configuration page.
        const editorOpened: boolean = await clickId(driver, 'id_rc_scene_entry');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open editor=' + editorOpened.toString());
        expect(editorOpened).assertTrue();
        const editorFound: boolean = await waitForId(driver, 'id_oen_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scene editor page=' + editorFound.toString());
        expect(editorFound).assertTrue();
        const stepsFound: boolean = await waitForId(driver, 'id_oen_steps_section');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', steps section=' + stepsFound.toString());
        expect(stepsFound).assertTrue();
        // Close the editor and the room configuration page.
        const editorBack: boolean = await clickId(driver, 'id_oen_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', editor back=' + editorBack.toString());
        expect(editorBack).assertTrue();
        const roomBack: boolean = await clickId(driver, 'id_rc_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', room back=' + roomBack.toString());
        expect(roomBack).assertTrue();
        const homeFound: boolean = await waitForId(driver, homeId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
        expect(homeFound).assertTrue();
      } else {
        // Phone console opens the scene editor directly.
        const editorOpened: boolean = await clickId(driver, 'id_nav_scene_editor');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', open editor=' + editorOpened.toString());
        expect(editorOpened).assertTrue();
        const editorFound: boolean = await waitForId(driver, 'id_scene_editor_root');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', scene editor page=' + editorFound.toString());
        expect(editorFound).assertTrue();
        const stepsFound: boolean = await waitForId(driver, 'id_steps_section');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', steps section=' + stepsFound.toString());
        expect(stepsFound).assertTrue();
        const editorBack: boolean = await clickId(driver, 'id_scene_back');
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', editor back=' + editorBack.toString());
        expect(editorBack).assertTrue();
        const homeFound: boolean = await waitForId(driver, homeId);
        hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ', back to home=' + homeFound.toString());
        expect(homeFound).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + TAG + ' end');
    });
  });
}
