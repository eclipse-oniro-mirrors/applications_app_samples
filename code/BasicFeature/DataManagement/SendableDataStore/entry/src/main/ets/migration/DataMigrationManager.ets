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
import { MigrationStatus, VersionEntry } from '../models/DataModels';
import { Logger } from '../utils/Logger';
import { ResultText } from '../utils/ResultText';

const INITIAL_VERSION: number = 1;
const MAX_VERSION_STEPS: number = 20;

/**
 * DataMigrationManager handles data schema versioning, migration steps,
 * rollback operations, and migration status tracking.
 */
export class DataMigrationManager {
  private currentVersion: number = INITIAL_VERSION;
  private targetVersion: number = INITIAL_VERSION;
  private status: MigrationStatus = MigrationStatus.IDLE;
  private versionHistory: VersionEntry[] = [];
  private historyCount: number = 0;
  private migrationLog: string[] = [];
  private logCount: number = 0;
  private autoMigrate: boolean = false;
  private migrationStartTime: number = 0;
  private migrationEndTime: number = 0;
  private successCount: number = 0;
  private failCount: number = 0;

  constructor() {
  }

  initialize(startVersion: number): string {
    if (!DataValidator.isValidVersion(startVersion)) {
      return ResultText.ofArgs($r('app.string.result_migration_initialize_invalid_version'), [startVersion],
        `initialize failed: invalid version ${startVersion}`);
    }
    this.currentVersion = startVersion;
    this.targetVersion = startVersion;
    this.status = MigrationStatus.IDLE;
    this.versionHistory = [];
    this.historyCount = 0;
    this.migrationLog = [];
    this.logCount = 0;
    this.migrationStartTime = 0;
    this.migrationEndTime = 0;
    this.successCount = 0;
    this.failCount = 0;
    this.addLog(`Migration manager initialized at version ${startVersion}`);
    return ResultText.ofArgs($r('app.string.result_migration_initialized'), [startVersion],
      `Migration manager initialized: version=${startVersion}`);
  }

  getCurrentVersion(): number {
    return this.currentVersion;
  }

  getTargetVersion(): number {
    return this.targetVersion;
  }

  getStatus(): MigrationStatus {
    return this.status;
  }

  getStatusString(): string {
    return ResultText.ofArgs($r('app.string.result_migration_status'),
      [this.currentVersion, this.targetVersion, String(this.status)],
      `Migration status: version=${this.currentVersion}, target=${this.targetVersion}, status=${this.status}`);
  }

  registerMigrationStep(fromVersion: number, toVersion: number, description: string): string {
    if (!DataValidator.isValidVersion(fromVersion) || !DataValidator.isValidVersion(toVersion)) {
      return ResultText.of($r('app.string.result_migration_register_invalid_versions'),
        'registerMigrationStep failed: invalid version numbers');
    }
    if (fromVersion >= toVersion) {
      return ResultText.of($r('app.string.result_migration_register_order'),
        'registerMigrationStep failed: toVersion must be greater than fromVersion');
    }
    if (this.historyCount >= MAX_VERSION_STEPS) {
      return ResultText.ofArgs($r('app.string.result_migration_register_max_steps'), [MAX_VERSION_STEPS],
        `registerMigrationStep failed: max steps reached (${MAX_VERSION_STEPS})`);
    }
    const entry: VersionEntry = {
      version: toVersion,
      appliedAt: 0,
      description: description,
      success: false
    };
    const newHistory: VersionEntry[] = [];
    for (let i: number = 0; i < this.historyCount; i++) {
      newHistory.push(this.versionHistory[i]);
    }
    newHistory.push(entry);
    this.versionHistory = newHistory;
    this.historyCount++;
    this.addLog(`Registered migration step: v${fromVersion} -> v${toVersion} (${description})`);
    return ResultText.ofArgs($r('app.string.result_migration_register_completed'), [fromVersion, toVersion],
      `registerMigrationStep completed: v${fromVersion} -> v${toVersion}`);
  }

