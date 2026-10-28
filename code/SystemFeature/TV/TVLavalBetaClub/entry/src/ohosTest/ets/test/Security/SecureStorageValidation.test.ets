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

const MAX_KEY_LENGTH: number = 64;

const MAX_VALUE_LENGTH: number = 4096;

const MAX_ENTRIES: number = 32;

const SENSITIVE_PREFIX: string = 'secure_';

interface StorageEntry {
  key: string;
  value: string;
  encrypted: boolean;
}

// Validates storage keys and values before persistence
class SecureStorageValidator {
  public static isKeyValid(key: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_]+$');
    return key.length > 0 && key.length <= MAX_KEY_LENGTH && pattern.test(key);
  }

  public static isValueValid(value: string): boolean {
    return value.length <= MAX_VALUE_LENGTH && value.indexOf('\r') < 0;
  }

  public static requiresEncryption(key: string): boolean {
    return key.startsWith(SENSITIVE_PREFIX) || key.toLowerCase().indexOf('token') >= 0;
  }

  public static isValid(entry: StorageEntry): boolean {
    return SecureStorageValidator.isKeyValid(entry.key) &&
      SecureStorageValidator.isValueValid(entry.value);
  }
}

// Encrypted key-value store with quota enforcement
class SecureStorage {
  private entries: Map<string, StorageEntry> = new Map<string, StorageEntry>();
  private readonly capacity: number;
  private rejected: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public put(entry: StorageEntry): boolean {
    if (!SecureStorageValidator.isValid(entry)) {
      this.rejected++;
      return false;
    }
    if (SecureStorageValidator.requiresEncryption(entry.key)) {
      entry = {
        key: entry.key,
        value: entry.value,
        encrypted: true
      };
    }
    if (!this.entries.has(entry.key) && this.entries.size >= this.capacity) {
      this.rejected++;
      return false;
    }
    this.entries.set(entry.key, {
      key: entry.key,
      value: entry.value,
      encrypted: entry.encrypted
    });
    return true;
  }

  public get(key: string): string {
    const entry = this.entries.get(key);
    return entry === undefined ? '' : entry.value;
  }

  public isEncrypted(key: string): boolean {
    const entry = this.entries.get(key);
    return entry !== undefined && entry.encrypted;
  }

  public delete(key: string): boolean {
    return this.entries.delete(key);
  }

  public size(): number {
    return this.entries.size;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public keys(): string[] {
    const result: string[] = [];
    this.entries.forEach((entry: StorageEntry, key: string) => {
      result.push(key);
    });
    return result;
  }

  public sensitiveKeys(): string[] {
    const result: string[] = [];
    this.entries.forEach((entry: StorageEntry, key: string) => {
      if (entry.encrypted) {
        result.push(key);
      }
    });
    return result;
  }

  public clear(): void {
    this.entries.clear();
    this.rejected = 0;
  }
}

// Enforces total storage size limits
class StorageQuota {
  private readonly limitBytes: number;
  private usedBytes: number = 0;

  constructor(limitBytes: number) {
    this.limitBytes = limitBytes;
  }

  public reserve(bytes: number): boolean {
    if (bytes < 0 || this.usedBytes + bytes > this.limitBytes) {
      return false;
    }
    this.usedBytes += bytes;
    return true;
  }

  public release(bytes: number): void {
    this.usedBytes -= bytes;
    if (this.usedBytes < 0) {
      this.usedBytes = 0;
    }
  }

  public getUsed(): number {
    return this.usedBytes;
  }

  public getLimit(): number {
    return this.limitBytes;
  }

  public remaining(): number {
    return this.limitBytes - this.usedBytes;
  }

  public usagePercent(): number {
    return this.limitBytes === 0 ? 0 : this.usedBytes * 100 / this.limitBytes;
  }

  public reset(): void {
    this.usedBytes = 0;
  }
}

// Audits sensitive key access
class StorageAudit {
  private reads: number = 0;
  private writes: number = 0;
  private sensitiveAccess: number = 0;

  public recordRead(key: string): void {
    this.reads++;
    if (SecureStorageValidator.requiresEncryption(key)) {
      this.sensitiveAccess++;
    }
  }

  public recordWrite(key: string): void {
    this.writes++;
    if (SecureStorageValidator.requiresEncryption(key)) {
      this.sensitiveAccess++;
    }
  }

  public getReads(): number {
    return this.reads;
  }

  public getWrites(): number {
    return this.writes;
  }

  public getSensitiveAccess(): number {
    return this.sensitiveAccess;
  }

  public total(): number {
    return this.reads + this.writes;
  }

