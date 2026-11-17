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
import { DlpPermission, DlpPolicy, PermissionSet, PolicyParseResult, PolicyValidation, actionsOfMask,
  defaultPolicy, findTemplate, isExpired, isValidMask, maskOfActions, mergePolicies, parsePolicy,
  permissionLabels, permissionSummary, serializePolicy, validatePolicy } from '../main/ets/core/DlpPolicyCore';

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

function joinTexts(values: Array<string>): string {
  return values.join('|');
}

export default function policyMatrix2Test(): void {
  describe('PolicyMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0001
     * @tc.name      testActionsWritePrint0001
     * @tc.desc      write and print masks list both actions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsWritePrint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(joinTexts(actionsOfMask(6))).assertEqual('write|print');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0002
     * @tc.name      testActionsThree0002
     * @tc.desc      three bit masks list actions in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsThree0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(joinTexts(actionsOfMask(7))).assertEqual('read|write|print');
      expect(joinTexts(actionsOfMask(11))).assertEqual('read|write|copy');
      expect(joinTexts(actionsOfMask(13))).assertEqual('read|print|copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0003
     * @tc.name      testActionsWriteCopy0003
     * @tc.desc      write and copy masks list both actions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActionsWriteCopy0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(joinTexts(actionsOfMask(10))).assertEqual('write|copy');
      expect(joinTexts(actionsOfMask(14))).assertEqual('write|print|copy');
      expect(joinTexts(actionsOfMask(12))).assertEqual('print|copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0004
     * @tc.name      testLabelsSingle0004
     * @tc.desc      single permission labels are correct
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsSingle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(joinTexts(permissionLabels(2))).assertEqual('编辑');
      expect(joinTexts(permissionLabels(4))).assertEqual('打印');
      expect(joinTexts(permissionLabels(8))).assertEqual('复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0005
     * @tc.name      testSummaryWritePrint0005
     * @tc.desc      summaries join labels with the chinese separator
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryWritePrint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(permissionSummary(6)).assertEqual('编辑、打印');
      expect(permissionSummary(12)).assertEqual('打印、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0006
     * @tc.name      testWatermarkBoundary0006
     * @tc.desc      watermark length boundaries are enforced
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWatermarkBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const valid: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, repeatChar('w', 64), '');
      const invalid: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, repeatChar('w', 65), '');
      expect(validatePolicy(valid).valid).assertTrue();
      expect(validatePolicy(invalid).valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0007
     * @tc.name      testNicknameBoundary0007
     * @tc.desc      nickname length boundaries are enforced
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNicknameBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const valid: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, '', repeatChar('n', 64));
      const invalid: DlpPolicy = new DlpPolicy('u', 'n', 1, 0, '', repeatChar('n', 65));
      expect(validatePolicy(valid).valid).assertTrue();
      expect(validatePolicy(invalid).valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0008
     * @tc.name      testMaskBoundaries0008
     * @tc.desc      zero fails and full masks pass validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskBoundaries0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(validatePolicy(policy(0)).valid).assertFalse();
      expect(validatePolicy(policy(15)).valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0009
     * @tc.name      testSerializeEmptyTexts0009
     * @tc.desc      empty texts serialize as empty values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmptyTexts0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(serializePolicy(new DlpPolicy('a', 'n', 1, 0, '', '')).endsWith('watermark=;nickname='))
        .assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0010
     * @tc.name      testSerializeUnicode0010
     * @tc.desc      unicode texts are percent encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeUnicode0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = serializePolicy(new DlpPolicy('张三', '李四', 3, 0, '水印', '昵称'));
      expect(text.indexOf('%E5%BC%A0%E4%B8%89') > 0).assertTrue();
      const parsed: PolicyParseResult = parsePolicy(text);
      expect(parsed.valid).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.accountId).assertEqual('张三');
        expect(parsed.policy.watermark).assertEqual('水印');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0011
     * @tc.name      testParseSeparators0011
     * @tc.desc      trailing separators and unknown keys are tolerated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSeparators0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=3;;extra=9;');
      expect(parsed.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0012
     * @tc.name      testParseEmptyNumbers0012
     * @tc.desc      empty numeric values are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyNumbers0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const mask: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=');
      const expire: PolicyParseResult = parsePolicy('v1;accountId=a;accountName=n;mask=1;expire=');
      expect(mask.valid).assertFalse();
      expect(expire.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0013
     * @tc.name      testMergeMasks0013
     * @tc.desc      merge takes the override mask and keeps base accounts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMergeMasks0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const base: DlpPolicy = new DlpPolicy('base', 'Base', 1, 0, '', '');
      const override: DlpPolicy = new DlpPolicy('other', 'Other', 13, 0, '', '');
      const merged: DlpPolicy = mergePolicies(base, override);
      expect(merged.mask).assertEqual(13);
      expect(merged.accountId).assertEqual('base');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0014
     * @tc.name      testFindAllTemplates0014
     * @tc.desc      every built in template resolves by id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindAllTemplates0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const ids: Array<string> = ['read-only', 'editable', 'printable', 'copyable', 'full'];
      for (let index = 0; index < ids.length; index++) {
        expect(findTemplate(ids[index]) !== null).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0015
     * @tc.name      testPermissionCounts0015
     * @tc.desc      permission counts for combined masks
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionCounts0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new PermissionSet(6).count()).assertEqual(2);
      expect(new PermissionSet(10).count()).assertEqual(2);
      expect(new PermissionSet(13).count()).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0016
     * @tc.name      testValidMaskEdge0016
     * @tc.desc      non finite masks are invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidMaskEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isValidMask(Number.NaN)).assertFalse();
      expect(isValidMask(-0.5)).assertFalse();
      expect(isValidMask(15.0)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0017
     * @tc.name      testDefaultPolicyPermanent0017
     * @tc.desc      default policies never expire
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultPolicyPermanent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isExpired(defaultPolicy('u', 'n'), 2000000000)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0018
     * @tc.name      testExpiredBoundary0018
     * @tc.desc      expiry checks are inclusive at the boundary
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiredBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const expiring: DlpPolicy = new DlpPolicy('u', 'n', 1, 500, '', '');
      expect(isExpired(expiring, 499)).assertFalse();
      expect(isExpired(expiring, 500)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0019
     * @tc.name      testMaskOfActionsDup0019
     * @tc.desc      duplicate action names do not change the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfActionsDup0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(maskOfActions(['read', 'read', 'read'])).assertEqual(1);
      expect(maskOfActions(['print', 'copy', 'print'])).assertEqual(12);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0020
     * @tc.name      testRoundTripAllMasks0020
     * @tc.desc      every mask round trips through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripAllMasks0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let mask = 1; mask <= 15; mask++) {
        const parsed: PolicyParseResult = parsePolicy(serializePolicy(policy(mask)));
        expect(parsed.valid).assertTrue();
        if (parsed.policy !== null) {
          expect(parsed.policy.mask).assertEqual(mask);
        }
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0021
     * @tc.name      testValidateIssueFields0021
     * @tc.desc      validation issues carry field names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateIssueFields0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const validation: PolicyValidation = validatePolicy(new DlpPolicy('', '', 0, 0, '', ''));
      expect(validation.issues.length).assertEqual(3);
      expect(validation.issues[0].field).assertEqual('accountId');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0022
     * @tc.name      testPermissionSetMaskClamp0022
     * @tc.desc      permission sets clamp unknown bits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionSetMaskClamp0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new PermissionSet(0xFF).mask).assertEqual(15);
      expect(new PermissionSet(16 + DlpPermission.READ).mask).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_POLICYMATRIX2_0023
     * @tc.name      testPolicyFieldsRoundTrip0023
     * @tc.desc      policy text fields round trip through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyFieldsRoundTrip0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: DlpPolicy = new DlpPolicy('user-1', 'User One', 11, 1700000000, '机密', 'Nick');
      const parsed: PolicyParseResult = parsePolicy(serializePolicy(source));
      expect(parsed.policy !== null).assertTrue();
      if (parsed.policy !== null) {
        expect(parsed.policy.accountName).assertEqual('User One');
        expect(parsed.policy.expiredAtSec).assertEqual(1700000000);
        expect(parsed.policy.nickname).assertEqual('Nick');
      }
    })
  });
}
