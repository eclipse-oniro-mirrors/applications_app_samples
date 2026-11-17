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

import { describe, it, expect } from '@ohos/hypium';

const MODEL_LHT16: string = 'LHT16';

const MODEL_ORIOLE: string = 'oriole';

const LOCALE_ZH: string = 'zh_CN';

const LOCALE_EN: string = 'en_US';

const MIN_API: number = 12;

const SUPPORTED_MODELS: string[] = [MODEL_LHT16, MODEL_ORIOLE];

const SUPPORTED_LOCALES: string[] = [LOCALE_ZH, LOCALE_EN];

const MAX_CASES: number = 16;

interface DeviceCase {
  model: string;
  locale: string;
  apiLevel: number;
}

interface CaseResult {
  key: string;
  passed: boolean;
  reason: string;
}

// Builds the device compatibility regression matrix
class RegressionMatrix {
  public static build(models: string[], locales: string[], apiLevel: number): DeviceCase[] {
    const result: DeviceCase[] = [];
    for (let i = 0; i < models.length; i++) {
      for (let j = 0; j < locales.length; j++) {
        if (result.length >= MAX_CASES) {
          return result;
        }
        result.push({ model: models[i], locale: locales[j], apiLevel: apiLevel });
      }
    }
    return result;
  }

  public static defaultMatrix(): DeviceCase[] {
    return RegressionMatrix.build(SUPPORTED_MODELS, SUPPORTED_LOCALES, MIN_API);
  }

  public static keyOf(testCase: DeviceCase): string {
    return `${testCase.model}:${testCase.locale}:${testCase.apiLevel}`;
  }

  public static dedupe(cases: DeviceCase[]): DeviceCase[] {
    const seen: Set<string> = new Set<string>();
    const result: DeviceCase[] = [];
    for (let i = 0; i < cases.length; i++) {
      const key = RegressionMatrix.keyOf(cases[i]);
      if (!seen.has(key)) {
        seen.add(key);
        result.push(cases[i]);
      }
    }
    return result;
  }

  public static countFor(locale: string): number {
    return RegressionMatrix.defaultMatrix()
      .filter((testCase: DeviceCase) => testCase.locale === locale).length;
  }
}

// Checks a single device case against compatibility rules
class CompatibilityChecker {
  public static isModelSupported(model: string): boolean {
    return SUPPORTED_MODELS.includes(model);
  }

  public static isLocaleSupported(locale: string): boolean {
    return SUPPORTED_LOCALES.includes(locale);
  }

  public static isApiSupported(apiLevel: number): boolean {
    return apiLevel >= MIN_API;
  }

  public static check(testCase: DeviceCase): CaseResult {
    const key = RegressionMatrix.keyOf(testCase);
    if (!CompatibilityChecker.isModelSupported(testCase.model)) {
      return { key: key, passed: false, reason: 'model' };
    }
    if (!CompatibilityChecker.isLocaleSupported(testCase.locale)) {
      return { key: key, passed: false, reason: 'locale' };
    }
    if (!CompatibilityChecker.isApiSupported(testCase.apiLevel)) {
      return { key: key, passed: false, reason: 'apiLevel' };
    }
    return { key: key, passed: true, reason: 'none' };
  }

  public static isCompatible(testCase: DeviceCase): boolean {
    return CompatibilityChecker.check(testCase).passed;
  }
}

// Runs a matrix of compatibility cases and aggregates results
class MatrixRunner {
  private results: CaseResult[] = [];

  public run(cases: DeviceCase[]): number {
    let failures: number = 0;
    for (let i = 0; i < cases.length; i++) {
      const result = CompatibilityChecker.check(cases[i]);
      this.results.push(result);
      if (!result.passed) {
        failures++;
      }
    }
    return failures;
  }

  public getResults(): CaseResult[] {
    return [...this.results];
  }

  public count(): number {
    return this.results.length;
  }

  public passedCount(): number {
    return this.results.filter((result: CaseResult) => result.passed).length;
  }

  public failedCount(): number {
    return this.results.filter((result: CaseResult) => !result.passed).length;
  }

