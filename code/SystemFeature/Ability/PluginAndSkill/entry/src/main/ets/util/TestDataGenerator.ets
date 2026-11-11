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

export interface GeneratedTestParams {
  bundleName: string;
  moduleName: string;
  skillName: string;
  flagIndex: number;
  flagValue: number;
}

export interface GeneratedTestCase {
  id: string;
  name: string;
  description: string;
  params: GeneratedTestParams;
  expectedSuccess: boolean;
  expectedError: string;
  category: string;
  priority: number;
}

export interface GeneratedTestSuite {
  suiteName: string;
  totalCases: number;
  categories: string[];
  cases: GeneratedTestCase[];
}

export class TestDataGenerator {
  private caseIdCounter: number = 0;

  private nextId(prefix: string): string {
    this.caseIdCounter++;
    return `${prefix}_${String(this.caseIdCounter).padStart(4, '0')}`;
  }

  public resetCounter(): void {
    this.caseIdCounter = 0;
  }

  public generateSingleSkillQuery(bundleName: string, moduleName: string,
    skillName: string, flagIndex: number): GeneratedTestCase {
    const id: string = this.nextId('SINGLE');
    return {
      id: id,
      name: `testSingleSkillQuery${id}`,
      description: `Query skill ${skillName} in ${bundleName}/${moduleName}`,
      params: {
        bundleName: bundleName,
        moduleName: moduleName,
        skillName: skillName,
        flagIndex: flagIndex,
        flagValue: FLAG_VALUES[flagIndex]
      },
      expectedSuccess: true,
      expectedError: '',
      category: 'SingleSkillQuery',
      priority: 1
    };
  }

  public generateAllModuleCombinations(skillName: string, flagIndex: number): GeneratedTestCase[] {
    const cases: GeneratedTestCase[] = [];
    for (let i: number = 0; i < MODULE_NAME_ARRAY.length; i++) {
      const moduleName: string = MODULE_NAME_ARRAY[i];
      const id: string = this.nextId('MODULE_COMBO');
      const expectedSuccess: boolean = moduleName === DEFAULT_MODULE_NAME;
      const testCase: GeneratedTestCase = {
        id: id,
        name: `testModuleCombo${id}`,
        description: `Query skill ${skillName} with module ${moduleName}`,
        params: {
          bundleName: DEFAULT_BUNDLE_NAME,
          moduleName: moduleName,
          skillName: skillName,
          flagIndex: flagIndex,
          flagValue: FLAG_VALUES[flagIndex]
        },
        expectedSuccess: expectedSuccess,
        expectedError: expectedSuccess ? '' : 'BusinessError',
        category: 'ModuleCombination',
        priority: 2
      };
      cases.push(testCase);
    }
    return cases;
  }

  public generateAllBundleCombinations(moduleName: string, skillName: string,
    flagIndex: number): GeneratedTestCase[] {
    const cases: GeneratedTestCase[] = [];
    for (let i: number = 0; i < BUNDLE_NAME_ARRAY.length; i++) {
      const bundleName: string = BUNDLE_NAME_ARRAY[i];
      const id: string = this.nextId('BUNDLE_COMBO');
      const expectedSuccess: boolean = bundleName === DEFAULT_BUNDLE_NAME;
      const testCase: GeneratedTestCase = {
        id: id,
        name: `testBundleCombo${id}`,
        description: `Query skill ${skillName} with bundle ${bundleName}`,
        params: {
          bundleName: bundleName,
          moduleName: moduleName,
          skillName: skillName,
          flagIndex: flagIndex,
          flagValue: FLAG_VALUES[flagIndex]
        },
        expectedSuccess: expectedSuccess,
        expectedError: expectedSuccess ? '' : 'BusinessError',
        category: 'BundleCombination',
        priority: 2
      };
      cases.push(testCase);
    }
    return cases;
  }

  public generateAllFlagCombinations(bundleName: string, moduleName: string,
    skillName: string): GeneratedTestCase[] {
    const cases: GeneratedTestCase[] = [];
    for (let i: number = 0; i < FLAG_LABELS.length; i++) {
      const id: string = this.nextId('FLAG_COMBO');
      const testCase: GeneratedTestCase = {
        id: id,
        name: `testFlagCombo${id}`,
        description: `Query skill ${skillName} with flag ${FLAG_LABELS[i]}`,
        params: {
          bundleName: bundleName,
          moduleName: moduleName,
          skillName: skillName,
          flagIndex: i,
          flagValue: FLAG_VALUES[i]
        },
        expectedSuccess: true,
        expectedError: '',
        category: 'FlagCombination',
        priority: 3
      };
      cases.push(testCase);
    }
    return cases;
  }

  public generateAllSkillCombinations(bundleName: string, moduleName: string,
    flagIndex: number): GeneratedTestCase[] {
    const cases: GeneratedTestCase[] = [];
    for (let i: number = 0; i < SKILL_ARRAY.length; i++) {
      const skillName: string = SKILL_ARRAY[i];
      const id: string = this.nextId('SKILL_COMBO');
      const expectedSuccess: boolean = skillName !== 'skill-nonexistent';
      const testCase: GeneratedTestCase = {
        id: id,
        name: `testSkillCombo${id}`,
        description: `Query skill ${skillName} in ${bundleName}/${moduleName}`,
        params: {
          bundleName: bundleName,
          moduleName: moduleName,
          skillName: skillName,
          flagIndex: flagIndex,
          flagValue: FLAG_VALUES[flagIndex]
        },
        expectedSuccess: expectedSuccess,
        expectedError: expectedSuccess ? '' : 'BusinessError',
        category: 'SkillCombination',
        priority: 2
      };
      cases.push(testCase);
    }
    return cases;
  }