  async migrate(targetVersion: number): Promise<string> {
    if (!DataValidator.isValidVersion(targetVersion)) {
      return ResultText.ofArgs($r('app.string.result_migration_migrate_invalid_version'), [targetVersion],
        `migrate failed: invalid target version ${targetVersion}`);
    }
    if (targetVersion <= this.currentVersion) {
      return ResultText.ofArgs($r('app.string.result_migration_migrate_target_order'),
        [targetVersion, this.currentVersion],
        `migrate failed: target ${targetVersion} must be > current ${this.currentVersion}`);
    }
    if (this.status === MigrationStatus.IN_PROGRESS) {
      return ResultText.of($r('app.string.result_migration_migrate_in_progress'),
        'migrate failed: migration already in progress');
    }
    this.targetVersion = targetVersion;
    this.status = MigrationStatus.IN_PROGRESS;
    this.migrationStartTime = Date.now();
    this.addLog(`Migration started: v${this.currentVersion} -> v${targetVersion}`);

    let stepsApplied: number = 0;
    for (let i: number = 0; i < this.historyCount; i++) {
      const entry: VersionEntry = this.versionHistory[i];
      if (entry.version <= targetVersion && entry.version > this.currentVersion) {
        try {
          this.addLog(`Applying step to v${entry.version}: ${entry.description}`);
          const updatedHistory: VersionEntry[] = [];
          for (let j: number = 0; j < this.historyCount; j++) {
            if (j === i) {
              const updated: VersionEntry = {
                version: this.versionHistory[j].version,
                appliedAt: Date.now(),
                description: this.versionHistory[j].description,
                success: true
              };
              updatedHistory.push(updated);
            } else {
              updatedHistory.push(this.versionHistory[j]);
            }
          }
          this.versionHistory = updatedHistory;
          this.currentVersion = entry.version;
          stepsApplied++;
          this.successCount++;
        } catch (e) {
          this.status = MigrationStatus.FAILED;
          this.failCount++;
          this.migrationEndTime = Date.now();
          this.addLog(`Migration failed at v${entry.version}: ${(e as Error).message}`);
          return ResultText.ofArgs($r('app.string.result_migration_migrate_failed_step'),
            [entry.version, (e as Error).message],
            `migrate failed at step v${entry.version}: ${(e as Error).message}`);
        }
      }
    }

    this.currentVersion = targetVersion;
    this.status = MigrationStatus.COMPLETED;
    this.migrationEndTime = Date.now();
    this.addLog(`Migration completed: v${targetVersion}, ${stepsApplied} steps applied`);
    return ResultText.ofArgs($r('app.string.result_migration_migrate_completed'),
      [this.currentVersion, stepsApplied, this.getDuration()],
      `migrate completed: v${this.currentVersion}, ${stepsApplied} steps applied in ${this.getDuration()}ms`);
  }

  migrateSync(targetVersion: number): string {
    if (!DataValidator.isValidVersion(targetVersion)) {
      return ResultText.of($r('app.string.result_migration_migrate_sync_invalid_version'),
        `migrateSync failed: invalid target version`);
    }
    if (targetVersion <= this.currentVersion) {
      return ResultText.of($r('app.string.result_migration_migrate_sync_target_order'),
        `migrateSync failed: target must be > current`);
    }
    this.targetVersion = targetVersion;
    this.status = MigrationStatus.IN_PROGRESS;
    this.migrationStartTime = Date.now();
    this.addLog(`Sync migration started: v${this.currentVersion} -> v${targetVersion}`);

    let stepsApplied: number = 0;
    for (let i: number = 0; i < this.historyCount; i++) {
      if (this.versionHistory[i].version <= targetVersion && this.versionHistory[i].version > this.currentVersion) {
        const updatedHistory: VersionEntry[] = [];
        for (let j: number = 0; j < this.historyCount; j++) {
          if (j === i) {
            const updated: VersionEntry = {
              version: this.versionHistory[j].version,
              appliedAt: Date.now(),
              description: this.versionHistory[j].description,
              success: true
            };
            updatedHistory.push(updated);
          } else {
            updatedHistory.push(this.versionHistory[j]);
          }
        }
        this.versionHistory = updatedHistory;
        this.currentVersion = this.versionHistory[i].version;
        stepsApplied++;
        this.successCount++;
      }
    }

    this.currentVersion = targetVersion;
    this.status = MigrationStatus.COMPLETED;
    this.migrationEndTime = Date.now();
    this.addLog(`Sync migration completed: v${targetVersion}`);
    return ResultText.ofArgs($r('app.string.result_migration_migrate_sync_completed'),
      [this.currentVersion, stepsApplied],
      `migrateSync completed: v${this.currentVersion}, ${stepsApplied} steps`);
  }