  public reset(): void {
    this.reads = 0;
    this.writes = 0;
    this.sensitiveAccess = 0;
  }
}

export default function secureStorageValidationTest() {
  describe('SecureStorageValidation_Test', () => {

    it('validator_should_check_keys', 0, () => {
      expect(SecureStorageValidator.isKeyValid('issue_draft')).assertTrue();
      expect(SecureStorageValidator.isKeyValid('token')).assertTrue();
      expect(SecureStorageValidator.isKeyValid('bad key')).assertFalse();
      expect(SecureStorageValidator.isKeyValid('bad-key')).assertFalse();
      expect(SecureStorageValidator.isKeyValid('')).assertFalse();
      expect(SecureStorageValidator.isKeyValid('a'.repeat(MAX_KEY_LENGTH + 1))).assertFalse();
    });

    it('validator_should_check_values', 0, () => {
      expect(SecureStorageValidator.isValueValid('value')).assertTrue();
      expect(SecureStorageValidator.isValueValid('a'.repeat(MAX_VALUE_LENGTH))).assertTrue();
      expect(SecureStorageValidator.isValueValid('a'.repeat(MAX_VALUE_LENGTH + 1))).assertFalse();
      expect(SecureStorageValidator.isValueValid('line\rbreak')).assertFalse();
    });

    it('validator_should_require_encryption', 0, () => {
      expect(SecureStorageValidator.requiresEncryption('secure_token')).assertTrue();
      expect(SecureStorageValidator.requiresEncryption('accessToken')).assertTrue();
      expect(SecureStorageValidator.requiresEncryption('issue_draft')).assertFalse();
      expect(SecureStorageValidator.requiresEncryption('')).assertFalse();
    });

    it('storage_should_put_and_get', 0, () => {
      const storage = new SecureStorage(MAX_ENTRIES);
      expect(storage.put({ key: 'issue_draft', value: 'text', encrypted: false })).assertTrue();
      expect(storage.get('issue_draft')).assertEqual('text');
      expect(storage.size()).assertEqual(1);
      expect(storage.isEncrypted('issue_draft')).assertFalse();
      expect(storage.get('missing')).assertEqual('');
    });

    it('storage_should_force_encryption_for_sensitive_keys', 0, () => {
      const storage = new SecureStorage(MAX_ENTRIES);
      expect(storage.put({ key: 'secure_token', value: 'abc', encrypted: false })).assertTrue();
      expect(storage.isEncrypted('secure_token')).assertTrue();
      expect(storage.put({ key: 'accessToken', value: 'xyz', encrypted: false })).assertTrue();
      expect(storage.isEncrypted('accessToken')).assertTrue();
      expect(storage.sensitiveKeys().length).assertEqual(2);
    });

    it('storage_should_reject_invalid_entries', 0, () => {
      const storage = new SecureStorage(MAX_ENTRIES);
      expect(storage.put({ key: 'bad key', value: 'v', encrypted: false })).assertFalse();
      expect(storage.put({ key: 'good', value: 'a'.repeat(MAX_VALUE_LENGTH + 1), encrypted: false }))
        .assertFalse();
      expect(storage.size()).assertEqual(0);
      expect(storage.getRejected()).assertEqual(2);
    });

    it('storage_should_delete_and_clear', 0, () => {
      const storage = new SecureStorage(MAX_ENTRIES);
      storage.put({ key: 'a', value: '1', encrypted: false });
      storage.put({ key: 'b', value: '2', encrypted: false });
      expect(storage.delete('a')).assertTrue();
      expect(storage.delete('a')).assertFalse();
      expect(storage.size()).assertEqual(1);
      expect(storage.keys()).assertDeepEquals(['b']);
      storage.clear();
      expect(storage.size()).assertEqual(0);
      expect(storage.getRejected()).assertEqual(0);
    });

    it('storage_should_enforce_capacity', 0, () => {
      const storage = new SecureStorage(2);
      expect(storage.put({ key: 'a', value: '1', encrypted: false })).assertTrue();
      expect(storage.put({ key: 'b', value: '2', encrypted: false })).assertTrue();
      expect(storage.put({ key: 'c', value: '3', encrypted: false })).assertFalse();
      expect(storage.put({ key: 'a', value: 'updated', encrypted: false })).assertTrue();
      expect(storage.get('a')).assertEqual('updated');
      expect(storage.getRejected()).assertEqual(1);
    });

    it('quota_should_reserve_and_release', 0, () => {
      const quota = new StorageQuota(1024);
      expect(quota.reserve(512)).assertTrue();
      expect(quota.getUsed()).assertEqual(512);
      expect(quota.remaining()).assertEqual(512);
      expect(quota.reserve(513)).assertFalse();
      expect(quota.reserve(512)).assertTrue();
      expect(quota.usagePercent()).assertEqual(100);
      quota.release(1024);
      expect(quota.getUsed()).assertEqual(0);
      quota.release(100);
      expect(quota.getUsed()).assertEqual(0);
    });

    it('audit_should_count_sensitive_access', 0, () => {
      const audit = new StorageAudit();
      audit.recordRead('issue_draft');
      audit.recordWrite('secure_token');
      audit.recordRead('accessToken');
      expect(audit.getReads()).assertEqual(2);
      expect(audit.getWrites()).assertEqual(1);
      expect(audit.getSensitiveAccess()).assertEqual(2);
      expect(audit.total()).assertEqual(3);
      audit.reset();
      expect(audit.total()).assertEqual(0);
    });

    it('storage_flow_should_protect_tokens', 0, () => {
      const storage = new SecureStorage(MAX_ENTRIES);
      const audit = new StorageAudit();
      const quota = new StorageQuota(4096);
      const entry: StorageEntry = { key: 'secure_session', value: 'value12345', encrypted: false };
      if (storage.put(entry)) {
        audit.recordWrite(entry.key);
        quota.reserve(entry.value.length);
      }
      expect(storage.isEncrypted('secure_session')).assertTrue();
      expect(storage.get('secure_session')).assertEqual('value12345');
      audit.recordRead('secure_session');
      expect(audit.getSensitiveAccess()).assertEqual(2);
      expect(quota.getUsed()).assertEqual(10);
      expect(SecureStorageValidator.requiresEncryption('secure_session')).assertTrue();
    });

    it('storage_constants_should_be_stable', 0, () => {
      expect(MAX_KEY_LENGTH).assertEqual(64);
      expect(MAX_VALUE_LENGTH).assertEqual(4096);
      expect(MAX_ENTRIES).assertEqual(32);
      expect(SENSITIVE_PREFIX).assertEqual('secure_');
    });
  });
}