  public generateEmptyParamCases(): GeneratedTestCase[] {
    const cases: GeneratedTestCase[] = [];

    const emptyBundle: GeneratedTestCase = {
      id: this.nextId('EMPTY'),
      name: `testEmptyBundle`,
      description: 'Query with empty bundle name',
      params: {
        bundleName: '',
        moduleName: DEFAULT_MODULE_NAME,
        skillName: DEFAULT_SKILL_NAME,
        flagIndex: 0,
        flagValue: FLAG_VALUES[0]
      },
      expectedSuccess: false,
      expectedError: 'BusinessError',
      category: 'EmptyParam',
      priority: 1
    };
    cases.push(emptyBundle);

    const emptyModule: GeneratedTestCase = {
      id: this.nextId('EMPTY'),
      name: `testEmptyModule`,
      description: 'Query with empty module name',
      params: {
        bundleName: DEFAULT_BUNDLE_NAME,
        moduleName: '',
        skillName: DEFAULT_SKILL_NAME,
        flagIndex: 0,
        flagValue: FLAG_VALUES[0]
      },
      expectedSuccess: false,
      expectedError: 'BusinessError',
      category: 'EmptyParam',
      priority: 1
    };
    cases.push(emptyModule);

    const emptySkill: GeneratedTestCase = {
      id: this.nextId('EMPTY'),
      name: `testEmptySkill`,
      description: 'Query with empty skill name',
      params: {
        bundleName: DEFAULT_BUNDLE_NAME,
        moduleName: DEFAULT_MODULE_NAME,
        skillName: '',
        flagIndex: 0,
        flagValue: FLAG_VALUES[0]
      },
      expectedSuccess: false,
      expectedError: 'BusinessError',
      category: 'EmptyParam',
      priority: 1
    };
    cases.push(emptySkill);

    const allEmpty: GeneratedTestCase = {
      id: this.nextId('EMPTY'),
      name: `testAllEmpty`,
      description: 'Query with all empty params',
      params: {
        bundleName: '',
        moduleName: '',
        skillName: '',
        flagIndex: 0,
        flagValue: FLAG_VALUES[0]
      },
      expectedSuccess: false,
      expectedError: 'BusinessError',
      category: 'EmptyParam',
      priority: 1
    };
    cases.push(allEmpty);

    return cases;
  }

  public generateFullCombinationSuite(): GeneratedTestSuite {
    const allCases: GeneratedTestCase[] = [];

    for (let i: number = 0; i < SKILL_ARRAY.length; i++) {
      const skillName: string = SKILL_ARRAY[i];
      const moduleCases: GeneratedTestCase[] = this.generateAllModuleCombinations(skillName, 0);
      for (let j: number = 0; j < moduleCases.length; j++) {
        allCases.push(moduleCases[j]);
      }
    }

    const flagCases: GeneratedTestCase[] = this.generateAllFlagCombinations(DEFAULT_BUNDLE_NAME,
      DEFAULT_MODULE_NAME, DEFAULT_SKILL_NAME);
    for (let i: number = 0; i < flagCases.length; i++) {
      allCases.push(flagCases[i]);
    }

    const emptyCases: GeneratedTestCase[] = this.generateEmptyParamCases();
    for (let i: number = 0; i < emptyCases.length; i++) {
      allCases.push(emptyCases[i]);
    }

    const categories: string[] = [];
    for (let i: number = 0; i < allCases.length; i++) {
      const cat: string = allCases[i].category;
      let found: boolean = false;
      for (let j: number = 0; j < categories.length; j++) {
        if (categories[j] === cat) {
          found = true;
          break;
        }
      }
      if (!found) {
        categories.push(cat);
      }
    }

    return {
      suiteName: 'FullCombinationSuite',
      totalCases: allCases.length,
      categories: categories,
      cases: allCases
    };
  }

  public getTotalGeneratedCount(): number {
    return this.caseIdCounter;
  }

  public generateBoundaryCases(): GeneratedTestCase[] {
    const cases: GeneratedTestCase[] = [];

    const longBundleName: string = 'com.'.repeat(50) + 'test';
    const longBundle: GeneratedTestCase = {
      id: this.nextId('BOUNDARY'),
      name: `testLongBundleName`,
      description: 'Query with very long bundle name',
      params: {
        bundleName: longBundleName,
        moduleName: DEFAULT_MODULE_NAME,
        skillName: DEFAULT_SKILL_NAME,
        flagIndex: 0,
        flagValue: FLAG_VALUES[0]
      },
      expectedSuccess: false,
      expectedError: 'BusinessError',
      category: 'Boundary',
      priority: 3
    };
    cases.push(longBundle);

    const specialChars: string = '!@#$%^&*()_+-=[]{}|;:,.<>?';
    const specialSkill: GeneratedTestCase = {
      id: this.nextId('BOUNDARY'),
      name: `testSpecialCharSkill`,
      description: 'Query with special characters in skill name',
      params: {
        bundleName: DEFAULT_BUNDLE_NAME,
        moduleName: DEFAULT_MODULE_NAME,
        skillName: specialChars,
        flagIndex: 0,
        flagValue: FLAG_VALUES[0]
      },
      expectedSuccess: false,
      expectedError: 'BusinessError',
      category: 'Boundary',
      priority: 3
    };
    cases.push(specialSkill);

    return cases;
  }
}
