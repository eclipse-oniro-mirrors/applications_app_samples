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

const OP_REPORT: string = 'report';

const OP_UPLOAD: string = 'upload';

const OP_LIST: string = 'list';

const OP_DETAIL: string = 'detail';

const REPORT_LIMIT: number = 64 * 1024;

const UPLOAD_LIMIT: number = 100 * 1024 * 1024;

const LIST_LIMIT: number = 8 * 1024;

const DETAIL_LIMIT: number = 16 * 1024;

const MAX_ATTACHMENTS: number = 4;

interface PayloadMetrics {
  operation: string;
  bytes: number;
  attachmentCount: number;
}

// Validates payload sizes per operation
class PayloadSizeValidator {
  public static isOperationKnown(operation: string): boolean {
    return operation === OP_REPORT || operation === OP_UPLOAD ||
      operation === OP_LIST || operation === OP_DETAIL;
  }

  public static limitFor(operation: string): number {
    if (operation === OP_REPORT) {
      return REPORT_LIMIT;
    }
    if (operation === OP_UPLOAD) {
      return UPLOAD_LIMIT;
    }
    if (operation === OP_LIST) {
      return LIST_LIMIT;
    }
    if (operation === OP_DETAIL) {
      return DETAIL_LIMIT;
    }
    return 0;
  }

  public static isSizeValid(operation: string, bytes: number): boolean {
    const limit = PayloadSizeValidator.limitFor(operation);
    return limit > 0 && bytes >= 0 && bytes <= limit;
  }

  public static isAttachmentCountValid(count: number): boolean {
    return count >= 0 && count <= MAX_ATTACHMENTS;
  }

  public static validate(metrics: PayloadMetrics): string[] {
    const issues: string[] = [];
    if (!PayloadSizeValidator.isOperationKnown(metrics.operation)) {
      issues.push('operation');
    } else if (!PayloadSizeValidator.isSizeValid(metrics.operation, metrics.bytes)) {
      issues.push('size');
    }
    if (!PayloadSizeValidator.isAttachmentCountValid(metrics.attachmentCount)) {
      issues.push('attachments');
    }
    return issues;
  }

  public static usagePercent(operation: string, bytes: number): number {
    const limit = PayloadSizeValidator.limitFor(operation);
    if (limit <= 0 || bytes < 0) {
      return 0;
    }
    const percent = bytes * 100 / limit;
    return percent > 100 ? 100 : percent;
  }

  public static isNearLimit(operation: string, bytes: number): boolean {
    return PayloadSizeValidator.usagePercent(operation, bytes) >= 80;
  }

  public static remainingBytes(operation: string, bytes: number): number {
    const limit = PayloadSizeValidator.limitFor(operation);
    const remaining = limit - bytes;
    return remaining < 0 ? 0 : remaining;
  }
}

