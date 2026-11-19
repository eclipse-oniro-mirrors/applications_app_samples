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
  CollabMetrics,
} from '../Shared/CollabTestDriver';


// 指标断言器：封装常见指标校验逻辑
class MetricsAssertor {
  public isSane(snapshot: CollabMetrics): boolean {
    return snapshot.operationCount === snapshot.successCount + snapshot.failureCount;
  }

  public isAllSuccess(snapshot: CollabMetrics): boolean {
    return snapshot.successCount === snapshot.operationCount && snapshot.operationCount > 0;
  }

  public isAllFailure(snapshot: CollabMetrics): boolean {
    return snapshot.failureCount === snapshot.operationCount && snapshot.operationCount > 0;
  }
}
export default function connectionPerformanceTest() {
  describe('ConnectionPerformance_Test', () => {
    it('case_metrics_0', 0, async () => {
      const c0 = new CollabMetricsCollector();
      c0.record(true, 10);
      c0.record(false, 20);
      expect(c0.snapshot().operationCount).assertEqual(2);
      expect(c0.snapshot().successCount).assertEqual(1);
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

    it('case_metrics_2', 0, async () => {
      const c2 = new CollabMetricsCollector();
      c2.record(true, 12);
      c2.record(false, 22);
      expect(c2.snapshot().operationCount).assertEqual(2);
      expect(c2.snapshot().successCount).assertEqual(1);
    });

    it('case_connect_3', 0, async () => {
      const b3 = new MockCollabBridge();
      const p3 = buildPeerInfo('device_3');
      const o3 = buildConnectOptions(true);
      const sid3 = b3.createAbilityConnectionSession(COLLAB_SESSION_NAME, p3, o3);
      expect(b3.connect(sid3)).assertTrue();
      const s3 = b3.getSession(sid3);
      expect(s3 !== null).assertTrue();
    });

    it('case_metrics_4', 0, async () => {
      const c4 = new CollabMetricsCollector();
      c4.record(true, 14);
      c4.record(false, 24);
      expect(c4.snapshot().operationCount).assertEqual(2);
      expect(c4.snapshot().successCount).assertEqual(1);
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

    it('case_metrics_6', 0, async () => {
      const c6 = new CollabMetricsCollector();
      c6.record(true, 16);
      c6.record(false, 26);
      expect(c6.snapshot().operationCount).assertEqual(2);
      expect(c6.snapshot().successCount).assertEqual(1);
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
