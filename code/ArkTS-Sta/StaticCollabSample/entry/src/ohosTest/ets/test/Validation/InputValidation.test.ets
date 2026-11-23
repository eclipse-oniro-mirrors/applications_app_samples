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

export default function inputValidationTest() {
  describe('InputValidation_Test', () => {
    it('case_codec_0', 0, async () => {
      const src0 = mockPayload(16);
      const enc0 = encodeUtf8(src0);
      const dec0 = decodeUtf8(enc0);
      expect(dec0).assertEqual(src0);
      expect(utf8ByteLength(src0)).assertEqual(enc0.byteLength);
    });

    it('case_peer_missing_1', 0, async () => {
      const p1 = new PeerInfoModel('', '', '', '', '');
      expect(p1.isComplete()).assertFalse();
      expect(p1.missingFields().length).assertLarger(0);
    });

    it('case_codec_2', 0, async () => {
      const src2 = mockPayload(18);
      const enc2 = encodeUtf8(src2);
      const dec2 = decodeUtf8(enc2);
      expect(dec2).assertEqual(src2);
      expect(utf8ByteLength(src2)).assertEqual(enc2.byteLength);
    });

    it('case_peer_missing_3', 0, async () => {
      const p3 = new PeerInfoModel('', '', '', '', '');
      expect(p3.isComplete()).assertFalse();
      expect(p3.missingFields().length).assertLarger(0);
    });

    it('case_codec_4', 0, async () => {
      const src4 = mockPayload(20);
      const enc4 = encodeUtf8(src4);
      const dec4 = decodeUtf8(enc4);
      expect(dec4).assertEqual(src4);
      expect(utf8ByteLength(src4)).assertEqual(enc4.byteLength);
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

    it('case_peer_missing_7', 0, async () => {
      const p7 = new PeerInfoModel('', '', '', '', '');
      expect(p7.isComplete()).assertFalse();
      expect(p7.missingFields().length).assertLarger(0);
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
