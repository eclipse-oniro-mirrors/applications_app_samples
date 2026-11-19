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
  isValidSessionId,
  isValidCollabToken,
  mockNetworkIds,
  normalizeCallbackMessage,
  COLLAB_BUNDLE_NAME,
  COLLAB_MODULE_NAME,
  COLLAB_ABILITY_NAME,
  COLLAB_SERVICE_NAME,
  COLLAB_SESSION_NAME,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  INVALID_SESSION_ID,
  STATUS_CONNECT_SUCCESS,
  STATUS_CONNECT_FAILED,
  STATUS_NO_DEVICE,
  STATUS_CREATE_FAILED,
  STATUS_INVALID_SESSION,
  STATUS_NOT_CONNECTED,
  STATUS_SESSION_DESTROYED,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  PARAM_KEY_PEER_INFO,
  PARAM_KEY_CONNECT_OPTION,
  PARAM_KEY_COLLAB_TOKEN,
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
export default function networkConnectivityTest() {
  describe('NetworkConnectivity_Test', () => {
    it('case_device_0', 0, async () => {
      const dm0 = new MockDeviceManager(0);
      expect(dm0.size()).assertEqual(0);
      expect(dm0.getFirstNetworkId().length >= 0).assertTrue();
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

    it('case_device_2', 0, async () => {
      const dm2 = new MockDeviceManager(2);
      expect(dm2.size()).assertEqual(2);
      expect(dm2.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_4', 0, async () => {
      const dm4 = new MockDeviceManager(0);
      expect(dm4.size()).assertEqual(0);
      expect(dm4.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_6', 0, async () => {
      const dm6 = new MockDeviceManager(2);
      expect(dm6.size()).assertEqual(2);
      expect(dm6.getFirstNetworkId().length >= 0).assertTrue();
    });

  });

}
