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
  MockDeviceManager,
  CollabEventRecorder,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  buildPeerInfo,
  buildConnectOptions,
  mockNetworkIds,
  isValidSessionId,
  isValidCollabToken,
  buildPermissionItems,
  COLLAB_BUNDLE_NAME,
  COLLAB_MODULE_NAME,
  COLLAB_ABILITY_NAME,
  COLLAB_SERVICE_NAME,
  COLLAB_SESSION_NAME,
  INVALID_SESSION_ID,
  REQUESTED_PERMISSIONS,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  PARAM_KEY_PEER_INFO,
  PARAM_KEY_CONNECT_OPTION,
  PARAM_KEY_COLLAB_TOKEN,
  STATUS_NO_DEVICE,
  STATUS_CREATE_FAILED,
  STATUS_INVALID_SESSION,
  STATUS_NOT_CONNECTED,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
} from '../Shared/CollabTestDriver';

export default function collabAppVersionTest() {
  describe('CollabAppVersion_Test', () => {
    it('case_create_id_0', 0, async () => {
      const b0 = new MockCollabBridge();
      const p0 = buildPeerInfo('device_0');
      const o0 = buildConnectOptions(true);
      const a0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      const c0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      expect(a0).assertLargerOrEqual(0);
      expect(c0).assertEqual(a0 + 1);
    });

    it('case_peer_complete_1', 0, async () => {
      const p1 = buildPeerInfo('device_1');
      expect(p1.isComplete()).assertTrue();
      expect(p1.missingFields().length).assertEqual(0);
    });

    it('case_security_2', 0, async () => {
      expect(isValidCollabToken('token_2')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_peer_complete_4', 0, async () => {
      const p4 = buildPeerInfo('device_4');
      expect(p4.isComplete()).assertTrue();
      expect(p4.missingFields().length).assertEqual(0);
    });

    it('case_security_5', 0, async () => {
      expect(isValidCollabToken('token_5')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_peer_complete_7', 0, async () => {
      const p7 = buildPeerInfo('device_7');
      expect(p7.isComplete()).assertTrue();
      expect(p7.missingFields().length).assertEqual(0);
    });

  });

}
