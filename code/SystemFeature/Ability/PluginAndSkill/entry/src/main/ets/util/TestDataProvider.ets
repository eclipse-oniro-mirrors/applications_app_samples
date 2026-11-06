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

import { skillManager } from '@kit.AbilityKit';
import {
  BUNDLE_NAME_ARRAY,
  DEFAULT_BUNDLE_NAME,
  DEFAULT_MODULE_NAME,
  DEFAULT_SKILL_NAME,
  FLAG_LABELS,
  FLAG_VALUES,
  MODULE_NAME_ARRAY,
  SKILL_ARRAY
} from './Constant';

export interface SkillQueryParams {
  bundleName: string;
  moduleName: string;
  skillName: string;
  flagIndex: number;
  flagLabel: string;
  flagValue: number;
}

export interface ExpectedSkillResult {
  shouldSucceed: boolean;
  expectedSkillName: string;
  expectedBundleName: string;
  expectedModuleName: string;
  expectedErrorContains: string;
}

export interface TestCaseDefinition {
  id: string;
  name: string;
  description: string;
  params: SkillQueryParams;
  expected: ExpectedSkillResult;
  category: string;
}

export class TestDataProvider {
  private static instance: TestDataProvider | undefined = undefined;

  private constructor() {
  }

  public static getInstance(): TestDataProvider {
    if (TestDataProvider.instance === undefined) {
      TestDataProvider.instance = new TestDataProvider();
    }
    return TestDataProvider.instance;
  }

  public createParams(bundleName: string, moduleName: string, skillName: string,
    flagIndex: number): SkillQueryParams {
    const params: SkillQueryParams = {
      bundleName: bundleName,
      moduleName: moduleName,
      skillName: skillName,
      flagIndex: flagIndex,
      flagLabel: FLAG_LABELS[flagIndex],
      flagValue: FLAG_VALUES[flagIndex]
    };
    return params;
  }

