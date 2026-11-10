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

const FIELD_PHONE: string = 'phone';

const FIELD_UDID: string = 'udid';

const FIELD_DESCRIPTION: string = 'description';

const FIELD_LOG: string = 'log';

const FIELD_ATTACHMENT: string = 'attachment';

const MAX_RETENTION_DAYS: number = 180;

const MIN_CONSENT_VERSION: number = 1;

const CONSENT_GRANTED: string = 'granted';

const CONSENT_DENIED: string = 'denied';

interface PrivacyField {
  name: string;
  sensitive: boolean;
  retentionDays: number;
}

interface ConsentRecord {
  purpose: string;
  version: number;
  state: string;
}

// Defines which collected fields are sensitive and their retention
class PrivacyPolicy {
  private fields: Map<string, PrivacyField> = new Map<string, PrivacyField>();

  public define(field: PrivacyField): boolean {
    if (field.name.length === 0 || this.fields.has(field.name)) {
      return false;
    }
    if (field.retentionDays < 0 || field.retentionDays > MAX_RETENTION_DAYS) {
      return false;
    }
    this.fields.set(field.name, {
      name: field.name,
      sensitive: field.sensitive,
      retentionDays: field.retentionDays
    });
    return true;
  }

  public isSensitive(name: string): boolean {
    const field = this.fields.get(name);
    return field !== undefined && field.sensitive;
  }

  public retentionOf(name: string): number {
    const field = this.fields.get(name);
    return field === undefined ? 0 : field.retentionDays;
  }

  public isExpired(name: string, collectedAt: number, now: number): boolean {
    const retention = this.retentionOf(name);
    if (retention <= 0) {
      return true;
    }
    return now - collectedAt > retention * 86400000;
  }

  public sensitiveFields(): string[] {
    const result: string[] = [];
    this.fields.forEach((field: PrivacyField) => {
      if (field.sensitive) {
        result.push(field.name);
      }
    });
    return result;
  }

  public size(): number {
    return this.fields.size;
  }

  public clear(): void {
    this.fields = new Map<string, PrivacyField>();
  }
}

// Records user consent for data collection purposes
class ConsentRegistry {
  private records: Map<string, ConsentRecord> = new Map<string, ConsentRecord>();

  public grant(purpose: string, version: number): boolean {
    if (purpose.length === 0 || version < MIN_CONSENT_VERSION) {
      return false;
    }
    this.records.set(purpose, { purpose: purpose, version: version, state: CONSENT_GRANTED });
    return true;
  }

  public deny(purpose: string): boolean {
    if (purpose.length === 0) {
      return false;
    }
    this.records.set(purpose, {
      purpose: purpose,
      version: MIN_CONSENT_VERSION,
      state: CONSENT_DENIED
    });
    return true;
  }

  public isGranted(purpose: string): boolean {
    const record = this.records.get(purpose);
    return record !== undefined && record.state === CONSENT_GRANTED;
  }

  public isDenied(purpose: string): boolean {
    const record = this.records.get(purpose);
    return record !== undefined && record.state === CONSENT_DENIED;
  }

  public stateOf(purpose: string): string {
    const record = this.records.get(purpose);
    return record === undefined ? '' : record.state;
  }

  public versionOf(purpose: string): number {
    const record = this.records.get(purpose);
    return record === undefined ? 0 : record.version;
  }

  public grantedCount(): number {
    let count: number = 0;
    this.records.forEach((record: ConsentRecord) => {
      if (record.state === CONSENT_GRANTED) {
        count++;
      }
    });
    return count;
  }

  public revoke(purpose: string): boolean {
    return this.records.delete(purpose);
  }

  public clear(): void {
    this.records = new Map<string, ConsentRecord>();
  }
}

// Enforces consent before sensitive data leaves the device
class UploadPrivacyGate {
  private policy: PrivacyPolicy;
  private consent: ConsentRegistry;

  constructor(policy: PrivacyPolicy, consent: ConsentRegistry) {
    this.policy = policy;
    this.consent = consent;
  }

  public canCollect(field: string, purpose: string): boolean {
    if (field.length === 0 || purpose.length === 0) {
      return false;
    }
    if (!this.policy.isSensitive(field)) {
      return true;
    }
    return this.consent.isGranted(purpose);
  }

