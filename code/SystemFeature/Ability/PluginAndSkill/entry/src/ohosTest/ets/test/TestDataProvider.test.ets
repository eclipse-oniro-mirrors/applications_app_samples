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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import {
  TestDataProvider,
  SkillQueryParams,
  TestCaseDefinition
} from '../../../main/ets/util/TestDataProvider';
import {
  BUNDLE_NAME_ARRAY,
  DEFAULT_BUNDLE_NAME,
  DEFAULT_MODULE_NAME,
  DEFAULT_SKILL_NAME,
  FLAG_LABELS,
  FLAG_VALUES,
  MODULE_NAME_ARRAY,
  SKILL_ARRAY
} from '../../../main/ets/util/Constant';

export default function testDataProviderTest(): void {
  describe('TestDataProviderTest', (): void => {
    beforeAll(() => { })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => { })

    // ==================== 单例模式 (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_0100
     * @tc.name: testTdpSingleton0001
     * @tc.desc: Verify getInstance returns a non-null object.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTdpSingleton0001', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      expect(provider.getAllSkillNames().length).assertLarger(0);
      expect(provider).assertEqual(provider);
      expect(provider.getCategories().length).assertEqual(4);
      done();
    });

    /*
     * @tc.number: SUB_TDP_0200
     * @tc.name: testTdpSingleton0002
     * @tc.desc: Verify multiple getInstance calls return the same reference.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTdpSingleton0002', 0, async (done: Function) => {
      const first: TestDataProvider = TestDataProvider.getInstance();
      const second: TestDataProvider = TestDataProvider.getInstance();
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(TestDataProvider.getInstance() === first).assertTrue();
      done();
    });

    // ==================== createParams (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_0300
     * @tc.name: testCreateParams0003
     * @tc.desc: Verify createParams maps all fields including flagLabel and flagValue.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateParams0003', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createParams('bundle.a', 'mod.a', 'skill.a', 1);
      expect(params.bundleName).assertEqual('bundle.a');
      expect(params.moduleName).assertEqual('mod.a');
      expect(params.skillName).assertEqual('skill.a');
      done();
    });

    /*
     * @tc.number: SUB_TDP_0400
     * @tc.name: testCreateParams0004
     * @tc.desc: Verify createParams flagLabel and flagValue match FLAG_LABELS/FLAG_VALUES at index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateParams0004', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 2);
      expect(params.flagIndex).assertEqual(2);
      expect(params.flagLabel).assertEqual(FLAG_LABELS[2]);
      expect(params.flagValue).assertEqual(FLAG_VALUES[2]);
      done();
    });

    // ==================== createDefaultParams (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_0500
     * @tc.name: testCreateDefaultParams0005
     * @tc.desc: Verify createDefaultParams uses DEFAULT constants and flagIndex 0.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateDefaultParams0005', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createDefaultParams();
      expect(params.bundleName).assertEqual(DEFAULT_BUNDLE_NAME);
      expect(params.moduleName).assertEqual(DEFAULT_MODULE_NAME);
      expect(params.skillName).assertEqual(DEFAULT_SKILL_NAME);
      done();
    });

    // ==================== createEmptyXxxParams (4 用例) ====================

    /*
     * @tc.number: SUB_TDP_0600
     * @tc.name: testCreateEmptyBundleParams0006
     * @tc.desc: Verify createEmptyBundleParams has empty bundleName and other fields default.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateEmptyBundleParams0006', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createEmptyBundleParams();
      expect(params.bundleName).assertEqual('');
      expect(params.moduleName).assertEqual(DEFAULT_MODULE_NAME);
      expect(params.skillName).assertEqual(DEFAULT_SKILL_NAME);
      done();
    });

    /*
     * @tc.number: SUB_TDP_0700
     * @tc.name: testCreateEmptyModuleParams0007
     * @tc.desc: Verify createEmptyModuleParams has empty moduleName.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateEmptyModuleParams0007', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createEmptyModuleParams();
      expect(params.moduleName).assertEqual('');
      expect(params.bundleName).assertEqual(DEFAULT_BUNDLE_NAME);
      expect(params.skillName).assertEqual(DEFAULT_SKILL_NAME);
      done();
    });

    /*
     * @tc.number: SUB_TDP_0800
     * @tc.name: testCreateEmptySkillParams0008
     * @tc.desc: Verify createEmptySkillParams has empty skillName.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateEmptySkillParams0008', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createEmptySkillParams();
      expect(params.skillName).assertEqual('');
      expect(params.bundleName).assertEqual(DEFAULT_BUNDLE_NAME);
      expect(params.moduleName).assertEqual(DEFAULT_MODULE_NAME);
      done();
    });

    /*
     * @tc.number: SUB_TDP_0900
     * @tc.name: testCreateAllEmptyParams0009
     * @tc.desc: Verify createAllEmptyParams has all three fields empty.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateAllEmptyParams0009', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createAllEmptyParams();
      expect(params.bundleName).assertEqual('');
      expect(params.moduleName).assertEqual('');
      expect(params.skillName).assertEqual('');
      done();
    });

    // ==================== createInvalidXxxParams (3 用例) ====================

    /*
     * @tc.number: SUB_TDP_1000
     * @tc.name: testCreateInvalidBundleParams0010
     * @tc.desc: Verify createInvalidBundleParams uses BUNDLE_NAME_ARRAY[1] and is not default.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateInvalidBundleParams0010', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createInvalidBundleParams();
      expect(params.bundleName).assertEqual(BUNDLE_NAME_ARRAY[1]);
      expect(params.bundleName !== DEFAULT_BUNDLE_NAME).assertTrue();
      expect(params.moduleName).assertEqual(MODULE_NAME_ARRAY[0]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_1100
     * @tc.name: testCreateInvalidModuleParams0011
     * @tc.desc: Verify createInvalidModuleParams uses MODULE_NAME_ARRAY[1].
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateInvalidModuleParams0011', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createInvalidModuleParams();
      expect(params.moduleName).assertEqual(MODULE_NAME_ARRAY[1]);
      expect(params.moduleName !== DEFAULT_MODULE_NAME).assertTrue();
      expect(params.bundleName).assertEqual(DEFAULT_BUNDLE_NAME);
      done();
    });

    /*
     * @tc.number: SUB_TDP_1200
     * @tc.name: testCreateInvalidSkillParams0012
     * @tc.desc: Verify createInvalidSkillParams uses SKILL_ARRAY[0] (skill-nonexistent).
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateInvalidSkillParams0012', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const params: SkillQueryParams = provider.createInvalidSkillParams();
      expect(params.skillName).assertEqual(SKILL_ARRAY[0]);
      expect(params.skillName).assertEqual('skill-nonexistent');
      expect(params.skillName !== DEFAULT_SKILL_NAME).assertTrue();
      done();
    });

    // ==================== getAllSkillNames / getValidSkillNames (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_1300
     * @tc.name: testGetAllSkillNames0013
     * @tc.desc: Verify getAllSkillNames returns all entries from SKILL_ARRAY.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllSkillNames0013', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const names: string[] = provider.getAllSkillNames();
      expect(names.length).assertEqual(SKILL_ARRAY.length);
      expect(names[0]).assertEqual(SKILL_ARRAY[0]);
      expect(names[names.length - 1]).assertEqual(SKILL_ARRAY[SKILL_ARRAY.length - 1]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_1400
     * @tc.name: testGetValidSkillNames0014
     * @tc.desc: Verify getValidSkillNames excludes skill-nonexistent.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetValidSkillNames0014', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const valid: string[] = provider.getValidSkillNames();
      expect(valid.length).assertEqual(SKILL_ARRAY.length - 1);
      let containsInvalid: boolean = false;
      for (let i: number = 0; i < valid.length; i++) {
        if (valid[i] === 'skill-nonexistent') {
          containsInvalid = true;
        }
      }
      expect(containsInvalid).assertFalse();
      expect(valid.length).assertLarger(0);
      done();
    });

    // ==================== getAllModuleNames / getAllBundleNames (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_1500
     * @tc.name: testGetAllModuleNames0015
     * @tc.desc: Verify getAllModuleNames returns MODULE_NAME_ARRAY entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllModuleNames0015', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const modules: string[] = provider.getAllModuleNames();
      expect(modules.length).assertEqual(MODULE_NAME_ARRAY.length);
      expect(modules[0]).assertEqual(MODULE_NAME_ARRAY[0]);
      expect(modules[1]).assertEqual(MODULE_NAME_ARRAY[1]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_1600
     * @tc.name: testGetAllBundleNames0016
     * @tc.desc: Verify getAllBundleNames returns BUNDLE_NAME_ARRAY entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllBundleNames0016', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const bundles: string[] = provider.getAllBundleNames();
      expect(bundles.length).assertEqual(BUNDLE_NAME_ARRAY.length);
      expect(bundles[0]).assertEqual(BUNDLE_NAME_ARRAY[0]);
      expect(bundles[1]).assertEqual(BUNDLE_NAME_ARRAY[1]);
      done();
    });

    // ==================== getAllFlagLabels / getAllFlagValues (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_1700
     * @tc.name: testGetAllFlagLabels0017
     * @tc.desc: Verify getAllFlagLabels returns all FLAG_LABELS entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllFlagLabels0017', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const labels: string[] = provider.getAllFlagLabels();
      expect(labels.length).assertEqual(FLAG_LABELS.length);
      expect(labels[0]).assertEqual(FLAG_LABELS[0]);
      expect(labels[labels.length - 1]).assertEqual(FLAG_LABELS[FLAG_LABELS.length - 1]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_1800
     * @tc.name: testGetAllFlagValues0018
     * @tc.desc: Verify getAllFlagValues returns all FLAG_VALUES entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetAllFlagValues0018', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const values: number[] = provider.getAllFlagValues();
      expect(values.length).assertEqual(FLAG_VALUES.length);
      expect(values[0]).assertEqual(FLAG_VALUES[0]);
      expect(values[values.length - 1]).assertEqual(FLAG_VALUES[FLAG_VALUES.length - 1]);
      done();
    });

    // ==================== getFlagLabelByIndex / getFlagValueByIndex (4 用例) ====================

    /*
     * @tc.number: SUB_TDP_1900
     * @tc.name: testGetFlagLabelByIndex0019
     * @tc.desc: Verify getFlagLabelByIndex returns correct label for valid index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFlagLabelByIndex0019', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      expect(provider.getFlagLabelByIndex(0)).assertEqual(FLAG_LABELS[0]);
      expect(provider.getFlagLabelByIndex(3)).assertEqual(FLAG_LABELS[3]);
      expect(provider.getFlagLabelByIndex(FLAG_LABELS.length - 1)).assertEqual(FLAG_LABELS[FLAG_LABELS.length - 1]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_2000
     * @tc.name: testGetFlagLabelByIndex0020
     * @tc.desc: Verify getFlagLabelByIndex falls back to first label for out-of-range index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFlagLabelByIndex0020', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      expect(provider.getFlagLabelByIndex(-1)).assertEqual(FLAG_LABELS[0]);
      expect(provider.getFlagLabelByIndex(FLAG_LABELS.length)).assertEqual(FLAG_LABELS[0]);
      expect(provider.getFlagLabelByIndex(999)).assertEqual(FLAG_LABELS[0]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_2100
     * @tc.name: testGetFlagValueByIndex0021
     * @tc.desc: Verify getFlagValueByIndex returns correct value for valid index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFlagValueByIndex0021', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      expect(provider.getFlagValueByIndex(0)).assertEqual(FLAG_VALUES[0]);
      expect(provider.getFlagValueByIndex(2)).assertEqual(FLAG_VALUES[2]);
      expect(provider.getFlagValueByIndex(FLAG_VALUES.length - 1)).assertEqual(FLAG_VALUES[FLAG_VALUES.length - 1]);
      done();
    });

    /*
     * @tc.number: SUB_TDP_2200
     * @tc.name: testGetFlagValueByIndex0022
     * @tc.desc: Verify getFlagValueByIndex falls back to first value for out-of-range index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFlagValueByIndex0022', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      expect(provider.getFlagValueByIndex(-1)).assertEqual(FLAG_VALUES[0]);
      expect(provider.getFlagValueByIndex(FLAG_VALUES.length)).assertEqual(FLAG_VALUES[0]);
      expect(provider.getFlagValueByIndex(100)).assertEqual(FLAG_VALUES[0]);
      done();
    });

    // ==================== generateSelfSkillTestCases (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_2300
     * @tc.name: testGenerateSelfSkillTestCases0023
     * @tc.desc: Verify generateSelfSkillTestCases count matches valid skills and all shouldSucceed.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateSelfSkillTestCases0023', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const cases: TestCaseDefinition[] = provider.generateSelfSkillTestCases();
      const validCount: number = provider.getValidSkillNames().length;
      expect(cases.length).assertEqual(validCount);
      expect(cases[0].expected.shouldSucceed).assertTrue();
      expect(cases[0].category).assertEqual('SelfSkillQuery_Success');
      done();
    });

    // ==================== generateBundleSkillTestCases (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_2400
     * @tc.name: testGenerateBundleSkillTestCases0024
     * @tc.desc: Verify generateBundleSkillTestCases count and category.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateBundleSkillTestCases0024', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const cases: TestCaseDefinition[] = provider.generateBundleSkillTestCases();
      const validCount: number = provider.getValidSkillNames().length;
      expect(cases.length).assertEqual(validCount);
      expect(cases[0].category).assertEqual('BundleSkillQuery_Success');
      expect(cases[0].expected.shouldSucceed).assertTrue();
      done();
    });

    // ==================== generateFlagCombinationCases (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_2500
     * @tc.name: testGenerateFlagCombinationCases0025
     * @tc.desc: Verify generateFlagCombinationCases count equals FLAG_LABELS length.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateFlagCombinationCases0025', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const cases: TestCaseDefinition[] = provider.generateFlagCombinationCases();
      expect(cases.length).assertEqual(FLAG_LABELS.length);
      expect(cases[0].category).assertEqual('FlagCombination');
      expect(cases[cases.length - 1].params.flagIndex).assertEqual(FLAG_LABELS.length - 1);
      done();
    });

    // ==================== generateErrorTestCases (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_2600
     * @tc.name: testGenerateErrorTestCases0026
     * @tc.desc: Verify generateErrorTestCases returns 3 error cases all shouldSucceed=false.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateErrorTestCases0026', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const cases: TestCaseDefinition[] = provider.generateErrorTestCases();
      expect(cases.length).assertEqual(3);
      expect(cases[0].expected.shouldSucceed).assertFalse();
      expect(cases[0].category).assertEqual('ErrorHandling');
      done();
    });

    // ==================== generateAllTestCases (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_2700
     * @tc.name: testGenerateAllTestCases0027
     * @tc.desc: Verify generateAllTestCases count equals sum of all sub-generators.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllTestCases0027', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const all: TestCaseDefinition[] = provider.generateAllTestCases();
      const selfCount: number = provider.generateSelfSkillTestCases().length;
      const bundleCount: number = provider.generateBundleSkillTestCases().length;
      const flagCount: number = provider.generateFlagCombinationCases().length;
      const errorCount: number = provider.generateErrorTestCases().length;
      expect(all.length).assertEqual(selfCount + bundleCount + flagCount + errorCount);
      expect(all.length).assertLarger(0);
      expect(all[0].id.length).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_TDP_2800
     * @tc.name: testGenerateAllTestCases0028
     * @tc.desc: Verify generateAllTestCases contains all four categories.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllTestCases0028', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const all: TestCaseDefinition[] = provider.generateAllTestCases();
      const categories: string[] = provider.getCategories();
      let foundCount: number = 0;
      for (let c: number = 0; c < categories.length; c++) {
        for (let i: number = 0; i < all.length; i++) {
          if (all[i].category === categories[c]) {
            foundCount++;
            break;
          }
        }
      }
      expect(foundCount).assertEqual(categories.length);
      expect(categories.length).assertEqual(4);
      expect(all[0].params.bundleName.length).assertLarger(0);
      done();
    });

    // ==================== getTotalCaseCount (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_2900
     * @tc.name: testGetTotalCaseCount0029
     * @tc.desc: Verify getTotalCaseCount matches generateAllTestCases length.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetTotalCaseCount0029', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const total: number = provider.getTotalCaseCount();
      const all: TestCaseDefinition[] = provider.generateAllTestCases();
      expect(total).assertEqual(all.length);
      expect(total).assertLarger(0);
      expect(total > provider.generateErrorTestCases().length).assertTrue();
      done();
    });

    // ==================== getCaseCountByCategory (2 用例) ====================

    /*
     * @tc.number: SUB_TDP_3000
     * @tc.name: testGetCaseCountByCategory0030
     * @tc.desc: Verify getCaseCountByCategory returns correct count for known categories.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetCaseCountByCategory0030', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const errorCount: number = provider.getCaseCountByCategory('ErrorHandling');
      expect(errorCount).assertEqual(3);
      const selfCount: number = provider.getCaseCountByCategory('SelfSkillQuery_Success');
      expect(selfCount).assertEqual(provider.getValidSkillNames().length);
      expect(selfCount).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_TDP_3100
     * @tc.name: testGetCaseCountByCategory0031
     * @tc.desc: Verify getCaseCountByCategory returns 0 for unknown category.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetCaseCountByCategory0031', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const count: number = provider.getCaseCountByCategory('NonExistentCategory');
      expect(count).assertEqual(0);
      const emptyCount: number = provider.getCaseCountByCategory('');
      expect(emptyCount).assertEqual(0);
      expect(provider.getCaseCountByCategory('FlagCombination') > 0).assertTrue();
      done();
    });

    // ==================== getCategories (1 用例) ====================

    /*
     * @tc.number: SUB_TDP_3200
     * @tc.name: testGetCategories0032
     * @tc.desc: Verify getCategories returns exactly 4 known category names.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetCategories0032', 0, async (done: Function) => {
      const provider: TestDataProvider = TestDataProvider.getInstance();
      const categories: string[] = provider.getCategories();
      expect(categories.length).assertEqual(4);
      expect(categories[0]).assertEqual('SelfSkillQuery_Success');
      expect(categories[3]).assertEqual('ErrorHandling');
      done();
    });
  });
}
