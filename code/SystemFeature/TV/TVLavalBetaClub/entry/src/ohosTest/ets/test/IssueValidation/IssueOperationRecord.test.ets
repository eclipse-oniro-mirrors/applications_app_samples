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
import { statusList } from '../../../../main/ets/pages/IssueReporter/models/IssueDetailInfo';

const ACTION_CREATE: string = 'create';

const ACTION_SUBMIT: string = 'submit';

const ACTION_RESUBMIT: string = 'resubmit';

const ACTION_VIEW: string = 'view';

const ACTION_DELETE: string = 'delete';

const ALLOWED_ACTIONS: string[] = [ACTION_CREATE, ACTION_SUBMIT, ACTION_RESUBMIT, ACTION_VIEW];

const MAX_RECORDS: number = 200;

const PAGE_SIZE: number = 20;

interface OperationRecord {
  issueId: string;
  action: string;
  operator: string;
  detail: string;
  timestamp: number;
}

// Validates operation actions and identifiers
class OperationValidator {
  public static isAllowedAction(action: string): boolean {
    return ALLOWED_ACTIONS.includes(action);
  }

  public static isIssueIdValid(issueId: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_-]{6,64}$');
    return pattern.test(issueId);
  }

  public static isRecordValid(record: OperationRecord): boolean {
    return OperationValidator.isAllowedAction(record.action) &&
      OperationValidator.isIssueIdValid(record.issueId) &&
      record.operator.length > 0 && record.timestamp > 0;
  }

  public static isDestructive(action: string): boolean {
    return action === ACTION_DELETE;
  }
}

// Maintains an ordered, bounded timeline of issue operations
class OperationTimeline {
  private records: OperationRecord[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public append(record: OperationRecord): boolean {
    if (!OperationValidator.isRecordValid(record)) {
      return false;
    }
    if (this.records.length >= this.capacity) {
      this.records.shift();
    }
    this.records.push({
      issueId: record.issueId,
      action: record.action,
      operator: record.operator,
      detail: record.detail,
      timestamp: record.timestamp
    });
    return true;
  }

  public size(): number {
    return this.records.length;
  }

  public all(): OperationRecord[] {
    return [...this.records];
  }

  public forIssue(issueId: string): OperationRecord[] {
    return this.records.filter((record: OperationRecord) => record.issueId === issueId);
  }

  public byAction(action: string): OperationRecord[] {
    return this.records.filter((record: OperationRecord) => record.action === action);
  }

  public latest(): OperationRecord | undefined {
    return this.records.length === 0 ? undefined : this.records[this.records.length - 1];
  }

  public page(pageIndex: number, pageSize: number): OperationRecord[] {
    if (pageIndex < 0 || pageSize <= 0) {
      return [];
    }
    const start = pageIndex * pageSize;
    if (start >= this.records.length) {
      return [];
    }
    return this.records.slice(start, start + pageSize);
  }

  public containsAction(issueId: string, action: string): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].issueId === issueId && this.records[i].action === action) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.records = [];
  }
}

// Aggregates operation statistics for audit
class OperationAudit {
  private counts: Map<string, number> = new Map<string, number>();
  private rejected: number = 0;

  public record(action: string): void {
    const current = this.counts.get(action) ?? 0;
    this.counts.set(action, current + 1);
  }

  public reject(): void {
    this.rejected++;
  }

  public countOf(action: string): number {
    const value = this.counts.get(action);
    return value === undefined ? 0 : value;
  }

  public total(): number {
    let total: number = 0;
    this.counts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public distinctActions(): number {
    return this.counts.size;
  }

  public reset(): void {
    this.counts = new Map<string, number>();
    this.rejected = 0;
  }
}

// Produces a human-readable timeline entry keyed by status list
class OperationFormatter {
  public static statusLabel(index: number): string {
    return index >= 0 && index < statusList.length ? statusList[index] : '';
  }

  public static format(record: OperationRecord): string {
    return `${record.timestamp}:${record.issueId}:${record.action}`;
  }

  public static formatAll(records: OperationRecord[]): string[] {
    const lines: string[] = [];
    for (let i = 0; i < records.length; i++) {
      lines.push(OperationFormatter.format(records[i]));
    }
    return lines;
  }

