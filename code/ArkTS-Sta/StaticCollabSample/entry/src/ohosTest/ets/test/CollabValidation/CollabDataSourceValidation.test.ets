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


// 设备发现结果：描述一次设备列表查询结果
interface DiscoveryResult {
  count: number;
  firstNetworkId: string;
  hasDevices: boolean;
}

// 设备发现器：封装设备列表查询
class DeviceDiscoverer {
  private manager: MockDeviceManager;

  constructor(manager: MockDeviceManager) {
    this.manager = manager;
  }

  public discover(): DiscoveryResult {
    const first: string = this.manager.getFirstNetworkId();
    return {
      count: this.manager.size(),
      firstNetworkId: first,
      hasDevices: first.length > 0
    };
  }
}
export default function collabDataSourceValidationTest() {
  describe('CollabDataSourceValidation_Test', () => {
    it('case_device_0', 0, async () => {
      const dm0 = new MockDeviceManager(0);
      expect(dm0.size()).assertEqual(0);
      expect(dm0.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_peer_complete_1', 0, async () => {
      const p1 = buildPeerInfo('device_1');
      expect(p1.isComplete()).assertTrue();
      expect(p1.missingFields().length).assertEqual(0);
    });

    it('case_peer_roundtrip_2', 0, async () => {
      const p2 = buildPeerInfo('device_2');
      const rec2: Record<string, string> = p2.toRecord();
      const rt2 = PeerInfoModel.fromRecord(rec2);
      expect(rt2.equals(p2)).assertTrue();
    });

    it('case_device_3', 0, async () => {
      const dm3 = new MockDeviceManager(3);
      expect(dm3.size()).assertEqual(3);
      expect(dm3.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_peer_complete_4', 0, async () => {
      const p4 = buildPeerInfo('device_4');
      expect(p4.isComplete()).assertTrue();
      expect(p4.missingFields().length).assertEqual(0);
    });

    it('case_peer_roundtrip_5', 0, async () => {
      const p5 = buildPeerInfo('device_5');
      const rec5: Record<string, string> = p5.toRecord();
      const rt5 = PeerInfoModel.fromRecord(rec5);
      expect(rt5.equals(p5)).assertTrue();
    });

    it('case_device_6', 0, async () => {
      const dm6 = new MockDeviceManager(2);
      expect(dm6.size()).assertEqual(2);
      expect(dm6.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_peer_complete_7', 0, async () => {
      const p7 = buildPeerInfo('device_7');
      expect(p7.isComplete()).assertTrue();
      expect(p7.missingFields().length).assertEqual(0);
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