  public createDefaultParams(): SkillQueryParams {
    return this.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 0);
  }

  public createEmptyBundleParams(): SkillQueryParams {
    return this.createParams('', DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, 0);
  }

  public createEmptyModuleParams(): SkillQueryParams {
    return this.createParams(DEFAULT_BUNDLE_NAME, '', DEFAULT_SKILL_NAME, 0);
  }

  public createEmptySkillParams(): SkillQueryParams {
    return this.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, '', 0);
  }

  public createAllEmptyParams(): SkillQueryParams {
    return this.createParams('', '', '', 0);
  }

  public createInvalidBundleParams(): SkillQueryParams {
    return this.createParams(BUNDLE_NAME_ARRAY[1], MODULE_NAME_ARRAY[0], SKILL_ARRAY[1], 0);
  }

  public createInvalidModuleParams(): SkillQueryParams {
    return this.createParams(DEFAULT_BUNDLE_NAME, MODULE_NAME_ARRAY[1], SKILL_ARRAY[1], 0);
  }

  public createInvalidSkillParams(): SkillQueryParams {
    return this.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, SKILL_ARRAY[0], 0);
  }

  public getAllSkillNames(): Array<string> {
    const result: Array<string> = [];
    for (let i = 0; i < SKILL_ARRAY.length; i++) {
      result.push(SKILL_ARRAY[i]);
    }
    return result;
  }

  public getValidSkillNames(): Array<string> {
    const result: Array<string> = [];
    for (let i = 0; i < SKILL_ARRAY.length; i++) {
      if (SKILL_ARRAY[i] !== 'skill-nonexistent') {
        result.push(SKILL_ARRAY[i]);
      }
    }
    return result;
  }

  public getAllModuleNames(): Array<string> {
    const result: Array<string> = [];
    for (let i = 0; i < MODULE_NAME_ARRAY.length; i++) {
      result.push(MODULE_NAME_ARRAY[i]);
    }
    return result;
  }

  public getAllBundleNames(): Array<string> {
    const result: Array<string> = [];
    for (let i = 0; i < BUNDLE_NAME_ARRAY.length; i++) {
      result.push(BUNDLE_NAME_ARRAY[i]);
    }
    return result;
  }

  public getAllFlagLabels(): Array<string> {
    const result: Array<string> = [];
    for (let i = 0; i < FLAG_LABELS.length; i++) {
      result.push(FLAG_LABELS[i]);
    }
    return result;
  }

  public getAllFlagValues(): Array<number> {
    const result: Array<number> = [];
    for (let i = 0; i < FLAG_VALUES.length; i++) {
      result.push(FLAG_VALUES[i]);
    }
    return result;
  }

  public getFlagLabelByIndex(index: number): string {
    if (index >= 0 && index < FLAG_LABELS.length) {
      return FLAG_LABELS[index];
    }
    return FLAG_LABELS[0];
  }

  public getFlagValueByIndex(index: number): number {
    if (index >= 0 && index < FLAG_VALUES.length) {
      return FLAG_VALUES[index];
    }
    return FLAG_VALUES[0];
  }

  public generateSelfSkillTestCases(): Array<TestCaseDefinition> {
    const cases: Array<TestCaseDefinition> = [];
    const validSkills = this.getValidSkillNames();

    for (let i = 0; i < validSkills.length; i++) {
      const skillName = validSkills[i];
      const caseDef: TestCaseDefinition = {
        id: `SELF_SKILL_SUCCESS_${1000 + i * 100}`,
        name: `testSelfSkillSuccess${String(i + 1).padStart(4, '0')}`,
        description: `Query own skill ${skillName} with valid params`,
        params: this.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, skillName, 0),
        expected: {
          shouldSucceed: true,
          expectedSkillName: skillName,
          expectedBundleName: DEFAULT_BUNDLE_NAME,
          expectedModuleName: DEFAULT_MODULE_NAME,
          expectedErrorContains: ''
        },
        category: 'SelfSkillQuery_Success'
      };
      cases.push(caseDef);
    }

    return cases;
  }

  public generateBundleSkillTestCases(): Array<TestCaseDefinition> {
    const cases: Array<TestCaseDefinition> = [];
    const validSkills = this.getValidSkillNames();

    for (let i = 0; i < validSkills.length; i++) {
      const skillName = validSkills[i];
      const caseDef: TestCaseDefinition = {
        id: `BUNDLE_SKILL_SUCCESS_${1000 + i * 100}`,
        name: `testBundleSkillSuccess${String(i + 1).padStart(4, '0')}`,
        description: `Query bundle skill ${skillName} with valid params`,
        params: this.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, skillName, 0),
        expected: {
          shouldSucceed: true,
          expectedSkillName: skillName,
          expectedBundleName: DEFAULT_BUNDLE_NAME,
          expectedModuleName: DEFAULT_MODULE_NAME,
          expectedErrorContains: ''
        },
        category: 'BundleSkillQuery_Success'
      };
      cases.push(caseDef);
    }

    return cases;
  }

  public generateFlagCombinationCases(): Array<TestCaseDefinition> {
    const cases: Array<TestCaseDefinition> = [];

    for (let i = 0; i < FLAG_LABELS.length; i++) {
      const caseDef: TestCaseDefinition = {
        id: `FLAG_COMBO_${1000 + i * 100}`,
        name: `testFlagCombo${String(i + 1).padStart(4, '0')}`,
        description: `Query with flag: ${FLAG_LABELS[i]}`,
        params: this.createParams(DEFAULT_BUNDLE_NAME, DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME, i),
        expected: {
          shouldSucceed: true,
          expectedSkillName: DEFAULT_SKILL_NAME,
          expectedBundleName: DEFAULT_BUNDLE_NAME,
          expectedModuleName: DEFAULT_MODULE_NAME,
          expectedErrorContains: ''
        },
        category: 'FlagCombination'
      };
      cases.push(caseDef);
    }

    return cases;
  }

  public generateErrorTestCases(): Array<TestCaseDefinition> {
    const cases: Array<TestCaseDefinition> = [];

    const invalidBundle: TestCaseDefinition = {
      id: 'ERROR_INVALID_BUNDLE_0100',
      name: 'testErrorInvalidBundle0001',
      description: 'Query with non-existent bundle name',
      params: this.createInvalidBundleParams(),
      expected: {
        shouldSucceed: false,
        expectedSkillName: '',
        expectedBundleName: '',
        expectedModuleName: '',
        expectedErrorContains: 'BusinessError'
      },
      category: 'ErrorHandling'
    };
    cases.push(invalidBundle);

    const invalidModule: TestCaseDefinition = {
      id: 'ERROR_INVALID_MODULE_0200',
      name: 'testErrorInvalidModule0002',
      description: 'Query with non-existent module name',
      params: this.createInvalidModuleParams(),
      expected: {
        shouldSucceed: false,
        expectedSkillName: '',
        expectedBundleName: '',
        expectedModuleName: '',
        expectedErrorContains: 'BusinessError'
      },
      category: 'ErrorHandling'
    };
    cases.push(invalidModule);

    const invalidSkill: TestCaseDefinition = {
      id: 'ERROR_INVALID_SKILL_0300',
      name: 'testErrorInvalidSkill0003',
      description: 'Query with non-existent skill name',
      params: this.createInvalidSkillParams(),
      expected: {
        shouldSucceed: false,
        expectedSkillName: '',
        expectedBundleName: '',
        expectedModuleName: '',
        expectedErrorContains: 'BusinessError'
      },
      category: 'ErrorHandling'
    };
    cases.push(invalidSkill);

    return cases;
  }

  public generateAllTestCases(): Array<TestCaseDefinition> {
    const allCases: Array<TestCaseDefinition> = [];
    const selfCases = this.generateSelfSkillTestCases();
    const bundleCases = this.generateBundleSkillTestCases();
    const flagCases = this.generateFlagCombinationCases();
    const errorCases = this.generateErrorTestCases();

    for (let i = 0; i < selfCases.length; i++) {
      allCases.push(selfCases[i]);
    }
    for (let i = 0; i < bundleCases.length; i++) {
      allCases.push(bundleCases[i]);
    }
    for (let i = 0; i < flagCases.length; i++) {
      allCases.push(flagCases[i]);
    }
    for (let i = 0; i < errorCases.length; i++) {
      allCases.push(errorCases[i]);
    }

    return allCases;
  }

  public getTotalCaseCount(): number {
    return this.generateAllTestCases().length;
  }

  public getCaseCountByCategory(category: string): number {
    const allCases = this.generateAllTestCases();
    let count = 0;
    for (let i = 0; i < allCases.length; i++) {
      if (allCases[i].category === category) {
        count++;
      }
    }
    return count;
  }

  public getCategories(): Array<string> {
    return [
      'SelfSkillQuery_Success',
      'BundleSkillQuery_Success',
      'FlagCombination',
      'ErrorHandling'
    ];
  }
}