  public canUpload(fields: string[], purpose: string): boolean {
    if (fields.length === 0) {
      return false;
    }
    for (let i = 0; i < fields.length; i++) {
      if (!this.canCollect(fields[i], purpose)) {
        return false;
      }
    }
    return true;
  }

  public blockedFields(fields: string[], purpose: string): string[] {
    const blocked: string[] = [];
    for (let i = 0; i < fields.length; i++) {
      if (!this.canCollect(fields[i], purpose)) {
        blocked.push(fields[i]);
      }
    }
    return blocked;
  }

  public requiresConsent(field: string): boolean {
    return this.policy.isSensitive(field);
  }
}

// Summarizes privacy checks
class PrivacyReport {
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

export default function privacyComplianceTest() {
  describe('PrivacyCompliance_Test', () => {

    it('policy_should_define_fields', 0, () => {
      const policy = new PrivacyPolicy();
      expect(policy.define({
        name: FIELD_PHONE, sensitive: true, retentionDays: 30
      })).assertTrue();
      expect(policy.define({
        name: FIELD_PHONE, sensitive: true, retentionDays: 30
      })).assertFalse();
      expect(policy.define({
        name: '', sensitive: true, retentionDays: 30
      })).assertFalse();
      expect(policy.size()).assertEqual(1);
      expect(policy.isSensitive(FIELD_PHONE)).assertTrue();
    });

    it('policy_should_reject_invalid_retention', 0, () => {
      const policy = new PrivacyPolicy();
      expect(policy.define({
        name: FIELD_LOG, sensitive: false, retentionDays: -1
      })).assertFalse();
      expect(policy.define({
        name: FIELD_LOG, sensitive: false, retentionDays: MAX_RETENTION_DAYS + 1
      })).assertFalse();
      expect(policy.define({
        name: FIELD_LOG, sensitive: false, retentionDays: MAX_RETENTION_DAYS
      })).assertTrue();
      expect(policy.retentionOf(FIELD_LOG)).assertEqual(MAX_RETENTION_DAYS);
      expect(policy.retentionOf('missing')).assertEqual(0);
    });

    it('policy_should_list_sensitive_fields', 0, () => {
      const policy = new PrivacyPolicy();
      policy.define({ name: FIELD_PHONE, sensitive: true, retentionDays: 30 });
      policy.define({ name: FIELD_UDID, sensitive: true, retentionDays: 90 });
      policy.define({ name: FIELD_DESCRIPTION, sensitive: false, retentionDays: 180 });
      expect(policy.sensitiveFields().length).assertEqual(2);
      expect(policy.sensitiveFields().includes(FIELD_PHONE)).assertTrue();
      expect(policy.sensitiveFields().includes(FIELD_DESCRIPTION)).assertFalse();
      policy.clear();
      expect(policy.size()).assertEqual(0);
    });

    it('policy_should_check_retention_expiry', 0, () => {
      const policy = new PrivacyPolicy();
      policy.define({ name: FIELD_PHONE, sensitive: true, retentionDays: 30 });
      const day = 86400000;
      expect(policy.isExpired(FIELD_PHONE, 0, 30 * day)).assertFalse();
      expect(policy.isExpired(FIELD_PHONE, 0, 31 * day)).assertTrue();
      expect(policy.isExpired('missing', 0, 1)).assertTrue();
    });

    it('consent_should_grant_and_deny', 0, () => {
      const consent = new ConsentRegistry();
      expect(consent.grant('issueReport', 1)).assertTrue();
      expect(consent.grant('issueReport', 0)).assertFalse();
      expect(consent.grant('', 1)).assertFalse();
      expect(consent.isGranted('issueReport')).assertTrue();
      expect(consent.stateOf('issueReport')).assertEqual(CONSENT_GRANTED);
      expect(consent.grantedCount()).assertEqual(1);
      expect(consent.deny('analytics')).assertTrue();
      expect(consent.isDenied('analytics')).assertTrue();
      expect(consent.stateOf('analytics')).assertEqual(CONSENT_DENIED);
    });

    it('consent_should_revoke_and_version', 0, () => {
      const consent = new ConsentRegistry();
      consent.grant('issueReport', 2);
      expect(consent.versionOf('issueReport')).assertEqual(2);
      expect(consent.versionOf('missing')).assertEqual(0);
      expect(consent.revoke('issueReport')).assertTrue();
      expect(consent.revoke('issueReport')).assertFalse();
      expect(consent.isGranted('issueReport')).assertFalse();
      expect(consent.stateOf('missing')).assertEqual('');
      consent.clear();
      expect(consent.grantedCount()).assertEqual(0);
    });

    it('gate_should_allow_non_sensitive_fields', 0, () => {
      const policy = new PrivacyPolicy();
      const consent = new ConsentRegistry();
      policy.define({ name: FIELD_DESCRIPTION, sensitive: false, retentionDays: 180 });
      const gate = new UploadPrivacyGate(policy, consent);
      expect(gate.canCollect(FIELD_DESCRIPTION, 'issueReport')).assertTrue();
      expect(gate.requiresConsent(FIELD_DESCRIPTION)).assertFalse();
      expect(gate.canCollect('', 'issueReport')).assertFalse();
      expect(gate.canCollect(FIELD_DESCRIPTION, '')).assertFalse();
    });

    it('gate_should_block_sensitive_without_consent', 0, () => {
      const policy = new PrivacyPolicy();
      const consent = new ConsentRegistry();
      policy.define({ name: FIELD_PHONE, sensitive: true, retentionDays: 30 });
      const gate = new UploadPrivacyGate(policy, consent);
      expect(gate.canCollect(FIELD_PHONE, 'issueReport')).assertFalse();
      expect(gate.requiresConsent(FIELD_PHONE)).assertTrue();
      consent.grant('issueReport', 1);
      expect(gate.canCollect(FIELD_PHONE, 'issueReport')).assertTrue();
    });

    it('gate_should_check_upload_field_sets', 0, () => {
      const policy = new PrivacyPolicy();
      const consent = new ConsentRegistry();
      policy.define({ name: FIELD_PHONE, sensitive: true, retentionDays: 30 });
      policy.define({ name: FIELD_DESCRIPTION, sensitive: false, retentionDays: 180 });
      policy.define({ name: FIELD_LOG, sensitive: true, retentionDays: 7 });
      const gate = new UploadPrivacyGate(policy, consent);
      expect(gate.canUpload([FIELD_DESCRIPTION], 'issueReport')).assertTrue();
      expect(gate.canUpload([FIELD_DESCRIPTION, FIELD_PHONE], 'issueReport')).assertFalse();
      expect(gate.blockedFields([FIELD_DESCRIPTION, FIELD_PHONE], 'issueReport'))
        .assertDeepEquals([FIELD_PHONE]);
      consent.grant('issueReport', 1);
      expect(gate.canUpload([FIELD_DESCRIPTION, FIELD_PHONE], 'issueReport')).assertTrue();
      consent.revoke('issueReport');
      expect(gate.blockedFields([FIELD_DESCRIPTION, FIELD_LOG], 'issueReport'))
        .assertDeepEquals([FIELD_LOG]);
    });

    it('report_should_aggregate_privacy_checks', 0, () => {
      const report = new PrivacyReport();
      report.check('consent', true);
      report.check('retention', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('upload', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['upload']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('privacy_flow_should_gate_upload', 0, () => {
      const policy = new PrivacyPolicy();
      const consent = new ConsentRegistry();
      policy.define({ name: FIELD_PHONE, sensitive: true, retentionDays: 30 });
      policy.define({ name: FIELD_UDID, sensitive: true, retentionDays: 90 });
      policy.define({ name: FIELD_ATTACHMENT, sensitive: false, retentionDays: 30 });
      const gate = new UploadPrivacyGate(policy, consent);
      const fields: string[] = [FIELD_UDID, FIELD_ATTACHMENT];
      expect(gate.canUpload(fields, 'issueReport')).assertFalse();
      consent.grant('issueReport', 1);
      expect(gate.canUpload(fields, 'issueReport')).assertTrue();
      expect(policy.sensitiveFields().length).assertEqual(2);
      expect(policy.isExpired(FIELD_UDID, 0, 91 * 86400000)).assertTrue();
    });

    it('privacy_constants_should_be_stable', 0, () => {
      expect(FIELD_PHONE).assertEqual('phone');
      expect(FIELD_UDID).assertEqual('udid');
      expect(FIELD_LOG).assertEqual('log');
      expect(MAX_RETENTION_DAYS).assertEqual(180);
      expect(MIN_CONSENT_VERSION).assertEqual(1);
      expect(CONSENT_GRANTED).assertEqual('granted');
    });
  });
}

