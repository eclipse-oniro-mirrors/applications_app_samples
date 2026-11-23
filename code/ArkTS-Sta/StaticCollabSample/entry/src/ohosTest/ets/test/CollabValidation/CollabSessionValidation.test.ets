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

export default function collabSessionValidationTest() {
  describe('CollabSessionValidation_Test', () => {
    it('case_create_id_0', 0, async () => {
      const b0 = new MockCollabBridge();
      const p0 = buildPeerInfo('device_0');
      const o0 = buildConnectOptions(true);
      const a0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      const c0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      expect(a0).assertLargerOrEqual(0);
      expect(c0).assertEqual(a0 + 1);
    });

    it('case_create_invalid_1', 0, async () => {
      const b1 = new MockCollabBridge();
      const p1 = buildPeerInfo('device_1');
      const o1 = buildConnectOptions(true);
      const sid1 = b1.createAbilityConnectionSession('', p1, o1);
      expect(sid1).assertEqual(INVALID_SESSION_ID);
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

    it('case_disconnect_destroy_3', 0, async () => {
      const b3 = new MockCollabBridge();
      const p3 = buildPeerInfo('device_3');
      const o3 = buildConnectOptions(true);
      const sid3 = b3.createAbilityConnectionSession(COLLAB_SESSION_NAME, p3, o3);
      b3.connect(sid3);
      expect(b3.disconnect(sid3)).assertTrue();
      expect(b3.destroyAbilityConnectionSession(sid3)).assertTrue();
      const s3 = b3.getSession(sid3);
      if (s3 !== null) {
        expect(s3.isDestroyed()).assertTrue();
      }
    });

    it('case_create_invalid_5', 0, async () => {
      const b5 = new MockCollabBridge();
      const p5 = buildPeerInfo('device_5');
      const o5 = buildConnectOptions(true);
      const sid5 = b5.createAbilityConnectionSession('', p5, o5);
      expect(sid5).assertEqual(INVALID_SESSION_ID);
    });

    it('case_connect_6', 0, async () => {
      const b6 = new MockCollabBridge();
      const p6 = buildPeerInfo('device_6');
      const o6 = buildConnectOptions(true);
      const sid6 = b6.createAbilityConnectionSession(COLLAB_SESSION_NAME, p6, o6);
      expect(b6.connect(sid6)).assertTrue();
      const s6 = b6.getSession(sid6);
      expect(s6 !== null).assertTrue();
    });

    it('case_disconnect_destroy_7', 0, async () => {
      const b7 = new MockCollabBridge();
      const p7 = buildPeerInfo('device_7');
      const o7 = buildConnectOptions(true);
      const sid7 = b7.createAbilityConnectionSession(COLLAB_SESSION_NAME, p7, o7);
      b7.connect(sid7);
      expect(b7.disconnect(sid7)).assertTrue();
      expect(b7.destroyAbilityConnectionSession(sid7)).assertTrue();
      const s7 = b7.getSession(sid7);
      if (s7 !== null) {
        expect(s7.isDestroyed()).assertTrue();
      }
    });

  });

}
