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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import {
  createFreshDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 升级策略枚举
enum UpgradeStrategy {
  NON_FORCED = 'non_forced', FORCED = 'forced'
}

// 安装状态枚举：描述安装/卸载的完整状态机
enum InstallState {
  IDLE = 'idle', INSTALLING = 'installing', INSTALLED = 'installed', CANCELLED = 'cancelled', FAILED = 'failed'
}

// 应用版本模型：携带版本号、版本名与构建号
class AppVersion {
  public versionCode: number;
  public versionName: string;
  public buildNumber: number;

  constructor(versionCode: number, versionName: string, buildNumber: number = 1) {
    this.versionCode = versionCode;
    this.versionName = versionName;
    this.buildNumber = buildNumber;
  }
}

// 版本比较器：处理版本大小比较与升级判定
class VersionComparator {
  public static compare(current: AppVersion, latest: AppVersion): number {
    if (current.versionCode < latest.versionCode) {
      return -1;
    }
    if (current.versionCode > latest.versionCode) {
      return 1;
    }
    return 0;
  }

  public static hasUpdate(current: AppVersion, latest: AppVersion): boolean {
    return VersionComparator.compare(current, latest) < 0;
  }

  public static isSameVersion(current: AppVersion, latest: AppVersion): boolean {
    return VersionComparator.compare(current, latest) === 0;
  }

  public static isCrossVersion(current: AppVersion, latest: AppVersion): boolean {
    return latest.versionCode - current.versionCode >= 100;
  }

  public static isDowngrade(current: AppVersion, latest: AppVersion): boolean {
    return VersionComparator.compare(current, latest) > 0;
  }
}

// 存储空间检测器：模拟安装前空间检测
class StorageChecker {
  private totalBytes: number;
  private availableBytes: number;

  constructor(totalBytes: number, availableBytes: number) {
    this.totalBytes = totalBytes;
    this.availableBytes = availableBytes;
  }

  public canInstall(requiredBytes: number): boolean {
    return this.availableBytes >= requiredBytes;
  }

  public isCriticalSpace(thresholdBytes: number): boolean {
    return this.availableBytes < thresholdBytes;
  }

  public getAvailableBytes(): number {
    return this.availableBytes;
  }

  public getAvailableRatio(): number {
    if (this.totalBytes === 0) {
      return 0;
    }
    return this.availableBytes / this.totalBytes;
  }
}

// 安装控制器：处理安装状态机、取消、残留与重复安装
class InstallController {
  private state: InstallState = InstallState.IDLE;
  private hasResidualIcon: boolean = false;
  private installedVersion: AppVersion | null = null;

  public beginInstall(version: AppVersion): boolean {
    if (this.state === InstallState.INSTALLING) {
      return false;
    }
    this.state = InstallState.INSTALLING;
    return true;
  }

  public completeInstall(version: AppVersion): void {
    this.state = InstallState.INSTALLED;
    this.installedVersion = version;
    this.hasResidualIcon = false;
  }

  public cancelInstall(): void {
    if (this.state === InstallState.INSTALLING) {
      this.state = InstallState.CANCELLED;
      this.hasResidualIcon = false;
    }
  }

  public failInstall(): void {
    this.state = InstallState.FAILED;
  }

  public getState(): InstallState {
    return this.state;
  }

  public getInstalledVersion(): AppVersion | null {
    return this.installedVersion;
  }

  public isAlreadyInstalled(version: AppVersion): boolean {
    if (this.installedVersion === null) {
      return false;
    }
    return VersionComparator.isSameVersion(this.installedVersion, version);
  }

  public hasResidual(): boolean {
    return this.hasResidualIcon;
  }

  public reset(): void {
    this.state = InstallState.IDLE;
    this.hasResidualIcon = false;
    this.installedVersion = null;
  }
}

// 升级控制器：管理升级策略、回滚、增量与灰度
class UpgradeController {
  private strategy: UpgradeStrategy = UpgradeStrategy.NON_FORCED;
  private upgraded: boolean = false;
  private canRollback: boolean = false;
  private grayUserIds: string[] = [];

  public setStrategy(strategy: UpgradeStrategy): void {
    this.strategy = strategy;
  }

  public getStrategy(): UpgradeStrategy {
    return this.strategy;
  }

  public applyUpgrade(): void {
    this.upgraded = true;
    this.canRollback = true;
  }

  public applyIncrementalUpdate(): void {
    this.upgraded = true;
    this.canRollback = true;
  }

  public isUpgraded(): boolean {
    return this.upgraded;
  }

  public rollback(): boolean {
    if (this.canRollback) {
      this.upgraded = false;
      this.canRollback = false;
      return true;
    }
    return false;
  }

  public setGrayUsers(userIds: string[]): void {
    this.grayUserIds = [...userIds];
  }

  public isGrayUser(userId: string): boolean {
    return this.grayUserIds.includes(userId);
  }

  public cancelForcedUpgrade(): boolean {
    return this.strategy === UpgradeStrategy.FORCED;
  }
}

// ===== 新增辅助代码：版本与安装扩展模型 =====

// 版本号格式枚举：描述版本号字符串的常见表示格式
enum VersionFormat {
  SEMANTIC = 'semantic', NUMERIC = 'numeric', DATE = 'date'
}

// 安装来源枚举：区分应用安装的不同来源渠道
enum InstallSource {
  LOCAL = 'local', STORE = 'store', SIDELOAD = 'sideload', OTA = 'ota'
}

// 升级结果枚举：描述一次升级操作后的最终状态
enum UpgradeResultState {
  PENDING = 'pending', SUCCESS = 'success', ROLLED_BACK = 'rolled_back', FAILED = 'failed'
}

// 版本元信息接口：携带版本号、来源与是否强制等扩展属性
interface VersionMetadata {
  version: AppVersion;
  source: InstallSource;
  forced: boolean;
  releaseNotes: string;
}

// 安装记录接口：描述一次安装事务的完整信息
interface InstallRecord {
  version: AppVersion;
  source: InstallSource;
  startedAt: number;
  finishedAt: number;
  success: boolean;
}

// 升级结果接口：描述一次升级操作的最终结果
interface UpgradeResult {
  fromVersion: AppVersion;
  toVersion: AppVersion;
  state: UpgradeResultState;
  elapsedMs: number;
}

// 版本号解析器：解析与格式化版本号字符串，支持分段校验
class VersionParser {
  public parse(versionName: string): number[] {
    const parts = versionName.split('.');
    const result: number[] = [];
    for (let i = 0; i < parts.length; i++) {
      const value = parseInt(parts[i], 10);
      if (isNaN(value)) {
        result.push(0);
      } else {
        result.push(value);
      }
    }
    return result;
  }

  public format(parts: number[]): string {
    const segments: string[] = [];
    for (let i = 0; i < parts.length; i++) {
      segments.push(parts[i].toString());
    }
    return segments.join('.');
  }

  public isValid(versionName: string): boolean {
    if (versionName.length === 0) {
      return false;
    }
    const parts = versionName.split('.');
    for (let i = 0; i < parts.length; i++) {
      if (parts[i].length === 0) {
        return false;
      }
      const value = parseInt(parts[i], 10);
      if (isNaN(value) || value < 0) {
        return false;
      }
    }
    return true;
  }

  public getMajorVersion(versionName: string): number {
    const parts = this.parse(versionName);
    if (parts.length === 0) {
      return 0;
    }
    return parts[0];
  }

  public getMinorVersion(versionName: string): number {
    const parts = this.parse(versionName);
    if (parts.length < 2) {
      return 0;
    }
    return parts[1];
  }

  public detectFormat(versionName: string): VersionFormat {
    if (versionName.indexOf('-') >= 0) {
      return VersionFormat.DATE;
    }
    if (versionName.indexOf('.') >= 0) {
      return VersionFormat.SEMANTIC;
    }
    return VersionFormat.NUMERIC;
  }
}

// 版本元信息模型：封装版本及其来源、强制标记，支持克隆与比较
class VersionInfo {
  public version: AppVersion;
  public source: InstallSource;
  public forced: boolean;
  public releaseNotes: string;

  constructor(version: AppVersion, source: InstallSource, forced: boolean, releaseNotes: string) {
    this.version = version;
    this.source = source;
    this.forced = forced;
    this.releaseNotes = releaseNotes;
  }

  public clone(): VersionInfo {
    const versionCopy = new AppVersion(this.version.versionCode, this.version.versionName, this.version.buildNumber);
    return new VersionInfo(versionCopy, this.source, this.forced, this.releaseNotes);
  }

  public equals(other: VersionInfo): boolean {
    return this.version.versionCode === other.version.versionCode &&
      this.version.versionName === other.version.versionName && this.source === other.source &&
      this.forced === other.forced && this.releaseNotes === other.releaseNotes;
  }

  public toString(): string {
    return `VersionInfo(version=${this.version.versionName}, code=${this.version.versionCode}, source=${this.source}, forced=${this.forced})`;
  }

  public isValid(): boolean {
    return this.version.versionCode >= 0 && this.version.versionName.length > 0;
  }
}

// 安装记录器：记录并统计安装事务，支持成功率计算
class InstallRecorder {
  private records: InstallRecord[] = [];

  public record(version: AppVersion, source: InstallSource, startedAt: number, finishedAt: number,
    success: boolean): void {
    const record: InstallRecord = {
      version: version,
      source: source,
      startedAt: startedAt,
      finishedAt: finishedAt,
      success: success
    };
    this.records.push(record);
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].success) {
        count++;
      }
    }
    return count;
  }

  public getFailureCount(): number {
    return this.getRecordCount() - this.getSuccessCount();
  }

  public getSuccessRate(): number {
    if (this.records.length === 0) {
      return 1;
    }
    return this.getSuccessCount() / this.records.length;
  }

  public getAverageDuration(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      sum += this.records[i].finishedAt - this.records[i].startedAt;
    }
    return sum / this.records.length;
  }

  public getRecordsBySource(source: InstallSource): InstallRecord[] {
    const result: InstallRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].source === source) {
        result.push(this.records[i]);
      }
    }
    return result;
  }

  public clear(): void {
    this.records = [];
  }
}

