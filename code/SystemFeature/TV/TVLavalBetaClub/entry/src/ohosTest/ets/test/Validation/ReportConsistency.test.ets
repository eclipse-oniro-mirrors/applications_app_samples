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
import { issueTypeList, probabilityList, statusList }
  from '../../../../main/ets/pages/IssueReporter/models/IssueDetailInfo';

const REQUIRED_FIELDS: string[] = ['issueId', 'description', 'status', 'type', 'faultTime'];

const MAX_DESCRIPTION_LENGTH: number = 1024;

const MAX_REMARK_LENGTH: number = 200;

const FAULT_TIME_LENGTH: number = 14;

interface ReportField {
  name: string;
  value: string;
  required: boolean;
}

// Validates individual report fields
class ReportFieldValidator {
  public static isEmpty(value: string): boolean {
    return value.trim().length === 0;
  }

  public static isRequiredMissing(field: ReportField): boolean {
    return field.required && ReportFieldValidator.isEmpty(field.value);
  }

  public static isDescriptionValid(value: string): boolean {
    return !ReportFieldValidator.isEmpty(value) && value.length <= MAX_DESCRIPTION_LENGTH;
  }

  public static isRemarkValid(value: string): boolean {
    return value.length <= MAX_REMARK_LENGTH;
  }

  public static isFaultTimeValid(value: string): boolean {
    return value.length === FAULT_TIME_LENGTH;
  }

  public static isTypeKnown(value: string): boolean {
    return issueTypeList.includes(value);
  }

  public static isProbabilityKnown(value: string): boolean {
    return probabilityList.includes(value);
  }

  public static isStatusKnown(value: string): boolean {
    return statusList.includes(value);
  }
}

// Checks cross-field consistency rules for an issue report
class ReportConsistencyChecker {
  private fields: Map<string, ReportField> = new Map<string, ReportField>();

  public set(name: string, value: string, required: boolean): boolean {
    if (name.length === 0) {
      return false;
    }
    this.fields.set(name, { name: name, value: value, required: required });
    return true;
  }

  public get(name: string): string {
    const field = this.fields.get(name);
    return field === undefined ? '' : field.value;
  }

  public missingRequired(): string[] {
    const missing: string[] = [];
    this.fields.forEach((field: ReportField) => {
      if (ReportFieldValidator.isRequiredMissing(field)) {
        missing.push(field.name);
      }
    });
    return missing;
  }

  public isComplete(): boolean {
    for (let i = 0; i < REQUIRED_FIELDS.length; i++) {
      const field = this.fields.get(REQUIRED_FIELDS[i]);
      if (field === undefined || ReportFieldValidator.isRequiredMissing(field)) {
        return false;
      }
    }
    return true;
  }

  public invalidValues(): string[] {
    const invalid: string[] = [];
    if (!ReportFieldValidator.isDescriptionValid(this.get('description'))) {
      invalid.push('description');
    }
    if (!ReportFieldValidator.isRemarkValid(this.get('remark'))) {
      invalid.push('remark');
    }
    if (!ReportFieldValidator.isFaultTimeValid(this.get('faultTime'))) {
      invalid.push('faultTime');
    }
    return invalid;
  }

  public unknownCatalogs(): string[] {
    const unknown: string[] = [];
    if (this.get('type').length > 0 && !ReportFieldValidator.isTypeKnown(this.get('type'))) {
      unknown.push('type');
    }
    if (this.get('probability').length > 0 &&
      !ReportFieldValidator.isProbabilityKnown(this.get('probability'))) {
      unknown.push('probability');
    }
    if (this.get('status').length > 0 && !ReportFieldValidator.isStatusKnown(this.get('status'))) {
      unknown.push('status');
    }
    return unknown;
  }

  public isConsistent(): boolean {
    return this.isComplete() && this.invalidValues().length === 0 &&
      this.unknownCatalogs().length === 0;
  }

  public size(): number {
    return this.fields.size;
  }

  public clear(): void {
    this.fields = new Map<string, ReportField>();
  }
}

// Builds a consistent report for tests
class ReportFactory {
  public static complete(): ReportConsistencyChecker {
    const checker = new ReportConsistencyChecker();
    checker.set('issueId', 'ISSUE-1001', true);
    checker.set('description', 'screen flickers', true);
    checker.set('status', statusList[1], true);
    checker.set('type', issueTypeList[0], true);
    checker.set('faultTime', '20260101120000', true);
    checker.set('probability', probabilityList[3], false);
    checker.set('remark', 'reproduced twice', false);
    return checker;
  }

