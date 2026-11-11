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
  TestDataGenerator,
  GeneratedTestCase,
  GeneratedTestSuite
} from '../../../main/ets/util/TestDataGenerator';
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

export default function testDataGeneratorTest(): void {
  describe('TestDataGeneratorTest', (): void => {
    beforeAll(() => { })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => { })

    // ==================== resetCounter / getTotalGeneratedCount (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_0100
     * @tc.name: testResetCounter0001
     * @tc.desc: Verify resetCounter sets counter to 0 and getTotalGeneratedCount reflects it.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testResetCounter0001', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.generateSingleSkillQuery('b', 'm', 's', 0);
      gen.generateSingleSkillQuery('b', 'm', 's', 0);
      expect(gen.getTotalGeneratedCount() > 0).assertTrue();
      gen.resetCounter();
      expect(gen.getTotalGeneratedCount()).assertEqual(0);
      expect(gen.getTotalGeneratedCount() === 0).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_TDG_0200
     * @tc.name: testGetTotalGeneratedCount0002
     * @tc.desc: Verify getTotalGeneratedCount increments after each generation call.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetTotalGeneratedCount0002', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      expect(gen.getTotalGeneratedCount()).assertEqual(0);
      gen.generateSingleSkillQuery('b', 'm', 's', 0);
      expect(gen.getTotalGeneratedCount()).assertEqual(1);
      gen.generateAllModuleCombinations('s', 0);
      expect(gen.getTotalGeneratedCount() > 1).assertTrue();
      done();
    });

    // ==================== generateSingleSkillQuery (3 用例) ====================

    /*
     * @tc.number: SUB_TDG_0300
     * @tc.name: testGenerateSingleSkillQuery0003
     * @tc.desc: Verify returned case has correct params and expectedSuccess=true.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateSingleSkillQuery0003', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const tc: GeneratedTestCase = gen.generateSingleSkillQuery('bundle.x', 'mod.x', 'skill.x', 0);
      expect(tc.params.bundleName).assertEqual('bundle.x');
      expect(tc.params.moduleName).assertEqual('mod.x');
      expect(tc.params.skillName).assertEqual('skill.x');
      done();
    });

    /*
     * @tc.number: SUB_TDG_0400
     * @tc.name: testGenerateSingleSkillQuery0004
     * @tc.desc: Verify flagIndex and flagValue are mapped correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateSingleSkillQuery0004', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const tc: GeneratedTestCase = gen.generateSingleSkillQuery(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 3);
      expect(tc.params.flagIndex).assertEqual(3);
      expect(tc.params.flagValue).assertEqual(FLAG_VALUES[3]);
      expect(tc.expectedSuccess).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_TDG_0500
     * @tc.name: testGenerateSingleSkillQuery0005
     * @tc.desc: Verify id, name, category fields are populated.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateSingleSkillQuery0005', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const tc: GeneratedTestCase = gen.generateSingleSkillQuery('b', 'm', 's', 0);
      expect(tc.id.length).assertLarger(0);
      expect(tc.name.length).assertLarger(0);
      expect(tc.category).assertEqual('SingleSkillQuery');
      done();
    });

    // ==================== generateAllModuleCombinations (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_0600
     * @tc.name: testGenerateAllModuleCombinations0006
     * @tc.desc: Verify count equals MODULE_NAME_ARRAY length and expectedSuccess distribution.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllModuleCombinations0006', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllModuleCombinations(DEFAULT_SKILL_NAME, 0);
      expect(cases.length).assertEqual(MODULE_NAME_ARRAY.length);
      let successCount: number = 0;
      for (let i: number = 0; i < cases.length; i++) {
        if (cases[i].expectedSuccess) {
          successCount++;
        }
      }
      expect(successCount).assertEqual(1);
      expect(cases[0].category).assertEqual('ModuleCombination');
      done();
    });

    /*
     * @tc.number: SUB_TDG_0700
     * @tc.name: testGenerateAllModuleCombinations0007
     * @tc.desc: Verify default module case has expectedSuccess=true and empty error.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllModuleCombinations0007', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllModuleCombinations(DEFAULT_SKILL_NAME, 0);
      let defaultCase: GeneratedTestCase | undefined = undefined;
      for (let i: number = 0; i < cases.length; i++) {
        if (cases[i].params.moduleName === DEFAULT_MODULE_NAME) {
          defaultCase = cases[i];
        }
      }
      expect(defaultCase!.category).assertEqual('ModuleCombination');
      expect(defaultCase!.expectedSuccess).assertTrue();
      expect(defaultCase!.expectedError).assertEqual('');
      done();
    });

    // ==================== generateAllBundleCombinations (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_0800
     * @tc.name: testGenerateAllBundleCombinations0008
     * @tc.desc: Verify count equals BUNDLE_NAME_ARRAY length.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllBundleCombinations0008', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllBundleCombinations(DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 0);
      expect(cases.length).assertEqual(BUNDLE_NAME_ARRAY.length);
      expect(cases[0].category).assertEqual('BundleCombination');
      expect(cases[0].id.length).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_TDG_0900
     * @tc.name: testGenerateAllBundleCombinations0009
     * @tc.desc: Verify invalid bundle case has expectedSuccess=false.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllBundleCombinations0009', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllBundleCombinations(DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 0);
      let invalidCase: GeneratedTestCase | undefined = undefined;
      for (let i: number = 0; i < cases.length; i++) {
        if (cases[i].params.bundleName === BUNDLE_NAME_ARRAY[1]) {
          invalidCase = cases[i];
        }
      }
      expect(invalidCase!.category).assertEqual('BundleCombination');
      expect(invalidCase!.expectedSuccess).assertFalse();
      expect(invalidCase!.expectedError).assertEqual('BusinessError');
      done();
    });

    // ==================== generateAllFlagCombinations (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_1000
     * @tc.name: testGenerateAllFlagCombinations0010
     * @tc.desc: Verify count equals FLAG_LABELS length and all expectedSuccess=true.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllFlagCombinations0010', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllFlagCombinations(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME);
      expect(cases.length).assertEqual(FLAG_LABELS.length);
      for (let i: number = 0; i < cases.length; i++) {
        expect(cases[i].expectedSuccess).assertTrue();
      }
      expect(cases[0].category).assertEqual('FlagCombination');
      done();
    });

    /*
     * @tc.number: SUB_TDG_1100
     * @tc.name: testGenerateAllFlagCombinations0011
     * @tc.desc: Verify each case has correct flagIndex and flagValue mapping.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllFlagCombinations0011', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllFlagCombinations(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME);
      for (let i: number = 0; i < cases.length; i++) {
        expect(cases[i].params.flagIndex).assertEqual(i);
        expect(cases[i].params.flagValue).assertEqual(FLAG_VALUES[i]);
      }
      expect(cases[0].params.flagValue).assertEqual(FLAG_VALUES[0]);
      expect(cases.length).assertLarger(0);
      done();
    });

    // ==================== generateAllSkillCombinations (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_1200
     * @tc.name: testGenerateAllSkillCombinations0012
     * @tc.desc: Verify count equals SKILL_ARRAY length.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllSkillCombinations0012', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllSkillCombinations(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, 0);
      expect(cases.length).assertEqual(SKILL_ARRAY.length);
      expect(cases[0].category).assertEqual('SkillCombination');
      expect(cases[0].params.bundleName).assertEqual(DEFAULT_BUNDLE_NAME);
      done();
    });

    /*
     * @tc.number: SUB_TDG_1300
     * @tc.name: testGenerateAllSkillCombinations0013
     * @tc.desc: Verify skill-nonexistent has expectedSuccess=false, others true.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllSkillCombinations0013', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllSkillCombinations(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, 0);
      let failCount: number = 0;
      let passCount: number = 0;
      for (let i: number = 0; i < cases.length; i++) {
        if (cases[i].expectedSuccess) {
          passCount++;
        } else {
          failCount++;
        }
      }
      expect(failCount).assertEqual(1);
      expect(passCount).assertEqual(SKILL_ARRAY.length - 1);
      expect(passCount).assertLarger(0);
      done();
    });

    // ==================== generateEmptyParamCases (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_1400
     * @tc.name: testGenerateEmptyParamCases0014
     * @tc.desc: Verify generateEmptyParamCases returns exactly 4 cases, all expectedSuccess=false.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateEmptyParamCases0014', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateEmptyParamCases();
      expect(cases.length).assertEqual(4);
      for (let i: number = 0; i < cases.length; i++) {
        expect(cases[i].expectedSuccess).assertFalse();
      }
      expect(cases[0].category).assertEqual('EmptyParam');
      done();
    });

    /*
     * @tc.number: SUB_TDG_1500
     * @tc.name: testGenerateEmptyParamCases0015
     * @tc.desc: Verify each empty case has the correct field empty.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateEmptyParamCases0015', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateEmptyParamCases();
      expect(cases[0].params.bundleName).assertEqual('');
      expect(cases[1].params.moduleName).assertEqual('');
      expect(cases[2].params.skillName).assertEqual('');
      done();
    });

    // ==================== generateBoundaryCases (2 用例) ====================

    /*
     * @tc.number: SUB_TDG_1600
     * @tc.name: testGenerateBoundaryCases0016
     * @tc.desc: Verify generateBoundaryCases returns 2 cases with Boundary category.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateBoundaryCases0016', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateBoundaryCases();
      expect(cases.length).assertEqual(2);
      expect(cases[0].category).assertEqual('Boundary');
      expect(cases[1].category).assertEqual('Boundary');
      done();
    });

    /*
     * @tc.number: SUB_TDG_1700
     * @tc.name: testGenerateBoundaryCases0017
     * @tc.desc: Verify boundary cases have expectedSuccess=false and long/special-char params.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateBoundaryCases0017', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateBoundaryCases();
      expect(cases[0].expectedSuccess).assertFalse();
      expect(cases[0].params.bundleName.length > 100).assertTrue();
      expect(cases[1].params.skillName.length > 10).assertTrue();
      done();
    });

    // ==================== generateFullCombinationSuite (4 用例) ====================

    /*
     * @tc.number: SUB_TDG_1800
     * @tc.name: testGenerateFullCombinationSuite0018
     * @tc.desc: Verify suite totalCases equals sum of all sub-generations.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateFullCombinationSuite0018', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const suite: GeneratedTestSuite = gen.generateFullCombinationSuite();
      expect(suite.totalCases).assertEqual(suite.cases.length);
      expect(suite.totalCases).assertLarger(0);
      expect(suite.suiteName).assertEqual('FullCombinationSuite');
      done();
    });

    /*
     * @tc.number: SUB_TDG_1900
     * @tc.name: testGenerateFullCombinationSuite0019
     * @tc.desc: Verify suite categories contain ModuleCombination, FlagCombination, EmptyParam.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateFullCombinationSuite0019', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const suite: GeneratedTestSuite = gen.generateFullCombinationSuite();
      expect(suite.categories.length >= 3).assertTrue();
      let hasModule: boolean = false;
      let hasFlag: boolean = false;
      let hasEmpty: boolean = false;
      for (let i: number = 0; i < suite.categories.length; i++) {
        if (suite.categories[i] === 'ModuleCombination') {
          hasModule = true;
        }
        if (suite.categories[i] === 'FlagCombination') {
          hasFlag = true;
        }
        if (suite.categories[i] === 'EmptyParam') {
          hasEmpty = true;
        }
      }
      expect(hasModule).assertTrue();
      expect(hasFlag).assertTrue();
      expect(hasEmpty).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_TDG_2000
     * @tc.name: testGenerateFullCombinationSuite0020
     * @tc.desc: Verify suite case count = SKILL_ARRAY*MODULE_NAME_ARRAY + FLAG_LABELS + 4 empty.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateFullCombinationSuite0020', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const suite: GeneratedTestSuite = gen.generateFullCombinationSuite();
      const expectedCount: number = SKILL_ARRAY.length * MODULE_NAME_ARRAY.length + FLAG_LABELS.length + 4;
      expect(suite.totalCases).assertEqual(expectedCount);
      expect(suite.cases.length).assertEqual(expectedCount);
      expect(suite.categories.length).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_TDG_2100
     * @tc.name: testGenerateFullCombinationSuite0021
     * @tc.desc: Verify all cases in suite have non-empty id and description.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateFullCombinationSuite0021', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const suite: GeneratedTestSuite = gen.generateFullCombinationSuite();
      let allValid: boolean = true;
      for (let i: number = 0; i < suite.cases.length; i++) {
        if (suite.cases[i].id.length === 0 || suite.cases[i].description.length === 0) {
          allValid = false;
        }
      }
      expect(allValid).assertTrue();
      expect(suite.totalCases).assertLarger(0);
      expect(suite.suiteName.length).assertLarger(0);
      done();
    });

    // ==================== generateSingleSkillQuery expectedError (1 用例) ====================

    /*
     * @tc.number: SUB_TDG_2200
     * @tc.name: testGenerateSingleSkillQueryExpectedError0022
     * @tc.desc: Verify generateSingleSkillQuery expectedError is empty for valid params.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateSingleSkillQueryExpectedError0022', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const tc: GeneratedTestCase = gen.generateSingleSkillQuery(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 0);
      expect(tc.expectedError).assertEqual('');
      expect(tc.expectedSuccess).assertTrue();
      expect(tc.priority).assertEqual(1);
      done();
    });

    // ==================== counter increments across methods (1 用例) ====================

    /*
     * @tc.number: SUB_TDG_2300
     * @tc.name: testCounterAccumulation0023
     * @tc.desc: Verify counter accumulates across different generation methods.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCounterAccumulation0023', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      gen.generateSingleSkillQuery('b', 'm', 's', 0);
      const afterSingle: number = gen.getTotalGeneratedCount();
      gen.generateAllModuleCombinations('s', 0);
      const afterModule: number = gen.getTotalGeneratedCount();
      expect(afterModule > afterSingle).assertTrue();
      expect(afterSingle).assertEqual(1);
      expect(afterModule).assertEqual(1 + MODULE_NAME_ARRAY.length);
      done();
    });

    // ==================== generateEmptyParamCases all-empty case (1 用例) ====================

    /*
     * @tc.number: SUB_TDG_2400
     * @tc.name: testGenerateEmptyParamCasesAllEmpty0024
     * @tc.desc: Verify the 4th empty case has all three fields empty.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateEmptyParamCasesAllEmpty0024', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateEmptyParamCases();
      const allEmpty: GeneratedTestCase = cases[3];
      expect(allEmpty.params.bundleName).assertEqual('');
      expect(allEmpty.params.moduleName).assertEqual('');
      expect(allEmpty.params.skillName).assertEqual('');
      done();
    });

    // ==================== generateAllModuleCombinations nonexistent module (1 用例) ====================

    /*
     * @tc.number: SUB_TDG_2500
     * @tc.name: testGenerateAllModuleCombinationsNonexistent0025
     * @tc.desc: Verify nonexistent module case has expectedSuccess=false and error set.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateAllModuleCombinationsNonexistent0025', 0, async (done: Function) => {
      const gen: TestDataGenerator = new TestDataGenerator();
      gen.resetCounter();
      const cases: GeneratedTestCase[] = gen.generateAllModuleCombinations(DEFAULT_SKILL_NAME, 0);
      let nonExistCase: GeneratedTestCase | undefined = undefined;
      for (let i: number = 0; i < cases.length; i++) {
        if (cases[i].params.moduleName === 'nonexistent_module') {
          nonExistCase = cases[i];
        }
      }
      expect(nonExistCase!.category).assertEqual('ModuleCombination');
      expect(nonExistCase!.expectedSuccess).assertFalse();
      expect(nonExistCase!.expectedError).assertEqual('BusinessError');
      done();
    });
  });
}
