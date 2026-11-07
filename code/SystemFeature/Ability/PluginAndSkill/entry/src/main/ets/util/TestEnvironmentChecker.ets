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

import { hilog } from '@kit.PerformanceAnalysisKit';
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

const DOMAIN: number = 0xF811;
const TAG: string = '[TestEnvironmentChecker]';

export interface CheckResult {
  checkName: string;
  passed: boolean;
  message: string;
  severity: string;
  details: string;
  timestamp: number;
}

export interface EnvironmentSummary {
  totalChecks: number;
  passedChecks: number;
  failedChecks: number;
  warningChecks: number;
  overallPassed: boolean;
  readinessPercentage: number;
  readinessGrade: string;
}

export class TestEnvironmentChecker {
  private results: CheckResult[] = [];
  private static instance: TestEnvironmentChecker | undefined = undefined;

  private constructor() {
  }

  public static getInstance(): TestEnvironmentChecker {
    if (TestEnvironmentChecker.instance === undefined) {
      TestEnvironmentChecker.instance = new TestEnvironmentChecker();
    }
    return TestEnvironmentChecker.instance;
  }

  private createResult(checkName: string, passed: boolean, message: string,
    severity: string, details: string): CheckResult {
    return {
      checkName: checkName,
      passed: passed,
      message: message,
      severity: severity,
      details: details,
      timestamp: Date.now()
    };
  }

  private addResult(result: CheckResult): void {
    this.results.push(result);
    if (result.passed) {
      hilog.debug(DOMAIN, TAG, '[PASS] %{public}s: %{public}s', result.checkName, result.message);
    } else {
      hilog.warn(DOMAIN, TAG, '[%{public}s] %{public}s: %{public}s',
        result.severity, result.checkName, result.message);
    }
  }

  public checkConstantsConfiguration(): void {
    const bundleValid = DEFAULT_BUNDLE_NAME.length > 0;
    this.addResult(this.createResult(
      'DefaultBundleName',
      bundleValid,
      bundleValid ? `Default bundle: ${DEFAULT_BUNDLE_NAME}` : 'Default bundle is empty',
      bundleValid ? 'info' : 'error',
      `DEFAULT_BUNDLE_NAME = "${DEFAULT_BUNDLE_NAME}"`
    ));

    const moduleValid = DEFAULT_MODULE_NAME.length > 0;
    this.addResult(this.createResult(
      'DefaultModuleName',
      moduleValid,
      moduleValid ? `Default module: ${DEFAULT_MODULE_NAME}` : 'Default module is empty',
      moduleValid ? 'info' : 'error',
      `DEFAULT_MODULE_NAME = "${DEFAULT_MODULE_NAME}"`
    ));

    const skillValid = DEFAULT_SKILL_NAME.length > 0;
    this.addResult(this.createResult(
      'DefaultSkillName',
      skillValid,
      skillValid ? `Default skill: ${DEFAULT_SKILL_NAME}` : 'Default skill is empty',
      skillValid ? 'info' : 'error',
      `DEFAULT_SKILL_NAME = "${DEFAULT_SKILL_NAME}"`
    ));

    const bundleArrayValid = BUNDLE_NAME_ARRAY.length > 0;
    this.addResult(this.createResult(
      'BundleNameArray',
      bundleArrayValid,
      `Bundle array has ${BUNDLE_NAME_ARRAY.length} entries`,
      bundleArrayValid ? 'info' : 'warning',
      `BUNDLE_NAME_ARRAY length = ${BUNDLE_NAME_ARRAY.length}`
    ));

    const moduleArrayValid = MODULE_NAME_ARRAY.length > 0;
    this.addResult(this.createResult(
      'ModuleNameArray',
      moduleArrayValid,
      `Module array has ${MODULE_NAME_ARRAY.length} entries`,
      moduleArrayValid ? 'info' : 'warning',
      `MODULE_NAME_ARRAY length = ${MODULE_NAME_ARRAY.length}`
    ));

    const skillArrayValid = SKILL_ARRAY.length > 0;
    this.addResult(this.createResult(
      'SkillArray',
      skillArrayValid,
      `Skill array has ${SKILL_ARRAY.length} entries`,
      skillArrayValid ? 'info' : 'warning',
      `SKILL_ARRAY length = ${SKILL_ARRAY.length}`
    ));

    const flagLabelsValid = FLAG_LABELS.length > 0;
    this.addResult(this.createResult(
      'FlagLabels',
      flagLabelsValid,
      `Flag labels has ${FLAG_LABELS.length} entries`,
      flagLabelsValid ? 'info' : 'warning',
      `FLAG_LABELS length = ${FLAG_LABELS.length}`
    ));

    const flagValuesValid = FLAG_VALUES.length > 0;
    this.addResult(this.createResult(
      'FlagValues',
      flagValuesValid,
      `Flag values has ${FLAG_VALUES.length} entries`,
      flagValuesValid ? 'info' : 'warning',
      `FLAG_VALUES length = ${FLAG_VALUES.length}`
    ));

    const flagMatch = FLAG_LABELS.length === FLAG_VALUES.length;
    this.addResult(this.createResult(
      'FlagConsistency',
      flagMatch,
      flagMatch ? 'Flag labels and values count match' : 'Flag labels and values count mismatch',
      flagMatch ? 'info' : 'error',
      `FLAG_LABELS.length=${FLAG_LABELS.length}, FLAG_VALUES.length=${FLAG_VALUES.length}`
    ));
  }

