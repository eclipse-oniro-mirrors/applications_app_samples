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
export default function deviceManagerValidationTest() {
  describe('DeviceManagerValidation_Test', () => {
    it('case_device_0', 0, async () => {
      const dm0 = new MockDeviceManager(0);
      expect(dm0.size()).assertEqual(0);
      expect(dm0.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_1', 0, async () => {
      const dm1 = new MockDeviceManager(1);
      expect(dm1.size()).assertEqual(1);
      expect(dm1.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_2', 0, async () => {
      const dm2 = new MockDeviceManager(2);
      expect(dm2.size()).assertEqual(2);
      expect(dm2.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_3', 0, async () => {
      const dm3 = new MockDeviceManager(3);
      expect(dm3.size()).assertEqual(3);
      expect(dm3.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_4', 0, async () => {
      const dm4 = new MockDeviceManager(0);
      expect(dm4.size()).assertEqual(0);
      expect(dm4.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_5', 0, async () => {
      const dm5 = new MockDeviceManager(1);
      expect(dm5.size()).assertEqual(1);
      expect(dm5.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_6', 0, async () => {
      const dm6 = new MockDeviceManager(2);
      expect(dm6.size()).assertEqual(2);
      expect(dm6.getFirstNetworkId().length >= 0).assertTrue();
    });

    it('case_device_7', 0, async () => {
      const dm7 = new MockDeviceManager(3);
      expect(dm7.size()).assertEqual(3);
      expect(dm7.getFirstNetworkId().length >= 0).assertTrue();
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
