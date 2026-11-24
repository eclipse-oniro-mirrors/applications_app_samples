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
  MockCollabBridge,
  MockCollabSession,
  PeerInfoModel,
  ConnectOptionsModel,
  AppStorageModel,
  CollabEventRecorder,
  SessionState,
  CollabEventType,
  buildPeerInfo,
  buildConnectOptions,
  isValidSessionId,
  safeInvoke,
  safeInvokeAsync,
  COLLAB_SESSION_NAME,
  INVALID_SESSION_ID,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  STATUS_CONNECT_SUCCESS,
  STATUS_NOT_CONNECTED,
  STATUS_SESSION_DESTROYED,
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
export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {
    it('case_storage_set_0', 0, async () => {
      const m0 = new AppStorageModel();
      expect(m0.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(m0.isConnected()).assertTrue();
    });

    it('case_storage_default_1', 0, async () => {
      const m1 = new AppStorageModel();
      expect(m1.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(m1.isConnected()).assertFalse();
    });

    it('case_storage_set_2', 0, async () => {
      const m2 = new AppStorageModel();
      expect(m2.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(m2.isConnected()).assertTrue();
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

    it('case_storage_default_5', 0, async () => {
      const m5 = new AppStorageModel();
      expect(m5.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(m5.isConnected()).assertFalse();
    });

    it('case_storage_set_6', 0, async () => {
      const m6 = new AppStorageModel();
      expect(m6.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(m6.isConnected()).assertTrue();
    });

    it('case_storage_default_7', 0, async () => {
      const m7 = new AppStorageModel();
      expect(m7.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(m7.isConnected()).assertFalse();
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
