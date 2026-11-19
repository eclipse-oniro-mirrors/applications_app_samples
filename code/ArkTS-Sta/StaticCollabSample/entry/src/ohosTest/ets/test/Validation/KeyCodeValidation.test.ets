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
  KEY_UP,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
} from '../Shared/CollabTestDriver';

export default function keyCodeValidationTest() {
  describe('KeyCodeValidation_Test', () => {
    it('case_keycode_0', 0, async () => {
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_UP).assertLargerOrEqual(0);
    });

    it('case_keycode_1', 0, async () => {
      expect(KEY_DOWN).assertEqual(2013);
      expect(KEY_DOWN).assertLargerOrEqual(0);
    });

    it('case_keycode_2', 0, async () => {
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_LEFT).assertLargerOrEqual(0);
    });

    it('case_keycode_3', 0, async () => {
      expect(KEY_RIGHT).assertEqual(2015);
      expect(KEY_RIGHT).assertLargerOrEqual(0);
    });

    it('case_keycode_4', 0, async () => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_ENTER).assertLargerOrEqual(0);
    });

    it('case_keycode_5', 0, async () => {
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_BACK).assertLargerOrEqual(0);
    });

    it('case_keycode_6', 0, async () => {
      expect(KEY_HOME).assertEqual(3);
      expect(KEY_HOME).assertLargerOrEqual(0);
    });

    it('case_keycode_7', 0, async () => {
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_UP).assertLargerOrEqual(0);
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
