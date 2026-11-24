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

export default function connectOptionManagerValidationTest() {
  describe('ConnectOptionManagerValidation_Test', () => {
    it('case_options_0', 0, async () => {
      const o0 = buildConnectOptions(true);
      expect(o0.needSendData).assertEqual(true);
      expect(o0.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl0 = o0.clone();
      expect(cl0.equals(o0)).assertTrue();
    });

    it('case_options_1', 0, async () => {
      const o1 = buildConnectOptions(false);
      expect(o1.needSendData).assertEqual(false);
      expect(o1.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl1 = o1.clone();
      expect(cl1.equals(o1)).assertTrue();
    });

    it('case_options_2', 0, async () => {
      const o2 = buildConnectOptions(true);
      expect(o2.needSendData).assertEqual(true);
      expect(o2.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl2 = o2.clone();
      expect(cl2.equals(o2)).assertTrue();
    });

    it('case_options_3', 0, async () => {
      const o3 = buildConnectOptions(false);
      expect(o3.needSendData).assertEqual(false);
      expect(o3.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl3 = o3.clone();
      expect(cl3.equals(o3)).assertTrue();
    });

    it('case_options_4', 0, async () => {
      const o4 = buildConnectOptions(true);
      expect(o4.needSendData).assertEqual(true);
      expect(o4.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl4 = o4.clone();
      expect(cl4.equals(o4)).assertTrue();
    });

    it('case_options_5', 0, async () => {
      const o5 = buildConnectOptions(false);
      expect(o5.needSendData).assertEqual(false);
      expect(o5.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl5 = o5.clone();
      expect(cl5.equals(o5)).assertTrue();
    });

    it('case_options_6', 0, async () => {
      const o6 = buildConnectOptions(true);
      expect(o6.needSendData).assertEqual(true);
      expect(o6.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl6 = o6.clone();
      expect(cl6.equals(o6)).assertTrue();
    });

    it('case_options_7', 0, async () => {
      const o7 = buildConnectOptions(false);
      expect(o7.needSendData).assertEqual(false);
      expect(o7.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const cl7 = o7.clone();
      expect(cl7.equals(o7)).assertTrue();
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
