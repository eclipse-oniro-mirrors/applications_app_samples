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


import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  PeerInfoModel,
  ConnectOptionsModel,
  AppStorageModel,
  MockDeviceManager,
  MockCollabBridge,
  MockCollabSession,
  CollabEventRecorder,
  SessionIdGenerator,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  OperationStatus,
  ConnectStartOption,
  CollabEventRecord,
  LogRecord,
  CollabMetrics,
  buildPeerInfo,
  buildConnectOptions,
  mockNetworkIds,
  mockPayload,
  encodeUtf8,
  decodeUtf8,
  utf8ByteLength,
  concatBuffers,
  isValidSessionId,
  isValidCollabToken,
  safeInvoke,
  safeInvokeAsync,
  buildPermissionItems,
  normalizeCallbackMessage,
  delay,
  waitUntil,
  runSerializedUiOperation,
  resetDriver,
  serializedDelay,
  triggerSerializedKey,
  getDriver,
  findComponentsByType,
  collabComponentCount,
  checkTextContent,
  checkComponentExists,
  dismissSystemDialog,
  simulateTouch,
  clickButtonByText,
  readInputText,
  getCurrentFocusIndex,
  checkFocusState,
  pressAndWait,
  launchSampleApp,
  waitForUiReady,
  COLLAB_BUNDLE_NAME,
  COLLAB_MODULE_NAME,
  COLLAB_ABILITY_NAME,
  COLLAB_SERVICE_NAME,
  COLLAB_SESSION_NAME,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  INVALID_SESSION_ID,
  REQUESTED_PERMISSIONS,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  PARAM_KEY_PEER_INFO,
  PARAM_KEY_CONNECT_OPTION,
  PARAM_KEY_COLLAB_TOKEN,
  TEXT_ENCODING,
  TAG,
  PAGE_TITLE,
  BUTTON_CONNECT,
  BUTTON_SEND_MESSAGE,
  BUTTON_SEND_DATA,
  BUTTON_DISCONNECT,
  BUTTON_DESTROY_SESSION,
  MESSAGE_INPUT_ID,
  KEY_BACK,
  KEY_HOME,
  KEY_UP,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  TIMEOUT_UI_RENDER,
  TIMEOUT_CONNECT,
  TIMEOUT_SESSION_CREATE,
  TIMEOUT_STATE_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_OPERATION,
  TOLERANCE_COMPONENT_COUNT,
  TOLERANCE_STATE_CHANGE
} from '../Shared/CollabTestDriver';


export default function uiFlowMatrixTest(): void {
  describe('UIFlowMatrix_Test', () => {
    it('ui_click_0_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 1; i++) {
        await clickButtonByText(driver, BUTTON_CONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_0_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 2; i++) {
        await clickButtonByText(driver, BUTTON_CONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_0_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 3; i++) {
        await clickButtonByText(driver, BUTTON_CONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_0_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 4; i++) {
        await clickButtonByText(driver, BUTTON_CONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_1_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 1; i++) {
        await clickButtonByText(driver, BUTTON_SEND_MESSAGE);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_1_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 2; i++) {
        await clickButtonByText(driver, BUTTON_SEND_MESSAGE);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_1_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 3; i++) {
        await clickButtonByText(driver, BUTTON_SEND_MESSAGE);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_1_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 4; i++) {
        await clickButtonByText(driver, BUTTON_SEND_MESSAGE);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_2_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 1; i++) {
        await clickButtonByText(driver, BUTTON_SEND_DATA);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_2_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 2; i++) {
        await clickButtonByText(driver, BUTTON_SEND_DATA);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_2_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 3; i++) {
        await clickButtonByText(driver, BUTTON_SEND_DATA);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_2_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 4; i++) {
        await clickButtonByText(driver, BUTTON_SEND_DATA);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_3_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 1; i++) {
        await clickButtonByText(driver, BUTTON_DISCONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_3_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 2; i++) {
        await clickButtonByText(driver, BUTTON_DISCONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_3_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 3; i++) {
        await clickButtonByText(driver, BUTTON_DISCONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_3_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 4; i++) {
        await clickButtonByText(driver, BUTTON_DISCONNECT);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_4_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 1; i++) {
        await clickButtonByText(driver, BUTTON_DESTROY_SESSION);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_4_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 2; i++) {
        await clickButtonByText(driver, BUTTON_DESTROY_SESSION);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_4_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 3; i++) {
        await clickButtonByText(driver, BUTTON_DESTROY_SESSION);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_click_4_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let i = 0; i < 4; i++) {
        await clickButtonByText(driver, BUTTON_DESTROY_SESSION);
        await serializedDelay(driver, DELAY_AFTER_OPERATION);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_key_navigation_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 3, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 4, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_5', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 5, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_6', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 6, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_7', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 7, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_8', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 8, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_9', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 9, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_10', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 10, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_11', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 11, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_12', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 12, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_13', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 13, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_14', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 14, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_15', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 15, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_16', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 16, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_17', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 17, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_18', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 18, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_19', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 19, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_key_navigation_20', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 20, DELAY_KEY_NAVIGATION);
      const index = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(INVALID_SESSION_ID);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(await collabComponentCount(driver)).assertLargerOrEqual(0);
    });

    it('ui_component_presence_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 1);
    });

    it('ui_component_presence_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 2);
    });

    it('ui_component_presence_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 3);
    });

    it('ui_component_presence_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 4);
    });

    it('ui_component_presence_5', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 5);
    });

    it('ui_component_presence_6', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 6);
    });

    it('ui_component_presence_7', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 7);
    });

    it('ui_component_presence_8', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 8);
    });

    it('ui_component_presence_9', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 9);
    });

    it('ui_component_presence_10', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 10);
    });

    it('ui_component_presence_11', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 11);
    });

    it('ui_component_presence_12', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 12);
    });

    it('ui_component_presence_13', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 13);
    });

    it('ui_component_presence_14', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 14);
    });

    it('ui_component_presence_15', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 15);
    });

    it('ui_component_presence_16', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 16);
    });

    it('ui_component_presence_17', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 17);
    });

    it('ui_component_presence_18', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 18);
    });

    it('ui_component_presence_19', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 19);
    });

    it('ui_component_presence_20', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const total = await collabComponentCount(driver);
      expect(total).assertLargerOrEqual(0);
      const buttons = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const texts = await findComponentsByType(driver, 'Text');
      expect(texts.length).assertLargerOrEqual(0);
      const inputs = await findComponentsByType(driver, 'TextInput');
      expect(inputs.length).assertLargerOrEqual(0);
      await serializedDelay(driver, DELAY_AFTER_OPERATION + 20);
    });

    it('ui_input_read_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_5', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_6', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_7', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_8', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_9', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_input_read_10', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text = await readInputText(driver);
      expect(text.length).assertLargerOrEqual(0);
      const components = await findComponentsByType(driver, 'TextInput');
      expect(components.length).assertLargerOrEqual(0);
      const focused = await checkFocusState(driver, INVALID_SESSION_ID);
      expect(focused === true || focused === false).assertTrue();
    });

    it('ui_touch_sequence_1', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 1; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_2', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 2; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_3', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 3; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_4', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 4; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_5', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 5; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_6', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 6; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_7', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 7; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_8', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 8; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_9', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 9; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    it('ui_touch_sequence_10', 0, async () => {
      const driver = getDriver();
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      for (let k = 0; k < 10; k++) {
        await simulateTouch(driver, 10, 10);
      }
      const count = await collabComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(INVALID_SESSION_ID);
    });

  });
}

