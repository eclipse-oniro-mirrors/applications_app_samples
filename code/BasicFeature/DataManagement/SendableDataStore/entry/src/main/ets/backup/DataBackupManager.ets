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
import { ResultText } from '../utils/ResultText';

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
    return ResultText.of($r('app.string.result_backup_initialized'), 'Backup manager initialized');
  }

  createBackup(name: string, storeType: StoreType, entryCount: number): string {
    if (!DataValidator.isValidKey(name)) {
      return ResultText.of($r('app.string.result_backup_create_invalid_name'),
        'createBackup failed: invalid backup name');
    }
    if (this.backupCount >= MAX_BACKUP_COUNT) {
      return ResultText.ofArgs($r('app.string.result_backup_create_max_reached'), [MAX_BACKUP_COUNT],
        `createBackup failed: max backups reached (${MAX_BACKUP_COUNT})`);
    }
    const existIdx: number = this.findBackupIndex(name);
    if (existIdx >= 0) {
      return ResultText.ofArgs($r('app.string.result_backup_create_exists'), [name],
        `createBackup failed: backup '${name}' already exists`);
    }
    const checksum: string = this.generateChecksum(name, entryCount);
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
    for (let i: number = 0; i < this.backupCount; i++) {
      newBackups.push(this.backups[i]);
    }
    newBackups.push(info);
    this.backups = newBackups;
    this.backupCount++;
    this.createCount++;
    return ResultText.ofArgs($r('app.string.result_backup_create_completed'), [name, entryCount, checksum],
      `createBackup completed: '${name}', entries=${entryCount}, checksum=${checksum}`);
  }

  restoreBackup(name: string): string {
    if (!DataValidator.isValidKey(name)) {
      return ResultText.of($r('app.string.result_backup_restore_invalid_name'),
        'restoreBackup failed: invalid backup name');
    }
    const idx: number = this.findBackupIndex(name);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_backup_restore_not_found'), [name],
        `restoreBackup failed: backup '${name}' not found`);
    }
    const backup: BackupInfo = this.backups[idx];
    if (backup.status !== BackupStatus.COMPLETED) {
      return ResultText.ofArgs($r('app.string.result_backup_restore_invalid_status'), [name, String(backup.status)],
        `restoreBackup failed: backup '${name}' status is ${backup.status}`);
    }
    const updatedBackups: BackupInfo[] = [];
    for (let i: number = 0; i < this.backupCount; i++) {
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
    for (let i: number = 0; i < this.backupCount; i++) {
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
    return ResultText.ofArgs($r('app.string.result_backup_restore_completed'), [name, backup.entryCount],
      `restoreBackup completed: '${name}', ${backup.entryCount} entries restored`);
  }

  deleteBackup(name: string): string {
    if (!DataValidator.isValidKey(name)) {
      return ResultText.of($r('app.string.result_backup_delete_invalid_name'),
        'deleteBackup failed: invalid backup name');
    }
    const idx: number = this.findBackupIndex(name);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_backup_delete_not_found'), [name],
        `deleteBackup failed: backup '${name}' not found`);
    }
    const newBackups: BackupInfo[] = [];
    for (let i: number = 0; i < this.backupCount; i++) {
      if (i !== idx) {
        newBackups.push(this.backups[i]);
      }
    }
    this.backups = newBackups;
    this.backupCount--;
    this.deleteCount++;
    return ResultText.ofArgs($r('app.string.result_backup_delete_completed'), [name],
      `deleteBackup completed: '${name}'`);
  }

  getBackupInfo(name: string): string {
    if (!DataValidator.isValidKey(name)) {
      return ResultText.of($r('app.string.result_backup_info_invalid_name'),
        'getBackupInfo failed: invalid backup name');
    }
    const idx: number = this.findBackupIndex(name);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_backup_info_not_found'), [name],
        `getBackupInfo: backup '${name}' not found`);
    }
    const backup: BackupInfo = this.backups[idx];
    return ResultText.ofArgs($r('app.string.result_backup_info_detail'),
      [backup.name, String(backup.storeType), backup.entryCount, backup.size, backup.version,
        backup.checksum, String(backup.status), backup.createdAt],
      `BackupInfo: name=${backup.name}, type=${backup.storeType}, entries=${backup.entryCount}, size=${backup.size}, ` +
        `version=${backup.version}, checksum=${backup.checksum}, status=${backup.status}, created=${backup.createdAt}`);
  }

  listBackups(): string {
    if (this.backupCount === 0) {
      return ResultText.of($r('app.string.result_backup_list_empty'), 'listBackups: no backups available');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.backupCount; i++) {
      const b: BackupInfo = this.backups[i];
      result.push(`${b.name}:${b.storeType}:${b.entryCount}:${b.status}`);
    }
    return ResultText.ofArgs($r('app.string.result_backup_list_items'), [result.join(', '), this.backupCount],
      `Backups: [${result.join(', ')}] (${this.backupCount} total)`);
  }

  getLatestBackup(): string {
    if (this.backupCount === 0) {
      return ResultText.of($r('app.string.result_backup_latest_empty'), 'getLatestBackup: no backups available');
    }
    let latestIdx: number = 0;
    let latestTime: number = this.backups[0].createdAt;
    for (let i: number = 1; i < this.backupCount; i++) {
      if (this.backups[i].createdAt >= latestTime) {
        latestTime = this.backups[i].createdAt;
        latestIdx = i;
      }
    }
    const backup: BackupInfo = this.backups[latestIdx];
    return ResultText.ofArgs($r('app.string.result_backup_latest_item'),
      [backup.name, backup.createdAt, backup.entryCount],
      `Latest backup: ${backup.name}, created=${backup.createdAt}, entries=${backup.entryCount}`);
  }

  getOldestBackup(): string {
    if (this.backupCount === 0) {
      return ResultText.of($r('app.string.result_backup_oldest_empty'), 'getOldestBackup: no backups available');
    }
    let oldestIdx: number = 0;
    let oldestTime: number = this.backups[0].createdAt;
    for (let i: number = 1; i < this.backupCount; i++) {
      if (this.backups[i].createdAt < oldestTime) {
        oldestTime = this.backups[i].createdAt;
        oldestIdx = i;
      }
    }
    const backup: BackupInfo = this.backups[oldestIdx];
    return ResultText.ofArgs($r('app.string.result_backup_oldest_item'),
      [backup.name, backup.createdAt, backup.entryCount],
      `Oldest backup: ${backup.name}, created=${backup.createdAt}, entries=${backup.entryCount}`);
  }

  setAutoBackup(enabled: boolean, intervalMs: number): string {
    if (intervalMs < 60000) {
      return ResultText.of($r('app.string.result_backup_auto_invalid_interval'),
        'setAutoBackup failed: interval must be >= 60000ms');
    }
    this.autoBackupEnabled = enabled;
    this.autoBackupInterval = intervalMs;
    return ResultText.ofArgs($r('app.string.result_backup_auto_set'), [String(enabled), intervalMs],
      `setAutoBackup: enabled=${enabled}, interval=${intervalMs}ms`);
  }

  isAutoBackupEnabled(): boolean {
    return this.autoBackupEnabled;
  }

  getAutoBackupInterval(): number {
    return this.autoBackupInterval;
  }

  checkAutoBackup(): string {
    if (!this.autoBackupEnabled) {
      return ResultText.of($r('app.string.result_backup_auto_disabled'),
        'checkAutoBackup: auto-backup is disabled');
    }
    const now: number = Date.now();
    const elapsed: number = now - this.lastAutoBackupTime;
    if (elapsed >= this.autoBackupInterval) {
      this.lastAutoBackupTime = now;
      return ResultText.ofArgs($r('app.string.result_backup_auto_triggered'), [now],
        `checkAutoBackup: auto-backup triggered at ${now}`);
    }
    const remaining: number = this.autoBackupInterval - elapsed;
    return ResultText.ofArgs($r('app.string.result_backup_auto_next'), [remaining],
      `checkAutoBackup: next backup in ${remaining}ms`);
  }

  getTotalBackupSize(): number {
    let total: number = 0;
    for (let i: number = 0; i < this.backupCount; i++) {
      total += this.backups[i].size;
    }
    return total;
  }

  getTotalEntryCount(): number {
    let total: number = 0;
    for (let i: number = 0; i < this.backupCount; i++) {
      total += this.backups[i].entryCount;
    }
    return total;
  }

  verifyBackupIntegrity(name: string): string {
    const idx: number = this.findBackupIndex(name);
    if (idx < 0) {
      return ResultText.ofArgs($r('app.string.result_backup_verify_not_found'), [name],
        `verifyBackupIntegrity failed: backup '${name}' not found`);
    }
    const backup: BackupInfo = this.backups[idx];
    const expectedChecksum: string = this.generateChecksum(backup.name, backup.entryCount);
    const valid: boolean = backup.checksum === expectedChecksum;
    const state: string = valid ? ResultText.of($r('app.string.result_backup_integrity_valid'), 'VALID') :
      ResultText.of($r('app.string.result_backup_integrity_invalid'), 'INVALID');
    return ResultText.ofArgs($r('app.string.result_backup_verify_result'),
      [name, state, expectedChecksum, backup.checksum],
      `verifyBackupIntegrity('${name}'): ${state} (expected=${expectedChecksum}, actual=${backup.checksum})`);
  }

  getStatistics(): string {
    const totalSize: number = this.getTotalBackupSize();
    const totalEntries: number = this.getTotalEntryCount();
    return ResultText.ofArgs($r('app.string.result_backup_statistics'),
      [this.backupCount, totalSize, totalEntries, this.createCount, this.restoreCount,
        this.deleteCount, String(this.autoBackupEnabled)],
      `Backup Statistics: count=${this.backupCount}, totalSize=${totalSize}, totalEntries=${totalEntries}, ` +
        `creates=${this.createCount}, restores=${this.restoreCount}, deletes=${this.deleteCount}, ` +
        `autoBackup=${this.autoBackupEnabled}`);
  }

  resetStatistics(): string {
    this.createCount = 0;
    this.restoreCount = 0;
    this.deleteCount = 0;
    return ResultText.of($r('app.string.result_backup_stats_reset'), 'Backup statistics reset');
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
    for (let i: number = 0; i < this.backupCount; i++) {
      if (this.backups[i].name === name) {
        return i;
      }
    }
    return -1;
  }

  private generateChecksum(name: string, entryCount: number): string {
    let hash: number = 0;
    const input: string = `${name}_${entryCount}_${Date.now()}`;
    for (let i: number = 0; i < input.length; i++) {
      const char: number = input.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash;
    }
    return `chk_${Math.abs(hash).toString(16)}`;
  }
}