// 升级结果模型：封装升级前后版本与结果状态，支持克隆与比较
class UpgradeOutcome {
  public fromVersion: AppVersion;
  public toVersion: AppVersion;
  public state: UpgradeResultState;
  public elapsedMs: number;

  constructor(fromVersion: AppVersion, toVersion: AppVersion, state: UpgradeResultState, elapsedMs: number) {
    this.fromVersion = fromVersion;
    this.toVersion = toVersion;
    this.state = state;
    this.elapsedMs = elapsedMs;
  }

  public clone(): UpgradeOutcome {
    return new UpgradeOutcome(this.fromVersion, this.toVersion, this.state, this.elapsedMs);
  }

  public equals(other: UpgradeOutcome): boolean {
    return this.fromVersion.versionCode === other.fromVersion.versionCode &&
      this.toVersion.versionCode === other.toVersion.versionCode && this.state === other.state &&
      this.elapsedMs === other.elapsedMs;
  }

  public toString(): string {
    return `UpgradeOutcome(${this.fromVersion.versionName} -> ${this.toVersion.versionName}, state=${this.state}, elapsedMs=${this.elapsedMs})`;
  }

  public isSuccess(): boolean {
    return this.state === UpgradeResultState.SUCCESS;
  }

  public isRolledBack(): boolean {
    return this.state === UpgradeResultState.ROLLED_BACK;
  }

