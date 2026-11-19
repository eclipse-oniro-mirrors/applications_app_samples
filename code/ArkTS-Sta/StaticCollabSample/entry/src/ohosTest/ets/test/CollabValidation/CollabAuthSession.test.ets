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

export default function collabAuthSessionTest() {
  describe('CollabAuthSession_Test', () => {
    it('case_security_0', 0, async () => {
      expect(isValidCollabToken('token_0')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
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

    it('case_connect_2', 0, async () => {
      const b2 = new MockCollabBridge();
      const p2 = buildPeerInfo('device_2');
      const o2 = buildConnectOptions(true);
      const sid2 = b2.createAbilityConnectionSession(COLLAB_SESSION_NAME, p2, o2);
      expect(b2.connect(sid2)).assertTrue();
      const s2 = b2.getSession(sid2);
      expect(s2 !== null).assertTrue();
    });

    it('case_security_3', 0, async () => {
      expect(isValidCollabToken('token_3')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_connect_5', 0, async () => {
      const b5 = new MockCollabBridge();
      const p5 = buildPeerInfo('device_5');
      const o5 = buildConnectOptions(true);
      const sid5 = b5.createAbilityConnectionSession(COLLAB_SESSION_NAME, p5, o5);
      expect(b5.connect(sid5)).assertTrue();
      const s5 = b5.getSession(sid5);
      expect(s5 !== null).assertTrue();
    });

    it('case_security_6', 0, async () => {
      expect(isValidCollabToken('token_6')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

  });

}