  public checkDefaultValuesExist(): void {
    const bundleInArray = BUNDLE_NAME_ARRAY.indexOf(DEFAULT_BUNDLE_NAME) >= 0;
    this.addResult(this.createResult(
      'DefaultBundleInArray',
      bundleInArray,
      bundleInArray ? 'Default bundle found in array' : 'Default bundle NOT in array',
      bundleInArray ? 'info' : 'warning',
      `DEFAULT_BUNDLE_NAME in BUNDLE_NAME_ARRAY: ${bundleInArray}`
    ));

    const moduleInArray = MODULE_NAME_ARRAY.indexOf(DEFAULT_MODULE_NAME) >= 0;
    this.addResult(this.createResult(
      'DefaultModuleInArray',
      moduleInArray,
      moduleInArray ? 'Default module found in array' : 'Default module NOT in array',
      moduleInArray ? 'info' : 'warning',
      `DEFAULT_MODULE_NAME in MODULE_NAME_ARRAY: ${moduleInArray}`
    ));

    const skillInArray = SKILL_ARRAY.indexOf(DEFAULT_SKILL_NAME) >= 0;
    this.addResult(this.createResult(
      'DefaultSkillInArray',
      skillInArray,
      skillInArray ? 'Default skill found in array' : 'Default skill NOT in array',
      skillInArray ? 'info' : 'warning',
      `DEFAULT_SKILL_NAME in SKILL_ARRAY: ${skillInArray}`
    ));
  }

  public checkDataIntegrity(): void {
    const noDuplicatesInModules = this.checkNoDuplicates(MODULE_NAME_ARRAY);
    this.addResult(this.createResult(
      'ModuleNoDuplicates',
      noDuplicatesInModules,
      noDuplicatesInModules ? 'No duplicate modules' : 'Duplicate modules found',
      noDuplicatesInModules ? 'info' : 'warning',
      `MODULE_NAME_ARRAY unique check: ${noDuplicatesInModules}`
    ));

    const noDuplicatesInBundles = this.checkNoDuplicates(BUNDLE_NAME_ARRAY);
    this.addResult(this.createResult(
      'BundleNoDuplicates',
      noDuplicatesInBundles,
      noDuplicatesInBundles ? 'No duplicate bundles' : 'Duplicate bundles found',
      noDuplicatesInBundles ? 'info' : 'warning',
      `BUNDLE_NAME_ARRAY unique check: ${noDuplicatesInBundles}`
    ));

    const noDuplicatesInSkills = this.checkNoDuplicates(SKILL_ARRAY);
    this.addResult(this.createResult(
      'SkillNoDuplicates',
      noDuplicatesInSkills,
      noDuplicatesInSkills ? 'No duplicate skills' : 'Duplicate skills found',
      noDuplicatesInSkills ? 'info' : 'warning',
      `SKILL_ARRAY unique check: ${noDuplicatesInSkills}`
    ));

    const noEmptyModules = this.checkNoEmptyStrings(MODULE_NAME_ARRAY);
    this.addResult(this.createResult(
      'NoEmptyModules',
      noEmptyModules,
      noEmptyModules ? 'No empty module names' : 'Empty module names found',
      noEmptyModules ? 'info' : 'warning',
      `MODULE_NAME_ARRAY empty check: ${noEmptyModules}`
    ));

    const noEmptySkills = this.checkNoEmptyStrings(SKILL_ARRAY);
    this.addResult(this.createResult(
      'NoEmptySkills',
      noEmptySkills,
      noEmptySkills ? 'No empty skill names' : 'Empty skill names found',
      noEmptySkills ? 'info' : 'warning',
      `SKILL_ARRAY empty check: ${noEmptySkills}`
    ));
  }