  public isValid(): boolean {
    return this.elapsedMs >= 0;
  }
}

// 存储容量单位枚举：描述存储空间的不同计量单位
enum StorageUnit {
  BYTE = 'byte', KB = 'kb', MB = 'mb', GB = 'gb'
}

// 存储空间换算器：在不同存储单位之间进行换算
class StorageUnitConverter {
  public static readonly BYTES_PER_KB: number = 1024;
  public static readonly BYTES_PER_MB: number = 1024 * 1024;
  public static readonly BYTES_PER_GB: number = 1024 * 1024 * 1024;

  public toBytes(value: number, unit: StorageUnit): number {
    if (unit === StorageUnit.KB) {
      return value * StorageUnitConverter.BYTES_PER_KB;
    }
    if (unit === StorageUnit.MB) {
      return value * StorageUnitConverter.BYTES_PER_MB;
    }
    if (unit === StorageUnit.GB) {
      return value * StorageUnitConverter.BYTES_PER_GB;
    }
    return value;
  }

  public fromBytes(bytes: number, unit: StorageUnit): number {
    if (unit === StorageUnit.KB) {
      return bytes / StorageUnitConverter.BYTES_PER_KB;
    }
    if (unit === StorageUnit.MB) {
      return bytes / StorageUnitConverter.BYTES_PER_MB;
    }
    if (unit === StorageUnit.GB) {
      return bytes / StorageUnitConverter.BYTES_PER_GB;
    }
    return bytes;
  }

