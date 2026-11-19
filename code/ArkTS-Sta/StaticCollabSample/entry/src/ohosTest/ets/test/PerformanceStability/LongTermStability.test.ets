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

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {
    it('case_create_id_0', 0, async () => {
      const b0 = new MockCollabBridge();
      const p0 = buildPeerInfo('device_0');
      const o0 = buildConnectOptions(true);
      const a0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      const c0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      expect(a0).assertLargerOrEqual(0);
      expect(c0).assertEqual(a0 + 1);
    });

    it('case_connect_1', 0, async () => {
      const b1 = new MockCollabBridge();
      const p1 = buildPeerInfo('device_1');
      const o1 = buildConnectOptions(true);
      const sid1 = b1.createAbilityConnectionSession(COLLAB_SESSION_NAME, p1, o1);
      expect(b1.connect(sid1)).assertTrue();
      const s1 = b1.getSession(sid1);
      expect(s1 !== null).assertTrue();
    });

    it('case_disconnect_destroy_2', 0, async () => {
      const b2 = new MockCollabBridge();
      const p2 = buildPeerInfo('device_2');
      const o2 = buildConnectOptions(true);
      const sid2 = b2.createAbilityConnectionSession(COLLAB_SESSION_NAME, p2, o2);
      b2.connect(sid2);
      expect(b2.disconnect(sid2)).assertTrue();
      expect(b2.destroyAbilityConnectionSession(sid2)).assertTrue();
      const s2 = b2.getSession(sid2);
      if (s2 !== null) {
        expect(s2.isDestroyed()).assertTrue();
      }
    });

    it('case_connect_4', 0, async () => {
      const b4 = new MockCollabBridge();
      const p4 = buildPeerInfo('device_4');
      const o4 = buildConnectOptions(true);
      const sid4 = b4.createAbilityConnectionSession(COLLAB_SESSION_NAME, p4, o4);
      expect(b4.connect(sid4)).assertTrue();
      const s4 = b4.getSession(sid4);
      expect(s4 !== null).assertTrue();
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

    it('case_connect_7', 0, async () => {
      const b7 = new MockCollabBridge();
      const p7 = buildPeerInfo('device_7');
      const o7 = buildConnectOptions(true);
      const sid7 = b7.createAbilityConnectionSession(COLLAB_SESSION_NAME, p7, o7);
      expect(b7.connect(sid7)).assertTrue();
      const s7 = b7.getSession(sid7);
      expect(s7 !== null).assertTrue();
    });

  });

}
