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
  SessionIdGenerator,
  MockDeviceManager,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  OperationStatus,
  ConnectStartOption,
  buildPeerInfo,
  buildConnectOptions,
  mockNetworkIds,
  mockPayload,
  encodeUtf8,
  decodeUtf8,
  utf8ByteLength,
  concatBuffers,
  isValidSessionId,
  isValidCollabToken,
  safeInvoke,
  safeInvokeAsync,
  buildPermissionItems,
  normalizeCallbackMessage,
  delay,
  waitUntil,
  COLLAB_BUNDLE_NAME,
  COLLAB_MODULE_NAME,
  COLLAB_ABILITY_NAME,
  COLLAB_SERVICE_NAME,
  COLLAB_SESSION_NAME,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  INVALID_SESSION_ID,
  REQUESTED_PERMISSIONS,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  PARAM_KEY_PEER_INFO,
  PARAM_KEY_CONNECT_OPTION,
  PARAM_KEY_COLLAB_TOKEN,
  STATUS_CONNECT_SUCCESS,
  STATUS_CONNECT_FAILED,
  STATUS_NO_DEVICE,
  STATUS_CREATE_FAILED,
  STATUS_INVALID_SESSION,
  STATUS_NOT_CONNECTED,
  STATUS_SESSION_DESTROYED,
  TEXT_ENCODING,
} from '../Shared/CollabTestDriver';


// 对端信息校验结果
interface PeerValidationResult {
  valid: boolean;
  missing: string[];
}

// 对端信息构建器：从原始字段装配 PeerInfoModel
class PeerInfoBuilder {
  private deviceId: string = '';
  private bundleName: string = '';
  private moduleName: string = '';
  private abilityName: string = '';
  private serviceName: string = '';

  public setDeviceId(value: string): PeerInfoBuilder {
    this.deviceId = value;
    return this;
  }

  public setBundleName(value: string): PeerInfoBuilder {
    this.bundleName = value;
    return this;
  }

  public setModuleName(value: string): PeerInfoBuilder {
    this.moduleName = value;
    return this;
  }

  public setAbilityName(value: string): PeerInfoBuilder {
    this.abilityName = value;
    return this;
  }

  public setServiceName(value: string): PeerInfoBuilder {
    this.serviceName = value;
    return this;
  }

  public build(): PeerInfoModel {
    return new PeerInfoModel(this.deviceId, this.bundleName, this.moduleName,
      this.abilityName, this.serviceName);
  }
}

// 对端信息校验器：逐字段检查完整性
class PeerInfoValidator {
  public validate(info: PeerInfoModel): PeerValidationResult {
    const missing: string[] = info.missingFields();
    return {
      valid: missing.length === 0,
      missing: missing
    };
  }
}
export default function collabPeerInfoModelTest() {
  describe('CollabPeerInfoModel_Test', () => {
    it('case_peer_complete_0', 0, async () => {
      const p0 = buildPeerInfo('device_0');
      expect(p0.isComplete()).assertTrue();
      expect(p0.missingFields().length).assertEqual(0);
    });

    it('case_peer_missing_1', 0, async () => {
      const p1 = new PeerInfoModel('', '', '', '', '');
      expect(p1.isComplete()).assertFalse();
      expect(p1.missingFields().length).assertLarger(0);
    });

    it('case_peer_roundtrip_2', 0, async () => {
      const p2 = buildPeerInfo('device_2');
      const rec2: Record<string, string> = p2.toRecord();
      const rt2 = PeerInfoModel.fromRecord(rec2);
      expect(rt2.equals(p2)).assertTrue();
    });

    it('case_peer_complete_3', 0, async () => {
      const p3 = buildPeerInfo('device_3');
      expect(p3.isComplete()).assertTrue();
      expect(p3.missingFields().length).assertEqual(0);
    });

    it('case_peer_missing_4', 0, async () => {
      const p4 = new PeerInfoModel('', '', '', '', '');
      expect(p4.isComplete()).assertFalse();
      expect(p4.missingFields().length).assertLarger(0);
    });

    it('case_peer_roundtrip_5', 0, async () => {
      const p5 = buildPeerInfo('device_5');
      const rec5: Record<string, string> = p5.toRecord();
      const rt5 = PeerInfoModel.fromRecord(rec5);
      expect(rt5.equals(p5)).assertTrue();
    });

    it('case_peer_complete_6', 0, async () => {
      const p6 = buildPeerInfo('device_6');
      expect(p6.isComplete()).assertTrue();
      expect(p6.missingFields().length).assertEqual(0);
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