  public static isChronological(records: OperationRecord[]): boolean {
    for (let i = 1; i < records.length; i++) {
      if (records[i].timestamp < records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }
}

export default function issueOperationRecordTest() {
  describe('IssueOperationRecord_Test', () => {

    it('validator_should_accept_allowed_actions', 0, () => {
      expect(OperationValidator.isAllowedAction(ACTION_CREATE)).assertTrue();
      expect(OperationValidator.isAllowedAction(ACTION_SUBMIT)).assertTrue();
      expect(OperationValidator.isAllowedAction(ACTION_RESUBMIT)).assertTrue();
      expect(OperationValidator.isAllowedAction(ACTION_VIEW)).assertTrue();
      expect(OperationValidator.isAllowedAction(ACTION_DELETE)).assertFalse();
      expect(OperationValidator.isAllowedAction('unknown')).assertFalse();
      expect(ALLOWED_ACTIONS.length).assertEqual(4);
    });

    it('validator_should_check_issue_ids', 0, () => {
      expect(OperationValidator.isIssueIdValid('ISSUE-2026')).assertTrue();
      expect(OperationValidator.isIssueIdValid('draft_01')).assertTrue();
      expect(OperationValidator.isIssueIdValid('short')).assertFalse();
      expect(OperationValidator.isIssueIdValid('has space')).assertFalse();
      expect(OperationValidator.isIssueIdValid('')).assertFalse();
    });

    it('validator_should_reject_invalid_records', 0, () => {
      expect(OperationValidator.isRecordValid({
        issueId: 'ISSUE', action: ACTION_CREATE, operator: 'dev', detail: '', timestamp: 1
      })).assertFalse();
      expect(OperationValidator.isRecordValid({
        issueId: 'ISSUE-2026', action: ACTION_CREATE, operator: '', detail: '', timestamp: 1
      })).assertFalse();
      expect(OperationValidator.isRecordValid({
        issueId: 'ISSUE-2026', action: ACTION_CREATE, operator: 'dev', detail: '', timestamp: 0
      })).assertFalse();
      expect(OperationValidator.isRecordValid({
        issueId: 'ISSUE-2026', action: ACTION_DELETE, operator: 'dev', detail: '', timestamp: 1
      })).assertFalse();
    });

    it('timeline_should_append_valid_records', 0, () => {
      const timeline = new OperationTimeline(MAX_RECORDS);
      expect(timeline.append({
        issueId: 'ISSUE-1001', action: ACTION_CREATE, operator: 'dev', detail: 'created', timestamp: 100
      })).assertTrue();
      expect(timeline.append({
        issueId: 'ISSUE-1001', action: ACTION_SUBMIT, operator: 'dev', detail: 'submitted', timestamp: 200
      })).assertTrue();
      expect(timeline.size()).assertEqual(2);
      expect(timeline.forIssue('ISSUE-1001').length).assertEqual(2);
      expect(timeline.forIssue('ISSUE-9').length).assertEqual(0);
      expect((timeline.latest() as OperationRecord).action).assertEqual(ACTION_SUBMIT);
    });

    it('timeline_should_reject_invalid_records', 0, () => {
      const timeline = new OperationTimeline(MAX_RECORDS);
      expect(timeline.append({
        issueId: 'bad', action: ACTION_CREATE, operator: 'dev', detail: '', timestamp: 1
      })).assertFalse();
      expect(timeline.append({
        issueId: 'ISSUE-1001', action: ACTION_DELETE, operator: 'dev', detail: '', timestamp: 1
      })).assertFalse();
      expect(timeline.size()).assertEqual(0);
      expect(timeline.latest() === undefined).assertTrue();
      expect(timeline.all().length).assertEqual(0);
    });

    it('timeline_should_filter_by_action', 0, () => {
      const timeline = new OperationTimeline(MAX_RECORDS);
      timeline.append({
        issueId: 'ISSUE-1001', action: ACTION_VIEW, operator: 'dev', detail: '', timestamp: 1
      });
      timeline.append({
        issueId: 'ISSUE-1001', action: ACTION_VIEW, operator: 'dev', detail: '', timestamp: 2
      });
      timeline.append({
        issueId: 'ISSUE-1001', action: ACTION_SUBMIT, operator: 'dev', detail: '', timestamp: 3
      });
      expect(timeline.byAction(ACTION_VIEW).length).assertEqual(2);
      expect(timeline.byAction(ACTION_SUBMIT).length).assertEqual(1);
      expect(timeline.byAction(ACTION_RESUBMIT).length).assertEqual(0);
      expect(timeline.containsAction('ISSUE-1001', ACTION_SUBMIT)).assertTrue();
      expect(timeline.containsAction('ISSUE-1001', ACTION_RESUBMIT)).assertFalse();
    });

    it('timeline_should_paginate', 0, () => {
      const timeline = new OperationTimeline(MAX_RECORDS);
      for (let i = 0; i < 45; i++) {
        timeline.append({
          issueId: 'ISSUE-2001', action: ACTION_VIEW, operator: 'dev', detail: `${i}`, timestamp: i + 1
        });
      }
      expect(timeline.size()).assertEqual(45);
      expect(timeline.page(0, PAGE_SIZE).length).assertEqual(20);
      expect(timeline.page(1, PAGE_SIZE).length).assertEqual(20);
      expect(timeline.page(2, PAGE_SIZE).length).assertEqual(5);
      expect(timeline.page(3, PAGE_SIZE).length).assertEqual(0);
      expect(timeline.page(-1, PAGE_SIZE).length).assertEqual(0);
      expect(timeline.page(0, 0).length).assertEqual(0);
    });

    it('timeline_should_evict_oldest_when_full', 0, () => {
      const timeline = new OperationTimeline(2);
      timeline.append({
        issueId: 'ISSUE-3001', action: ACTION_VIEW, operator: 'dev', detail: 'a', timestamp: 1
      });
      timeline.append({
        issueId: 'ISSUE-3001', action: ACTION_VIEW, operator: 'dev', detail: 'b', timestamp: 2
      });
      timeline.append({
        issueId: 'ISSUE-3001', action: ACTION_VIEW, operator: 'dev', detail: 'c', timestamp: 3
      });
      expect(timeline.size()).assertEqual(2);
      expect((timeline.all()[0]).detail).assertEqual('b');
      expect((timeline.latest() as OperationRecord).detail).assertEqual('c');
      timeline.clear();
      expect(timeline.size()).assertEqual(0);
    });

    it('audit_should_count_operations', 0, () => {
      const audit = new OperationAudit();
      audit.record(ACTION_CREATE);
      audit.record(ACTION_SUBMIT);
      audit.record(ACTION_SUBMIT);
      audit.reject();
      expect(audit.countOf(ACTION_SUBMIT)).assertEqual(2);
      expect(audit.countOf(ACTION_CREATE)).assertEqual(1);
      expect(audit.countOf(ACTION_DELETE)).assertEqual(0);
      expect(audit.total()).assertEqual(3);
      expect(audit.getRejected()).assertEqual(1);
      expect(audit.distinctActions()).assertEqual(2);
      audit.reset();
      expect(audit.total()).assertEqual(0);
      expect(audit.getRejected()).assertEqual(0);
    });

    it('formatter_should_render_timeline', 0, () => {
      const record: OperationRecord = {
        issueId: 'ISSUE-4001', action: ACTION_SUBMIT, operator: 'dev', detail: '', timestamp: 1000
      };
      expect(OperationFormatter.format(record)).assertEqual('1000:ISSUE-4001:submit');
      expect(OperationFormatter.formatAll([record]).length).assertEqual(1);
      expect(OperationFormatter.isChronological([record])).assertTrue();
      const newer: OperationRecord = {
        issueId: 'ISSUE-4001', action: ACTION_VIEW, operator: 'dev', detail: '', timestamp: 2000
      };
      expect(OperationFormatter.isChronological([record, newer])).assertTrue();
      expect(OperationFormatter.isChronological([newer, record])).assertFalse();
    });

    it('formatter_should_map_status_labels', 0, () => {
      expect(OperationFormatter.statusLabel(0)).assertEqual(statusList[0]);
      expect(OperationFormatter.statusLabel(8)).assertEqual(statusList[8]);
      expect(OperationFormatter.statusLabel(-1)).assertEqual('');
      expect(OperationFormatter.statusLabel(statusList.length)).assertEqual('');
      expect(statusList.length).assertEqual(9);
    });

    it('operation_flow_should_record_full_lifecycle', 0, () => {
      const timeline = new OperationTimeline(MAX_RECORDS);
      const audit = new OperationAudit();
      const steps: string[] = [ACTION_CREATE, ACTION_VIEW, ACTION_SUBMIT];
      for (let i = 0; i < steps.length; i++) {
        const appended = timeline.append({
          issueId: 'ISSUE-5001',
          action: steps[i],
          operator: 'developer',
          detail: steps[i],
          timestamp: 1000 + i
        });
        if (appended) {
          audit.record(steps[i]);
        }
      }
      expect(timeline.size()).assertEqual(3);
      expect(audit.total()).assertEqual(3);
      expect(timeline.containsAction('ISSUE-5001', ACTION_CREATE)).assertTrue();
      expect(timeline.containsAction('ISSUE-5001', ACTION_SUBMIT)).assertTrue();
      expect(OperationFormatter.isChronological(timeline.all())).assertTrue();
      expect((timeline.latest() as OperationRecord).action).assertEqual(ACTION_SUBMIT);
    });

    it('operation_constants_should_be_stable', 0, () => {
      expect(ACTION_CREATE).assertEqual('create');
      expect(ACTION_SUBMIT).assertEqual('submit');
      expect(ACTION_RESUBMIT).assertEqual('resubmit');
      expect(ACTION_VIEW).assertEqual('view');
      expect(MAX_RECORDS).assertEqual(200);
      expect(PAGE_SIZE).assertEqual(20);
    });
  });
}

