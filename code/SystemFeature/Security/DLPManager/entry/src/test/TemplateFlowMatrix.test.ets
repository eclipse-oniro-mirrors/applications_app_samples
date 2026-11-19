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
import { DlpPolicy, PolicyTemplate } from '../main/ets/core/DlpPolicyCore';
import { CustomTemplate, TemplateModel, parseTemplateText, templateDisplayName } from '../main/ets/feature/TemplateModel';

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

function namesOf(model: TemplateModel): string {
  const parts: string[] = [];
  const items: CustomTemplate[] = model.customTemplates();
  for (let index = 0; index < items.length; index++) {
    parts.push(items[index].name);
  }
  return parts.join('|');
}

export default function templateFlowMatrixTest(): void {
  describe('TemplateFlowMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0001
     * @tc.name      testCreateFind0001
     * @tc.desc      created templates can be found by id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCreateFind0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      const id: string = model.add('alpha', 3, 100).id;
      expect(id).assertEqual('custom-100');
      expect(model.find(id) !== null).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0002
     * @tc.name      testUpdateFlow0002
     * @tc.desc      updates change fields but keep identity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.update('custom-100', 'beta', 9);
      const found: CustomTemplate | null = model.find('custom-100');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('beta');
        expect(found.mask).assertEqual(9);
        expect(found.createdAtSec).assertEqual(100);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0003
     * @tc.name      testRemoveFlow0003
     * @tc.desc      removed templates disappear from lookups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      expect(model.remove('custom-100')).assertTrue();
      expect(model.find('custom-100')).assertNull();
      expect(model.customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0004
     * @tc.name      testSerializeMidFlow0004
     * @tc.desc      serialization after creation preserves the template
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeMidFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customCount()).assertEqual(1);
      expect(parsed.maskOf('custom-100')).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0005
     * @tc.name      testSerializeAfterUpdate0005
     * @tc.desc      serialization after update stores the new values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeAfterUpdate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.update('custom-100', 'beta', 5);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customTemplates()[0].name).assertEqual('beta');
      expect(parsed.customTemplates()[0].mask).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0006
     * @tc.name      testSerializeAfterRemove0006
     * @tc.desc      serialization after removal drops the template
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeAfterRemove0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.add('beta', 5, 200);
      model.remove('custom-100');
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customCount()).assertEqual(1);
      expect(namesOf(parsed)).assertEqual('beta');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0007
     * @tc.name      testDuplicateAfterUpdate0007
     * @tc.desc      names freed by update can be reused
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDuplicateAfterUpdate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.update('custom-100', 'beta', 3);
      expect(model.add('alpha', 5, 200).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0008
     * @tc.name      testDuplicateAfterRemove0008
     * @tc.desc      names freed by removal can be reused
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDuplicateAfterRemove0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.remove('custom-100');
      expect(model.add('alpha', 5, 200).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0009
     * @tc.name      testMaskStepwise0009
     * @tc.desc      mask updates flow through summaries and policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskStepwise0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      expect(model.summaryOf('custom-100')).assertEqual('读取');
      model.update('custom-100', 'alpha', 5);
      expect(model.summaryOf('custom-100')).assertEqual('读取、打印');
      model.update('custom-100', 'alpha', 15);
      expect(model.summaryOf('custom-100')).assertEqual('读取、编辑、打印、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0010
     * @tc.name      testPolicyAfterUpdate0010
     * @tc.desc      policy conversion reflects the latest mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyAfterUpdate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.update('custom-100', 'alpha', 9);
      const policy: DlpPolicy | null = model.toPolicy('u', 'n', 'custom-100');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(9);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0011
     * @tc.name      testPolicyAfterRemove0011
     * @tc.desc      removed templates cannot produce policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyAfterRemove0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.remove('custom-100');
      expect(model.toPolicy('u', 'n', 'custom-100')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0012
     * @tc.name      testOrderAfterRemove0012
     * @tc.desc      remaining customs keep their insertion order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOrderAfterRemove0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 2, 200);
      model.add('three', 3, 300);
      model.remove('custom-200');
      expect(namesOf(model)).assertEqual('one|three');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0013
     * @tc.name      testDisplayAfterUpdate0013
     * @tc.desc      display names follow updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayAfterUpdate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.update('custom-100', 'beta', 1);
      expect(templateDisplayName(model.allTemplates()[5])).assertEqual('beta');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0014
     * @tc.name      testUniqueAfterReadd0014
     * @tc.desc      re-adding in the same second gets a fresh id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueAfterReadd0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.remove('custom-100');
      const again: string = model.add('alpha', 1, 100).id;
      expect(again).assertEqual('custom-100');
      expect(model.customCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0015
     * @tc.name      testCountLifecycle0015
     * @tc.desc      counts follow the lifecycle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountLifecycle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.totalCount()).assertEqual(5);
      model.add('alpha', 1, 100);
      expect(model.totalCount()).assertEqual(6);
      model.remove('custom-100');
      expect(model.totalCount()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0016
     * @tc.name      testAddFive0016
     * @tc.desc      five custom templates coexist
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddFive0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      for (let index = 1; index <= 5; index++) {
        expect(model.add('t' + index.toString(), index, index).ok).assertTrue();
      }
      expect(model.customCount()).assertEqual(5);
      expect(model.totalCount()).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0017
     * @tc.name      testRemoveAll0017
     * @tc.desc      removing all customs restores the built in count
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveAll0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 2, 200);
      model.remove('custom-100');
      model.remove('custom-200');
      expect(model.customCount()).assertEqual(0);
      expect(model.allTemplates().length).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0018
     * @tc.name      testRoundTripTwice0018
     * @tc.desc      repeated serialization cycles stay stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripTwice0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.add('beta', 5, 200);
      const first: TemplateModel = parseTemplateText(model.serialize());
      const second: TemplateModel = parseTemplateText(first.serialize());
      expect(second.serialize()).assertEqual(model.serialize());
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0019
     * @tc.name      testMaskOfAfterRemove0019
     * @tc.desc      removed ids no longer resolve
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfAfterRemove0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 3, 100);
      model.remove('custom-100');
      expect(model.maskOf('custom-100')).assertEqual(-1);
      expect(model.summaryOf('custom-100')).assertEqual('无权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0020
     * @tc.name      testSummaryAfterMaskChange0020
     * @tc.desc      summaries change with the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryAfterMaskChange0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 2, 100);
      expect(model.summaryOf('custom-100')).assertEqual('编辑');
      model.update('custom-100', 'alpha', 10);
      expect(model.summaryOf('custom-100')).assertEqual('编辑、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0021
     * @tc.name      testInvalidUpdateName0021
     * @tc.desc      invalid names reject updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidUpdateName0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      expect(model.update('custom-100', '', 1).ok).assertFalse();
      expect(model.update('custom-100', repeatChar('x', 21), 1).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0022
     * @tc.name      testInvalidUpdateMask0022
     * @tc.desc      invalid masks reject updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidUpdateMask0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      expect(model.update('custom-100', 'alpha', 0).ok).assertFalse();
      expect(model.update('custom-100', 'alpha', 16).ok).assertFalse();
      expect(model.maskOf('custom-100')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0023
     * @tc.name      testWhitespaceName0023
     * @tc.desc      names are trimmed before duplicate checks
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWhitespaceName0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      expect(model.add('  alpha  ', 1, 200).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0024
     * @tc.name      testBuiltInMasksEvolve0024
     * @tc.desc      built in masks are unaffected by custom changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltInMasksEvolve0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 15, 100);
      expect(model.maskOf('read-only')).assertEqual(1);
      expect(model.maskOf('full')).assertEqual(15);
      expect(model.maskOf('custom-100')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0025
     * @tc.name      testAllTemplatesOrder0025
     * @tc.desc      custom templates follow the built ins in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAllTemplatesOrder0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 2, 200);
      const all: PolicyTemplate[] = model.allTemplates();
      expect(all.length).assertEqual(7);
      expect(all[5].id).assertEqual('custom-100');
      expect(all[6].id).assertEqual('custom-200');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0026
     * @tc.name      testMaskSweep0026
     * @tc.desc      odd masks can be created and resolved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskSweep0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      const masks: number[] = [1, 2, 4, 8, 7, 11, 13, 14, 15];
      for (let index = 0; index < masks.length; index++) {
        const result = model.add('m' + masks[index].toString(), masks[index], index + 1);
        expect(result.ok).assertTrue();
        expect(model.maskOf(result.id)).assertEqual(masks[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0027
     * @tc.name      testUnicodeAfterUpdate0027
     * @tc.desc      unicode names round trip after updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnicodeAfterUpdate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.update('custom-100', '年度审阅😀', 3);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customTemplates()[0].name).assertEqual('年度审阅😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0028
     * @tc.name      testPolicyBuiltIns0028
     * @tc.desc      built in policies resolve after custom changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyBuiltIns0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      const policy: DlpPolicy | null = model.toPolicy('u', 'n', 'copyable');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(9);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0029
     * @tc.name      testUpdateMissingAfterRemove0029
     * @tc.desc      updates after removal report failure
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateMissingAfterRemove0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.remove('custom-100');
      expect(model.update('custom-100', 'beta', 3).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEFLOW_0030
     * @tc.name      testSerializeEmptyAfterRemove0030
     * @tc.desc      removing all customs restores empty serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmptyAfterRemove0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('alpha', 1, 100);
      model.remove('custom-100');
      expect(model.serialize()).assertEqual('');
      expect(parseTemplateText(model.serialize()).customCount()).assertEqual(0);
    })
  });
}
