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
import { DlpPermission, PERMISSION_ALL, POLICY_VERSION, PermissionSet, DlpPolicy, PolicyIssue,
  PolicyValidation, PolicyParseResult, PolicyTemplate, isValidMask, actionsOfMask, maskOfActions,
  permissionLabels, permissionSummary, defaultPolicy, withPermission, withoutPermission, togglePermission,
  hasPermission, isExpired, validatePolicy, mergePolicies, builtInTemplates, findTemplate, serializePolicy,
  parsePolicy } from '../main/ets/core/DlpPolicyCore';

function joinTexts(values: Array<string>): string {
  return values.join('|');
}

function issueFields(validation: PolicyValidation): string {
  const parts: Array<string> = [];
  for (let index = 0; index < validation.issues.length; index++) {
    parts.push(validation.issues[index].field + ':' + validation.issues[index].code);
  }
  return parts.join('|');
}

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

function samplePolicy(): DlpPolicy {
  return new DlpPolicy('user001', 'User One', DlpPermission.READ | DlpPermission.WRITE, 1700000000, 'WATERMARK',
    'Nick');
}

export default function dlpPolicyCoreTest(): void {
  describe('DlpPolicyCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0001
     * @tc.name      testPermissionSetMask0001
     * @tc.desc      mask is limited to the four permission bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionSetMask0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionSetMask0001 begin');
      console.info('testPermissionSetMask0001 begin');
      expect(new PermissionSet(0).mask).assertEqual(0);
      expect(new PermissionSet(PERMISSION_ALL).mask).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0002
     * @tc.name      testPermissionSetOverflow0002
     * @tc.desc      bits above the mask are dropped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionSetOverflow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionSetOverflow0002 begin');
      console.info('testPermissionSetOverflow0002 begin');
      expect(new PermissionSet(16).mask).assertEqual(0);
      expect(new PermissionSet(31).mask).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0003
     * @tc.name      testPermissionSetNegative0003
     * @tc.desc      negative masks keep all known bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionSetNegative0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionSetNegative0003 begin');
      console.info('testPermissionSetNegative0003 begin');
      expect(new PermissionSet(-1).mask).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0004
     * @tc.name      testPermissionHas0004
     * @tc.desc      permission lookup checks individual bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionHas0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionHas0004 begin');
      console.info('testPermissionHas0004 begin');
      const set: PermissionSet = new PermissionSet(DlpPermission.READ);
      expect(set.has(DlpPermission.READ)).assertTrue();
      expect(set.has(DlpPermission.WRITE)).assertFalse();
      expect(set.has(DlpPermission.PRINT)).assertFalse();
      expect(set.has(DlpPermission.COPY)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0005
     * @tc.name      testPermissionGrant0005
     * @tc.desc      granting adds a permission bit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionGrant0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionGrant0005 begin');
      console.info('testPermissionGrant0005 begin');
      const set: PermissionSet = new PermissionSet(0).grant(DlpPermission.READ);
      expect(set.mask).assertEqual(1);
      expect(set.grant(DlpPermission.WRITE).mask).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0006
     * @tc.name      testPermissionGrantIdempotent0006
     * @tc.desc      granting an existing permission does not change the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionGrantIdempotent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionGrantIdempotent0006 begin');
      console.info('testPermissionGrantIdempotent0006 begin');
      const set: PermissionSet = new PermissionSet(DlpPermission.READ);
      expect(set.grant(DlpPermission.READ).mask).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0007
     * @tc.name      testPermissionRevoke0007
     * @tc.desc      revoking clears only the requested bit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionRevoke0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionRevoke0007 begin');
      console.info('testPermissionRevoke0007 begin');
      const set: PermissionSet = new PermissionSet(3);
      expect(set.revoke(DlpPermission.READ).mask).assertEqual(2);
      expect(set.revoke(DlpPermission.WRITE).mask).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0008
     * @tc.name      testPermissionRevokeAbsent0008
     * @tc.desc      revoking an absent permission keeps the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionRevokeAbsent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionRevokeAbsent0008 begin');
      console.info('testPermissionRevokeAbsent0008 begin');
      const set: PermissionSet = new PermissionSet(1);
      expect(set.revoke(DlpPermission.PRINT).mask).assertEqual(1);
      expect(set.revoke(DlpPermission.READ).mask).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0009
     * @tc.name      testPermissionToggle0009
     * @tc.desc      toggling flips a single permission
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionToggle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionToggle0009 begin');
      console.info('testPermissionToggle0009 begin');
      const empty: PermissionSet = new PermissionSet(0);
      expect(empty.toggle(DlpPermission.READ).mask).assertEqual(1);
      expect(new PermissionSet(1).toggle(DlpPermission.READ).mask).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0010
     * @tc.name      testPermissionToggleKeepsOthers0010
     * @tc.desc      toggling preserves unrelated bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionToggleKeepsOthers0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionToggleKeepsOthers0010 begin');
      console.info('testPermissionToggleKeepsOthers0010 begin');
      const set: PermissionSet = new PermissionSet(3);
      expect(set.toggle(DlpPermission.PRINT).mask).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0011
     * @tc.name      testPermissionEmpty0011
     * @tc.desc      empty mask is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionEmpty0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionEmpty0011 begin');
      console.info('testPermissionEmpty0011 begin');
      expect(new PermissionSet(0).isEmpty()).assertTrue();
      expect(new PermissionSet(1).isEmpty()).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0012
     * @tc.name      testPermissionCount0012
     * @tc.desc      permission count reflects set bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionCount0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionCount0012 begin');
      console.info('testPermissionCount0012 begin');
      expect(new PermissionSet(0).count()).assertEqual(0);
      expect(new PermissionSet(1).count()).assertEqual(1);
      expect(new PermissionSet(15).count()).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0013
     * @tc.name      testPermissionFromActions0013
     * @tc.desc      action names build the permission mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionFromActions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionFromActions0013 begin');
      console.info('testPermissionFromActions0013 begin');
      const set: PermissionSet = PermissionSet.fromActions(['read', 'write']);
      expect(set.mask).assertEqual(3);
      expect(set.has(DlpPermission.WRITE)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0014
     * @tc.name      testPermissionFromActionsUnknown0014
     * @tc.desc      unknown actions are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionFromActionsUnknown0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionFromActionsUnknown0014 begin');
      console.info('testPermissionFromActionsUnknown0014 begin');
      expect(PermissionSet.fromActions(['share']).mask).assertEqual(0);
      expect(PermissionSet.fromActions([]).mask).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0015
     * @tc.name      testActionsEmpty0015
     * @tc.desc      empty mask has no actions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsEmpty0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsEmpty0015 begin');
      console.info('testActionsEmpty0015 begin');
      expect(actionsOfMask(0).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0016
     * @tc.name      testActionsSingle0016
     * @tc.desc      single permissions produce single actions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsSingle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsSingle0016 begin');
      console.info('testActionsSingle0016 begin');
      expect(joinTexts(actionsOfMask(1))).assertEqual('read');
      expect(joinTexts(actionsOfMask(4))).assertEqual('print');
      expect(joinTexts(actionsOfMask(8))).assertEqual('copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0017
     * @tc.name      testActionsCombined0017
     * @tc.desc      combined masks list actions in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsCombined0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsCombined0017 begin');
      console.info('testActionsCombined0017 begin');
      expect(joinTexts(actionsOfMask(3))).assertEqual('read|write');
      expect(joinTexts(actionsOfMask(15))).assertEqual('read|write|print|copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0018
     * @tc.name      testMaskOfActionsEmpty0018
     * @tc.desc      empty action list produces a zero mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfActionsEmpty0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfActionsEmpty0018 begin');
      console.info('testMaskOfActionsEmpty0018 begin');
      expect(maskOfActions([])).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0019
     * @tc.name      testMaskOfActionsBasic0019
     * @tc.desc      action names map to the expected bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfActionsBasic0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfActionsBasic0019 begin');
      console.info('testMaskOfActionsBasic0019 begin');
      expect(maskOfActions(['read'])).assertEqual(1);
      expect(maskOfActions(['write', 'print'])).assertEqual(6);
      expect(maskOfActions(['read', 'copy', 'read'])).assertEqual(9);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0020
     * @tc.name      testMaskOfActionsInvalid0020
     * @tc.desc      unknown action names are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfActionsInvalid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfActionsInvalid0020 begin');
      console.info('testMaskOfActionsInvalid0020 begin');
      expect(maskOfActions(['share', ''])) .assertEqual(0);
      expect(maskOfActions(['READ'])).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0021
     * @tc.name      testLabelsEmpty0021
     * @tc.desc      empty mask has no labels
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsEmpty0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLabelsEmpty0021 begin');
      console.info('testLabelsEmpty0021 begin');
      expect(permissionLabels(0).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0022
     * @tc.name      testLabelsBasic0022
     * @tc.desc      permission labels are chinese
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsBasic0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLabelsBasic0022 begin');
      console.info('testLabelsBasic0022 begin');
      expect(joinTexts(permissionLabels(1))).assertEqual('读取');
      expect(joinTexts(permissionLabels(3))).assertEqual('读取|编辑');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0023
     * @tc.name      testLabelsFull0023
     * @tc.desc      all four labels are listed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsFull0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLabelsFull0023 begin');
      console.info('testLabelsFull0023 begin');
      expect(joinTexts(permissionLabels(15))).assertEqual('读取|编辑|打印|复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0024
     * @tc.name      testSummaryEmpty0024
     * @tc.desc      zero mask shows the no permission label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryEmpty0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryEmpty0024 begin');
      console.info('testSummaryEmpty0024 begin');
      expect(permissionSummary(0)).assertEqual('无权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0025
     * @tc.name      testSummaryBasic0025
     * @tc.desc      labels join with the chinese separator
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryBasic0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryBasic0025 begin');
      console.info('testSummaryBasic0025 begin');
      expect(permissionSummary(1)).assertEqual('读取');
      expect(permissionSummary(3)).assertEqual('读取、编辑');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0026
     * @tc.name      testSummaryFull0026
     * @tc.desc      full mask lists all permissions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryFull0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryFull0026 begin');
      console.info('testSummaryFull0026 begin');
      expect(permissionSummary(15)).assertEqual('读取、编辑、打印、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0027
     * @tc.name      testValidMaskRange0027
     * @tc.desc      masks between zero and all are valid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMaskRange0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidMaskRange0027 begin');
      console.info('testValidMaskRange0027 begin');
      expect(isValidMask(0)).assertTrue();
      expect(isValidMask(15)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0028
     * @tc.name      testValidMaskOutOfRange0028
     * @tc.desc      masks outside the bit range are invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMaskOutOfRange0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidMaskOutOfRange0028 begin');
      console.info('testValidMaskOutOfRange0028 begin');
      expect(isValidMask(16)).assertFalse();
      expect(isValidMask(-1)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0029
     * @tc.name      testValidMaskFraction0029
     * @tc.desc      fractional masks are invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMaskFraction0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidMaskFraction0029 begin');
      console.info('testValidMaskFraction0029 begin');
      expect(isValidMask(1.5)).assertFalse();
      expect(isValidMask(Number.NaN)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0030
     * @tc.name      testDefaultPolicy0030
     * @tc.desc      default policy grants read only without expiry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultPolicy0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaultPolicy0030 begin');
      console.info('testDefaultPolicy0030 begin');
      const policy: DlpPolicy = defaultPolicy('user001', 'User One');
      expect(policy.accountId).assertEqual('user001');
      expect(policy.accountName).assertEqual('User One');
      expect(policy.mask).assertEqual(1);
      expect(policy.expiredAtSec).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0031
     * @tc.name      testWithPermission0031
     * @tc.desc      adding a permission updates the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWithPermission0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testWithPermission0031 begin');
      console.info('testWithPermission0031 begin');
      const policy: DlpPolicy = withPermission(samplePolicy(), DlpPermission.PRINT);
      expect(policy.mask).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0032
     * @tc.name      testWithoutPermission0032
     * @tc.desc      removing a permission updates the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWithoutPermission0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testWithoutPermission0032 begin');
      console.info('testWithoutPermission0032 begin');
      const policy: DlpPolicy = withoutPermission(samplePolicy(), DlpPermission.READ);
      expect(policy.mask).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0033
     * @tc.name      testTogglePermission0033
     * @tc.desc      toggling a policy permission flips the bit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTogglePermission0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTogglePermission0033 begin');
      console.info('testTogglePermission0033 begin');
      expect(togglePermission(samplePolicy(), DlpPermission.COPY).mask).assertEqual(11);
      expect(togglePermission(samplePolicy(), DlpPermission.READ).mask).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0034
     * @tc.name      testHasPermission0034
     * @tc.desc      policy permission lookup checks the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHasPermission0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHasPermission0034 begin');
      console.info('testHasPermission0034 begin');
      const policy: DlpPolicy = samplePolicy();
      expect(hasPermission(policy, DlpPermission.READ)).assertTrue();
      expect(hasPermission(policy, DlpPermission.PRINT)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0035
     * @tc.name      testPermissionImmutable0035
     * @tc.desc      permission helpers return new policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionImmutable0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionImmutable0035 begin');
      console.info('testPermissionImmutable0035 begin');
      const policy: DlpPolicy = samplePolicy();
      const updated: DlpPolicy = withPermission(policy, DlpPermission.COPY);
      expect(policy.mask).assertEqual(3);
      expect(updated.mask).assertEqual(11);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0036
     * @tc.name      testPermissionKeepFields0036
     * @tc.desc      permission changes keep account fields
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionKeepFields0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionKeepFields0036 begin');
      console.info('testPermissionKeepFields0036 begin');
      const updated: DlpPolicy = withPermission(samplePolicy(), DlpPermission.COPY);
      expect(updated.accountId).assertEqual('user001');
      expect(updated.watermark).assertEqual('WATERMARK');
      expect(updated.expiredAtSec).assertEqual(1700000000);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0037
     * @tc.name      testExpiredNever0037
     * @tc.desc      zero expiry never expires
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiredNever0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiredNever0037 begin');
      console.info('testExpiredNever0037 begin');
      const policy: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, '', '');
      expect(isExpired(policy, 2000000000)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0038
     * @tc.name      testExpiredBefore0038
     * @tc.desc      policy is active before the expiry second
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiredBefore0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiredBefore0038 begin');
      console.info('testExpiredBefore0038 begin');
      const policy: DlpPolicy = new DlpPolicy('a', 'n', 1, 100, '', '');
      expect(isExpired(policy, 99)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0039
     * @tc.name      testExpiredAt0039
     * @tc.desc      policy expires at the expiry second
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiredAt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiredAt0039 begin');
      console.info('testExpiredAt0039 begin');
      const policy: DlpPolicy = new DlpPolicy('a', 'n', 1, 100, '', '');
      expect(isExpired(policy, 100)).assertTrue();
      expect(isExpired(policy, 101)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0040
     * @tc.name      testExpiredNegative0040
     * @tc.desc      negative expiry is treated as permanent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiredNegative0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiredNegative0040 begin');
      console.info('testExpiredNegative0040 begin');
      const policy: DlpPolicy = new DlpPolicy('a', 'n', 1, -5, '', '');
      expect(isExpired(policy, 2000000000)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0041
     * @tc.name      testValidPolicy0041
     * @tc.desc      complete policy passes validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidPolicy0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidPolicy0041 begin');
      console.info('testValidPolicy0041 begin');
      const validation: PolicyValidation = validatePolicy(samplePolicy());
      expect(validation.valid).assertTrue();
      expect(validation.issues.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0042
     * @tc.name      testEmptyAccountId0042
     * @tc.desc      missing account id is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyAccountId0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEmptyAccountId0042 begin');
      console.info('testEmptyAccountId0042 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('', 'n', 1, 0, '', ''));
      expect(validation.valid).assertFalse();
      expect(issueFields(validation)).assertEqual('accountId:empty');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0043
     * @tc.name      testBlankAccountId0043
     * @tc.desc      whitespace only account id is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBlankAccountId0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBlankAccountId0043 begin');
      console.info('testBlankAccountId0043 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('   ', 'n', 1, 0, '', ''));
      expect(validation.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0044
     * @tc.name      testEmptyAccountName0044
     * @tc.desc      missing account name is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyAccountName0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEmptyAccountName0044 begin');
      console.info('testEmptyAccountName0044 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', '', 1, 0, '', ''));
      expect(issueFields(validation)).assertEqual('accountName:empty');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0045
     * @tc.name      testZeroMask0045
     * @tc.desc      zero permissions are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testZeroMask0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testZeroMask0045 begin');
      console.info('testZeroMask0045 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', 'n', 0, 0, '', ''));
      expect(issueFields(validation)).assertEqual('mask:empty');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0046
     * @tc.name      testNegativeExpire0046
     * @tc.desc      negative expiry is rejected by validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNegativeExpire0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNegativeExpire0046 begin');
      console.info('testNegativeExpire0046 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', 'n', 1, -1, '', ''));
      expect(issueFields(validation)).assertEqual('expiredAtSec:range');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0047
     * @tc.name      testFractionExpire0047
     * @tc.desc      fractional expiry is rejected by validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFractionExpire0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFractionExpire0047 begin');
      console.info('testFractionExpire0047 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', 'n', 1, 1.5, '', ''));
      expect(validation.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0048
     * @tc.name      testLongWatermark0048
     * @tc.desc      watermark longer than sixty four characters is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongWatermark0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLongWatermark0048 begin');
      console.info('testLongWatermark0048 begin');
      const watermark: string = repeatChar('w', 65);
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', 'n', 1, 0, watermark, ''));
      expect(issueFields(validation)).assertEqual('watermark:length');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0049
     * @tc.name      testLongNickname0049
     * @tc.desc      nickname longer than sixty four characters is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongNickname0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLongNickname0049 begin');
      console.info('testLongNickname0049 begin');
      const nickname: string = repeatChar('n', 65);
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', 'n', 1, 0, '', nickname));
      expect(issueFields(validation)).assertEqual('nickname:length');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0050
     * @tc.name      testMaxTextLength0050
     * @tc.desc      exactly sixty four characters is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaxTextLength0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaxTextLength0050 begin');
      console.info('testMaxTextLength0050 begin');
      const text: string = repeatChar('x', 64);
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('a', 'n', 1, 0, text, text));
      expect(validation.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0051
     * @tc.name      testMultipleIssues0051
     * @tc.desc      multiple problems are all reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultipleIssues0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMultipleIssues0051 begin');
      console.info('testMultipleIssues0051 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('', '', 0, -1, '', ''));
      expect(validation.issues.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0052
     * @tc.name      testMergeOverrideMask0052
     * @tc.desc      merge takes the override mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeOverrideMask0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeOverrideMask0052 begin');
      console.info('testMergeOverrideMask0052 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, '', '');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 100, 'W', 'N');
      const merged: DlpPolicy = mergePolicies(base, override);
      expect(merged.mask).assertEqual(3);
      expect(merged.accountId).assertEqual('a');
      expect(merged.accountName).assertEqual('n');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0053
     * @tc.name      testMergeExpireBothZero0053
     * @tc.desc      merge keeps permanent when both are permanent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpireBothZero0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeExpireBothZero0053 begin');
      console.info('testMergeExpireBothZero0053 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, '', '');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 0, '', '');
      expect(mergePolicies(base, override).expiredAtSec).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0054
     * @tc.name      testMergeExpireOneZero0054
     * @tc.desc      a single expiry survives the merge
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpireOneZero0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeExpireOneZero0054 begin');
      console.info('testMergeExpireOneZero0054 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 100, '', '');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 0, '', '');
      expect(mergePolicies(base, override).expiredAtSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0055
     * @tc.name      testMergeExpireBaseZero0055
     * @tc.desc      override expiry wins when base is permanent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpireBaseZero0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeExpireBaseZero0055 begin');
      console.info('testMergeExpireBaseZero0055 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, '', '');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 100, '', '');
      expect(mergePolicies(base, override).expiredAtSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0056
     * @tc.name      testMergeExpireMin0056
     * @tc.desc      the earlier expiry is kept when both exist
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpireMin0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeExpireMin0056 begin');
      console.info('testMergeExpireMin0056 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 200, '', '');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 100, '', '');
      expect(mergePolicies(base, override).expiredAtSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0057
     * @tc.name      testMergeExpireMinReverse0057
     * @tc.desc      base expiry is kept when it is earlier
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpireMinReverse0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeExpireMinReverse0057 begin');
      console.info('testMergeExpireMinReverse0057 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 100, '', '');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 200, '', '');
      expect(mergePolicies(base, override).expiredAtSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0058
     * @tc.name      testMergeWatermarkFallback0058
     * @tc.desc      empty override watermark keeps the base watermark
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeWatermarkFallback0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeWatermarkFallback0058 begin');
      console.info('testMergeWatermarkFallback0058 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, 'BASE', 'BaseNick');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 0, '', '');
      const merged: DlpPolicy = mergePolicies(base, override);
      expect(merged.watermark).assertEqual('BASE');
      expect(merged.nickname).assertEqual('BaseNick');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0059
     * @tc.name      testMergeOverrideWatermark0059
     * @tc.desc      non empty override text wins
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeOverrideWatermark0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeOverrideWatermark0059 begin');
      console.info('testMergeOverrideWatermark0059 begin');
      const base: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, 'BASE', 'BaseNick');
      const override: DlpPolicy = new DlpPolicy('b', 'm', 3, 0, 'NEW', 'NewNick');
      const merged: DlpPolicy = mergePolicies(base, override);
      expect(merged.watermark).assertEqual('NEW');
      expect(merged.nickname).assertEqual('NewNick');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0060
     * @tc.name      testTemplatesCount0060
     * @tc.desc      five built in templates are provided
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplatesCount0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplatesCount0060 begin');
      console.info('testTemplatesCount0060 begin');
      expect(builtInTemplates().length).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0061
     * @tc.name      testTemplateReadOnly0061
     * @tc.desc      read only template grants a single permission
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateReadOnly0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateReadOnly0061 begin');
      console.info('testTemplateReadOnly0061 begin');
      const template: PolicyTemplate | null = findTemplate('read-only');
      expect(template !== null).assertTrue();
      if (template !== null) {
        expect(template.mask).assertEqual(1);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0062
     * @tc.name      testTemplateEditable0062
     * @tc.desc      editable template combines read and write
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateEditable0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateEditable0062 begin');
      console.info('testTemplateEditable0062 begin');
      const template: PolicyTemplate | null = findTemplate('editable');
      expect(template !== null).assertTrue();
      if (template !== null) {
        expect(template.mask).assertEqual(3);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0063
     * @tc.name      testTemplatePrintable0063
     * @tc.desc      printable template combines read and print
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplatePrintable0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplatePrintable0063 begin');
      console.info('testTemplatePrintable0063 begin');
      const template: PolicyTemplate | null = findTemplate('printable');
      expect(template !== null).assertTrue();
      if (template !== null) {
        expect(template.mask).assertEqual(5);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0064
     * @tc.name      testTemplateCopyable0064
     * @tc.desc      copyable template combines read and copy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateCopyable0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateCopyable0064 begin');
      console.info('testTemplateCopyable0064 begin');
      const template: PolicyTemplate | null = findTemplate('copyable');
      expect(template !== null).assertTrue();
      if (template !== null) {
        expect(template.mask).assertEqual(9);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0065
     * @tc.name      testTemplateFull0065
     * @tc.desc      full template grants every permission
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateFull0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateFull0065 begin');
      console.info('testTemplateFull0065 begin');
      const template: PolicyTemplate | null = findTemplate('full');
      expect(template !== null).assertTrue();
      if (template !== null) {
        expect(template.mask).assertEqual(PERMISSION_ALL);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0066
     * @tc.name      testTemplateMissing0066
     * @tc.desc      unknown template ids return null
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateMissing0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateMissing0066 begin');
      console.info('testTemplateMissing0066 begin');
      expect(findTemplate('FULL')).assertNull();
      expect(findTemplate('')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0067
     * @tc.name      testSerializeBasic0067
     * @tc.desc      serialization follows the documented field order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeBasic0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeBasic0067 begin');
      console.info('testSerializeBasic0067 begin');
      const policy: DlpPolicy = new DlpPolicy('user001', 'User One', 3, 1700000000, 'W', 'N');
      const text: string = serializePolicy(policy);
      expect(text).assertEqual('v1;accountId=user001;accountName=User%20One;mask=3;expire=1700000000;watermark=W;nickname=N');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0068
     * @tc.name      testSerializeVersion0068
     * @tc.desc      serialized text starts with the policy version
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeVersion0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeVersion0068 begin');
      console.info('testSerializeVersion0068 begin');
      expect(serializePolicy(defaultPolicy('a', 'n')).startsWith(POLICY_VERSION + ';')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0069
     * @tc.name      testSerializeEscape0069
     * @tc.desc      semicolons and equals inside values are encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEscape0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeEscape0069 begin');
      console.info('testSerializeEscape0069 begin');
      const policy: DlpPolicy = new DlpPolicy('a', 'n', 1, 0, 'w;x=y', '');
      expect(serializePolicy(policy).indexOf('%3B') > 0).assertTrue();
      expect(serializePolicy(policy).indexOf('w%3Bx%3Dy') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0070
     * @tc.name      testSerializeChinese0070
     * @tc.desc      chinese text is percent encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeChinese0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeChinese0070 begin');
      console.info('testSerializeChinese0070 begin');
      const policy: DlpPolicy = new DlpPolicy('a', '张三', 1, 0, '水印', '');
      const text: string = serializePolicy(policy);
      expect(text.indexOf('%E5%BC%A0%E4%B8%89') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0071
     * @tc.name      testSerializeEmptyText0071
     * @tc.desc      empty watermark and nickname stay empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmptyText0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeEmptyText0071 begin');
      console.info('testSerializeEmptyText0071 begin');
      const text: string = serializePolicy(new DlpPolicy('a', 'n', 1, 0, '', ''));
      expect(text.endsWith('watermark=;nickname=')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0072
     * @tc.name      testParseRoundTrip0072
     * @tc.desc      serialized policy parses back with the same fields
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseRoundTrip0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseRoundTrip0072 begin');
      console.info('testParseRoundTrip0072 begin');
      const policy: DlpPolicy = samplePolicy();
      const parsed: PolicyParseResult = parsePolicy(serializePolicy(policy));
      expect(parsed.valid).assertTrue();
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.accountId).assertEqual('user001');
        expect(parsed.policy.accountName).assertEqual('User One');
        expect(parsed.policy.mask).assertEqual(3);
        expect(parsed.policy.expiredAtSec).assertEqual(1700000000);
        expect(parsed.policy.watermark).assertEqual('WATERMARK');
        expect(parsed.policy.nickname).assertEqual('Nick');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0073
     * @tc.name      testParseEmpty0073
     * @tc.desc      empty text is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0073 begin');
      console.info('testParseEmpty0073 begin');
      const parsed: PolicyParseResult = parsePolicy('');
      expect(parsed.valid).assertFalse();
      expect(parsed.policy).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0074
     * @tc.name      testParseWrongVersion0074
     * @tc.desc      unsupported versions are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseWrongVersion0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseWrongVersion0074 begin');
      console.info('testParseWrongVersion0074 begin');
      const parsed: PolicyParseResult = parsePolicy('v2;accountId=a;accountName=n;mask=1');
      expect(parsed.valid).assertFalse();
      expect(parsed.policy).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0075
     * @tc.name      testParseMissingFields0075
     * @tc.desc      missing required fields fail validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMissingFields0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMissingFields0075 begin');
      console.info('testParseMissingFields0075 begin');
      const parsed: PolicyParseResult = parsePolicy('v1');
      expect(parsed.valid).assertFalse();
      expect(parsed.validation.issues.length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0076
     * @tc.name      testParseMalformedField0076
     * @tc.desc      fields without equals are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformedField0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMalformedField0076 begin');
      console.info('testParseMalformedField0076 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;broken');
      expect(parsed.valid).assertFalse();
      expect(issueFields(parsed.validation).indexOf('field:malformed') >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0077
     * @tc.name      testParseUnknownKey0077
     * @tc.desc      unknown keys are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseUnknownKey0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseUnknownKey0077 begin');
      console.info('testParseUnknownKey0077 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;extra=1');
      expect(parsed.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0078
     * @tc.name      testParseTrailingSemicolon0078
     * @tc.desc      trailing separators do not break parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTrailingSemicolon0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseTrailingSemicolon0078 begin');
      console.info('testParseTrailingSemicolon0078 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;');
      expect(parsed.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0079
     * @tc.name      testParseEncodedValue0079
     * @tc.desc      encoded values are decoded on parse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEncodedValue0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEncodedValue0079 begin');
      console.info('testParseEncodedValue0079 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;watermark=w%3Bx');
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.watermark).assertEqual('w;x');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0080
     * @tc.name      testParseEncodedChinese0080
     * @tc.desc      encoded chinese text decodes correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEncodedChinese0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEncodedChinese0080 begin');
      console.info('testParseEncodedChinese0080 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=%E5%BC%A0%E4%B8%89;mask=1');
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.accountName).assertEqual('张三');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0081
     * @tc.name      testParseBadEncoding0081
     * @tc.desc      malformed percent encoding is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadEncoding0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseBadEncoding0081 begin');
      console.info('testParseBadEncoding0081 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;watermark=%zz');
      expect(parsed.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0082
     * @tc.name      testParseNonNumericMask0082
     * @tc.desc      non numeric masks are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNonNumericMask0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNonNumericMask0082 begin');
      console.info('testParseNonNumericMask0082 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=abc');
      expect(parsed.valid).assertFalse();
      expect(issueFields(parsed.validation).indexOf('mask:format') >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0083
     * @tc.name      testParseNonNumericExpire0083
     * @tc.desc      non numeric expiry is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNonNumericExpire0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNonNumericExpire0083 begin');
      console.info('testParseNonNumericExpire0083 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;expire=-5');
      expect(parsed.valid).assertFalse();
      expect(issueFields(parsed.validation).indexOf('expire:format') >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0084
     * @tc.name      testParseEmptyMaskValue0084
     * @tc.desc      empty numeric values are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyMaskValue0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmptyMaskValue0084 begin');
      console.info('testParseEmptyMaskValue0084 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=');
      expect(issueFields(parsed.validation).indexOf('mask:empty') >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0085
     * @tc.name      testParseMaskValue0085
     * @tc.desc      numeric mask is parsed into the policy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMaskValue0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMaskValue0085 begin');
      console.info('testParseMaskValue0085 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=9');
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.mask).assertEqual(9);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0086
     * @tc.name      testParseExpireValue0086
     * @tc.desc      numeric expiry is parsed into the policy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseExpireValue0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseExpireValue0086 begin');
      console.info('testParseExpireValue0086 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;expire=1700000000');
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.expiredAtSec).assertEqual(1700000000);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0087
     * @tc.name      testParseWhitespace0087
     * @tc.desc      surrounding whitespace is trimmed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseWhitespace0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseWhitespace0087 begin');
      console.info('testParseWhitespace0087 begin');
      const parsed: PolicyParseResult = parsePolicy('  v1;accountId=a;accountName=n;mask=1  ');
      expect(parsed.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0088
     * @tc.name      testParseVersionOnly0088
     * @tc.desc      version only text yields an invalid policy object
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseVersionOnly0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseVersionOnly0088 begin');
      console.info('testParseVersionOnly0088 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;');
      expect(parsed.policy !== null).assertTrue();
      expect(parsed.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0089
     * @tc.name      testParseIssueContent0089
     * @tc.desc      issues carry field and message text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseIssueContent0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseIssueContent0089 begin');
      console.info('testParseIssueContent0089 begin');
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('', 'n', 1, 0, '', ''));
      const issue: PolicyIssue = validation.issues[0];
      expect(issue.field).assertEqual('accountId');
      expect(issue.code).assertEqual('empty');
      expect(issue.message.length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0090
     * @tc.name      testTemplateFields0090
     * @tc.desc      templates expose id and resource key
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateFields0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateFields0090 begin');
      console.info('testTemplateFields0090 begin');
      const templates: Array<PolicyTemplate> = builtInTemplates();
      expect(templates[0].id).assertEqual('read-only');
      expect(templates[0].nameKey).assertEqual('template_read_only');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_DLPPOLICY_0091
     * @tc.name      testTemplateMaskClamp0091
     * @tc.desc      template masks are clamped to known bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateMaskClamp0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateMaskClamp0091 begin');
      console.info('testTemplateMaskClamp0091 begin');
      const template: PolicyTemplate = new PolicyTemplate('x', 'k', 31);
      expect(template.mask).assertEqual(15);
    })
  });
}