  public static incomplete(): ReportConsistencyChecker {
    const checker = new ReportConsistencyChecker();
    checker.set('issueId', '', true);
    checker.set('description', '', true);
    checker.set('status', '', true);
    checker.set('type', '', true);
    checker.set('faultTime', '', true);
    return checker;
  }

  public static requiredFieldCount(): number {
    return REQUIRED_FIELDS.length;
  }
}

// Summarizes report validation results
class ReportValidationSummary {
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
    return this.isPassed() ? 'consistent' : 'inconsistent';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function reportConsistencyTest() {
  describe('ReportConsistency_Test', () => {

    it('validator_should_detect_empty_values', 0, () => {
      expect(ReportFieldValidator.isEmpty('')).assertTrue();
      expect(ReportFieldValidator.isEmpty('   ')).assertTrue();
      expect(ReportFieldValidator.isEmpty('\n\t')).assertTrue();
      expect(ReportFieldValidator.isEmpty('x')).assertFalse();
    });

    it('validator_should_detect_missing_required', 0, () => {
      expect(ReportFieldValidator.isRequiredMissing({
        name: 'a', value: '', required: true
      })).assertTrue();
      expect(ReportFieldValidator.isRequiredMissing({
        name: 'a', value: '', required: false
      })).assertFalse();
      expect(ReportFieldValidator.isRequiredMissing({
        name: 'a', value: 'x', required: true
      })).assertFalse();
    });

    it('validator_should_check_description', 0, () => {
      expect(ReportFieldValidator.isDescriptionValid('text')).assertTrue();
      expect(ReportFieldValidator.isDescriptionValid('')).assertFalse();
      expect(ReportFieldValidator.isDescriptionValid('a'.repeat(MAX_DESCRIPTION_LENGTH)))
        .assertTrue();
      expect(ReportFieldValidator.isDescriptionValid('a'.repeat(MAX_DESCRIPTION_LENGTH + 1)))
        .assertFalse();
    });

    it('validator_should_check_remark', 0, () => {
      expect(ReportFieldValidator.isRemarkValid('')).assertTrue();
      expect(ReportFieldValidator.isRemarkValid('a'.repeat(MAX_REMARK_LENGTH))).assertTrue();
      expect(ReportFieldValidator.isRemarkValid('a'.repeat(MAX_REMARK_LENGTH + 1))).assertFalse();
    });

    it('validator_should_check_fault_time', 0, () => {
      expect(ReportFieldValidator.isFaultTimeValid('20260101120000')).assertTrue();
      expect(ReportFieldValidator.isFaultTimeValid('20260101')).assertFalse();
      expect(ReportFieldValidator.isFaultTimeValid('')).assertFalse();
      expect(FAULT_TIME_LENGTH).assertEqual(14);
    });

    it('validator_should_check_catalogs', 0, () => {
      expect(ReportFieldValidator.isTypeKnown(issueTypeList[0])).assertTrue();
      expect(ReportFieldValidator.isTypeKnown('unknown')).assertFalse();
      expect(ReportFieldValidator.isProbabilityKnown(probabilityList[0])).assertTrue();
      expect(ReportFieldValidator.isProbabilityKnown('unknown')).assertFalse();
      expect(ReportFieldValidator.isStatusKnown(statusList[0])).assertTrue();
      expect(ReportFieldValidator.isStatusKnown('unknown')).assertFalse();
    });

    it('checker_should_store_fields', 0, () => {
      const checker = new ReportConsistencyChecker();
      expect(checker.set('issueId', 'ISSUE-1001', true)).assertTrue();
      expect(checker.set('', 'x', true)).assertFalse();
      expect(checker.get('issueId')).assertEqual('ISSUE-1001');
      expect(checker.get('missing')).assertEqual('');
      expect(checker.size()).assertEqual(1);
      checker.clear();
      expect(checker.size()).assertEqual(0);
    });

    it('checker_should_report_missing_required', 0, () => {
      const checker = ReportFactory.incomplete();
      const missing = checker.missingRequired();
      expect(missing.length).assertEqual(REQUIRED_FIELDS.length);
      expect(missing.includes('description')).assertTrue();
      expect(missing.includes('faultTime')).assertTrue();
      expect(checker.isComplete()).assertFalse();
    });

    it('checker_should_accept_complete_report', 0, () => {
      const checker = ReportFactory.complete();
      expect(checker.isComplete()).assertTrue();
      expect(checker.missingRequired().length).assertEqual(0);
      expect(checker.invalidValues().length).assertEqual(0);
      expect(checker.unknownCatalogs().length).assertEqual(0);
      expect(checker.isConsistent()).assertTrue();
    });

    it('checker_should_detect_invalid_values', 0, () => {
      const checker = ReportFactory.complete();
      checker.set('description', '', true);
      checker.set('remark', 'a'.repeat(MAX_REMARK_LENGTH + 1), false);
      checker.set('faultTime', 'bad', true);
      const invalid = checker.invalidValues();
      expect(invalid.length).assertEqual(3);
      expect(invalid.includes('description')).assertTrue();
      expect(invalid.includes('remark')).assertTrue();
      expect(invalid.includes('faultTime')).assertTrue();
      expect(checker.isConsistent()).assertFalse();
    });

    it('checker_should_detect_unknown_catalogs', 0, () => {
      const checker = ReportFactory.complete();
      checker.set('type', 'unknown', true);
      checker.set('probability', 'unknown', false);
      checker.set('status', 'unknown', true);
      const unknown = checker.unknownCatalogs();
      expect(unknown.length).assertEqual(3);
      expect(unknown.includes('type')).assertTrue();
      expect(unknown.includes('probability')).assertTrue();
      expect(unknown.includes('status')).assertTrue();
    });

    it('checker_should_ignore_empty_optional_catalogs', 0, () => {
      const checker = ReportFactory.complete();
      checker.set('probability', '', false);
      expect(checker.unknownCatalogs().length).assertEqual(0);
      expect(checker.isConsistent()).assertTrue();
    });

    it('summary_should_aggregate_checks', 0, () => {
      const summary = new ReportValidationSummary();
      summary.check('complete', true);
      summary.check('catalogs', true);
      expect(summary.count()).assertEqual(2);
      expect(summary.isPassed()).assertTrue();
      expect(summary.summary()).assertEqual('consistent');
      summary.check('values', false);
      expect(summary.isPassed()).assertFalse();
      expect(summary.summary()).assertEqual('inconsistent');
      expect(summary.failures()).assertDeepEquals(['values']);
      summary.reset();
      expect(summary.count()).assertEqual(0);
    });

    it('report_flow_should_validate_submission', 0, () => {
      const checker = ReportFactory.complete();
      const summary = new ReportValidationSummary();
      summary.check('complete', checker.isComplete());
      summary.check('values', checker.invalidValues().length === 0);
      summary.check('catalogs', checker.unknownCatalogs().length === 0);
      summary.check('consistent', checker.isConsistent());
      expect(summary.isPassed()).assertTrue();
      expect(checker.get('issueId')).assertEqual('ISSUE-1001');
      expect(ReportFactory.requiredFieldCount()).assertEqual(5);
    });

    it('report_flow_should_block_incomplete_submission', 0, () => {
      const checker = ReportFactory.incomplete();
      const summary = new ReportValidationSummary();
      summary.check('complete', checker.isComplete());
      summary.check('values', checker.invalidValues().length === 0);
      expect(summary.isPassed()).assertFalse();
      expect(summary.failures().length).assertEqual(2);
      expect(checker.missingRequired().length).assertEqual(5);
      expect(checker.isConsistent()).assertFalse();
    });

    it('report_flow_should_recover_after_fix', 0, () => {
      const checker = ReportFactory.incomplete();
      expect(checker.isConsistent()).assertFalse();
      checker.set('issueId', 'ISSUE-2002', true);
      checker.set('description', 'fixed description', true);
      checker.set('status', statusList[0], true);
      checker.set('type', issueTypeList[1], true);
      checker.set('faultTime', '20260301120000', true);
      expect(checker.isComplete()).assertTrue();
      expect(checker.isConsistent()).assertTrue();
      expect(checker.missingRequired().length).assertEqual(0);
    });

    it('report_constants_should_be_stable', 0, () => {
      expect(REQUIRED_FIELDS.length).assertEqual(5);
      expect(MAX_DESCRIPTION_LENGTH).assertEqual(1024);
      expect(MAX_REMARK_LENGTH).assertEqual(200);
      expect(FAULT_TIME_LENGTH).assertEqual(14);
      expect(issueTypeList.length).assertEqual(4);
      expect(statusList.length).assertEqual(9);
    });
  });
}

