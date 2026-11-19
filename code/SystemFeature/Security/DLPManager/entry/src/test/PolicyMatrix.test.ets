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
import { DlpPermission, DlpPolicy, PERMISSION_ALL, PermissionSet, PolicyParseResult, PolicyTemplate,
  PolicyValidation, actionsOfMask, builtInTemplates, defaultPolicy, findTemplate, hasPermission, isExpired,
  isValidMask, maskOfActions, mergePolicies, parsePolicy, permissionLabels, permissionSummary,
  serializePolicy, validatePolicy, withPermission, withoutPermission, togglePermission
} from '../main/ets/core/DlpPolicyCore';

function joinTexts(values: string[]): string {
  return values.join('|');
}

function policy(mask: number): DlpPolicy {
  return new DlpPolicy('user001', 'User One', mask, 0, '', '');
}

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

export default function policyMatrixTest(): void {
  describe('PolicyMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0001
     * @tc.name      testActionsZero0001
     * @tc.desc      zero mask has no actions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsZero0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsZero0001 begin');
      expect(actionsOfMask(0).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0002
     * @tc.name      testActionsRead0002
     * @tc.desc      read only mask lists read
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsRead0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsRead0002 begin');
      expect(joinTexts(actionsOfMask(1))).assertEqual('read');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0003
     * @tc.name      testActionsWrite0003
     * @tc.desc      write mask lists write
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsWrite0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsWrite0003 begin');
      expect(joinTexts(actionsOfMask(2))).assertEqual('write');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0004
     * @tc.name      testActionsReadWrite0004
     * @tc.desc      read and write combine in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsReadWrite0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsReadWrite0004 begin');
      expect(joinTexts(actionsOfMask(3))).assertEqual('read|write');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0005
     * @tc.name      testActionsPrint0005
     * @tc.desc      print mask lists print after read
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsPrint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsPrint0005 begin');
      expect(joinTexts(actionsOfMask(5))).assertEqual('read|print');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0006
     * @tc.name      testActionsCopy0006
     * @tc.desc      copy mask lists copy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsCopy0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsCopy0006 begin');
      expect(joinTexts(actionsOfMask(9))).assertEqual('read|copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0007
     * @tc.name      testActionsAll0007
     * @tc.desc      all permissions list every action
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsAll0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsAll0007 begin');
      expect(joinTexts(actionsOfMask(15))).assertEqual('read|write|print|copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0008
     * @tc.name      testActionsIgnoredBits0008
     * @tc.desc      bits above the known mask are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsIgnoredBits0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActionsIgnoredBits0008 begin');
      expect(joinTexts(actionsOfMask(17))).assertEqual('read');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0009
     * @tc.name      testMaskFromActions0009
     * @tc.desc      action lists rebuild masks
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskFromActions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskFromActions0009 begin');
      expect(maskOfActions(['read', 'print'])).assertEqual(5);
      expect(maskOfActions(['copy'])).assertEqual(8);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0010
     * @tc.name      testPermissionCount0010
     * @tc.desc      permission counts follow set bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionCount0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionCount0010 begin');
      expect(new PermissionSet(0).count()).assertEqual(0);
      expect(new PermissionSet(5).count()).assertEqual(2);
      expect(new PermissionSet(15).count()).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0011
     * @tc.name      testPermissionChains0011
     * @tc.desc      grant revoke and toggle chains stay consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionChains0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionChains0011 begin');
      const set: PermissionSet = new PermissionSet(0)
        .grant(DlpPermission.READ)
        .grant(DlpPermission.WRITE)
        .grant(DlpPermission.PRINT)
        .revoke(DlpPermission.WRITE)
        .toggle(DlpPermission.COPY);
      expect(set.mask).assertEqual(13);
      expect(set.count()).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0012
     * @tc.name      testPermissionFromActions0012
     * @tc.desc      action sets convert into permission sets
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionFromActions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionFromActions0012 begin');
      const set: PermissionSet = PermissionSet.fromActions(['read', 'copy']);
      expect(set.mask).assertEqual(9);
      expect(set.has(DlpPermission.COPY)).assertTrue();
      expect(set.has(DlpPermission.PRINT)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0013
     * @tc.name      testValidMaskSweep0013
     * @tc.desc      mask validity follows the documented range
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMaskSweep0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidMaskSweep0013 begin');
      expect(isValidMask(0)).assertTrue();
      expect(isValidMask(15)).assertTrue();
      expect(isValidMask(16)).assertFalse();
      expect(isValidMask(-1)).assertFalse();
      expect(isValidMask(2.5)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0014
     * @tc.name      testLabelsSweep0014
     * @tc.desc      labels list every permission in chinese
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsSweep0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLabelsSweep0014 begin');
      expect(joinTexts(permissionLabels(3))).assertEqual('读取|编辑');
      expect(joinTexts(permissionLabels(15))).assertEqual('读取|编辑|打印|复制');
      expect(permissionSummary(0)).assertEqual('无权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0015
     * @tc.name      testValidMasks0015
     * @tc.desc      common masks pass validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMasks0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidMasks0015 begin');
      const masks: number[] = [1, 3, 5, 9, 15];
      for (let index = 0; index < masks.length; index++) {
        const validation: PolicyValidation = validatePolicy(policy(masks[index]));
        expect(validation.valid).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0016
     * @tc.name      testEmptyAccountId0016
     * @tc.desc      empty account ids fail validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyAccountId0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEmptyAccountId0016 begin');
      const invalid: DlpPolicy = new DlpPolicy('', 'n', 1, 0, '', '');
      expect(validatePolicy(invalid).issues[0].field).assertEqual('accountId');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0017
     * @tc.name      testBlankAccountName0017
     * @tc.desc      blank account names fail validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBlankAccountName0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBlankAccountName0017 begin');
      const invalid: DlpPolicy = new DlpPolicy('u', '  ', 1, 0, '', '');
      expect(validatePolicy(invalid).valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0018
     * @tc.name      testZeroMask0018
     * @tc.desc      zero permission masks fail validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testZeroMask0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testZeroMask0018 begin');
      expect(validatePolicy(policy(0)).issues[0].field).assertEqual('mask');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0019
     * @tc.name      testNegativeExpire0019
     * @tc.desc      negative expiries fail validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNegativeExpire0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNegativeExpire0019 begin');
      const invalid: DlpPolicy = new DlpPolicy('u', 'n', 1, -1, '', '');
      expect(validatePolicy(invalid).issues[0].field).assertEqual('expiredAtSec');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0020
     * @tc.name      testFractionExpire0020
     * @tc.desc      fractional expiries fail validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFractionExpire0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFractionExpire0020 begin');
      const invalid: DlpPolicy = new DlpPolicy('u', 'n', 1, 1.5, '', '');
      expect(validatePolicy(invalid).valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0021
     * @tc.name      testLongTexts0021
     * @tc.desc      over long watermark and nickname are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLongTexts0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLongTexts0021 begin');
      const invalid: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, repeatChar('w', 65), repeatChar('n', 65));
      expect(validatePolicy(invalid).issues.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0022
     * @tc.name      testMultipleIssues0022
     * @tc.desc      all policy problems are reported together
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultipleIssues0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMultipleIssues0022 begin');
      const invalid: DlpPolicy = new DlpPolicy('', '', 0, -1, '', '');
      expect(validatePolicy(invalid).issues.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0023
     * @tc.name      testExpiryBoundary0023
     * @tc.desc      expiry starts at the configured second
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiryBoundary0023 begin');
      const expiring: DlpPolicy = new DlpPolicy('u', 'n', 1, 100, '', '');
      expect(isExpired(expiring, 99)).assertFalse();
      expect(isExpired(expiring, 100)).assertTrue();
      expect(isExpired(policy(1), 999999999)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0024
     * @tc.name      testMergeExpiry0024
     * @tc.desc      merge keeps the stricter expiry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeExpiry0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeExpiry0024 begin');
      const base: DlpPolicy = new DlpPolicy('u', 'n', 1, 200, '', '');
      const short: DlpPolicy = new DlpPolicy('x', 'y', 3, 100, '', '');
      expect(mergePolicies(base, short).expiredAtSec).assertEqual(100);
      expect(mergePolicies(short, base).expiredAtSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0025
     * @tc.name      testMergePermanent0025
     * @tc.desc      permanent policies merge without expiry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergePermanent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergePermanent0025 begin');
      const base: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, '', '');
      const other: DlpPolicy = new DlpPolicy('x', 'y', 3, 0, '', '');
      expect(mergePolicies(base, other).expiredAtSec).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0026
     * @tc.name      testMergeTexts0026
     * @tc.desc      merge falls back to base text values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeTexts0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMergeTexts0026 begin');
      const base: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, 'BASE', 'Nick');
      const other: DlpPolicy = new DlpPolicy('x', 'y', 3, 0, '', '');
      const merged: DlpPolicy = mergePolicies(base, other);
      expect(merged.watermark).assertEqual('BASE');
      expect(merged.nickname).assertEqual('Nick');
      expect(merged.mask).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0027
     * @tc.name      testBuiltInTemplates0027
     * @tc.desc      built in template masks are stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltInTemplates0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuiltInTemplates0027 begin');
      const templates: PolicyTemplate[] = builtInTemplates();
      expect(templates.length).assertEqual(5);
      expect(templates[0].mask).assertEqual(1);
      expect(templates[1].mask).assertEqual(3);
      expect(templates[2].mask).assertEqual(5);
      expect(templates[3].mask).assertEqual(9);
      expect(templates[4].mask).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0028
     * @tc.name      testFindTemplate0028
     * @tc.desc      template ids resolve case sensitively
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindTemplate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindTemplate0028 begin');
      expect(findTemplate('full') !== null).assertTrue();
      expect(findTemplate('FULL')).assertNull();
      expect(findTemplate('missing')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0029
     * @tc.name      testSerializeExact0029
     * @tc.desc      serialization keeps the field order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeExact0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeExact0029 begin');
      const value: DlpPolicy = new DlpPolicy('u', 'n', 5, 100, 'W', 'N');
      expect(serializePolicy(value)).assertEqual('v1;accountId=u;accountName=n;mask=5;expire=100;watermark=W;nickname=N');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0030
     * @tc.name      testSerializeEscapes0030
     * @tc.desc      separators in values are percent encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEscapes0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeEscapes0030 begin');
      const value: DlpPolicy = new DlpPolicy('a b', 'n', 1, 0, 'w;x=y', '');
      expect(serializePolicy(value).indexOf('%20') > 0).assertTrue();
      expect(serializePolicy(value).indexOf('%3B') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0031
     * @tc.name      testRoundTripMasks0031
     * @tc.desc      policies with every mask round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripMasks0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripMasks0031 begin');
      const masks: number[] = [1, 3, 5, 9, 15];
      for (let index = 0; index < masks.length; index++) {
        const source: DlpPolicy = policy(masks[index]);
        const parsed: PolicyParseResult = parsePolicy(serializePolicy(source));
        expect(parsed.valid).assertTrue();
        expect(parsed.policy !== null).assertTrue();
        if (parsed.policy !== null) {
          expect(parsed.policy.mask).assertEqual(masks[index]);
        }
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0032
     * @tc.name      testParseEmpty0032
     * @tc.desc      empty text is rejected on parse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0032 begin');
      expect(parsePolicy('').policy).assertNull();
      expect(parsePolicy('   ').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0033
     * @tc.name      testParseVersion0033
     * @tc.desc      unsupported versions are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseVersion0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseVersion0033 begin');
      expect(parsePolicy('v2;accountId=a;accountName=n;mask=1').policy).assertNull();
      expect(parsePolicy('accountId=a').policy).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0034
     * @tc.name      testParseMalformed0034
     * @tc.desc      malformed fields are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformed0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMalformed0034 begin');
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;broken');
      expect(parsed.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0035
     * @tc.name      testParseUnknownKey0035
     * @tc.desc      unknown keys do not break parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseUnknownKey0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseUnknownKey0035 begin');
      expect(parsePolicy('v1;accountId=a;accountName=n;mask=1;extra=9').valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0036
     * @tc.name      testParseNumericErrors0036
     * @tc.desc      non numeric numeric fields are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNumericErrors0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNumericErrors0036 begin');
      expect(parsePolicy('v1;accountId=a;accountName=n;mask=abc').valid).assertFalse();
      expect(parsePolicy('v1;accountId=a;accountName=n;mask=1;expire=-5').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0037
     * @tc.name      testParseEncodedValues0037
     * @tc.desc      encoded values decode during parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEncodedValues0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEncodedValues0037 begin');
      const parsed: PolicyParseResult = parsePolicy(
        'v1;accountId=a;accountName=%E5%BC%A0%E4%B8%89;mask=1;watermark=w%3Bx');
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.accountName).assertEqual('张三');
        expect(parsed.policy.watermark).assertEqual('w;x');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0038
     * @tc.name      testParseTrailingSeparator0038
     * @tc.desc      trailing separators are tolerated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTrailingSeparator0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseTrailingSeparator0038 begin');
      expect(parsePolicy('v1;accountId=a;accountName=n;mask=1;').valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0039
     * @tc.name      testPolicyPermissions0039
     * @tc.desc      policy permission helpers follow the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyPermissions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPolicyPermissions0039 begin');
      const value: DlpPolicy = policy(3);
      expect(hasPermission(value, DlpPermission.READ)).assertTrue();
      expect(hasPermission(value, DlpPermission.PRINT)).assertFalse();
      expect(withPermission(value, DlpPermission.PRINT).mask).assertEqual(7);
      expect(withoutPermission(value, DlpPermission.READ).mask).assertEqual(2);
      expect(togglePermission(value, DlpPermission.READ).mask).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0040
     * @tc.name      testDefaultPolicy0040
     * @tc.desc      default policies grant read without expiry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultPolicy0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaultPolicy0040 begin');
      const value: DlpPolicy = defaultPolicy('u', 'n');
      expect(value.mask).assertEqual(1);
      expect(value.expiredAtSec).assertEqual(0);
      expect(value.accountName).assertEqual('n');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0041
     * @tc.name      testPermissionAllValue0041
     * @tc.desc      the all permission constant matches four bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionAllValue0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPermissionAllValue0041 begin');
      expect(PERMISSION_ALL).assertEqual(15);
      expect(DlpPermission.READ + DlpPermission.WRITE + DlpPermission.PRINT + DlpPermission.COPY).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX_0042
     * @tc.name      testPolicyImmutableHelpers0042
     * @tc.desc      permission helpers return new policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyImmutableHelpers0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPolicyImmutableHelpers0042 begin');
      const value: DlpPolicy = policy(1);
      const updated: DlpPolicy = withPermission(value, DlpPermission.COPY);
      expect(value.mask).assertEqual(1);
      expect(updated.mask).assertEqual(9);
      expect(updated.accountId).assertEqual('user001');
    })
  });
}
