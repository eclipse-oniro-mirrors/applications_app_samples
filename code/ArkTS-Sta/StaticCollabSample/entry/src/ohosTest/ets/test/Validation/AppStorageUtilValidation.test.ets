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
  mockPayload,
  encodeUtf8,
  decodeUtf8,
  utf8ByteLength,
  concatBuffers,
  PeerInfoModel,
  ConnectOptionsModel,
  AppStorageModel,
  MockDeviceManager,
  MockCollabBridge,
  MockCollabSession,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  buildPeerInfo,
  buildConnectOptions,
  buildPermissionItems,
  isValidSessionId,
  REQUESTED_PERMISSIONS,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  INVALID_SESSION_ID,
  COLLAB_SESSION_NAME,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  ConnectStartOption,
  SessionIdGenerator,
  mockNetworkIds,
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
export default function appStorageUtilValidationTest() {
  describe('AppStorageUtilValidation_Test', () => {
    it('case_storage_default_0', 0, async () => {
      const m0 = new AppStorageModel();
      expect(m0.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(m0.isConnected()).assertFalse();
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

    it('case_storage_default_3', 0, async () => {
      const m3 = new AppStorageModel();
      expect(m3.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(m3.isConnected()).assertFalse();
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

    it('case_storage_default_6', 0, async () => {
      const m6 = new AppStorageModel();
      expect(m6.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(m6.isConnected()).assertFalse();
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
