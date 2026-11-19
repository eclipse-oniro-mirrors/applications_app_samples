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
  isValidCollabToken,
  buildPermissionItems,
  isValidSessionId,
  PeerInfoModel,
  ConnectOptionsModel,
  MockCollabBridge,
  MockCollabSession,
  CollabTestLogger,
  REQUESTED_PERMISSIONS,
  COLLAB_BUNDLE_NAME,
  PARAM_KEY_COLLAB_TOKEN,
  INVALID_SESSION_ID,
  buildPeerInfo,
  buildConnectOptions,
  COLLAB_SESSION_NAME,
  PermissionItem,
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
export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {
    it('case_security_0', 0, async () => {
      expect(isValidCollabToken('token_0')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_1', 0, async () => {
      const items1: PermissionItem[] = buildPermissionItems(1);
      expect(items1.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items1[0].granted).assertEqual(true);
    });

    it('case_security_2', 0, async () => {
      expect(isValidCollabToken('token_2')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_3', 0, async () => {
      const items3: PermissionItem[] = buildPermissionItems(3);
      expect(items3.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items3[0].granted).assertEqual(true);
    });

    it('case_security_4', 0, async () => {
      expect(isValidCollabToken('token_4')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_5', 0, async () => {
      const items5: PermissionItem[] = buildPermissionItems(5);
      expect(items5.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items5[0].granted).assertEqual(true);
    });

    it('case_security_6', 0, async () => {
      expect(isValidCollabToken('token_6')).assertTrue();
      expect(isValidCollabToken('')).assertFalse();
    });

    it('case_permission_7', 0, async () => {
      const items7: PermissionItem[] = buildPermissionItems(1);
      expect(items7.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items7[0].granted).assertEqual(true);
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
