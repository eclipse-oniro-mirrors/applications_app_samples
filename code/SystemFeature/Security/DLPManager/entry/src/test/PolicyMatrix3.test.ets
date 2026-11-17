/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { DlpPermission, DlpPolicy, PermissionSet, PolicyParseResult, PolicyTemplate, actionsOfMask,
  builtInTemplates, defaultPolicy, findTemplate, isExpired, isValidMask, maskOfActions, mergePolicies, parsePolicy,
  permissionLabels, permissionSummary, serializePolicy, validatePolicy } from '../main/ets/core/DlpPolicyCore';

function policy(mask: number): DlpPolicy {
  return new DlpPolicy('u', 'n', mask, 0, '', '');
}

function popCount(mask: number): number {
  let count: number = 0;
  let value: number = mask;
  while (value > 0) {
    count += value & 1;
    value = value >> 1;
  }
  return count;
}

export default function policyMatrix3Test(): void {
  describe('PolicyMatrix3Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0001
     * @tc.name      testActionsCountLoop0001
     * @tc.desc      action counts match the popcount of every mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsCountLoop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let mask = 0; mask <= 15; mask++) {
        expect(actionsOfMask(mask).length).assertEqual(popCount(mask));
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0002
     * @tc.name      testLabelsCountLoop0002
     * @tc.desc      label counts match the popcount of every mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsCountLoop0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let mask = 0; mask <= 15; mask++) {
        expect(permissionLabels(mask).length).assertEqual(popCount(mask));
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0003
     * @tc.name      testLabelsJoin0003
     * @tc.desc      labels join in a fixed order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsJoin0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(permissionSummary(15)).assertEqual('读取、编辑、打印、复制');
      expect(permissionSummary(7)).assertEqual('读取、编辑、打印');
      expect(permissionSummary(14)).assertEqual('编辑、打印、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0004
     * @tc.name      testRoundTripLoop0004
     * @tc.desc      every mask round trips with unicode texts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripLoop0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let mask = 1; mask <= 15; mask++) {
        const source: DlpPolicy = new DlpPolicy('用户', '名称', mask, 1000, '水印', '昵称');
        const parsed: PolicyParseResult = parsePolicy(serializePolicy(source));
        expect(parsed.valid).assertTrue();
        if (parsed.policy !== null) {
          expect(parsed.policy.mask).assertEqual(mask);
          expect(parsed.policy.accountName).assertEqual('名称');
        }
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0005
     * @tc.name      testValidateLoop0005
     * @tc.desc      each invalid field is reported individually
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateLoop0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const fields: Array<DlpPolicy> = [
        new DlpPolicy('', 'n', 1, 0, '', ''),
        new DlpPolicy('u', '', 1, 0, '', ''),
        new DlpPolicy('u', 'n', 0, 0, '', ''),
        new DlpPolicy('u', 'n', 1, -1, '', '')
      ];
      for (let index = 0; index < fields.length; index++) {
        expect(validatePolicy(fields[index]).valid).assertFalse();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0006
     * @tc.name      testMergeExpiryLoop0006
     * @tc.desc      merge keeps the earlier expiry in every pairing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpiryLoop0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const base: DlpPolicy = new DlpPolicy('u', 'n', 1, 300, '', '');
      const overrides: Array<number> = [0, 100, 300, 500];
      const expected: Array<number> = [300, 100, 300, 300];
      for (let index = 0; index < overrides.length; index++) {
        const override: DlpPolicy = new DlpPolicy('u2', 'n2', 3, overrides[index], '', '');
        expect(mergePolicies(base, override).expiredAtSec).assertEqual(expected[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0007
     * @tc.name      testTemplateMasks0007
     * @tc.desc      built in templates expose stable masks
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateMasks0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: Array<PolicyTemplate> = builtInTemplates();
      const expected: Array<number> = [1, 3, 5, 9, 15];
      for (let index = 0; index < templates.length; index++) {
        expect(templates[index].mask).assertEqual(expected[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0008
     * @tc.name      testPermissionSetLoop0008
     * @tc.desc      permission sets grant and revoke every bit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionSetLoop0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const permissions: Array<DlpPermission> = [DlpPermission.READ, DlpPermission.WRITE,
        DlpPermission.PRINT, DlpPermission.COPY];
      let set: PermissionSet = new PermissionSet(0);
      for (let index = 0; index < permissions.length; index++) {
        set = set.grant(permissions[index]);
        expect(set.count()).assertEqual(index + 1);
      }
      for (let index = 0; index < permissions.length; index++) {
        set = set.revoke(permissions[index]);
      }
      expect(set.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0009
     * @tc.name      testSummaryLoop0009
     * @tc.desc      summaries cover every built in template
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryLoop0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(permissionSummary(1)).assertEqual('读取');
      expect(permissionSummary(3)).assertEqual('读取、编辑');
      expect(permissionSummary(5)).assertEqual('读取、打印');
      expect(permissionSummary(9)).assertEqual('读取、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0010
     * @tc.name      testValidMaskLoop0010
     * @tc.desc      mask validation covers every integer in range
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMaskLoop0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let mask = 0; mask <= 15; mask++) {
        expect(isValidMask(mask)).assertTrue();
      }
      expect(isValidMask(16)).assertFalse();
      expect(isValidMask(-1)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0011
     * @tc.name      testParseMalformedLoop0011
     * @tc.desc      malformed payloads are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformedLoop0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const payloads: Array<string> = ['', 'v2;mask=1', 'accountId=a', 'v1;mask=abc', 'v1;accountId=a;accountName=n;mask=1;x'];
      for (let index = 0; index < payloads.length; index++) {
        expect(parsePolicy(payloads[index]).valid).assertFalse();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0012
     * @tc.name      testDefaultPolicyLoop0012
     * @tc.desc      default policies are read only and permanent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultPolicyLoop0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: DlpPolicy = defaultPolicy('u', 'n');
      expect(value.mask).assertEqual(DlpPermission.READ);
      expect(isExpired(value, 2000000000)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0013
     * @tc.name      testExpiryLoop0013
     * @tc.desc      expiry checks cover each boundary
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryLoop0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const expiring: DlpPolicy = new DlpPolicy('u', 'n', 1, 100, '', '');
      const checks: Array<boolean> = [isExpired(expiring, 0), isExpired(expiring, 99),
        isExpired(expiring, 100), isExpired(expiring, 101)];
      expect(checks[0]).assertFalse();
      expect(checks[1]).assertFalse();
      expect(checks[2]).assertTrue();
      expect(checks[3]).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0014
     * @tc.name      testFindTemplateLoop0014
     * @tc.desc      every built in template id resolves
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindTemplateLoop0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const ids: Array<string> = ['read-only', 'editable', 'printable', 'copyable', 'full'];
      for (let index = 0; index < ids.length; index++) {
        expect(findTemplate(ids[index]) !== null).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0015
     * @tc.name      testMaskOfActionsLoop0015
     * @tc.desc      action names rebuild each single bit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfActionsLoop0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(maskOfActions(['read'])).assertEqual(1);
      expect(maskOfActions(['write'])).assertEqual(2);
      expect(maskOfActions(['print'])).assertEqual(4);
      expect(maskOfActions(['copy'])).assertEqual(8);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0016
     * @tc.name      testPermissionHelpers0016
     * @tc.desc      permission helpers follow mask changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionHelpers0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: DlpPolicy = policy(2);
      expect(new PermissionSet(value.mask).has(DlpPermission.WRITE)).assertTrue();
      expect(new PermissionSet(value.mask).has(DlpPermission.READ)).assertFalse();
      expect(new PermissionSet(value.mask).toggle(DlpPermission.READ).mask).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0017
     * @tc.name      testSerializeEmpty0017
     * @tc.desc      empty texts serialize as empty values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmpty0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(serializePolicy(policy(1)).endsWith('watermark=;nickname=')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0018
     * @tc.name      testParseVersionLoop0018
     * @tc.desc      wrong versions are rejected consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseVersionLoop0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const versions: Array<string> = ['v2', 'v0', 'V1', 'v1.0'];
      for (let index = 0; index < versions.length; index++) {
        expect(parsePolicy(versions[index] + ';accountId=a;accountName=n;mask=1').policy).assertNull();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0019
     * @tc.name      testRoundTripTwice0019
     * @tc.desc      repeated serialization rounds are stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripTwice0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = serializePolicy(new DlpPolicy('a', 'b', 7, 100, 'w', 'n'));
      const parsed: PolicyParseResult = parsePolicy(source);
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(serializePolicy(parsed.policy)).assertEqual(source);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX3_0020
     * @tc.name      testUnknownKeysLoop0020
     * @tc.desc      unknown keys are ignored without failing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownKeysLoop0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parsePolicy('v1;accountId=a;accountName=n;mask=1;x=1;y=2').valid).assertTrue();
    })
  });
}
