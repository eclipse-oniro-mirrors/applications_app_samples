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
import { CustomTemplate, TemplateModel, TemplateResult, templateDisplayName,
  parseTemplateText } from '../main/ets/feature/TemplateModel';

function customNames(model: TemplateModel): string {
  const parts: string[] = [];
  const items: CustomTemplate[] = model.customTemplates();
  for (let index = 0; index < items.length; index++) {
    parts.push(items[index].name);
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

export default function templateModelTest(): void {
  describe('TemplateModelTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0001
     * @tc.name      testBuiltIns0001
     * @tc.desc      five built in templates are available
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltIns0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuiltIns0001 begin');
      console.info('testBuiltIns0001 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.allTemplates().length).assertEqual(5);
      expect(model.customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0002
     * @tc.name      testAddCustom0002
     * @tc.desc      a valid custom template is created
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddCustom0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddCustom0002 begin');
      console.info('testAddCustom0002 begin');
      const model: TemplateModel = new TemplateModel();
      const result: TemplateResult = model.add('工作模板', 3, 100);
      expect(result.ok).assertTrue();
      expect(result.id).assertEqual('custom-100');
      expect(model.customCount()).assertEqual(1);
      expect(model.totalCount()).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0003
     * @tc.name      testAddEmptyName0003
     * @tc.desc      empty names are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddEmptyName0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddEmptyName0003 begin');
      console.info('testAddEmptyName0003 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('', 1, 100).ok).assertFalse();
      expect(model.add('   ', 1, 100).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0004
     * @tc.name      testAddLongName0004
     * @tc.desc      names above twenty characters are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddLongName0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddLongName0004 begin');
      console.info('testAddLongName0004 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add(repeatChar('a', 21), 1, 100).ok).assertFalse();
      expect(model.add(repeatChar('a', 20), 1, 100).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0005
     * @tc.name      testAddDuplicateName0005
     * @tc.desc      duplicate names are rejected case insensitively
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddDuplicateName0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddDuplicateName0005 begin');
      console.info('testAddDuplicateName0005 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('Work', 1, 100);
      const result: TemplateResult = model.add('work', 3, 200);
      expect(result.ok).assertFalse();
      expect(result.message).assertEqual('模板名称已存在');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0006
     * @tc.name      testAddZeroMask0006
     * @tc.desc      templates need at least one permission
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddZeroMask0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddZeroMask0006 begin');
      console.info('testAddZeroMask0006 begin');
      const model: TemplateModel = new TemplateModel();
      const result: TemplateResult = model.add('empty', 0, 100);
      expect(result.ok).assertFalse();
      expect(result.message).assertEqual('至少需要保留一项权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0007
     * @tc.name      testAddFullMask0007
     * @tc.desc      full permission masks are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddFullMask0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddFullMask0007 begin');
      console.info('testAddFullMask0007 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('full', 15, 100).ok).assertTrue();
      expect(model.maskOf('custom-100')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0008
     * @tc.name      testAddUniqueIds0008
     * @tc.desc      templates created in the same second get unique ids
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddUniqueIds0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddUniqueIds0008 begin');
      console.info('testAddUniqueIds0008 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      const second: TemplateResult = model.add('two', 2, 100);
      expect(second.id).assertEqual('custom-100-2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0009
     * @tc.name      testFind0009
     * @tc.desc      custom templates can be looked up by id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFind0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFind0009 begin');
      console.info('testFind0009 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      const found: CustomTemplate | null = model.find('custom-100');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('one');
        expect(found.mask).assertEqual(1);
      }
      expect(model.find('missing')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0010
     * @tc.name      testUpdate0010
     * @tc.desc      updating changes the name and mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdate0010 begin');
      console.info('testUpdate0010 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      const result: TemplateResult = model.update('custom-100', 'renamed', 5);
      expect(result.ok).assertTrue();
      const found: CustomTemplate | null = model.find('custom-100');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('renamed');
        expect(found.mask).assertEqual(5);
        expect(found.createdAtSec).assertEqual(100);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0011
     * @tc.name      testUpdateMissing0011
     * @tc.desc      updating an unknown template fails
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateMissing0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateMissing0011 begin');
      console.info('testUpdateMissing0011 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.update('missing', 'name', 1).ok).assertFalse();
      expect(model.update('read-only', 'name', 1).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0012
     * @tc.name      testUpdateDuplicate0012
     * @tc.desc      updating to an existing name is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateDuplicate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateDuplicate0012 begin');
      console.info('testUpdateDuplicate0012 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 2, 200);
      expect(model.update('custom-200', 'one', 2).ok).assertFalse();
      expect(model.update('custom-200', 'two', 2).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0013
     * @tc.name      testRemove0013
     * @tc.desc      removing custom templates behaves as expected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemove0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemove0013 begin');
      console.info('testRemove0013 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      expect(model.remove('custom-100')).assertTrue();
      expect(model.customCount()).assertEqual(0);
      expect(model.remove('custom-100')).assertFalse();
      expect(model.remove('read-only')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0014
     * @tc.name      testMaskOfBuiltIn0014
     * @tc.desc      built in masks are exposed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfBuiltIn0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfBuiltIn0014 begin');
      console.info('testMaskOfBuiltIn0014 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.maskOf('read-only')).assertEqual(1);
      expect(model.maskOf('editable')).assertEqual(3);
      expect(model.maskOf('full')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0015
     * @tc.name      testMaskOfCustom0015
     * @tc.desc      custom masks are exposed by id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfCustom0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfCustom0015 begin');
      console.info('testMaskOfCustom0015 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('copy', 9, 100);
      expect(model.maskOf('custom-100')).assertEqual(9);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0016
     * @tc.name      testMaskOfMissing0016
     * @tc.desc      unknown template ids return minus one
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfMissing0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfMissing0016 begin');
      console.info('testMaskOfMissing0016 begin');
      expect(new TemplateModel().maskOf('missing')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0017
     * @tc.name      testToPolicy0017
     * @tc.desc      templates convert into policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToPolicy0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToPolicy0017 begin');
      console.info('testToPolicy0017 begin');
      const model: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = model.toPolicy('user001', 'User', 'editable');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(3);
        expect(policy.accountId).assertEqual('user001');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0018
     * @tc.name      testToPolicyMissing0018
     * @tc.desc      unknown templates cannot produce policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToPolicyMissing0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToPolicyMissing0018 begin');
      console.info('testToPolicyMissing0018 begin');
      expect(new TemplateModel().toPolicy('u', 'n', 'missing')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0019
     * @tc.name      testSummary0019
     * @tc.desc      template summaries list permissions in chinese
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummary0019 begin');
      console.info('testSummary0019 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.summaryOf('read-only')).assertEqual('读取');
      model.add('edit', 3, 100);
      expect(model.summaryOf('custom-100')).assertEqual('读取、编辑');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0020
     * @tc.name      testDisplayNames0020
     * @tc.desc      built in templates have chinese display names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayNames0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDisplayNames0020 begin');
      console.info('testDisplayNames0020 begin');
      const builtIn: PolicyTemplate[] = new TemplateModel().allTemplates();
      expect(templateDisplayName(builtIn[0])).assertEqual('只读');
      expect(templateDisplayName(builtIn[4])).assertEqual('完全控制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0021
     * @tc.name      testDisplayCustom0021
     * @tc.desc      custom display names fall back to the stored name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayCustom0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDisplayCustom0021 begin');
      console.info('testDisplayCustom0021 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('工作模板', 1, 100);
      const all: PolicyTemplate[] = model.allTemplates();
      expect(templateDisplayName(all[5])).assertEqual('工作模板');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0022
     * @tc.name      testCustomOrder0022
     * @tc.desc      custom templates follow the built in ones
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCustomOrder0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCustomOrder0022 begin');
      console.info('testCustomOrder0022 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 2, 200);
      expect(customNames(model)).assertEqual('one|two');
      expect(model.allTemplates()[5].id).assertEqual('custom-100');
      expect(model.allTemplates()[6].id).assertEqual('custom-200');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0023
     * @tc.name      testSerializeEmpty0023
     * @tc.desc      empty models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmpty0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeEmpty0023 begin');
      console.info('testSerializeEmpty0023 begin');
      expect(new TemplateModel().serialize()).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0024
     * @tc.name      testSerializeRoundTrip0024
     * @tc.desc      custom templates round trip through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeRoundTrip0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeRoundTrip0024 begin');
      console.info('testSerializeRoundTrip0024 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('工作模板', 5, 100);
      model.add('copy', 9, 200);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customCount()).assertEqual(2);
      expect(parsed.maskOf('custom-100')).assertEqual(5);
      expect(customNames(parsed)).assertEqual('工作模板|copy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0025
     * @tc.name      testSerializeSpecial0025
     * @tc.desc      separators inside names survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeSpecial0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeSpecial0025 begin');
      console.info('testSerializeSpecial0025 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('a|b;c', 1, 100);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customTemplates()[0].name).assertEqual('a|b;c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0026
     * @tc.name      testParseEmpty0026
     * @tc.desc      empty text parses to a model without customs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0026 begin');
      console.info('testParseEmpty0026 begin');
      expect(parseTemplateText('').customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0027
     * @tc.name      testParseMalformed0027
     * @tc.desc      malformed serialized lines are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformed0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMalformed0027 begin');
      console.info('testParseMalformed0027 begin');
      const parsed: TemplateModel = parseTemplateText('bad\nid|name|notanumber|100');
      expect(parsed.customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0028
     * @tc.name      testValidateName0028
     * @tc.desc      name validation returns a readable message
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateName0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateName0028 begin');
      console.info('testValidateName0028 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.validateName('', '')).assertEqual('模板名称不能为空');
      expect(model.validateName('ok', '')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMODEL_0029
     * @tc.name      testValidateMask0029
     * @tc.desc      mask validation rejects zero and out of range values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateMask0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateMask0029 begin');
      console.info('testValidateMask0029 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.validateMask(0).length > 0).assertTrue();
      expect(model.validateMask(16).length > 0).assertTrue();
      expect(model.validateMask(1)).assertEqual('');
    })
  });
}
