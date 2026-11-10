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

const SEVERITY_BLOCKER: string = 'blocker';

const SEVERITY_CRITICAL: string = 'critical';

const SEVERITY_NORMAL: string = 'normal';

const FEATURE_CREATE: string = 'createIssue';

const FEATURE_LIST: string = 'issueList';

const FEATURE_DETAIL: string = 'issueDetail';

const FEATURE_ATTACHMENT: string = 'attachment';

const FEATURE_NETWORK: string = 'network';

const FEATURE_LOCAL: string = 'localization';

interface RegressionCase {
  id: string;
  feature: string;
  severity: string;
  steps: string[];
}

interface CaseResult {
  id: string;
  passed: boolean;
  durationMs: number;
}

// Stores regression cases and supports filtering
class RegressionSuite {
  private cases: RegressionCase[] = [];

  public register(testCase: RegressionCase): boolean {
    if (testCase.id.length === 0 || this.has(testCase.id)) {
      return false;
    }
    if (testCase.feature.length === 0 || testCase.steps.length === 0) {
      return false;
    }
    this.cases.push({
      id: testCase.id,
      feature: testCase.feature,
      severity: testCase.severity,
      steps: [...testCase.steps]
    });
    return true;
  }

  public has(id: string): boolean {
    for (let i = 0; i < this.cases.length; i++) {
      if (this.cases[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public size(): number {
    return this.cases.length;
  }

  public all(): RegressionCase[] {
    return [...this.cases];
  }

  public byFeature(feature: string): RegressionCase[] {
    return this.cases.filter((testCase: RegressionCase) => testCase.feature === feature);
  }

  public bySeverity(severity: string): RegressionCase[] {
    return this.cases.filter((testCase: RegressionCase) => testCase.severity === severity);
  }

  public features(): string[] {
    const seen: Set<string> = new Set<string>();
    const result: string[] = [];
    for (let i = 0; i < this.cases.length; i++) {
      if (!seen.has(this.cases[i].feature)) {
        seen.add(this.cases[i].feature);
        result.push(this.cases[i].feature);
      }
    }
    return result;
  }

  public clear(): void {
    this.cases = [];
  }
}

// Builds the standard regression catalog
class RegressionCatalog {
  public static standard(): RegressionSuite {
    const suite = new RegressionSuite();
    suite.register({
      id: 'REG-CREATE-001',
      feature: FEATURE_CREATE,
      severity: SEVERITY_BLOCKER,
      steps: ['open home', 'open create', 'fill form', 'submit']
    });
    suite.register({
      id: 'REG-LIST-001',
      feature: FEATURE_LIST,
      severity: SEVERITY_CRITICAL,
      steps: ['open home', 'open list']
    });
    suite.register({
      id: 'REG-DETAIL-001',
      feature: FEATURE_DETAIL,
      severity: SEVERITY_NORMAL,
      steps: ['open list', 'open detail']
    });
    suite.register({
      id: 'REG-ATTACH-001',
      feature: FEATURE_ATTACHMENT,
      severity: SEVERITY_CRITICAL,
      steps: ['open create', 'add attachment', 'submit']
    });
    suite.register({
      id: 'REG-NET-001',
      feature: FEATURE_NETWORK,
      severity: SEVERITY_NORMAL,
      steps: ['disconnect', 'submit', 'reconnect']
    });
    suite.register({
      id: 'REG-LOCAL-001',
      feature: FEATURE_LOCAL,
      severity: SEVERITY_NORMAL,
      steps: ['switch locale', 'verify labels']
    });
    return suite;
  }

  public static expectedFeatureCount(): number {
    return 6;
  }
}

// Runs regression cases and records results
class RegressionRunner {
  private results: CaseResult[] = [];

  public run(cases: RegressionCase[], action: (testCase: RegressionCase) => boolean): number {
    let failures: number = 0;
    for (let i = 0; i < cases.length; i++) {
      const passed = action(cases[i]);
      this.results.push({ id: cases[i].id, passed: passed, durationMs: (i + 1) * 10 });
      if (!passed) {
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

  public failedIds(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.results.length; i++) {
      if (!this.results[i].passed) {
        ids.push(this.results[i].id);
      }
    }
    return ids;
  }

  public totalDuration(): number {
    let total: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      total += this.results[i].durationMs;
    }
    return total;
  }

  public reset(): void {
    this.results = [];
  }
}

// Aggregates pass rate and blocker failures
class RegressionReport {
  private total: number = 0;
  private passed: number = 0;
  private blockers: string[] = [];

  public record(caseId: string, severity: string, passed: boolean): void {
    this.total++;
    if (passed) {
      this.passed++;
    } else if (severity === SEVERITY_BLOCKER) {
      this.blockers.push(caseId);
    }
  }

  public getTotal(): number {
    return this.total;
  }

  public getPassed(): number {
    return this.passed;
  }

  public getFailed(): number {
    return this.total - this.passed;
  }

  public getPassRate(): number {
    return this.total === 0 ? 0 : this.passed * 100 / this.total;
  }

  public hasBlockers(): boolean {
    return this.blockers.length > 0;
  }

  public getBlockers(): string[] {
    return [...this.blockers];
  }

  public isReleaseReady(): boolean {
    return this.total > 0 && !this.hasBlockers() && this.getPassRate() >= 95;
  }

  public reset(): void {
    this.total = 0;
    this.passed = 0;
    this.blockers = [];
  }
}

// Builds a feature × severity coverage matrix
class RegressionMatrix {
  public static coverage(suite: RegressionSuite): Map<string, number> {
    const matrix: Map<string, number> = new Map<string, number>();
    const cases = suite.all();
    for (let i = 0; i < cases.length; i++) {
      const key = `${cases[i].feature}:${cases[i].severity}`;
      const current = matrix.get(key) ?? 0;
      matrix.set(key, current + 1);
    }
    return matrix;
  }

  public static missingFeatures(suite: RegressionSuite, expected: string[]): string[] {
    const present = suite.features();
    const missing: string[] = [];
    for (let i = 0; i < expected.length; i++) {
      if (!present.includes(expected[i])) {
        missing.push(expected[i]);
      }
    }
    return missing;
  }

  public static hasBlockerCoverage(suite: RegressionSuite): boolean {
    return suite.bySeverity(SEVERITY_BLOCKER).length > 0;
  }

  public static coverageRatio(suite: RegressionSuite, expectedFeatures: number): number {
    if (expectedFeatures <= 0) {
      return 0;
    }
    return suite.features().length * 100 / expectedFeatures;
  }
}

export default function comprehensiveRegressionTest() {
  describe('ComprehensiveRegression_Test', () => {

    it('suite_should_register_unique_cases', 0, () => {
      const suite = new RegressionSuite();
      const testCase: RegressionCase = {
        id: 'REG-001', feature: FEATURE_CREATE, severity: SEVERITY_BLOCKER, steps: ['step']
      };
      expect(suite.register(testCase)).assertTrue();
      expect(suite.register(testCase)).assertFalse();
      expect(suite.register({
        id: '', feature: FEATURE_CREATE, severity: SEVERITY_NORMAL, steps: ['step']
      })).assertFalse();
      expect(suite.register({
        id: 'REG-002', feature: '', severity: SEVERITY_NORMAL, steps: ['step']
      })).assertFalse();
      expect(suite.register({
        id: 'REG-003', feature: FEATURE_CREATE, severity: SEVERITY_NORMAL, steps: []
      })).assertFalse();
      expect(suite.size()).assertEqual(1);
      expect(suite.has('REG-001')).assertTrue();
      expect(suite.has('REG-999')).assertFalse();
    });

    it('catalog_should_cover_all_features', 0, () => {
      const suite = RegressionCatalog.standard();
      expect(suite.size()).assertEqual(6);
      expect(suite.features().length).assertEqual(RegressionCatalog.expectedFeatureCount());
      expect(suite.byFeature(FEATURE_CREATE).length).assertEqual(1);
      expect(suite.bySeverity(SEVERITY_NORMAL).length).assertEqual(3);
      expect(suite.bySeverity(SEVERITY_BLOCKER).length).assertEqual(1);
      expect(suite.bySeverity(SEVERITY_CRITICAL).length).assertEqual(2);
    });

    it('catalog_should_filter_and_clear', 0, () => {
      const suite = RegressionCatalog.standard();
      expect(suite.byFeature('missing').length).assertEqual(0);
      expect(suite.bySeverity('unknown').length).assertEqual(0);
      expect(suite.all().length).assertEqual(6);
      suite.clear();
      expect(suite.size()).assertEqual(0);
      expect(suite.features().length).assertEqual(0);
    });

    it('runner_should_pass_all_cases', 0, () => {
      const suite = RegressionCatalog.standard();
      const runner = new RegressionRunner();
      const failures = runner.run(suite.all(), () => true);
      expect(failures).assertEqual(0);
      expect(runner.count()).assertEqual(6);
      expect(runner.passedCount()).assertEqual(6);
      expect(runner.failedCount()).assertEqual(0);
      expect(runner.failedIds().length).assertEqual(0);
      expect(runner.totalDuration()).assertEqual(210);
    });

    it('runner_should_track_failures', 0, () => {
      const suite = RegressionCatalog.standard();
      const runner = new RegressionRunner();
      const failures = runner.run(suite.all(), (testCase: RegressionCase) =>
        testCase.feature !== FEATURE_ATTACHMENT);
      expect(failures).assertEqual(1);
      expect(runner.failedCount()).assertEqual(1);
      expect(runner.failedIds()).assertDeepEquals(['REG-ATTACH-001']);
      expect(runner.passedCount()).assertEqual(5);
      runner.reset();
      expect(runner.count()).assertEqual(0);
      expect(runner.totalDuration()).assertEqual(0);
    });

    it('runner_should_stop_counting_after_reset', 0, () => {
      const suite = RegressionCatalog.standard();
      const runner = new RegressionRunner();
      runner.run(suite.byFeature(FEATURE_CREATE), () => true);
      expect(runner.count()).assertEqual(1);
      runner.reset();
      runner.run(suite.byFeature(FEATURE_LIST), () => false);
      expect(runner.count()).assertEqual(1);
      expect(runner.failedCount()).assertEqual(1);
      expect(runner.getResults()[0].durationMs).assertEqual(10);
    });

    it('report_should_compute_pass_rate', 0, () => {
      const report = new RegressionReport();
      report.record('a', SEVERITY_NORMAL, true);
      report.record('b', SEVERITY_CRITICAL, true);
      report.record('c', SEVERITY_NORMAL, false);
      expect(report.getTotal()).assertEqual(3);
      expect(report.getPassed()).assertEqual(2);
      expect(report.getFailed()).assertEqual(1);
      expect(report.getPassRate()).assertLarger(66);
      expect(report.hasBlockers()).assertFalse();
      expect(report.isReleaseReady()).assertFalse();
    });

    it('report_should_flag_blockers', 0, () => {
      const report = new RegressionReport();
      report.record('REG-CREATE-001', SEVERITY_BLOCKER, false);
      report.record('REG-LIST-001', SEVERITY_CRITICAL, true);
      expect(report.hasBlockers()).assertTrue();
      expect(report.getBlockers()).assertDeepEquals(['REG-CREATE-001']);
      expect(report.isReleaseReady()).assertFalse();
      report.reset();
      expect(report.getTotal()).assertEqual(0);
      expect(report.getPassRate()).assertEqual(0);
    });

    it('report_should_be_release_ready_at_full_pass', 0, () => {
      const report = new RegressionReport();
      for (let i = 0; i < 20; i++) {
        report.record(`case-${i}`, SEVERITY_NORMAL, true);
      }
      expect(report.getPassRate()).assertEqual(100);
      expect(report.isReleaseReady()).assertTrue();
      report.record('late-failure', SEVERITY_NORMAL, false);
      expect(report.getPassRate()).assertLarger(95);
      expect(report.getPassRate()).assertLess(96);
      expect(report.isReleaseReady()).assertTrue();
    });

    it('matrix_should_compute_coverage', 0, () => {
      const suite = RegressionCatalog.standard();
      const coverage = RegressionMatrix.coverage(suite);
      expect(coverage.size).assertEqual(6);
      expect(coverage.get(`${FEATURE_CREATE}:${SEVERITY_BLOCKER}`)).assertEqual(1);
      expect(coverage.get(`${FEATURE_LIST}:${SEVERITY_CRITICAL}`)).assertEqual(1);
      expect(coverage.get(`${FEATURE_LIST}:${SEVERITY_BLOCKER}`) === undefined).assertTrue();
    });

    it('matrix_should_detect_missing_features', 0, () => {
      const suite = RegressionCatalog.standard();
      expect(RegressionMatrix.missingFeatures(suite, [
        FEATURE_CREATE, FEATURE_LIST, FEATURE_DETAIL,
        FEATURE_ATTACHMENT, FEATURE_NETWORK, FEATURE_LOCAL
      ]).length).assertEqual(0);
      expect(RegressionMatrix.missingFeatures(suite, [FEATURE_CREATE, 'missingFeature']))
        .assertDeepEquals(['missingFeature']);
      expect(RegressionMatrix.hasBlockerCoverage(suite)).assertTrue();
      expect(RegressionMatrix.coverageRatio(suite, 6)).assertEqual(100);
      expect(RegressionMatrix.coverageRatio(suite, 12)).assertEqual(50);
    });

    it('regression_flow_should_decide_release', 0, () => {
      const suite = RegressionCatalog.standard();
      const runner = new RegressionRunner();
      const report = new RegressionReport();
      runner.run(suite.all(), (testCase: RegressionCase) => testCase.id !== 'REG-LOCAL-001');
      const results = runner.getResults();
      const cases = suite.all();
      for (let i = 0; i < results.length; i++) {
        report.record(results[i].id, cases[i].severity, results[i].passed);
      }
      expect(runner.count()).assertEqual(6);
      expect(report.getPassed()).assertEqual(5);
      expect(report.getFailed()).assertEqual(1);
      expect(report.hasBlockers()).assertFalse();
      // A non blocker failure still keeps the pass rate below the release threshold
      expect(report.isReleaseReady()).assertFalse();
      expect(report.getBlockers().length).assertEqual(0);
      // A clean run is release ready
      report.reset();
      for (let i = 0; i < cases.length; i++) {
        report.record(cases[i].id, cases[i].severity, true);
      }
      expect(report.isReleaseReady()).assertTrue();
    });

    it('regression_constants_should_be_stable', 0, () => {
      expect(SEVERITY_BLOCKER).assertEqual('blocker');
      expect(SEVERITY_CRITICAL).assertEqual('critical');
      expect(SEVERITY_NORMAL).assertEqual('normal');
      expect(FEATURE_CREATE).assertEqual('createIssue');
      expect(FEATURE_LOCAL).assertEqual('localization');
      expect(RegressionCatalog.expectedFeatureCount()).assertEqual(6);
    });
  });
}