  public failuresByReason(reason: string): string[] {
    const keys: string[] = [];
    for (let i = 0; i < this.results.length; i++) {
      if (!this.results[i].passed && this.results[i].reason === reason) {
        keys.push(this.results[i].key);
      }
    }
    return keys;
  }

  public passRate(): number {
    return this.results.length === 0 ? 0 : this.passedCount() * 100 / this.results.length;
  }

  public reset(): void {
    this.results = [];
  }
}

// Summarizes compatibility regression health
class CompatibilityReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public summary(): string {
    return this.isPassed() ? 'compatible' : 'incompatible';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function compatibilityRegressionTest() {
  describe('CompatibilityRegression_Test', () => {

    it('matrix_should_build_default_cases', 0, () => {
      const matrix = RegressionMatrix.defaultMatrix();
      expect(matrix.length).assertEqual(4);
      expect(matrix[0].model).assertEqual(MODEL_LHT16);
      expect(matrix[0].locale).assertEqual(LOCALE_ZH);
      expect(matrix[0].apiLevel).assertEqual(MIN_API);
      expect(RegressionMatrix.countFor(LOCALE_EN)).assertEqual(2);
    });

    it('matrix_should_cap_case_count', 0, () => {
      const models: string[] = ['a', 'b', 'c', 'd', 'e'];
      const locales: string[] = ['zh', 'en', 'fr', 'de'];
      const cases = RegressionMatrix.build(models, locales, MIN_API);
      expect(cases.length).assertEqual(MAX_CASES);
      expect(RegressionMatrix.build([], locales, MIN_API).length).assertEqual(0);
    });

    it('matrix_should_build_keys', 0, () => {
      const testCase: DeviceCase = { model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 14 };
      expect(RegressionMatrix.keyOf(testCase)).assertEqual('LHT16:zh_CN:14');
      expect(RegressionMatrix.keyOf({
        model: MODEL_ORIOLE, locale: LOCALE_EN, apiLevel: 12
      })).assertEqual('oriole:en_US:12');
    });

    it('matrix_should_dedupe_cases', 0, () => {
      const cases: DeviceCase[] = [
        { model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 12 },
        { model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 12 },
        { model: MODEL_ORIOLE, locale: LOCALE_EN, apiLevel: 12 }
      ];
      const unique = RegressionMatrix.dedupe(cases);
      expect(unique.length).assertEqual(2);
      expect(RegressionMatrix.dedupe([]).length).assertEqual(0);
    });

    it('checker_should_accept_supported_models', 0, () => {
      expect(CompatibilityChecker.isModelSupported(MODEL_LHT16)).assertTrue();
      expect(CompatibilityChecker.isModelSupported(MODEL_ORIOLE)).assertTrue();
      expect(CompatibilityChecker.isModelSupported('phone-x')).assertFalse();
      expect(SUPPORTED_MODELS.length).assertEqual(2);
    });

    it('checker_should_accept_supported_locales', 0, () => {
      expect(CompatibilityChecker.isLocaleSupported(LOCALE_ZH)).assertTrue();
      expect(CompatibilityChecker.isLocaleSupported(LOCALE_EN)).assertTrue();
      expect(CompatibilityChecker.isLocaleSupported('fr_FR')).assertFalse();
      expect(SUPPORTED_LOCALES.length).assertEqual(2);
    });

    it('checker_should_accept_min_api', 0, () => {
      expect(CompatibilityChecker.isApiSupported(MIN_API)).assertTrue();
      expect(CompatibilityChecker.isApiSupported(MIN_API - 1)).assertFalse();
      expect(CompatibilityChecker.isApiSupported(MIN_API + 1)).assertTrue();
    });

    it('checker_should_return_reasons', 0, () => {
      expect(CompatibilityChecker.check({
        model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 12
      }).reason).assertEqual('none');
      expect(CompatibilityChecker.check({
        model: 'bad', locale: LOCALE_ZH, apiLevel: 12
      }).reason).assertEqual('model');
      expect(CompatibilityChecker.check({
        model: MODEL_LHT16, locale: 'bad', apiLevel: 12
      }).reason).assertEqual('locale');
      expect(CompatibilityChecker.check({
        model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 9
      }).reason).assertEqual('apiLevel');
    });

    it('checker_should_flag_incompatible_cases', 0, () => {
      expect(CompatibilityChecker.isCompatible({
        model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 14
      })).assertTrue();
      expect(CompatibilityChecker.isCompatible({
        model: 'phone-x', locale: LOCALE_ZH, apiLevel: 14
      })).assertFalse();
      expect(CompatibilityChecker.isCompatible({
        model: MODEL_ORIOLE, locale: 'fr_FR', apiLevel: 14
      })).assertFalse();
    });

    it('runner_should_pass_full_matrix', 0, () => {
      const runner = new MatrixRunner();
      const failures = runner.run(RegressionMatrix.defaultMatrix());
      expect(failures).assertEqual(0);
      expect(runner.count()).assertEqual(4);
      expect(runner.passedCount()).assertEqual(4);
      expect(runner.failedCount()).assertEqual(0);
      expect(runner.passRate()).assertEqual(100);
    });

    it('runner_should_track_failures', 0, () => {
      const runner = new MatrixRunner();
      const failures = runner.run([
        { model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 12 },
        { model: 'bad', locale: LOCALE_ZH, apiLevel: 12 },
        { model: MODEL_ORIOLE, locale: 'bad', apiLevel: 12 },
        { model: MODEL_ORIOLE, locale: LOCALE_EN, apiLevel: 9 }
      ]);
      expect(failures).assertEqual(3);
      expect(runner.failedCount()).assertEqual(3);
      expect(runner.passRate()).assertEqual(25);
      expect(runner.failuresByReason('model').length).assertEqual(1);
      expect(runner.failuresByReason('locale').length).assertEqual(1);
      expect(runner.failuresByReason('apiLevel').length).assertEqual(1);
    });

    it('runner_should_reset', 0, () => {
      const runner = new MatrixRunner();
      runner.run(RegressionMatrix.defaultMatrix());
      expect(runner.count()).assertEqual(4);
      runner.reset();
      expect(runner.count()).assertEqual(0);
      expect(runner.passRate()).assertEqual(0);
      expect(runner.failuresByReason('model').length).assertEqual(0);
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new CompatibilityReport();
      report.check('matrix', true);
      report.check('models', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('compatible');
      report.check('locale', false);
      expect(report.summary()).assertEqual('incompatible');
      expect(report.failures()).assertDeepEquals(['locale']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('regression_flow_should_pass_supported_devices', 0, () => {
      const matrix = RegressionMatrix.defaultMatrix();
      const runner = new MatrixRunner();
      const report = new CompatibilityReport();
      runner.run(matrix);
      report.check('allPassed', runner.failedCount() === 0);
      report.check('fullMatrix', runner.count() === 4);
      report.check('models', CompatibilityChecker.isModelSupported(MODEL_LHT16));
      expect(report.isPassed()).assertTrue();
      expect(runner.passRate()).assertEqual(100);
      expect(RegressionMatrix.dedupe(matrix).length).assertEqual(4);
    });

    it('regression_flow_should_detect_regressions', 0, () => {
      const matrix: DeviceCase[] = [
        { model: MODEL_LHT16, locale: LOCALE_ZH, apiLevel: 12 },
        { model: 'legacy', locale: LOCALE_ZH, apiLevel: 12 },
        { model: MODEL_ORIOLE, locale: LOCALE_EN, apiLevel: 11 }
      ];
      const runner = new MatrixRunner();
      const report = new CompatibilityReport();
      const failures = runner.run(matrix);
      report.check('noCritical', failures === 0);
      expect(report.isPassed()).assertFalse();
      expect(failures).assertEqual(2);
      expect(runner.failuresByReason('model')).assertDeepEquals(['legacy:zh_CN:12']);
      expect(runner.failuresByReason('apiLevel')).assertDeepEquals(['oriole:en_US:11']);
    });

    it('compatibility_constants_should_be_stable', 0, () => {
      expect(MODEL_LHT16).assertEqual('LHT16');
      expect(MODEL_ORIOLE).assertEqual('oriole');
      expect(LOCALE_ZH).assertEqual('zh_CN');
      expect(LOCALE_EN).assertEqual('en_US');
      expect(MIN_API).assertEqual(12);
      expect(MAX_CASES).assertEqual(16);
    });
  });
}


