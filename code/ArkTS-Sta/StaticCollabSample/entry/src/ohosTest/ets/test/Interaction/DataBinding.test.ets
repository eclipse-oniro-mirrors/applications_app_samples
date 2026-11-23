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
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  waitForUiReady,
  collabComponentCount,
  checkTextContent,
  checkComponentExists,
  clickButtonByText,
  readInputText,
  getCurrentFocusIndex,
  checkFocusState,
  pressAndWait,
  triggerSerializedKey,
  simulateTouch,
  serializedDelay,
  findComponentsByType,
  runSerializedUiOperation,
  KEY_UP,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  TIMEOUT_UI_RENDER,
  TIMEOUT_CONNECT,
  TIMEOUT_STATE_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_OPERATION,
  TOLERANCE_COMPONENT_COUNT,
  STRESS_ROUNDS_NAVIGATION,
  STABLE_ROUNDS,
  PAGE_TITLE,
  BUTTON_CONNECT,
  BUTTON_SEND_MESSAGE,
  BUTTON_SEND_DATA,
  BUTTON_DISCONNECT,
  BUTTON_DESTROY_SESSION,
  MESSAGE_INPUT_ID,
  launchSampleApp,
  MockCollabBridge,
  MockCollabSession,
  PeerInfoModel,
  ConnectOptionsModel,
  AppStorageModel,
  SessionState,
  buildPeerInfo,
  buildConnectOptions,
  COLLAB_SESSION_NAME,
  INVALID_SESSION_ID,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  encodeUtf8,
  decodeUtf8,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_SESSION_ID,
  CollabEventType,
  CollabTestLogger,
  CollabMetricsCollector,
} from '../Shared/CollabTestDriver';


// 状态观察结果：描述一次 AppStorage 键值监听结果
interface WatchResult {
  key: string;
  count: number;
}

// 状态写入器：将协作状态写入 AppStorage 模型
class CollabStateWriter {
  private storage: AppStorageModel;

  constructor(storage: AppStorageModel) {
    this.storage = storage;
  }

  public writeConnected(value: boolean): void {
    this.storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, value);
  }

  public writeSessionId(sessionId: number): void {
    this.storage.setOrCreate(STORAGE_KEY_SESSION_ID, sessionId);
  }

  public writeMessage(message: string): void {
    this.storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, message);
  }

  public readConnected(): boolean {
    return this.storage.isConnected();
  }

  public readSessionId(): number {
    return this.storage.getSessionId();
  }
}
export default function dataBindingTest() {
  describe('DataBinding_Test', () => {
    it('case_ui_render_0', 0, async () => {
      const d0 = getDriver();
      await waitForUiReady(d0, TIMEOUT_UI_RENDER);
      const cnt0 = await collabComponentCount(d0);
      expect(cnt0).assertLargerOrEqual(1);
    });

    it('case_storage_set_1', 0, async () => {
      const m1 = new AppStorageModel();
      expect(m1.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(m1.isConnected()).assertTrue();
    });

    it('case_storage_watch_2', 0, async () => {
      const m2 = new AppStorageModel();
      m2.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'onMessage');
      m2.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'hello');
      expect(m2.getWatchInvokeCount()).assertLargerOrEqual(1);
      expect(m2.getLastWatchedKey()).assertEqual(STORAGE_KEY_RECEIVE_MESSAGE);
    });

    it('case_ui_render_3', 0, async () => {
      const d3 = getDriver();
      await waitForUiReady(d3, TIMEOUT_UI_RENDER);
      const cnt3 = await collabComponentCount(d3);
      expect(cnt3).assertLargerOrEqual(1);
    });

    it('case_storage_set_4', 0, async () => {
      const m4 = new AppStorageModel();
      expect(m4.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(m4.isConnected()).assertTrue();
    });

    it('case_storage_watch_5', 0, async () => {
      const m5 = new AppStorageModel();
      m5.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'onMessage');
      m5.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'hello');
      expect(m5.getWatchInvokeCount()).assertLargerOrEqual(1);
      expect(m5.getLastWatchedKey()).assertEqual(STORAGE_KEY_RECEIVE_MESSAGE);
    });

    it('case_ui_render_6', 0, async () => {
      const d6 = getDriver();
      await waitForUiReady(d6, TIMEOUT_UI_RENDER);
      const cnt6 = await collabComponentCount(d6);
      expect(cnt6).assertLargerOrEqual(1);
    });

    it('case_storage_set_7', 0, async () => {
      const m7 = new AppStorageModel();
      expect(m7.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(m7.isConnected()).assertTrue();
    });

    it('case_extra_8', 0, async () => {
      const b8 = new MockCollabBridge();
      const p8 = buildPeerInfo('device_8');
      const o8 = buildConnectOptions(true);
      const a8 = b8.createAbilityConnectionSession(COLLAB_SESSION_NAME, p8, o8);
      const c8 = b8.createAbilityConnectionSession(COLLAB_SESSION_NAME, p8, o8);
      expect(a8).assertLargerOrEqual(0);
      expect(c8).assertEqual(a8 + 1);
    });

  });

}
