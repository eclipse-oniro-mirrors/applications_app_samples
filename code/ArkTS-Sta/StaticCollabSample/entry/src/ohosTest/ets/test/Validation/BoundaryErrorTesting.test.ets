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

export default function boundaryErrorTestingTest() {
  describe('BoundaryErrorTesting_Test', () => {
    it('case_codec_0', 0, async () => {
      const src0 = mockPayload(16);
      const enc0 = encodeUtf8(src0);
      const dec0 = decodeUtf8(enc0);
      expect(dec0).assertEqual(src0);
      expect(utf8ByteLength(src0)).assertEqual(enc0.byteLength);
    });

    it('case_create_invalid_1', 0, async () => {
      const b1 = new MockCollabBridge();
      const p1 = buildPeerInfo('device_1');
      const o1 = buildConnectOptions(true);
      const sid1 = b1.createAbilityConnectionSession('', p1, o1);
      expect(sid1).assertEqual(INVALID_SESSION_ID);
    });

    it('case_peer_missing_2', 0, async () => {
      const p2 = new PeerInfoModel('', '', '', '', '');
      expect(p2.isComplete()).assertFalse();
      expect(p2.missingFields().length).assertLarger(0);
    });

    it('case_codec_3', 0, async () => {
      const src3 = mockPayload(19);
      const enc3 = encodeUtf8(src3);
      const dec3 = decodeUtf8(enc3);
      expect(dec3).assertEqual(src3);
      expect(utf8ByteLength(src3)).assertEqual(enc3.byteLength);
    });

    it('case_create_invalid_4', 0, async () => {
      const b4 = new MockCollabBridge();
      const p4 = buildPeerInfo('device_4');
      const o4 = buildConnectOptions(true);
      const sid4 = b4.createAbilityConnectionSession('', p4, o4);
      expect(sid4).assertEqual(INVALID_SESSION_ID);
    });

    it('case_peer_missing_5', 0, async () => {
      const p5 = new PeerInfoModel('', '', '', '', '');
      expect(p5.isComplete()).assertFalse();
      expect(p5.missingFields().length).assertLarger(0);
    });

    it('case_codec_6', 0, async () => {
      const src6 = mockPayload(22);
      const enc6 = encodeUtf8(src6);
      const dec6 = decodeUtf8(enc6);
      expect(dec6).assertEqual(src6);
      expect(utf8ByteLength(src6)).assertEqual(enc6.byteLength);
    });

    it('case_create_invalid_7', 0, async () => {
      const b7 = new MockCollabBridge();
      const p7 = buildPeerInfo('device_7');
      const o7 = buildConnectOptions(true);
      const sid7 = b7.createAbilityConnectionSession('', p7, o7);
      expect(sid7).assertEqual(INVALID_SESSION_ID);
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
