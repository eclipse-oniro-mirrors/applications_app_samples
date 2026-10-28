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

const MAX_DESCRIPTION: number = 1024;

const MAX_ATTACHMENT_BYTES: number = 100 * 1024 * 1024;

const MAX_ATTACHMENTS: number = 4;

const FAULT_TIME_LENGTH: number = 14;

const MAX_FILE_NAME: number = 128;

const ALLOWED_EXTENSIONS: string[] = ['png', 'jpg', 'jpeg', 'mp4', 'mp3', 'log', 'tar', 'zip'];

interface ValidationIssue {
  field: string;
  code: string;
}

interface ValidationStep {
  name: string;
  critical: boolean;
  validate: () => boolean;
}

interface MatrixCase {
  name: string;
  expected: boolean;
  validate: () => boolean;
}

// Provides the validators used by the end-to-end matrix
class EndToEndValidators {
  public static isDescriptionValid(value: string): boolean {
    return value.trim().length > 0 && value.length <= MAX_DESCRIPTION;
  }

  public static isFaultTimeValid(value: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9]{14}$');
    return value.length === FAULT_TIME_LENGTH && pattern.test(value);
  }

  public static isAttachmentCountValid(count: number): boolean {
    return count >= 0 && count <= MAX_ATTACHMENTS;
  }

  public static isAttachmentSizeValid(sizeBytes: number): boolean {
    return sizeBytes >= 0 && sizeBytes <= MAX_ATTACHMENT_BYTES;
  }

  public static extensionOf(fileName: string): string {
    const index = fileName.lastIndexOf('.');
    return index < 0 || index === fileName.length - 1 ? '' : fileName.substring(index + 1).toLowerCase();
  }

  public static isFileNameValid(fileName: string): boolean {
    return fileName.length > 0 && fileName.length <= MAX_FILE_NAME &&
      fileName.indexOf('/') < 0 && fileName.indexOf('\\') < 0 && fileName.indexOf('..') < 0;
  }

  public static isAttachmentValid(fileName: string, sizeBytes: number): boolean {
    return EndToEndValidators.isFileNameValid(fileName) &&
      ALLOWED_EXTENSIONS.includes(EndToEndValidators.extensionOf(fileName)) &&
      EndToEndValidators.isAttachmentSizeValid(sizeBytes);
  }

  public static isIssueIdValid(issueId: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_-]{6,64}$');
    return pattern.test(issueId);
  }

  public static isPhoneValid(phone: string): boolean {
    if (phone.length === 0) {
      return true;
    }
    const pattern: RegExp = new RegExp('^[0-9]{6,15}$');
    return pattern.test(phone);
  }

  public static isProbabilityId(id: string): boolean {
    return id === '0' || id === '1' || id === '2' || id === '3';
  }

  public static isConfigVersionValid(version: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9]+(\\.[0-9]+)*$');
    return pattern.test(version);
  }
}

// Executes ordered validation steps and aggregates issues
class ValidationPipeline {
  private steps: ValidationStep[] = [];
  private executed: string[] = [];
  private issues: ValidationIssue[] = [];

  public add(name: string, validate: () => boolean, critical: boolean = true): boolean {
    if (name.length === 0 || this.has(name)) {
      return false;
    }
    this.steps.push({ name: name, critical: critical, validate: validate });
    return true;
  }

  public has(name: string): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].name === name) {
        return true;
      }
    }
    return false;
  }

  public run(): boolean {
    this.executed = [];
    this.issues = [];
    for (let i = 0; i < this.steps.length; i++) {
      const step = this.steps[i];
      this.executed.push(step.name);
      const passed = step.validate();
      if (!passed) {
        this.issues.push({ field: step.name, code: 'failed' });
        if (step.critical) {
          return false;
        }
      }
    }
    return this.issues.length === 0;
  }

  public getExecuted(): string[] {
    return [...this.executed];
  }

  public getIssues(): ValidationIssue[] {
    return [...this.issues];
  }

  public count(): number {
    return this.steps.length;
  }

  public clear(): void {
    this.steps = [];
    this.executed = [];
    this.issues = [];
  }
}

