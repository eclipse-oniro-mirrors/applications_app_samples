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
  PermissionItem,
  isValidCollabToken,
} from '../Shared/CollabTestDriver';


// 权限策略级别：描述敏感权限分级
enum PermissionTier {
  NORMAL = 'normal',
  SENSITIVE = 'sensitive'
}

// 权限目录项：描述一条权限及其分级
interface PermissionEntry {
  name: string;
  tier: PermissionTier;
  present: boolean;
}

// 权限目录构建器：从权限名称列表构造目录
class PermissionCatalogBuilder {
  public build(names: string[]): PermissionEntry[] {
    const entries: PermissionEntry[] = [];
    for (const name of names) {
      entries.push({
        name: name,
        tier: name.indexOf('CAMERA') >= 0 || name.indexOf('MICROPHONE') >= 0
          ? PermissionTier.SENSITIVE : PermissionTier.NORMAL,
        present: true
      });
    }
    return entries;
  }

  public countSensitive(entries: PermissionEntry[]): number {
    let count: number = 0;
    for (const entry of entries) {
      if (entry.tier === PermissionTier.SENSITIVE) {
        count++;
      }
    }
    return count;
  }
}
export default function permissionValidationTest() {
  describe('PermissionValidation_Test', () => {
    it('case_permission_0', 0, async () => {
      const items0: PermissionItem[] = buildPermissionItems(0);
      expect(items0.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items0[0].granted).assertEqual(false);
    });

    it('case_security_1', 0, async () => {
      expect(isValidCollabToken('token_1')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_2', 0, async () => {
      const items2: PermissionItem[] = buildPermissionItems(2);
      expect(items2.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items2[0].granted).assertEqual(true);
    });

    it('case_security_3', 0, async () => {
      expect(isValidCollabToken('token_3')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_4', 0, async () => {
      const items4: PermissionItem[] = buildPermissionItems(4);
      expect(items4.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items4[0].granted).assertEqual(true);
    });

    it('case_security_5', 0, async () => {
      expect(isValidCollabToken('token_5')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_6', 0, async () => {
      const items6: PermissionItem[] = buildPermissionItems(0);
      expect(items6.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items6[0].granted).assertEqual(false);
    });

    it('case_security_7', 0, async () => {
      expect(isValidCollabToken('token_7')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
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
