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
import { CustomTemplate, TemplateModel, TemplateResult, parseTemplateText,
  templateDisplayName } from '../main/ets/feature/TemplateModel';

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

export default function templateMatrixTest(): void {
  describe('TemplateMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0001
     * @tc.name      testBuiltInOrder0001
     * @tc.desc      built in templates keep the documented order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltInOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuiltInOrder0001 begin');
      const templates: PolicyTemplate[] = new TemplateModel().allTemplates();
      expect(templates[0].id).assertEqual('read-only');
      expect(templates[1].id).assertEqual('editable');
      expect(templates[2].id).assertEqual('printable');
      expect(templates[3].id).assertEqual('copyable');
      expect(templates[4].id).assertEqual('full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0002
     * @tc.name      testAddMaskOne0002
     * @tc.desc      read only custom templates are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddMaskOne0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddMaskOne0002 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('m1', 1, 100).ok).assertTrue();
      expect(model.maskOf('custom-100')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0003
     * @tc.name      testAddMaskTwo0003
     * @tc.desc      write only custom masks are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddMaskTwo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddMaskTwo0003 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('m2', 2, 100).ok).assertTrue();
      expect(model.maskOf('custom-100')).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0004
     * @tc.name      testAddMaskPrint0004
     * @tc.desc      print combinations are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddMaskPrint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddMaskPrint0004 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('m3', 5, 100).ok).assertTrue();
      expect(model.add('m4', 7, 200).ok).assertTrue();
      expect(model.maskOf('custom-200')).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0005
     * @tc.name      testAddMaskCopy0005
     * @tc.desc      copy combinations are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddMaskCopy0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddMaskCopy0005 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('m1', 8, 100).ok).assertTrue();
      expect(model.add('m2', 9, 200).ok).assertTrue();
      expect(model.add('m3', 15, 300).ok).assertTrue();
      expect(model.customCount()).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0006
     * @tc.name      testAddInvalidMask0006
     * @tc.desc      zero and out of range masks are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddInvalidMask0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddInvalidMask0006 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('zero', 0, 100).ok).assertFalse();
      expect(model.add('large', 16, 100).ok).assertFalse();
      expect(model.customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0007
     * @tc.name      testNameBoundary0007
     * @tc.desc      names accept twenty characters and reject twenty one
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNameBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNameBoundary0007 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add(repeatChar('a', 20), 1, 100).ok).assertTrue();
      expect(model.add(repeatChar('b', 21), 1, 200).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0008
     * @tc.name      testDuplicateCase0008
     * @tc.desc      duplicate names are rejected case insensitively
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDuplicateCase0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDuplicateCase0008 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('Work', 1, 100);
      expect(model.add('WORK', 1, 200).ok).assertFalse();
      expect(model.add(' work ', 1, 300).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0009
     * @tc.name      testUniqueIdsThree0009
     * @tc.desc      three templates created together get unique ids
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueIdsThree0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueIdsThree0009 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.add('a', 1, 100).id).assertEqual('custom-100');
      expect(model.add('b', 2, 100).id).assertEqual('custom-100-2');
      expect(model.add('c', 3, 100).id).assertEqual('custom-100-3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0010
     * @tc.name      testTotalCount0010
     * @tc.desc      totals combine built in and custom templates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotalCount0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTotalCount0010 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.totalCount()).assertEqual(5);
      model.add('a', 1, 100);
      expect(model.totalCount()).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0011
     * @tc.name      testUpdateName0011
     * @tc.desc      updating only the name keeps the mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateName0011 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('old', 5, 100);
      expect(model.update('custom-100', 'new', 5).ok).assertTrue();
      const found: CustomTemplate | null = model.find('custom-100');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('new');
        expect(found.mask).assertEqual(5);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0012
     * @tc.name      testUpdateMask0012
     * @tc.desc      updating only the mask keeps the name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateMask0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateMask0012 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('name', 1, 100);
      expect(model.update('custom-100', 'name', 15).ok).assertTrue();
      expect(model.maskOf('custom-100')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0013
     * @tc.name      testUpdateSelfName0013
     * @tc.desc      keeping the same name during update is allowed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateSelfName0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateSelfName0013 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('same', 1, 100);
      expect(model.update('custom-100', 'same', 3).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0014
     * @tc.name      testUpdateDuplicate0014
     * @tc.desc      updating onto another name is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateDuplicate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateDuplicate0014 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 2, 200);
      expect(model.update('custom-200', 'ONE', 2).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0015
     * @tc.name      testUpdateMissing0015
     * @tc.desc      unknown and built in templates cannot be updated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateMissing0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateMissing0015 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.update('missing', 'x', 1).ok).assertFalse();
      expect(model.update('read-only', 'x', 1).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0016
     * @tc.name      testRemoveAndReadd0016
     * @tc.desc      removed names can be reused
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveAndReadd0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemoveAndReadd0016 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('reuse', 1, 100);
      expect(model.remove('custom-100')).assertTrue();
      expect(model.add('reuse', 3, 200).ok).assertTrue();
      expect(model.customCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0017
     * @tc.name      testRemoveMatrix0017
     * @tc.desc      only existing custom templates can be removed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemoveMatrix0017 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.remove('missing')).assertFalse();
      expect(model.remove('full')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0018
     * @tc.name      testFindMatrix0018
     * @tc.desc      lookups separate custom and built in templates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindMatrix0018 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('a', 1, 100);
      expect(model.find('custom-100') !== null).assertTrue();
      expect(model.find('read-only')).assertNull();
      expect(model.find('missing')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0019
     * @tc.name      testMaskOfBuiltIns0019
     * @tc.desc      built in masks match the documented values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfBuiltIns0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfBuiltIns0019 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.maskOf('read-only')).assertEqual(1);
      expect(model.maskOf('editable')).assertEqual(3);
      expect(model.maskOf('printable')).assertEqual(5);
      expect(model.maskOf('copyable')).assertEqual(9);
      expect(model.maskOf('full')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0020
     * @tc.name      testToPolicyMask0020
     * @tc.desc      policy conversion uses the template mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToPolicyMask0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToPolicyMask0020 begin');
      const model: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = model.toPolicy('u', 'n', 'printable');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(5);
        expect(policy.accountName).assertEqual('n');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0021
     * @tc.name      testSummaryMatrix0021
     * @tc.desc      summaries list the permission labels
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryMatrix0021 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.summaryOf('read-only')).assertEqual('读取');
      expect(model.summaryOf('editable')).assertEqual('读取、编辑');
      expect(model.summaryOf('printable')).assertEqual('读取、打印');
      expect(model.summaryOf('copyable')).assertEqual('读取、复制');
      expect(model.summaryOf('full')).assertEqual('读取、编辑、打印、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0022
     * @tc.name      testDisplayMatrix0022
     * @tc.desc      built in display names are localized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDisplayMatrix0022 begin');
      const templates: PolicyTemplate[] = new TemplateModel().allTemplates();
      expect(templateDisplayName(templates[0])).assertEqual('只读');
      expect(templateDisplayName(templates[1])).assertEqual('可编辑');
      expect(templateDisplayName(templates[2])).assertEqual('可打印');
      expect(templateDisplayName(templates[3])).assertEqual('可复制');
      expect(templateDisplayName(templates[4])).assertEqual('完全控制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0023
     * @tc.name      testDisplayCustom0023
     * @tc.desc      custom display names use the stored name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayCustom0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDisplayCustom0023 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('审阅模板', 3, 100);
      expect(templateDisplayName(model.allTemplates()[5])).assertEqual('审阅模板');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0024
     * @tc.name      testSerializeEmpty0024
     * @tc.desc      empty template models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmpty0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeEmpty0024 begin');
      expect(new TemplateModel().serialize()).assertEqual('');
      expect(parseTemplateText('').customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0025
     * @tc.name      testRoundTripThree0025
     * @tc.desc      multiple templates round trip through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripThree0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripThree0025 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('one', 1, 100);
      model.add('two', 3, 200);
      model.add('three', 15, 300);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customCount()).assertEqual(3);
      expect(namesOf(parsed)).assertEqual('one|two|three');
      expect(parsed.maskOf('custom-300')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0026
     * @tc.name      testRoundTripUnicode0026
     * @tc.desc      unicode names round trip through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripUnicode0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripUnicode0026 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('年度审阅😀', 5, 100);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customTemplates()[0].name).assertEqual('年度审阅😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0027
     * @tc.name      testRoundTripSpecial0027
     * @tc.desc      separators in names round trip through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripSpecial0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripSpecial0027 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('a|b;c=d', 1, 100);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customTemplates()[0].name).assertEqual('a|b;c=d');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0028
     * @tc.name      testParseMalformedFields0028
     * @tc.desc      lines with wrong field counts are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformedFields0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMalformedFields0028 begin');
      expect(parseTemplateText('a|b|c').customCount()).assertEqual(0);
      expect(parseTemplateText('a|b|c|d|e').customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0029
     * @tc.name      testParseNonNumeric0029
     * @tc.desc      non numeric masks and times are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNonNumeric0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNonNumeric0029 begin');
      expect(parseTemplateText('custom-1|name|abc|100').customCount()).assertEqual(0);
      expect(parseTemplateText('custom-1|name|1|abc').customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0030
     * @tc.name      testValidateNameMatrix0030
     * @tc.desc      name validation covers empty long and duplicate names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateNameMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateNameMatrix0030 begin');
      const model: TemplateModel = new TemplateModel();
      model.add('taken', 1, 100);
      expect(model.validateName('', '').length > 0).assertTrue();
      expect(model.validateName(repeatChar('x', 21), '').length > 0).assertTrue();
      expect(model.validateName('TAKEN', '').length > 0).assertTrue();
      expect(model.validateName('TAKEN', 'custom-100')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0031
     * @tc.name      testValidateMaskMatrix0031
     * @tc.desc      mask validation rejects zero and large values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateMaskMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateMaskMatrix0031 begin');
      const model: TemplateModel = new TemplateModel();
      expect(model.validateMask(0).length > 0).assertTrue();
      expect(model.validateMask(16).length > 0).assertTrue();
      expect(model.validateMask(1)).assertEqual('');
      expect(model.validateMask(15)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX_0032
     * @tc.name      testMaskOfMissing0032
     * @tc.desc      unknown template ids return minus one
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskOfMissing0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskOfMissing0032 begin');
      expect(new TemplateModel().maskOf('missing')).assertEqual(-1);
    })
  });
}
