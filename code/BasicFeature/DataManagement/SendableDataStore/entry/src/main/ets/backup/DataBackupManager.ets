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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { BackupInfo, BackupStatus, StoreType } from '../models/DataModels';
import { Logger } from '../utils/Logger';

const MAX_BACKUP_COUNT: number = 50;

/**
 * DataBackupManager provides backup creation, restoration, backup info
 * management, auto-backup scheduling, and backup history tracking.
 */
export class DataBackupManager {
  private backups: BackupInfo[] = [];
  private backupCount: number = 0;
  private autoBackupEnabled: boolean = false;
  private autoBackupInterval: number = 3600000;
  private lastAutoBackupTime: number = 0;
  private createCount: number = 0;
  private restoreCount: number = 0;
  private deleteCount: number = 0;
  private createdAt: number = 0;

  constructor() {
  }

  initialize(): string {
    this.backups = [];
    this.backupCount = 0;
    this.autoBackupEnabled = false;
    this.lastAutoBackupTime = 0;
    this.createCount = 0;
    this.restoreCount = 0;
    this.deleteCount = 0;
    this.createdAt = Date.now();
    return 'Backup manager initialized';
  }

  createBackup(name: string, storeType: StoreType, entryCount: number): string {
    if (!DataValidator.isValidKey(name)) {
      return 'createBackup failed: invalid backup name';
    }
    if (this.backupCount >= MAX_BACKUP_COUNT) {
      return `createBackup failed: max backups reached (${MAX_BACKUP_COUNT})`;
    }
    const existIdx = this.findBackupIndex(name);
    if (existIdx >= 0) {
      return `createBackup failed: backup '${name}' already exists`;
    }
    const checksum = this.generateChecksum(name, entryCount);
    const info: BackupInfo = {
      name: name,
      createdAt: Date.now(),
      size: entryCount * 128,
      storeType: storeType,
      entryCount: entryCount,
      version: DataStoreConstants.CURRENT_STORE_VERSION,
      checksum: checksum,
      status: BackupStatus.COMPLETED
    };
    const newBackups: BackupInfo[] = [];
    for (let i = 0; i < this.backupCount; i++) {
      newBackups.push(this.backups[i]);
    }
    newBackups.push(info);
    this.backups = newBackups;
    this.backupCount++;
    this.createCount++;
    return `createBackup completed: '${name}', entries=${entryCount}, checksum=${checksum}`;
  }

  restoreBackup(name: string): string {
    if (!DataValidator.isValidKey(name)) {
      return 'restoreBackup failed: invalid backup name';
    }
    const idx = this.findBackupIndex(name);
    if (idx < 0) {
      return `restoreBackup failed: backup '${name}' not found`;
    }
    const backup = this.backups[idx];
    if (backup.status !== BackupStatus.COMPLETED) {
      return `restoreBackup failed: backup '${name}' status is ${backup.status}`;
    }
    const updatedBackups: BackupInfo[] = [];
    for (let i = 0; i < this.backupCount; i++) {
      if (i === idx) {
        const restoring: BackupInfo = {
          name: this.backups[i].name,
          createdAt: this.backups[i].createdAt,
          size: this.backups[i].size,
          storeType: this.backups[i].storeType,
          entryCount: this.backups[i].entryCount,
          version: this.backups[i].version,
          checksum: this.backups[i].checksum,
          status: BackupStatus.RESTORING
        };
        updatedBackups.push(restoring);
      } else {
        updatedBackups.push(this.backups[i]);
      }
    }
    this.backups = updatedBackups;
    const finalBackups: BackupInfo[] = [];
    for (let i = 0; i < this.backupCount; i++) {
      if (i === idx) {
        const completed: BackupInfo = {
          name: this.backups[i].name,
          createdAt: this.backups[i].createdAt,
          size: this.backups[i].size,
          storeType: this.backups[i].storeType,
          entryCount: this.backups[i].entryCount,
          version: this.backups[i].version,
          checksum: this.backups[i].checksum,
          status: BackupStatus.COMPLETED
        };
        finalBackups.push(completed);
      } else {
        finalBackups.push(this.backups[i]);
      }
    }
    this.backups = finalBackups;
    this.restoreCount++;
    return `restoreBackup completed: '${name}', ${backup.entryCount} entries restored`;
  }

  deleteBackup(name: string): string {
    if (!DataValidator.isValidKey(name)) {
      return 'deleteBackup failed: invalid backup name';
    }
    const idx = this.findBackupIndex(name);
    if (idx < 0) {
      return `deleteBackup failed: backup '${name}' not found`;
    }
    const newBackups: BackupInfo[] = [];
    for (let i = 0; i < this.backupCount; i++) {
      if (i !== idx) {
        newBackups.push(this.backups[i]);
      }
    }
    this.backups = newBackups;
    this.backupCount--;
    this.deleteCount++;
    return `deleteBackup completed: '${name}'`;
  }

  getBackupInfo(name: string): string {
    if (!DataValidator.isValidKey(name)) {
      return 'getBackupInfo failed: invalid backup name';
    }
    const idx = this.findBackupIndex(name);
    if (idx < 0) {
      return `getBackupInfo: backup '${name}' not found`;
    }
    const backup = this.backups[idx];
    return `BackupInfo: name=${backup.name}, type=${backup.storeType}, entries=${backup.entryCount}, ` +
      `size=${backup.size}, version=${backup.version}, checksum=${backup.checksum}, ` +
      `status=${backup.status}, created=${backup.createdAt}`;
  }