// Runs data-driven validation cases and reports failures
class ValidationMatrix {
  private cases: MatrixCase[] = [];
  private failureItems: string[] = [];

  public add(name: string, expected: boolean, validate: () => boolean): boolean {
    if (name.length === 0 || this.has(name)) {
      return false;
    }
    this.cases.push({ name: name, expected: expected, validate: validate });
    return true;
  }

  public has(name: string): boolean {
    return this.cases.some((testCase: MatrixCase) => testCase.name === name);
  }

  public run(): number {
    this.failureItems = [];
    for (let i = 0; i < this.cases.length; i++) {
      const actual = this.cases[i].validate();
      if (actual !== this.cases[i].expected) {
        this.failureItems.push(this.cases[i].name);
      }
    }
    return this.failureItems.length;
  }

  public count(): number {
    return this.cases.length;
  }

  public getFailures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.cases.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.cases = [];
    this.failureItems = [];
  }
}

// Summarizes end-to-end validation results
class EndToEndReport {
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
    return this.isPassed() ? 'valid' : 'invalid';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function endToEndValidationTest() {
  describe('EndToEndValidation_Test', () => {

    it('validators_should_check_description', 0, () => {
      expect(EndToEndValidators.isDescriptionValid('text')).assertTrue();
      expect(EndToEndValidators.isDescriptionValid('')).assertFalse();
      expect(EndToEndValidators.isDescriptionValid('   ')).assertFalse();
      expect(EndToEndValidators.isDescriptionValid('a'.repeat(MAX_DESCRIPTION))).assertTrue();
      expect(EndToEndValidators.isDescriptionValid('a'.repeat(MAX_DESCRIPTION + 1))).assertFalse();
    });

    it('validators_should_check_fault_time', 0, () => {
      expect(EndToEndValidators.isFaultTimeValid('20260101120000')).assertTrue();
      expect(EndToEndValidators.isFaultTimeValid('20260101')).assertFalse();
      expect(EndToEndValidators.isFaultTimeValid('2026-01-01-12')).assertFalse();
      expect(EndToEndValidators.isFaultTimeValid('')).assertFalse();
    });

    it('validators_should_check_attachment_limits', 0, () => {
      expect(EndToEndValidators.isAttachmentCountValid(0)).assertTrue();
      expect(EndToEndValidators.isAttachmentCountValid(MAX_ATTACHMENTS)).assertTrue();
      expect(EndToEndValidators.isAttachmentCountValid(MAX_ATTACHMENTS + 1)).assertFalse();
      expect(EndToEndValidators.isAttachmentSizeValid(MAX_ATTACHMENT_BYTES)).assertTrue();
      expect(EndToEndValidators.isAttachmentSizeValid(MAX_ATTACHMENT_BYTES + 1)).assertFalse();
      expect(EndToEndValidators.isAttachmentSizeValid(-1)).assertFalse();
    });

    it('validators_should_check_file_names', 0, () => {
      expect(EndToEndValidators.extensionOf('a.PNG')).assertEqual('png');
      expect(EndToEndValidators.extensionOf('noext')).assertEqual('');
      expect(EndToEndValidators.isFileNameValid('a.png')).assertTrue();
      expect(EndToEndValidators.isFileNameValid('dir/a.png')).assertFalse();
      expect(EndToEndValidators.isFileNameValid('../a.png')).assertFalse();
      expect(EndToEndValidators.isAttachmentValid('a.png', 1024)).assertTrue();
      expect(EndToEndValidators.isAttachmentValid('a.exe', 1024)).assertFalse();
    });

    it('validators_should_check_identifiers', 0, () => {
      expect(EndToEndValidators.isIssueIdValid('ISSUE-1001')).assertTrue();
      expect(EndToEndValidators.isIssueIdValid('bad')).assertFalse();
      expect(EndToEndValidators.isPhoneValid('')).assertTrue();
      expect(EndToEndValidators.isPhoneValid('13812345678')).assertTrue();
      expect(EndToEndValidators.isPhoneValid('abc')).assertFalse();
      expect(EndToEndValidators.isProbabilityId('3')).assertTrue();
      expect(EndToEndValidators.isProbabilityId('4')).assertFalse();
    });

    it('pipeline_should_add_steps', 0, () => {
      const pipeline = new ValidationPipeline();
      expect(pipeline.add('description', () => true)).assertTrue();
      expect(pipeline.add('description', () => true)).assertFalse();
      expect(pipeline.add('', () => true)).assertFalse();
      expect(pipeline.count()).assertEqual(1);
      expect(pipeline.has('description')).assertTrue();
    });

    it('pipeline_should_pass_all_steps', 0, () => {
      const pipeline = new ValidationPipeline();
      pipeline.add('description', () => EndToEndValidators.isDescriptionValid('ok'));
      pipeline.add('faultTime', () => EndToEndValidators.isFaultTimeValid('20260101120000'));
      pipeline.add('attachment', () => EndToEndValidators.isAttachmentValid('a.png', 1));
      expect(pipeline.run()).assertTrue();
      expect(pipeline.getExecuted().length).assertEqual(3);
      expect(pipeline.getIssues().length).assertEqual(0);
    });

    it('pipeline_should_stop_on_critical_failure', 0, () => {
      const pipeline = new ValidationPipeline();
      pipeline.add('description', () => false, true);
      pipeline.add('later', () => true, true);
      expect(pipeline.run()).assertFalse();
      expect(pipeline.getExecuted()).assertDeepEquals(['description']);
      expect(pipeline.getIssues().length).assertEqual(1);
      expect(pipeline.getIssues()[0].field).assertEqual('description');
    });

    it('pipeline_should_continue_after_optional_failure', 0, () => {
      const pipeline = new ValidationPipeline();
      pipeline.add('optional', () => false, false);
      pipeline.add('required', () => true, true);
      expect(pipeline.run()).assertFalse();
      expect(pipeline.getExecuted().length).assertEqual(2);
      expect(pipeline.getIssues().length).assertEqual(1);
      expect(pipeline.getIssues()[0].code).assertEqual('failed');
    });

    it('matrix_should_run_cases', 0, () => {
      const matrix = new ValidationMatrix();
      expect(matrix.add('desc-ok', true, () => EndToEndValidators.isDescriptionValid('ok'))).assertTrue();
      expect(matrix.add('desc-ok', true, () => true)).assertFalse();
      expect(matrix.add('', true, () => true)).assertFalse();
      matrix.add('desc-empty', false, () => EndToEndValidators.isDescriptionValid(''));
      expect(matrix.count()).assertEqual(2);
      expect(matrix.run()).assertEqual(0);
      expect(matrix.isPassed()).assertTrue();
    });

    it('matrix_should_detect_mismatches', 0, () => {
      const matrix = new ValidationMatrix();
      matrix.add('time-bad', true, () => EndToEndValidators.isFaultTimeValid('bad'));
      matrix.add('file-good', true, () => EndToEndValidators.isAttachmentValid('a.png', 1));
      matrix.add('count-bad', false, () => EndToEndValidators.isAttachmentCountValid(9));
      expect(matrix.run()).assertEqual(1);
      expect(matrix.getFailures()).assertDeepEquals(['time-bad']);
      expect(matrix.isPassed()).assertFalse();
      matrix.reset();
      expect(matrix.count()).assertEqual(0);
      expect(matrix.isPassed()).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new EndToEndReport();
      report.check('description', true);
      report.check('faultTime', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('valid');
      report.check('attachment', false);
      expect(report.summary()).assertEqual('invalid');
      expect(report.failures()).assertDeepEquals(['attachment']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('flow_should_validate_full_submission', 0, () => {
      const pipeline = new ValidationPipeline();
      const report = new EndToEndReport();
      pipeline.add('description', () => EndToEndValidators.isDescriptionValid('issue text'));
      pipeline.add('faultTime', () => EndToEndValidators.isFaultTimeValid('20260101120000'));
      pipeline.add('attachment', () => EndToEndValidators.isAttachmentValid('log.tar', 2048));
      const passed = pipeline.run();
      report.check('pipeline', passed);
      report.check('noIssues', pipeline.getIssues().length === 0);
      expect(report.isPassed()).assertTrue();
      expect(pipeline.getExecuted()).assertDeepEquals(['description', 'faultTime', 'attachment']);
    });

    it('flow_should_block_invalid_submission', 0, () => {
      const pipeline = new ValidationPipeline();
      const report = new EndToEndReport();
      pipeline.add('description', () => EndToEndValidators.isDescriptionValid(''));
      pipeline.add('faultTime', () => EndToEndValidators.isFaultTimeValid('bad'));
      const passed = pipeline.run();
      report.check('pipeline', passed);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['pipeline']);
      expect(pipeline.getIssues()[0].field).assertEqual('description');
    });

    it('flow_should_validate_configuration', 0, () => {
      expect(EndToEndValidators.isConfigVersionValid('1.0.0')).assertTrue();
      expect(EndToEndValidators.isConfigVersionValid('1.0.x')).assertFalse();
      expect(EndToEndValidators.isConfigVersionValid('')).assertFalse();
      expect(EndToEndValidators.isConfigVersionValid('2')).assertTrue();
      const matrix = new ValidationMatrix();
      matrix.add('version-ok', true, () => EndToEndValidators.isConfigVersionValid('1.2.3'));
      matrix.add('version-bad', false, () => EndToEndValidators.isConfigVersionValid('x'));
      expect(matrix.run()).assertEqual(0);
    });

    it('flow_should_validate_media_selection', 0, () => {
      const validFiles: string[] = ['a.png', 'b.jpg', 'c.mp4', 'd.log'];
      for (let i = 0; i < validFiles.length; i++) {
        expect(EndToEndValidators.isAttachmentValid(validFiles[i], 1024)).assertTrue();
      }
      expect(EndToEndValidators.isAttachmentValid('e.dmg', 1024)).assertFalse();
      expect(EndToEndValidators.isAttachmentValid('f.log', MAX_ATTACHMENT_BYTES + 1)).assertFalse();
      expect(EndToEndValidators.isAttachmentCountValid(validFiles.length)).assertTrue();
      expect(validFiles.length).assertEqual(MAX_ATTACHMENTS);
    });

    it('flow_should_validate_phone_and_probability', 0, () => {
      expect(EndToEndValidators.isPhoneValid('138-1234-5678')).assertFalse();
      expect(EndToEndValidators.isPhoneValid('13812345678')).assertTrue();
      expect(EndToEndValidators.isProbabilityId('0')).assertTrue();
      for (let i = 0; i < MAX_ATTACHMENTS; i++) {
        expect(EndToEndValidators.isProbabilityId(`${i}`)).assertTrue();
      }
      expect(EndToEndValidators.isProbabilityId('9')).assertFalse();
    });

    it('flow_should_validate_paths_and_ids', 0, () => {
      expect(EndToEndValidators.isFileNameValid('issue.log')).assertTrue();
      expect(EndToEndValidators.isFileNameValid('a'.repeat(MAX_FILE_NAME + 1))).assertFalse();
      expect(EndToEndValidators.isIssueIdValid('draft-1001')).assertTrue();
      expect(EndToEndValidators.isIssueIdValid('draft 1001')).assertFalse();
      expect(EndToEndValidators.extensionOf('archive.tar')).assertEqual('tar');
    });

    it('e2e_constants_should_be_stable', 0, () => {
      expect(MAX_DESCRIPTION).assertEqual(1024);
      expect(MAX_ATTACHMENT_BYTES).assertEqual(104857600);
      expect(MAX_ATTACHMENTS).assertEqual(4);
      expect(FAULT_TIME_LENGTH).assertEqual(14);
      expect(MAX_FILE_NAME).assertEqual(128);
      expect(ALLOWED_EXTENSIONS.length).assertEqual(8);
    });
  });
}