// Aggregates payload checks
class PayloadReport {
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

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function payloadSizeValidationTest() {
  describe('PayloadSizeValidation_Test', () => {

    it('validator_should_recognize_operations', 0, () => {
      expect(PayloadSizeValidator.isOperationKnown(OP_REPORT)).assertTrue();
      expect(PayloadSizeValidator.isOperationKnown(OP_UPLOAD)).assertTrue();
      expect(PayloadSizeValidator.isOperationKnown(OP_LIST)).assertTrue();
      expect(PayloadSizeValidator.isOperationKnown(OP_DETAIL)).assertTrue();
      expect(PayloadSizeValidator.isOperationKnown('unknown')).assertFalse();
      expect(PayloadSizeValidator.isOperationKnown('')).assertFalse();
    });

    it('validator_should_expose_limits', 0, () => {
      expect(PayloadSizeValidator.limitFor(OP_REPORT)).assertEqual(REPORT_LIMIT);
      expect(PayloadSizeValidator.limitFor(OP_UPLOAD)).assertEqual(UPLOAD_LIMIT);
      expect(PayloadSizeValidator.limitFor(OP_LIST)).assertEqual(LIST_LIMIT);
      expect(PayloadSizeValidator.limitFor(OP_DETAIL)).assertEqual(DETAIL_LIMIT);
      expect(PayloadSizeValidator.limitFor('unknown')).assertEqual(0);
    });

    it('validator_should_check_sizes', 0, () => {
      expect(PayloadSizeValidator.isSizeValid(OP_REPORT, 0)).assertTrue();
      expect(PayloadSizeValidator.isSizeValid(OP_REPORT, REPORT_LIMIT)).assertTrue();
      expect(PayloadSizeValidator.isSizeValid(OP_REPORT, REPORT_LIMIT + 1)).assertFalse();
      expect(PayloadSizeValidator.isSizeValid(OP_REPORT, -1)).assertFalse();
      expect(PayloadSizeValidator.isSizeValid('unknown', 1)).assertFalse();
    });

    it('validator_should_check_attachment_count', 0, () => {
      expect(PayloadSizeValidator.isAttachmentCountValid(0)).assertTrue();
      expect(PayloadSizeValidator.isAttachmentCountValid(MAX_ATTACHMENTS)).assertTrue();
      expect(PayloadSizeValidator.isAttachmentCountValid(MAX_ATTACHMENTS + 1)).assertFalse();
      expect(PayloadSizeValidator.isAttachmentCountValid(-1)).assertFalse();
    });

    it('validator_should_report_issues', 0, () => {
      const issues = PayloadSizeValidator.validate({
        operation: OP_REPORT, bytes: REPORT_LIMIT + 1, attachmentCount: 5
      });
      expect(issues.length).assertEqual(2);
      expect(issues.includes('size')).assertTrue();
      expect(issues.includes('attachments')).assertTrue();
      expect(PayloadSizeValidator.validate({
        operation: OP_REPORT, bytes: 1024, attachmentCount: 1
      }).length).assertEqual(0);
    });

    it('validator_should_report_unknown_operation', 0, () => {
      const issues = PayloadSizeValidator.validate({
        operation: 'unknown', bytes: 10, attachmentCount: 0
      });
      expect(issues).assertDeepEquals(['operation']);
    });

    it('validator_should_compute_usage', 0, () => {
      expect(PayloadSizeValidator.usagePercent(OP_REPORT, 0)).assertEqual(0);
      expect(PayloadSizeValidator.usagePercent(OP_REPORT, REPORT_LIMIT / 2)).assertEqual(50);
      expect(PayloadSizeValidator.usagePercent(OP_REPORT, REPORT_LIMIT)).assertEqual(100);
      expect(PayloadSizeValidator.usagePercent(OP_REPORT, REPORT_LIMIT * 2)).assertEqual(100);
      expect(PayloadSizeValidator.usagePercent('unknown', 10)).assertEqual(0);
    });

    it('validator_should_detect_near_limit', 0, () => {
      expect(PayloadSizeValidator.isNearLimit(OP_LIST, LIST_LIMIT / 2)).assertFalse();
      expect(PayloadSizeValidator.isNearLimit(OP_LIST, LIST_LIMIT * 8 / 10)).assertTrue();
      expect(PayloadSizeValidator.isNearLimit(OP_LIST, LIST_LIMIT)).assertTrue();
      expect(PayloadSizeValidator.isNearLimit(OP_LIST, LIST_LIMIT + 1)).assertTrue();
    });

    it('validator_should_compute_remaining', 0, () => {
      expect(PayloadSizeValidator.remainingBytes(OP_DETAIL, 0)).assertEqual(DETAIL_LIMIT);
      expect(PayloadSizeValidator.remainingBytes(OP_DETAIL, DETAIL_LIMIT)).assertEqual(0);
      expect(PayloadSizeValidator.remainingBytes(OP_DETAIL, DETAIL_LIMIT + 1)).assertEqual(0);
      expect(PayloadSizeValidator.remainingBytes(OP_DETAIL, 1024)).assertEqual(DETAIL_LIMIT - 1024);
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new PayloadReport();
      report.check('size', true);
      report.check('attachments', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('nearLimit', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['nearLimit']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('payload_flow_should_gate_upload', 0, () => {
      const report = new PayloadReport();
      const metrics: PayloadMetrics = {
        operation: OP_UPLOAD, bytes: UPLOAD_LIMIT, attachmentCount: MAX_ATTACHMENTS
      };
      report.check('valid', PayloadSizeValidator.validate(metrics).length === 0);
      report.check('usage', PayloadSizeValidator.usagePercent(OP_UPLOAD, UPLOAD_LIMIT) === 100);
      report.check('near', PayloadSizeValidator.isNearLimit(OP_UPLOAD, UPLOAD_LIMIT));
      expect(report.isPassed()).assertTrue();
      metrics.bytes = UPLOAD_LIMIT + 1;
      expect(PayloadSizeValidator.validate(metrics)).assertDeepEquals(['size']);
    });

    it('payload_flow_should_warn_near_limit', 0, () => {
      const report = new PayloadReport();
      const bytes = Math.ceil(REPORT_LIMIT * 0.9);
      report.check('near', PayloadSizeValidator.isNearLimit(OP_REPORT, bytes));
      report.check('valid', PayloadSizeValidator.isSizeValid(OP_REPORT, bytes));
      report.check('remaining', PayloadSizeValidator.remainingBytes(OP_REPORT, bytes) < REPORT_LIMIT);
      expect(report.isPassed()).assertTrue();
      expect(PayloadSizeValidator.usagePercent(OP_REPORT, bytes)).assertLargerOrEqual(90);
    });

    it('payload_constants_should_be_stable', 0, () => {
      expect(REPORT_LIMIT).assertEqual(65536);
      expect(UPLOAD_LIMIT).assertEqual(104857600);
      expect(LIST_LIMIT).assertEqual(8192);
      expect(DETAIL_LIMIT).assertEqual(16384);
      expect(MAX_ATTACHMENTS).assertEqual(4);
    });
  });
}