  listBackups(): string {
    if (this.backupCount === 0) {
      return 'listBackups: no backups available';
    }
    const result: string[] = [];
    for (let i = 0; i < this.backupCount; i++) {
      const b = this.backups[i];
      result.push(`${b.name}:${b.storeType}:${b.entryCount}:${b.status}`);
    }
    return `Backups: [${result.join(', ')}] (${this.backupCount} total)`;
  }

  getLatestBackup(): string {
    if (this.backupCount === 0) {
      return 'getLatestBackup: no backups available';
    }
    let latestIdx = 0;
    let latestTime = this.backups[0].createdAt;
    for (let i = 1; i < this.backupCount; i++) {
      if (this.backups[i].createdAt >= latestTime) {
        latestTime = this.backups[i].createdAt;
        latestIdx = i;
      }
    }
    const backup = this.backups[latestIdx];
    return `Latest backup: ${backup.name}, created=${backup.createdAt}, entries=${backup.entryCount}`;
  }

  getOldestBackup(): string {
    if (this.backupCount === 0) {
      return 'getOldestBackup: no backups available';
    }
    let oldestIdx = 0;
    let oldestTime = this.backups[0].createdAt;
    for (let i = 1; i < this.backupCount; i++) {
      if (this.backups[i].createdAt < oldestTime) {
        oldestTime = this.backups[i].createdAt;
        oldestIdx = i;
      }
    }
    const backup = this.backups[oldestIdx];
    return `Oldest backup: ${backup.name}, created=${backup.createdAt}, entries=${backup.entryCount}`;
  }

  setAutoBackup(enabled: boolean, intervalMs: number): string {
    if (intervalMs < 60000) {
      return 'setAutoBackup failed: interval must be >= 60000ms';
    }
    this.autoBackupEnabled = enabled;
    this.autoBackupInterval = intervalMs;
    return `setAutoBackup: enabled=${enabled}, interval=${intervalMs}ms`;
  }

  isAutoBackupEnabled(): boolean {
    return this.autoBackupEnabled;
  }

  getAutoBackupInterval(): number {
    return this.autoBackupInterval;
  }

  checkAutoBackup(): string {
    if (!this.autoBackupEnabled) {
      return 'checkAutoBackup: auto-backup is disabled';
    }
    const now = Date.now();
    const elapsed = now - this.lastAutoBackupTime;
    if (elapsed >= this.autoBackupInterval) {
      this.lastAutoBackupTime = now;
      return `checkAutoBackup: auto-backup triggered at ${now}`;
    }
    const remaining = this.autoBackupInterval - elapsed;
    return `checkAutoBackup: next backup in ${remaining}ms`;
  }

  getTotalBackupSize(): number {
    let total = 0;
    for (let i = 0; i < this.backupCount; i++) {
      total += this.backups[i].size;
    }
    return total;
  }

  getTotalEntryCount(): number {
    let total = 0;
    for (let i = 0; i < this.backupCount; i++) {
      total += this.backups[i].entryCount;
    }
    return total;
  }

  verifyBackupIntegrity(name: string): string {
    const idx = this.findBackupIndex(name);
    if (idx < 0) {
      return `verifyBackupIntegrity failed: backup '${name}' not found`;
    }
    const backup = this.backups[idx];
    const expectedChecksum = this.generateChecksum(backup.name, backup.entryCount);
    const valid = backup.checksum === expectedChecksum;
    return `verifyBackupIntegrity('${name}'): ${valid ? 'VALID' : 'INVALID'} (expected=${expectedChecksum}, actual=${backup.checksum})`;
  }

  getStatistics(): string {
    const totalSize = this.getTotalBackupSize();
    const totalEntries = this.getTotalEntryCount();
    return `Backup Statistics: count=${this.backupCount}, totalSize=${totalSize}, ` +
      `totalEntries=${totalEntries}, creates=${this.createCount}, restores=${this.restoreCount}, ` +
      `deletes=${this.deleteCount}, autoBackup=${this.autoBackupEnabled}`;
  }

  resetStatistics(): string {
    this.createCount = 0;
    this.restoreCount = 0;
    this.deleteCount = 0;
    return 'Backup statistics reset';
  }

  isInitialized(): boolean {
    return this.createdAt > 0;
  }

  release(): void {
    this.backups = [];
    this.backupCount = 0;
    this.autoBackupEnabled = false;
    this.autoBackupInterval = 3600000;
    this.lastAutoBackupTime = 0;
    this.createCount = 0;
    this.restoreCount = 0;
    this.deleteCount = 0;
    this.createdAt = 0;
    Logger.info('DataBackupManager released');
  }

  private findBackupIndex(name: string): number {
    for (let i = 0; i < this.backupCount; i++) {
      if (this.backups[i].name === name) {
        return i;
      }
    }
    return -1;
  }

  private generateChecksum(name: string, entryCount: number): string {
    let hash = 0;
    const input = `${name}_${entryCount}_${Date.now()}`;
    for (let i = 0; i < input.length; i++) {
      const char = input.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash;
    }
    return `chk_${Math.abs(hash).toString(16)}`;
  }
}