  rollback(targetVersion: number): string {
    if (!DataValidator.isValidVersion(targetVersion)) {
      return ResultText.of($r('app.string.result_migration_rollback_invalid_version'),
        'rollback failed: invalid target version');
    }
    if (targetVersion >= this.currentVersion) {
      return ResultText.of($r('app.string.result_migration_rollback_target_order'),
        'rollback failed: target must be < current version');
    }
    if (this.status === MigrationStatus.IN_PROGRESS) {
      return ResultText.of($r('app.string.result_migration_rollback_in_progress'),
        'rollback failed: migration in progress');
    }
    this.addLog(`Rollback started: v${this.currentVersion} -> v${targetVersion}`);
    const previousVersion: number = this.currentVersion;
    this.currentVersion = targetVersion;
    this.status = MigrationStatus.ROLLED_BACK;
    this.migrationEndTime = Date.now();
    this.addLog(`Rollback completed: v${previousVersion} -> v${targetVersion}`);
    return ResultText.ofArgs($r('app.string.result_migration_rollback_completed'),
      [previousVersion, targetVersion],
      `rollback completed: v${previousVersion} -> v${targetVersion}`);
  }

  getMigrationStrategy(): string {
    const strategies: string[] = [];
    strategies.push(`current=v${this.currentVersion}`);
    strategies.push(`auto=${this.autoMigrate}`);
    strategies.push(`registeredSteps=${this.historyCount}`);
    for (let i: number = 0; i < this.historyCount; i++) {
      const entry: VersionEntry = this.versionHistory[i];
      const applied: string = entry.appliedAt > 0 ? 'applied' : 'pending';
      strategies.push(`step:v${entry.version}:${entry.description}:${applied}`);
    }
    return ResultText.ofArgs($r('app.string.result_migration_strategy'), [strategies.join(', ')],
      `Strategy: [${strategies.join(', ')}]`);
  }

  setAutoMigrate(enabled: boolean): string {
    this.autoMigrate = enabled;
    this.addLog(`Auto-migrate set to ${enabled}`);
    return ResultText.ofArgs($r('app.string.result_migration_set_auto_migrate'), [String(enabled)],
      `setAutoMigrate: ${enabled}`);
  }

  isAutoMigrate(): boolean {
    return this.autoMigrate;
  }

  getVersionHistory(): string {
    if (this.historyCount === 0) {
      return ResultText.of($r('app.string.result_migration_history_empty'), 'Version history: empty');
    }
    const result: string[] = [];
    for (let i: number = 0; i < this.historyCount; i++) {
      const entry: VersionEntry = this.versionHistory[i];
      const status: string = entry.success ? 'OK' : 'PENDING';
      result.push(`v${entry.version}:${entry.description}:${status}`);
    }
    return ResultText.ofArgs($r('app.string.result_migration_history'), [result.join(', ')],
      `Version history: [${result.join(', ')}]`);
  }

  getMigrationLog(): string {
    if (this.logCount === 0) {
      return ResultText.of($r('app.string.result_migration_log_empty'), 'Migration log: empty');
    }
    return ResultText.ofArgs($r('app.string.result_migration_log'), [this.logCount],
      `Migration log: ${this.logCount} entries`);
  }

  getMigrationLogEntries(): string[] {
    const result: string[] = [];
    for (let i: number = 0; i < this.logCount; i++) {
      result.push(this.migrationLog[i]);
    }
    return result;
  }

  getStatistics(): string {
    const duration: number = this.migrationEndTime > 0 ? this.migrationEndTime - this.migrationStartTime : 0;
    return ResultText.ofArgs($r('app.string.result_migration_statistics'),
      [this.currentVersion, String(this.status), this.historyCount, this.successCount, this.failCount,
        String(this.autoMigrate), duration],
      `Migration Statistics: version=${this.currentVersion}, status=${this.status}, ` +
        `steps=${this.historyCount}, success=${this.successCount}, fail=${this.failCount}, ` +
        `autoMigrate=${this.autoMigrate}, lastDuration=${duration}ms`);
  }

  isInitialized(): boolean {
    return this.currentVersion >= INITIAL_VERSION;
  }

  release(): void {
    this.currentVersion = INITIAL_VERSION;
    this.targetVersion = INITIAL_VERSION;
    this.status = MigrationStatus.IDLE;
    this.versionHistory = [];
    this.historyCount = 0;
    this.migrationLog = [];
    this.logCount = 0;
    this.autoMigrate = false;
    this.migrationStartTime = 0;
    this.migrationEndTime = 0;
    this.successCount = 0;
    this.failCount = 0;
    Logger.info('DataMigrationManager released');
  }

  private addLog(message: string): void {
    if (this.logCount < 1000) {
      const newLog: string[] = [];
      for (let i: number = 0; i < this.logCount; i++) {
        newLog.push(this.migrationLog[i]);
      }
      newLog.push(`[${Date.now()}] ${message}`);
      this.migrationLog = newLog;
      this.logCount++;
    }
  }

  private getDuration(): number {
    return this.migrationEndTime - this.migrationStartTime;
  }
}