  private checkNoDuplicates(arr: string[]): boolean {
    for (let i = 0; i < arr.length; i++) {
      for (let j = i + 1; j < arr.length; j++) {
        if (arr[i] === arr[j]) {
          return false;
        }
      }
    }
    return true;
  }

  private checkNoEmptyStrings(arr: string[]): boolean {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i].length === 0) {
        return false;
      }
    }
    return true;
  }

  public runAllChecks(): EnvironmentSummary {
    this.results = [];
    this.checkConstantsConfiguration();
    this.checkDefaultValuesExist();
    this.checkDataIntegrity();
    return this.getSummary();
  }

  public getSummary(): EnvironmentSummary {
    let passed = 0;
    let failed = 0;
    let warnings = 0;

    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].passed) {
        passed++;
      } else if (this.results[i].severity === 'error') {
        failed++;
      } else {
        warnings++;
      }
    }

    const total = this.results.length;
    const readinessPercentage = total > 0 ? Math.round((passed / total) * 100) : 0;
    let readinessGrade = 'F';
    if (readinessPercentage >= 95) {
      readinessGrade = 'A';
    } else if (readinessPercentage >= 85) {
      readinessGrade = 'B';
    } else if (readinessPercentage >= 75) {
      readinessGrade = 'C';
    } else if (readinessPercentage >= 60) {
      readinessGrade = 'D';
    }

    return {
      totalChecks: total,
      passedChecks: passed,
      failedChecks: failed,
      warningChecks: warnings,
      overallPassed: failed === 0,
      readinessPercentage: readinessPercentage,
      readinessGrade: readinessGrade
    };
  }

  public getResults(): CheckResult[] {
    const copy: CheckResult[] = [];
    for (let i = 0; i < this.results.length; i++) {
      const r = this.results[i];
      const resultCopy: CheckResult = {
        checkName: r.checkName,
        passed: r.passed,
        message: r.message,
        severity: r.severity,
        details: r.details,
        timestamp: r.timestamp
      };
      copy.push(resultCopy);
    }
    return copy;
  }

  public getFailedResults(): CheckResult[] {
    const failed: CheckResult[] = [];
    for (let i = 0; i < this.results.length; i++) {
      if (!this.results[i].passed) {
        failed.push(this.results[i]);
      }
    }
    return failed;
  }

  public generateCheckReport(): string {
    const summary = this.getSummary();
    const lines: string[] = [];
    lines.push('=== Environment Check Report ===');
    lines.push(`Total checks: ${summary.totalChecks}`);
    lines.push(`Passed: ${summary.passedChecks}`);
    lines.push(`Failed: ${summary.failedChecks}`);
    lines.push(`Warnings: ${summary.warningChecks}`);
    lines.push(`Readiness: ${summary.readinessPercentage}% (${summary.readinessGrade})`);
    lines.push(`Overall: ${summary.overallPassed ? 'READY' : 'NOT READY'}`);
    lines.push('');

    if (this.results.length > 0) {
      lines.push('--- Detailed Results ---');
      for (let i = 0; i < this.results.length; i++) {
        const r = this.results[i];
        const status = r.passed ? 'PASS' : 'FAIL';
        lines.push(`  [${status}] ${r.checkName}: ${r.message}`);
        if (!r.passed && r.details.length > 0) {
          lines.push(`         Details: ${r.details}`);
        }
      }
    }

    lines.push('');
    lines.push('=== End of Report ===');
    return lines.join('\n');
  }

  public clear(): void {
    this.results = [];
    hilog.info(DOMAIN, TAG, 'Environment checker cleared');
  }

  public getResultCount(): number {
    return this.results.length;
  }
}
