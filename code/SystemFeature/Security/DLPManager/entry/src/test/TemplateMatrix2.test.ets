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
import { CustomTemplate, TemplateModel, templateDisplayName, parseTemplateText } from '../main/ets/feature/TemplateModel';

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

export default function templateMatrix2Test(): void {
  describe('TemplateMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0001
     * @tc.name      testAddEditable0001
     * @tc.desc      editable masks are accepted and stored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddEditable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.add('edit', 3, 100).ok).assertTrue();
      expect(model.maskOf('custom-100')).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0002
     * @tc.name      testAddPrintable0002
     * @tc.desc      printable masks are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddPrintable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.add('print', 5, 100).ok).assertTrue();
      expect(model.summaryOf('custom-100')).assertEqual('读取、打印');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0003
     * @tc.name      testAddCopyable0003
     * @tc.desc      copyable masks are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddCopyable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.add('copy', 9, 100).ok).assertTrue();
      expect(model.summaryOf('custom-100')).assertEqual('读取、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0004
     * @tc.name      testAddFull0004
     * @tc.desc      full masks are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddFull0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.add('full', 15, 100).ok).assertTrue();
      expect(model.summaryOf('custom-100')).assertEqual('读取、编辑、打印、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0005
     * @tc.name      testUpdateBoth0005
     * @tc.desc      updates change both name and mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateBoth0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('old', 1, 100);
      expect(model.update('custom-100', 'new', 11).ok).assertTrue();
      const found: CustomTemplate | null = model.find('custom-100');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('new');
        expect(found.mask).assertEqual(11);
        expect(found.createdAtSec).assertEqual(100);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0006
     * @tc.name      testUpdateSelfName0006
     * @tc.desc      updates keeping the same name succeed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateSelfName0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('same', 1, 100);
      expect(model.update('custom-100', 'same', 3).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0007
     * @tc.name      testBuiltInMasks0007
     * @tc.desc      built in masks are unchanged by custom actions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltInMasks0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('custom', 15, 100);
      expect(model.maskOf('read-only')).assertEqual(1);
      expect(model.maskOf('editable')).assertEqual(3);
      expect(model.maskOf('full')).assertEqual(15);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0008
     * @tc.name      testDisplayNames0008
     * @tc.desc      display names cover all built ins
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayNames0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const all: PolicyTemplate[] = new TemplateModel().allTemplates();
      expect(templateDisplayName(all[0])).assertEqual('只读');
      expect(templateDisplayName(all[1])).assertEqual('可编辑');
      expect(templateDisplayName(all[3])).assertEqual('可复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0009
     * @tc.name      testSerializeOrder0009
     * @tc.desc      serialization keeps insertion order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeOrder0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('b', 1, 200);
      model.add('a', 3, 100);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(namesOf(parsed)).assertEqual('b|a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0010
     * @tc.name      testParseMalformed0010
     * @tc.desc      malformed serialized lines are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformed0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseTemplateText('only|three|fields').customCount()).assertEqual(0);
      expect(parseTemplateText('id|name|mask|created|extra').customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0011
     * @tc.name      testParseNonNumeric0011
     * @tc.desc      non numeric masks and times are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNonNumeric0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseTemplateText('id|name|mask|created').customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0012
     * @tc.name      testDuplicateName0012
     * @tc.desc      duplicate names are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDuplicateName0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('name', 1, 100);
      expect(model.add('name', 1, 200).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0013
     * @tc.name      testDuplicateWhitespace0013
     * @tc.desc      duplicate checks trim whitespace
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDuplicateWhitespace0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('name', 1, 100);
      expect(model.add('  name  ', 1, 200).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0014
     * @tc.name      testNameLengths0014
     * @tc.desc      name lengths over twenty are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNameLengths0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.add(repeatChar('a', 20), 1, 100).ok).assertTrue();
      expect(model.add(repeatChar('b', 21), 1, 200).ok).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0015
     * @tc.name      testCountLifecycle0015
     * @tc.desc      counts follow adds and removals
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountLifecycle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('a', 1, 100);
      model.add('b', 2, 200);
      expect(model.totalCount()).assertEqual(7);
      model.remove('custom-100');
      expect(model.totalCount()).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0016
     * @tc.name      testPolicyCustom0016
     * @tc.desc      custom templates convert into policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPolicyCustom0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('custom', 13, 100);
      const policy: DlpPolicy | null = model.toPolicy('u', 'n', 'custom-100');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(13);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0017
     * @tc.name      testSummaryAfterDelete0017
     * @tc.desc      deleted templates report no permissions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryAfterDelete0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('custom', 1, 100);
      model.remove('custom-100');
      expect(model.summaryOf('custom-100')).assertEqual('无权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0018
     * @tc.name      testOrderAfterRemove0018
     * @tc.desc      removal keeps the remaining order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOrderAfterRemove0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('a', 1, 100);
      model.add('b', 2, 200);
      model.add('c', 3, 300);
      model.remove('custom-200');
      expect(namesOf(model)).assertEqual('a|c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0019
     * @tc.name      testSerializeUnicode0019
     * @tc.desc      unicode names round trip through serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeUnicode0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('审阅😀', 5, 100);
      const parsed: TemplateModel = parseTemplateText(model.serialize());
      expect(parsed.customTemplates()[0].name).assertEqual('审阅😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0020
     * @tc.name      testValidateMasks0020
     * @tc.desc      zero and large masks are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateMasks0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.validateMask(0).length > 0).assertTrue();
      expect(model.validateMask(16).length > 0).assertTrue();
      expect(model.validateMask(15)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0021
     * @tc.name      testReaddAfterRemove0021
     * @tc.desc      names can be reused after removal
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReaddAfterRemove0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('reuse', 1, 100);
      model.remove('custom-100');
      expect(model.add('reuse', 2, 200).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0022
     * @tc.name      testDisplayAfterUpdate0022
     * @tc.desc      custom display names follow updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayAfterUpdate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      model.add('before', 1, 100);
      model.update('custom-100', 'after', 1);
      expect(templateDisplayName(model.allTemplates()[5])).assertEqual('after');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0023
     * @tc.name      testFindMissing0023
     * @tc.desc      lookups separate customs from built ins
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindMissing0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: TemplateModel = new TemplateModel();
      expect(model.find('missing')).assertNull();
      expect(model.find('read-only')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEMATRIX2_0024
     * @tc.name      testSerializeEmpty0024
     * @tc.desc      empty models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmpty0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new TemplateModel().serialize()).assertEqual('');
      expect(parseTemplateText('').totalCount()).assertEqual(5);
    })
  });
}