  public formatBytes(bytes: number): string {
    if (bytes >= StorageUnitConverter.BYTES_PER_GB) {
      return `${this.fromBytes(bytes, StorageUnit.GB).toFixed(2)}GB`;
    }
    if (bytes >= StorageUnitConverter.BYTES_PER_MB) {
      return `${this.fromBytes(bytes, StorageUnit.MB).toFixed(2)}MB`;
    }
    if (bytes >= StorageUnitConverter.BYTES_PER_KB) {
      return `${this.fromBytes(bytes, StorageUnit.KB).toFixed(2)}KB`;
    }
    return `${bytes}B`;
  }
}

export default function powerAppVersionTest() {
  describe('PowerAppVersion_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // ===== 版本比较 =====
    it('same_version_should_be_detected', 0, async () => {
      const current = new AppVersion(100, '1.0.0');
      const latest = new AppVersion(100, '1.0.0');
      expect(VersionComparator.isSameVersion(current, latest)).assertTrue();
      expect(VersionComparator.hasUpdate(current, latest)).assertFalse();
    });

    it('new_version_should_be_detected', 0, async () => {
      const current = new AppVersion(100, '1.0.0');
      const latest = new AppVersion(200, '2.0.0');
      expect(VersionComparator.hasUpdate(current, latest)).assertTrue();
    });

    it('cross_version_upgrade_should_be_detected', 0, async () => {
      const old = new AppVersion(10, '0.1.0');
      const latest = new AppVersion(300, '3.0.0');
      expect(VersionComparator.compare(old, latest)).assertEqual(-1);
      expect(VersionComparator.isCrossVersion(old, latest)).assertTrue();
    });

    it('non_cross_version_upgrade_should_be_identified', 0, async () => {
      const old = new AppVersion(150, '1.5.0');
      const latest = new AppVersion(200, '2.0.0');
      expect(VersionComparator.isCrossVersion(old, latest)).assertFalse();
    });

    it('downgrade_should_be_detected', 0, async () => {
      const high = new AppVersion(200, '2.0.0');
      const low = new AppVersion(100, '1.0.0');
      expect(VersionComparator.isDowngrade(high, low)).assertTrue();
    });

    it('version_compare_should_handle_zero_version_code', 0, async () => {
      const zero = new AppVersion(0, '0.0.0');
      const positive = new AppVersion(1, '0.0.1');
      expect(VersionComparator.compare(zero, positive)).assertEqual(-1);
    });

    // ===== 存储空间检测 =====
    it('insufficient_space_should_block_install', 0, async () => {
      const checker = new StorageChecker(1024, 100);
      expect(checker.canInstall(500)).assertFalse();
    });

    it('critical_space_threshold_should_be_detected', 0, async () => {
      const checker = new StorageChecker(1024, 50);
      expect(checker.isCriticalSpace(100)).assertTrue();
    });

    it('enough_space_should_allow_install', 0, async () => {
      const checker = new StorageChecker(1024, 800);
      expect(checker.canInstall(500)).assertTrue();
      expect(checker.isCriticalSpace(100)).assertFalse();
    });

    it('available_ratio_should_be_calculated', 0, async () => {
      const checker = new StorageChecker(1024, 256);
      expect(checker.getAvailableRatio()).assertEqual(0.25);
    });

    it('zero_total_space_should_return_zero_ratio', 0, async () => {
      const checker = new StorageChecker(0, 0);
      expect(checker.getAvailableRatio()).assertEqual(0);
    });

    // ===== 安装状态机 =====
    it('install_should_transition_to_installing_then_installed', 0, async () => {
      const controller = new InstallController();
      const version = new AppVersion(100, '1.0.0');
      expect(controller.beginInstall(version)).assertTrue();
      expect(controller.getState()).assertEqual(InstallState.INSTALLING);
      controller.completeInstall(version);
      expect(controller.getState()).assertEqual(InstallState.INSTALLED);
    });

    it('duplicate_install_should_be_blocked_while_installing', 0, async () => {
      const controller = new InstallController();
      const version = new AppVersion(100, '1.0.0');
      controller.beginInstall(version);
      expect(controller.beginInstall(version)).assertFalse();
    });

    it('cancel_install_should_leave_no_residual', 0, async () => {
      const controller = new InstallController();
      const version = new AppVersion(100, '1.0.0');
      controller.beginInstall(version);
      controller.cancelInstall();
      expect(controller.getState()).assertEqual(InstallState.CANCELLED);
      expect(controller.hasResidual()).assertFalse();
    });

    it('repeated_install_same_version_should_be_detected', 0, async () => {
      const controller = new InstallController();
      const version = new AppVersion(100, '1.0.0');
      controller.beginInstall(version);
      controller.completeInstall(version);
      expect(controller.isAlreadyInstalled(new AppVersion(100, '1.0.0'))).assertTrue();
      expect(controller.isAlreadyInstalled(new AppVersion(200, '2.0.0'))).assertFalse();
    });

    it('install_failure_should_mark_failed_state', 0, async () => {
      const controller = new InstallController();
      controller.beginInstall(new AppVersion(100, '1.0.0'));
      controller.failInstall();
      expect(controller.getState()).assertEqual(InstallState.FAILED);
    });

    // ===== 升级策略 =====
    it('forced_upgrade_cancel_should_be_blocked', 0, async () => {
      const controller = new UpgradeController();
      controller.setStrategy(UpgradeStrategy.FORCED);
      expect(controller.cancelForcedUpgrade()).assertTrue();
    });

    it('non_forced_upgrade_cancel_should_be_allowed', 0, async () => {
      const controller = new UpgradeController();
      expect(controller.cancelForcedUpgrade()).assertFalse();
    });

    it('upgrade_should_mark_upgraded_state', 0, async () => {
      const controller = new UpgradeController();
      controller.applyUpgrade();
      expect(controller.isUpgraded()).assertTrue();
    });

    it('rollback_should_restore_previous_version', 0, async () => {
      const controller = new UpgradeController();
      controller.applyUpgrade();
      expect(controller.rollback()).assertTrue();
      expect(controller.isUpgraded()).assertFalse();
    });

    it('rollback_without_upgrade_should_fail', 0, async () => {
      const controller = new UpgradeController();
      expect(controller.rollback()).assertFalse();
    });

    it('gray_release_should_only_hit_gray_users', 0, async () => {
      const controller = new UpgradeController();
      controller.setGrayUsers(['userA', 'userB']);
      expect(controller.isGrayUser('userA')).assertTrue();
      expect(controller.isGrayUser('userC')).assertFalse();
    });

    it('version_code_max_boundary_should_compare', 0, async () => {
      const big = new AppVersion(999999, '9.9.9');
      const small = new AppVersion(1, '0.0.1');
      expect(VersionComparator.compare(big, small)).assertEqual(1);
    });

    it('build_number_should_be_preserved', 0, async () => {
      const version = new AppVersion(100, '1.0.0', 42);
      expect(version.buildNumber).assertEqual(42);
    });

    it('version_name_should_be_non_empty', 0, async () => {
      const version = new AppVersion(100, '1.0.0');
      expect(version.versionName.length).assertLargerOrEqual(1);
    });

    it('space_exactly_equal_required_should_allow_install', 0, async () => {
      const checker = new StorageChecker(1024, 500);
      expect(checker.canInstall(500)).assertTrue();
    });

    it('space_just_below_required_should_block_install', 0, async () => {
      const checker = new StorageChecker(1024, 499);
      expect(checker.canInstall(500)).assertFalse();
    });

    it('install_reset_should_return_to_idle', 0, async () => {
      const controller = new InstallController();
      controller.beginInstall(new AppVersion(100, '1.0.0'));
      controller.completeInstall(new AppVersion(100, '1.0.0'));
      controller.reset();
      expect(controller.getState()).assertEqual(InstallState.IDLE);
    });

    it('rollback_then_reapply_should_work', 0, async () => {
      const controller = new UpgradeController();
      controller.applyUpgrade();
      controller.rollback();
      controller.applyIncrementalUpdate();
      expect(controller.isUpgraded()).assertTrue();
    });

    it('gray_user_empty_list_should_return_false', 0, async () => {
      const controller = new UpgradeController();
      expect(controller.isGrayUser('anyone')).assertFalse();
    });

    it('version_compare_negative_version_code', 0, async () => {
      const a = new AppVersion(-1, '-1.0');
      const b = new AppVersion(1, '1.0');
      expect(VersionComparator.compare(a, b)).assertEqual(-1);
    });

    it('version_compare_same_code_different_name', 0, async () => {
      const a = new AppVersion(100, '1.0.0');
      const b = new AppVersion(100, '1.0.0-beta');
      expect(VersionComparator.isSameVersion(a, b)).assertTrue();
    });

    it('storage_zero_required_bytes_should_allow', 0, async () => {
      const checker = new StorageChecker(1024, 0);
      expect(checker.canInstall(0)).assertTrue();
    });

    it('storage_available_zero_should_block', 0, async () => {
      const checker = new StorageChecker(1024, 0);
      expect(checker.canInstall(1)).assertFalse();
    });

    it('storage_ratio_one_when_full', 0, async () => {
      const checker = new StorageChecker(500, 500);
      expect(checker.getAvailableRatio()).assertEqual(1);
    });

    it('install_begin_again_after_cancel', 0, async () => {
      const controller = new InstallController();
      controller.beginInstall(new AppVersion(100, '1.0.0'));
      controller.cancelInstall();
      expect(controller.beginInstall(new AppVersion(100, '1.0.0'))).assertTrue();
    });

    it('install_complete_without_begin_stays_idle', 0, async () => {
      const controller = new InstallController();
      controller.completeInstall(new AppVersion(100, '1.0.0'));
      expect(controller.getState()).assertEqual(InstallState.INSTALLED);
    });

    it('is_already_installed_when_none_returns_false', 0, async () => {
      const controller = new InstallController();
      expect(controller.isAlreadyInstalled(new AppVersion(100, '1.0.0'))).assertFalse();
    });

    it('upgrade_apply_twice_should_still_be_upgraded', 0, async () => {
      const controller = new UpgradeController();
      controller.applyUpgrade();
      controller.applyUpgrade();
      expect(controller.isUpgraded()).assertTrue();
    });

    it('rollback_twice_should_fail_second_time', 0, async () => {
      const controller = new UpgradeController();
      controller.applyUpgrade();
      controller.rollback();
      expect(controller.rollback()).assertFalse();
    });

    it('gray_user_after_reset_empty_list', 0, async () => {
      const controller = new UpgradeController();
      controller.setGrayUsers([]);
      expect(controller.isGrayUser('userA')).assertFalse();
    });

    it('strategy_default_should_be_non_forced', 0, async () => {
      const controller = new UpgradeController();
      expect(controller.getStrategy()).assertEqual(UpgradeStrategy.NON_FORCED);
    });

    // 适配 VersionParser：版本号分段解析
    it('version_parser_should_parse_segments', 0, async () => {
      const parser = new VersionParser();
      const parts = parser.parse('1.2.3');
      expect(parts[0]).assertEqual(1);
      expect(parts[1]).assertEqual(2);
      expect(parts[2]).assertEqual(3);
    });

    // 适配 VersionParser：版本号格式化回写
    it('version_parser_should_format_segments', 0, async () => {
      const parser = new VersionParser();
      expect(parser.format([1, 2, 3])).assertEqual('1.2.3');
    });

    // 适配 VersionParser：版本号合法性校验
    it('version_parser_should_validate_version_names', 0, async () => {
      const parser = new VersionParser();
      expect(parser.isValid('1.2.3')).assertTrue();
      expect(parser.isValid('1..3')).assertFalse();
      expect(parser.isValid('')).assertFalse();
    });

    // 适配 VersionParser：提取主次版本号
    it('version_parser_should_extract_major_minor', 0, async () => {
      const parser = new VersionParser();
      expect(parser.getMajorVersion('3.2.1')).assertEqual(3);
      expect(parser.getMinorVersion('3.2.1')).assertEqual(2);
      expect(parser.getMinorVersion('3')).assertEqual(0);
    });

    // 适配 VersionParser：格式识别
    it('version_parser_should_detect_format', 0, async () => {
      const parser = new VersionParser();
      expect(parser.detectFormat('1.0.0')).assertEqual(VersionFormat.SEMANTIC);
      expect(parser.detectFormat('2025-08-01')).assertEqual(VersionFormat.DATE);
      expect(parser.detectFormat('12345')).assertEqual(VersionFormat.NUMERIC);
    });

    // 适配 VersionInfo：克隆后的元信息应保持相等
    it('version_info_should_clone_equally', 0, async () => {
      const info = new VersionInfo(new AppVersion(100, '1.0.0'), InstallSource.STORE, false, '首次发布');
      const copy = info.clone();
      expect(info.equals(copy)).assertTrue();
    });

    // 适配 VersionInfo：元信息合法性判定
    it('version_info_should_validate_metadata', 0, async () => {
      const valid = new VersionInfo(new AppVersion(100, '1.0.0'), InstallSource.OTA, true, '');
      const invalid = new VersionInfo(new AppVersion(-1, ''), InstallSource.LOCAL, false, '');
      expect(valid.isValid()).assertTrue();
      expect(invalid.isValid()).assertFalse();
    });

    // 适配 InstallRecorder：安装成功率计算
    it('install_recorder_should_compute_success_rate', 0, async () => {
      const recorder = new InstallRecorder();
      const v100 = new AppVersion(100, '1.0.0');
      recorder.record(v100, InstallSource.STORE, 1000, 2000, true);
      recorder.record(v100, InstallSource.STORE, 2000, 3000, true);
      recorder.record(v100, InstallSource.LOCAL, 3000, 4000, false);
      expect(recorder.getRecordCount()).assertEqual(3);
      expect(recorder.getSuccessCount()).assertEqual(2);
      expect(recorder.getFailureCount()).assertEqual(1);
      expect(recorder.getSuccessRate()).assertEqual(2 / 3);
    });

    // 适配 InstallRecorder：安装平均耗时计算
    it('install_recorder_should_compute_average_duration', 0, async () => {
      const recorder = new InstallRecorder();
      const v100 = new AppVersion(100, '1.0.0');
      recorder.record(v100, InstallSource.STORE, 1000, 3000, true);
      recorder.record(v100, InstallSource.STORE, 3000, 7000, true);
      expect(recorder.getAverageDuration()).assertEqual(3000);
    });

    // 适配 InstallRecorder：按来源筛选记录
    it('install_recorder_should_filter_by_source', 0, async () => {
      const recorder = new InstallRecorder();
      const v100 = new AppVersion(100, '1.0.0');
      recorder.record(v100, InstallSource.OTA, 1000, 2000, true);
      recorder.record(v100, InstallSource.LOCAL, 2000, 3000, true);
      const otaRecords = recorder.getRecordsBySource(InstallSource.OTA);
      expect(otaRecords.length).assertEqual(1);
    });

    // 适配 UpgradeOutcome：回滚状态判定
    it('upgrade_outcome_should_detect_rollback', 0, async () => {
      const rolledBack = new UpgradeOutcome(new AppVersion(100, '1.0.0'), new AppVersion(200, '2.0.0'),
        UpgradeResultState.ROLLED_BACK, 5000);
      const success = new UpgradeOutcome(new AppVersion(100, '1.0.0'), new AppVersion(200, '2.0.0'),
        UpgradeResultState.SUCCESS, 5000);
      expect(rolledBack.isRolledBack()).assertTrue();
      expect(success.isRolledBack()).assertFalse();
      expect(success.isSuccess()).assertTrue();
    });

    // 适配 UpgradeOutcome：耗时合法性判定
    it('upgrade_outcome_should_validate_elapsed', 0, async () => {
      const outcome = new UpgradeOutcome(new AppVersion(100, '1.0.0'), new AppVersion(200, '2.0.0'),
        UpgradeResultState.PENDING, 1000);
      expect(outcome.isValid()).assertTrue();
    });

    // 适配 StorageUnitConverter：单位换算
    it('storage_converter_should_convert_units', 0, async () => {
      const converter = new StorageUnitConverter();
      expect(converter.toBytes(2, StorageUnit.KB)).assertEqual(2048);
      expect(converter.toBytes(1, StorageUnit.MB)).assertEqual(1024 * 1024);
      expect(converter.fromBytes(2048, StorageUnit.KB)).assertEqual(2);
    });

    // 适配 StorageUnitConverter：可读格式展示
    it('storage_converter_should_format_readable', 0, async () => {
      const converter = new StorageUnitConverter();
      expect(converter.formatBytes(1024)).assertEqual('1.00KB');
      expect(converter.formatBytes(512)).assertEqual('512B');
      expect(converter.formatBytes(1024 * 1024 * 1024)).assertEqual('1.00GB');
    });
  });
}
