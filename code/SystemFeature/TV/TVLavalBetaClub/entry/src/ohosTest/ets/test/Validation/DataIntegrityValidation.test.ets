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

const MAX_RECORDS: number = 64;

const MAX_PAYLOAD_LENGTH: number = 8192;

const CHECKSUM_MOD: number = 1000003;

interface DataRecord {
  id: string;
  payload: string;
  checksum: number;
  updatedAt: number;
}

// Computes and verifies record checksums
class IntegrityChecker {
  public static checksum(payload: string): number {
    let hash: number = 0;
    for (let i = 0; i < payload.length; i++) {
      hash = (hash * 31 + payload.charCodeAt(i)) % CHECKSUM_MOD;
    }
    return hash;
  }

  public static isPayloadValid(payload: string): boolean {
    return payload.length > 0 && payload.length <= MAX_PAYLOAD_LENGTH &&
      payload.indexOf('\r') < 0;
  }

  public static isRecordValid(record: DataRecord): boolean {
    return record.id.length > 0 && IntegrityChecker.isPayloadValid(record.payload) &&
      record.updatedAt >= 0 && record.checksum >= 0;
  }

  public static isIntact(record: DataRecord): boolean {
    return IntegrityChecker.isRecordValid(record) &&
      IntegrityChecker.checksum(record.payload) === record.checksum;
  }

  public static corruptRecord(record: DataRecord): DataRecord {
    return {
      id: record.id,
      payload: record.payload + '#',
      checksum: record.checksum,
      updatedAt: record.updatedAt
    };
  }
}

// Stores records and detects/repairs corruption
class IntegrityStore {
  private records: Map<string, DataRecord> = new Map<string, DataRecord>();
  private readonly capacity: number;
  private repaired: number = 0;
  private quarantined: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public put(id: string, payload: string, now: number): boolean {
    if (id.length === 0 || !IntegrityChecker.isPayloadValid(payload)) {
      return false;
    }
    if (!this.records.has(id) && this.records.size >= this.capacity) {
      return false;
    }
    this.records.set(id, {
      id: id,
      payload: payload,
      checksum: IntegrityChecker.checksum(payload),
      updatedAt: now
    });
    return true;
  }

  public get(id: string): DataRecord | undefined {
    return this.records.get(id);
  }

  public setRecord(record: DataRecord): boolean {
    if (!IntegrityChecker.isRecordValid(record)) {
      return false;
    }
    this.records.set(record.id, record);
    return true;
  }

  public corruptedIds(): string[] {
    const result: string[] = [];
    this.records.forEach((record: DataRecord) => {
      if (!IntegrityChecker.isIntact(record)) {
        result.push(record.id);
      }
    });
    return result;
  }

  public isHealthy(): boolean {
    return this.corruptedIds().length === 0;
  }

  public repair(id: string): boolean {
    const record = this.records.get(id);
    if (record === undefined) {
      return false;
    }
    const repairedRecord: DataRecord = {
      id: record.id,
      payload: record.payload,
      checksum: IntegrityChecker.checksum(record.payload),
      updatedAt: record.updatedAt
    };
    if (IntegrityChecker.isIntact(repairedRecord)) {
      this.records.set(id, repairedRecord);
      this.repaired++;
      return true;
    }
    return false;
  }

  public quarantine(id: string): boolean {
    if (!this.records.has(id)) {
      return false;
    }
    this.records.delete(id);
    this.quarantined++;
    return true;
  }

  public repairAll(): number {
    const corrupted = this.corruptedIds();
    let count: number = 0;
    for (let i = 0; i < corrupted.length; i++) {
      if (this.repair(corrupted[i])) {
        count++;
      }
    }
    return count;
  }

  public getRepaired(): number {
    return this.repaired;
  }

  public getQuarantined(): number {
    return this.quarantined;
  }

  public size(): number {
    return this.records.size;
  }

  public clear(): void {
    this.records = new Map<string, DataRecord>();
    this.repaired = 0;
    this.quarantined = 0;
  }
}

