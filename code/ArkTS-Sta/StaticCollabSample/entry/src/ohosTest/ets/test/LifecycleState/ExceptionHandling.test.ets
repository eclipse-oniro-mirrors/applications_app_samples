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
  SessionState,
  CollabEventType,
  buildPeerInfo,
  buildConnectOptions,
  isValidSessionId,
  safeInvoke,
  safeInvokeAsync,
  COLLAB_SESSION_NAME,
  INVALID_SESSION_ID,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  STATUS_CONNECT_SUCCESS,
  STATUS_NOT_CONNECTED,
  STATUS_SESSION_DESTROYED,
  CollabTestLogger,
  CollabMetricsCollector,
} from '../Shared/CollabTestDriver';

export default function exceptionHandlingTest() {
  describe('ExceptionHandling_Test', () => {
    it('case_create_invalid_0', 0, async () => {
      const b0 = new MockCollabBridge();
      const p0 = buildPeerInfo('device_0');
      const o0 = buildConnectOptions(true);
      const sid0 = b0.createAbilityConnectionSession('', p0, o0);
      expect(sid0).assertEqual(INVALID_SESSION_ID);
    });

    it('case_peer_missing_1', 0, async () => {
      const p1 = new PeerInfoModel('', '', '', '', '');
      expect(p1.isComplete()).assertFalse();
      expect(p1.missingFields().length).assertLarger(0);
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

    it('case_create_invalid_3', 0, async () => {
      const b3 = new MockCollabBridge();
      const p3 = buildPeerInfo('device_3');
      const o3 = buildConnectOptions(true);
      const sid3 = b3.createAbilityConnectionSession('', p3, o3);
      expect(sid3).assertEqual(INVALID_SESSION_ID);
    });

    it('case_peer_missing_4', 0, async () => {
      const p4 = new PeerInfoModel('', '', '', '', '');
      expect(p4.isComplete()).assertFalse();
      expect(p4.missingFields().length).assertLarger(0);
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

    it('case_create_invalid_6', 0, async () => {
      const b6 = new MockCollabBridge();
      const p6 = buildPeerInfo('device_6');
      const o6 = buildConnectOptions(true);
      const sid6 = b6.createAbilityConnectionSession('', p6, o6);
      expect(sid6).assertEqual(INVALID_SESSION_ID);
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
