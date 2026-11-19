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
  CollabEventRecorder,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  buildPeerInfo,
  buildConnectOptions,
  COLLAB_SESSION_NAME,
  INVALID_SESSION_ID,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  encodeUtf8,
  decodeUtf8,
  mockPayload,
  concatBuffers,
  delay,
  STRESS_ROUNDS_NAVIGATION,
  STRESS_ROUNDS_LIFECYCLE,
} from '../Shared/CollabTestDriver';

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
    it('case_create_id_0', 0, async () => {
      const b0 = new MockCollabBridge();
      const p0 = buildPeerInfo('device_0');
      const o0 = buildConnectOptions(true);
      const a0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      const c0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      expect(a0).assertLargerOrEqual(0);
      expect(c0).assertEqual(a0 + 1);
    });

    it('case_disconnect_destroy_1', 0, async () => {
      const b1 = new MockCollabBridge();
      const p1 = buildPeerInfo('device_1');
      const o1 = buildConnectOptions(true);
      const sid1 = b1.createAbilityConnectionSession(COLLAB_SESSION_NAME, p1, o1);
      b1.connect(sid1);
      expect(b1.disconnect(sid1)).assertTrue();
      expect(b1.destroyAbilityConnectionSession(sid1)).assertTrue();
      const s1 = b1.getSession(sid1);
      if (s1 !== null) {
        expect(s1.isDestroyed()).assertTrue();
      }
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

    it('case_disconnect_destroy_5', 0, async () => {
      const b5 = new MockCollabBridge();
      const p5 = buildPeerInfo('device_5');
      const o5 = buildConnectOptions(true);
      const sid5 = b5.createAbilityConnectionSession(COLLAB_SESSION_NAME, p5, o5);
      b5.connect(sid5);
      expect(b5.disconnect(sid5)).assertTrue();
      expect(b5.destroyAbilityConnectionSession(sid5)).assertTrue();
      const s5 = b5.getSession(sid5);
      if (s5 !== null) {
        expect(s5.isDestroyed()).assertTrue();
      }
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