// Aggregates integrity checks for reports
class IntegrityReport {
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

export default function dataIntegrityValidationTest() {
  describe('DataIntegrityValidation_Test', () => {

    it('checker_should_compute_checksum', 0, () => {
      const checksum = IntegrityChecker.checksum('issue-payload');
      expect(checksum).assertLargerOrEqual(0);
      expect(IntegrityChecker.checksum('issue-payload')).assertEqual(checksum);
      expect(IntegrityChecker.checksum('issue-payload!') === checksum).assertFalse();
      expect(IntegrityChecker.checksum('')).assertEqual(0);
    });

    it('checker_should_validate_payload', 0, () => {
      expect(IntegrityChecker.isPayloadValid('data')).assertTrue();
      expect(IntegrityChecker.isPayloadValid('')).assertFalse();
      expect(IntegrityChecker.isPayloadValid('a'.repeat(MAX_PAYLOAD_LENGTH))).assertTrue();
      expect(IntegrityChecker.isPayloadValid('a'.repeat(MAX_PAYLOAD_LENGTH + 1))).assertFalse();
      expect(IntegrityChecker.isPayloadValid('bad\rpayload')).assertFalse();
    });

    it('checker_should_validate_records', 0, () => {
      const record: DataRecord = {
        id: 'R-1', payload: 'data', checksum: IntegrityChecker.checksum('data'), updatedAt: 100
      };
      expect(IntegrityChecker.isRecordValid(record)).assertTrue();
      expect(IntegrityChecker.isIntact(record)).assertTrue();
      record.id = '';
      expect(IntegrityChecker.isRecordValid(record)).assertFalse();
    });

    it('checker_should_detect_corruption', 0, () => {
      const record: DataRecord = {
        id: 'R-1', payload: 'data', checksum: IntegrityChecker.checksum('data'), updatedAt: 100
      };
      const corrupted = IntegrityChecker.corruptRecord(record);
      expect(IntegrityChecker.isIntact(corrupted)).assertFalse();
      expect(IntegrityChecker.isRecordValid(corrupted)).assertTrue();
      expect((corrupted.payload).indexOf('#')).assertLargerOrEqual(0);
    });

    it('store_should_put_and_get', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      expect(store.put('R-1', 'payload', 100)).assertTrue();
      expect(store.size()).assertEqual(1);
      const record = store.get('R-1') as DataRecord;
      expect(record.payload).assertEqual('payload');
      expect(IntegrityChecker.isIntact(record)).assertTrue();
      expect(store.get('missing') === undefined).assertTrue();
    });

    it('store_should_reject_invalid_records', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      expect(store.put('', 'payload', 0)).assertFalse();
      expect(store.put('R-1', '', 0)).assertFalse();
      expect(store.put('R-2', 'bad\rpayload', 0)).assertFalse();
      expect(store.size()).assertEqual(0);
      expect(store.setRecord({
        id: '', payload: 'x', checksum: 0, updatedAt: 0
      })).assertFalse();
    });

    it('store_should_detect_corruption', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      store.put('R-1', 'healthy', 100);
      store.put('R-2', 'healthy', 100);
      const record = store.get('R-2') as DataRecord;
      store.setRecord(IntegrityChecker.corruptRecord(record));
      expect(store.corruptedIds()).assertDeepEquals(['R-2']);
      expect(store.isHealthy()).assertFalse();
    });

    it('store_should_repair_record', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      store.put('R-1', 'healthy', 100);
      const record = store.get('R-1') as DataRecord;
      store.setRecord(IntegrityChecker.corruptRecord(record));
      expect(store.repair('R-1')).assertTrue();
      expect(store.isHealthy()).assertTrue();
      expect(store.getRepaired()).assertEqual(1);
      expect(store.repair('missing')).assertFalse();
    });

    it('store_should_repair_all', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      store.put('R-1', 'a', 0);
      store.put('R-2', 'b', 0);
      store.setRecord(IntegrityChecker.corruptRecord(store.get('R-1') as DataRecord));
      store.setRecord(IntegrityChecker.corruptRecord(store.get('R-2') as DataRecord));
      expect(store.repairAll()).assertEqual(2);
      expect(store.isHealthy()).assertTrue();
      expect(store.getRepaired()).assertEqual(2);
    });

    it('store_should_quarantine_record', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      store.put('R-1', 'a', 0);
      expect(store.quarantine('R-1')).assertTrue();
      expect(store.quarantine('R-1')).assertFalse();
      expect(store.size()).assertEqual(0);
      expect(store.getQuarantined()).assertEqual(1);
      store.clear();
      expect(store.getRepaired()).assertEqual(0);
      expect(store.getQuarantined()).assertEqual(0);
    });

    it('store_should_enforce_capacity', 0, () => {
      const store = new IntegrityStore(1);
      expect(store.put('R-1', 'a', 0)).assertTrue();
      expect(store.put('R-2', 'b', 0)).assertFalse();
      expect(store.put('R-1', 'updated', 1)).assertTrue();
      expect((store.get('R-1') as DataRecord).payload).assertEqual('updated');
      expect(store.size()).assertEqual(1);
    });

    it('report_should_aggregate_integrity_checks', 0, () => {
      const report = new IntegrityReport();
      report.check('checksum', true);
      report.check('store', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('repair', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['repair']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('integrity_flow_should_recover_store', 0, () => {
      const store = new IntegrityStore(MAX_RECORDS);
      const report = new IntegrityReport();
      store.put('A', 'alpha', 100);
      store.put('B', 'beta', 200);
      store.setRecord(IntegrityChecker.corruptRecord(store.get('B') as DataRecord));
      report.check('detect', store.corruptedIds().length === 1);
      report.check('repair', store.repairAll() === 1);
      report.check('healthy', store.isHealthy());
      expect(report.isPassed()).assertTrue();
      expect(store.size()).assertEqual(2);
      expect(store.getRepaired()).assertEqual(1);
    });

    it('data_integrity_constants_should_be_stable', 0, () => {
      expect(MAX_RECORDS).assertEqual(64);
      expect(MAX_PAYLOAD_LENGTH).assertEqual(8192);
      expect(CHECKSUM_MOD).assertEqual(1000003);
    });
  });
}

