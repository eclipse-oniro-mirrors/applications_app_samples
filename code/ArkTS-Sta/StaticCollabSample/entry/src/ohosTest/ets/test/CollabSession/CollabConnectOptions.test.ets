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
  SessionIdGenerator,
  MockDeviceManager,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  OperationStatus,
  ConnectStartOption,
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
  STATUS_CONNECT_SUCCESS,
  STATUS_CONNECT_FAILED,
  STATUS_NO_DEVICE,
  STATUS_CREATE_FAILED,
  STATUS_INVALID_SESSION,
  STATUS_NOT_CONNECTED,
  STATUS_SESSION_DESTROYED,
  TEXT_ENCODING,
} from '../Shared/CollabTestDriver';

export default function collabConnectOptionsTest() {
  describe('CollabConnectOptions_Test', () => {
    it('case_options_0', 0, async () => {
      const o0 = buildConnectOptions(true);
      expect(o0.needSendData).assertEqual(true);
      expect(o0.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl0 = o0.clone();
      expect(cl0.equals(o0)).assertTrue();
    });

    it('case_create_id_1', 0, async () => {
      const b1 = new MockCollabBridge();
      const p1 = buildPeerInfo('device_1');
      const o1 = buildConnectOptions(true);
      const a1 = b1.createAbilityConnectionSession(COLLAB_SESSION_NAME, p1, o1);
      const c1 = b1.createAbilityConnectionSession(COLLAB_SESSION_NAME, p1, o1);
      expect(a1).assertLargerOrEqual(0);
      expect(c1).assertEqual(a1 + 1);
    });

    it('case_options_2', 0, async () => {
      const o2 = buildConnectOptions(true);
      expect(o2.needSendData).assertEqual(true);
      expect(o2.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl2 = o2.clone();
      expect(cl2.equals(o2)).assertTrue();
    });

    it('case_options_4', 0, async () => {
      const o4 = buildConnectOptions(true);
      expect(o4.needSendData).assertEqual(true);
      expect(o4.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl4 = o4.clone();
      expect(cl4.equals(o4)).assertTrue();
    });

    it('case_options_6', 0, async () => {
      const o6 = buildConnectOptions(true);
      expect(o6.needSendData).assertEqual(true);
      expect(o6.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl6 = o6.clone();
      expect(cl6.equals(o6)).assertTrue();
    });

  });

}
