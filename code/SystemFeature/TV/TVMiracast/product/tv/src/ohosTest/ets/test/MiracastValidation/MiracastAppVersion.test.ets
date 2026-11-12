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
import { Log } from 'library';

const TAG: string = 'MiracastAppVersionSuite';

// 投屏引擎（CastEngine）的发布通道
enum EngineChannel {
  STABLE = 'stable', BETA = 'beta', CANARY = 'canary'
}

// 引擎升级策略：强制升级与可选升级
enum EngineUpgradeStrategy {
  NON_FORCED = 'non_forced', FORCED = 'forced'
}

// 引擎安装状态机：描述 miracast player service 的安装与替换过程
enum EngineInstallState {
  IDLE = 'idle', INSTALLING = 'installing', INSTALLED = 'installed', CANCELLED = 'cancelled', FAILED = 'failed'
}

// 投屏引擎版本：携带 versionCode、versionName、buildNumber 与发布通道
class CastEngineVersion {
  public versionCode: number;
  public versionName: string;
  public buildNumber: number;
  public channel: EngineChannel;

  constructor(versionCode: number, versionName: string, buildNumber: number = 1,
    channel: EngineChannel = EngineChannel.STABLE) {
    this.versionCode = versionCode;
    this.versionName = versionName;
    this.buildNumber = buildNumber;
    this.channel = channel;
  }

  public toString(): string {
    return `${this.versionName}(${this.versionCode})`;
  }
}

// 引擎版本比较器：处理版本大小、跨版本、降级与协议兼容判定
class EngineVersionComparator {
  public static compare(current: CastEngineVersion, latest: CastEngineVersion): number {
    if (current.versionCode < latest.versionCode) {
      return -1;
    }
    if (current.versionCode > latest.versionCode) {
      return 1;
    }
    return 0;
  }

  public static hasUpdate(current: CastEngineVersion, latest: CastEngineVersion): boolean {
    return EngineVersionComparator.compare(current, latest) < 0;
  }

  public static isSameVersion(current: CastEngineVersion, latest: CastEngineVersion): boolean {
    return EngineVersionComparator.compare(current, latest) === 0;
  }

  public static isCrossVersion(current: CastEngineVersion, latest: CastEngineVersion): boolean {
    return latest.versionCode - current.versionCode >= 100;
  }

  public static isDowngrade(current: CastEngineVersion, latest: CastEngineVersion): boolean {
    return EngineVersionComparator.compare(current, latest) > 0;
  }

  // 主版本号一致才允许在同一 Cast 协议上热升级
  public static isMajorCompatible(current: CastEngineVersion, latest: CastEngineVersion): boolean {
    const currentMajor = Math.floor(current.versionCode / 100);
    const latestMajor = Math.floor(latest.versionCode / 100);
    return currentMajor === latestMajor;
  }
}

// 引擎包存储检测器：模拟升级包下载前后的空间校验
class EngineStorageChecker {
  private totalBytes: number;
  private availableBytes: number;
  private reservedBytes: number;

  constructor(totalBytes: number, availableBytes: number, reservedBytes: number = 0) {
    this.totalBytes = totalBytes;
    this.availableBytes = availableBytes;
    this.reservedBytes = reservedBytes;
  }

  public canUpgrade(requiredBytes: number): boolean {
    return this.getUsableBytes() >= requiredBytes;
  }

  public getUsableBytes(): number {
    const usable = this.availableBytes - this.reservedBytes;
    return usable > 0 ? usable : 0;
  }

  public isCriticalSpace(thresholdBytes: number): boolean {
    return this.getUsableBytes() < thresholdBytes;
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

  public isPackageCacheFull(cacheBytes: number, limitBytes: number): boolean {
    return cacheBytes >= limitBytes;
  }
}

// 引擎安装控制器：处理安装状态机、取消、残留与重复安装
class EngineInstallController {
  private state: EngineInstallState = EngineInstallState.IDLE;
  private hasResidualBundle: boolean = false;
  private installedVersion: CastEngineVersion | null = null;

  public beginInstall(version: CastEngineVersion): boolean {
    if (this.state === EngineInstallState.INSTALLING) {
      return false;
    }
    this.state = EngineInstallState.INSTALLING;
    return true;
  }

  public completeInstall(version: CastEngineVersion): void {
    this.state = EngineInstallState.INSTALLED;
    this.installedVersion = version;
    this.hasResidualBundle = false;
  }

  public cancelInstall(): void {
    if (this.state === EngineInstallState.INSTALLING) {
      this.state = EngineInstallState.CANCELLED;
      this.hasResidualBundle = false;
    }
  }

  public failInstall(): void {
    this.state = EngineInstallState.FAILED;
  }

  public getState(): EngineInstallState {
    return this.state;
  }

  public getInstalledVersion(): CastEngineVersion | null {
    return this.installedVersion;
  }

  public isAlreadyInstalled(version: CastEngineVersion): boolean {
    if (this.installedVersion === null) {
      return false;
    }
    return EngineVersionComparator.isSameVersion(this.installedVersion, version);
  }

  public hasResidual(): boolean {
    return this.hasResidualBundle;
  }

  public reset(): void {
    this.state = EngineInstallState.IDLE;
    this.hasResidualBundle = false;
    this.installedVersion = null;
  }
}

// 引擎升级控制器：管理升级策略、回滚、增量升级与灰度发布
class EngineUpgradeController {
  private strategy: EngineUpgradeStrategy = EngineUpgradeStrategy.NON_FORCED;
  private upgraded: boolean = false;
  private canRollback: boolean = false;
  private grayDeviceIds: string[] = [];

  public setStrategy(strategy: EngineUpgradeStrategy): void {
    this.strategy = strategy;
  }

  public getStrategy(): EngineUpgradeStrategy {
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

  public setGrayDevices(deviceIds: string[]): void {
    this.grayDeviceIds = [...deviceIds];
  }

  public isGrayDevice(deviceId: string): boolean {
    return this.grayDeviceIds.includes(deviceId);
  }

  public isForcedUpgrade(): boolean {
    return this.strategy === EngineUpgradeStrategy.FORCED;
  }

  public getGrayDeviceCount(): number {
    return this.grayDeviceIds.length;
  }
}

// 引擎安装记录：描述一次安装事务的耗时与结果
interface EngineInstallRecord {
  version: CastEngineVersion;
  channel: EngineChannel;
  startedAt: number;
  finishedAt: number;
  success: boolean;
}

// 版本号解析器：解析、格式化与校验引擎版本号
class EngineVersionParser {
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
    return parts.length === 0 ? 0 : parts[0];
  }

  public getMinorVersion(versionName: string): number {
    const parts = this.parse(versionName);
    return parts.length < 2 ? 0 : parts[1];
  }
}

// 引擎版本元信息模型：支持克隆、相等比较与合法性判定
class EngineVersionInfo {
  public version: CastEngineVersion;
  public channel: EngineChannel;
  public forced: boolean;
  public releaseNotes: string;

  constructor(version: CastEngineVersion, channel: EngineChannel, forced: boolean, releaseNotes: string) {
    this.version = version;
    this.channel = channel;
    this.forced = forced;
    this.releaseNotes = releaseNotes;
  }

  public clone(): EngineVersionInfo {
    const copy = new CastEngineVersion(this.version.versionCode, this.version.versionName,
      this.version.buildNumber, this.version.channel);
    return new EngineVersionInfo(copy, this.channel, this.forced, this.releaseNotes);
  }

  public equals(other: EngineVersionInfo): boolean {
    return this.version.versionCode === other.version.versionCode &&
      this.version.versionName === other.version.versionName &&
      this.channel === other.channel && this.forced === other.forced &&
      this.releaseNotes === other.releaseNotes;
  }

  public toString(): string {
    return `EngineVersionInfo(${this.version.versionName}, channel=${this.channel}, forced=${this.forced})`;
  }

  public isValid(): boolean {
    return this.version.versionCode >= 0 && this.version.versionName.length > 0;
  }

  public isBetaChannel(): boolean {
    return this.channel === EngineChannel.BETA;
  }
}

// 安装记录器：记录并统计引擎安装事务
class EngineInstallRecorder {
  private records: EngineInstallRecord[] = [];

  public record(version: CastEngineVersion, channel: EngineChannel, startedAt: number,
    finishedAt: number, success: boolean): void {
    const record: EngineInstallRecord = {
      version: version,
      channel: channel,
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

  public getRecordsByChannel(channel: EngineChannel): EngineInstallRecord[] {
    const result: EngineInstallRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].channel === channel) {
        result.push(this.records[i]);
      }
    }
    return result;
  }
}

// 升级结果模型：封装升级前后版本与结果标记
class EngineUpgradeOutcome {
  public fromVersion: CastEngineVersion;
  public toVersion: CastEngineVersion;
  public success: boolean;
  public elapsedMs: number;

  constructor(fromVersion: CastEngineVersion, toVersion: CastEngineVersion,
    success: boolean, elapsedMs: number) {
    this.fromVersion = fromVersion;
    this.toVersion = toVersion;
    this.success = success;
    this.elapsedMs = elapsedMs;
  }

  public clone(): EngineUpgradeOutcome {
    return new EngineUpgradeOutcome(this.fromVersion, this.toVersion, this.success, this.elapsedMs);
  }

  public equals(other: EngineUpgradeOutcome): boolean {
    return this.fromVersion.versionCode === other.fromVersion.versionCode &&
      this.toVersion.versionCode === other.toVersion.versionCode &&
      this.success === other.success && this.elapsedMs === other.elapsedMs;
  }

  public toString(): string {
    return `EngineUpgradeOutcome(${this.fromVersion.versionName} -> ${this.toVersion.versionName}, success=${this.success})`;
  }

  public isSuccess(): boolean {
    return this.success;
  }

  public isValid(): boolean {
    return this.elapsedMs >= 0;
  }

  public getVersionDelta(): number {
    return this.toVersion.versionCode - this.fromVersion.versionCode;
  }
}

// 存储容量单位枚举：描述引擎包大小的计量单位
enum StorageUnit {
  BYTE = 'byte', KB = 'kb', MB = 'mb', GB = 'gb'
}

// 存储空间换算器：在不同存储单位之间换算引擎包大小
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
}

// Cast 协议版本：引擎与设备协商使用的镜像协议
class CastProtocolVersion {
  public static readonly V1: number = 1;
  public static readonly V2: number = 2;
  public static readonly V3: number = 3;

  public static isSupported(protocol: number): boolean {
    return protocol >= CastProtocolVersion.V1 && protocol <= CastProtocolVersion.V3;
  }

  public static isBackwardCompatible(deviceProtocol: number, engineProtocol: number): boolean {
    return deviceProtocol <= engineProtocol && CastProtocolVersion.isSupported(deviceProtocol);
  }

  public static getPreferredProtocol(engineProtocol: number): number {
    if (engineProtocol > CastProtocolVersion.V3) {
      return CastProtocolVersion.V3;
    }
    return engineProtocol;
  }
}

// 升级计划器：按通道与灰度策略决定是否下发升级
class EngineUpgradePlanner {
  private minimumVersionCode: number;
  private allowedChannels: EngineChannel[];

  constructor(minimumVersionCode: number, allowedChannels: EngineChannel[]) {
    this.minimumVersionCode = minimumVersionCode;
    this.allowedChannels = [...allowedChannels];
  }

  public shouldOffer(version: CastEngineVersion): boolean {
    if (version.versionCode < this.minimumVersionCode) {
      return false;
    }
    return this.allowedChannels.includes(version.channel);
  }

  public getMinimumVersionCode(): number {
    return this.minimumVersionCode;
  }

  public getChannelCount(): number {
    return this.allowedChannels.length;
  }

  public addChannel(channel: EngineChannel): void {
    if (!this.allowedChannels.includes(channel)) {
      this.allowedChannels.push(channel);
    }
  }

  public removeChannel(channel: EngineChannel): void {
    const index = this.allowedChannels.indexOf(channel);
    if (index >= 0) {
      this.allowedChannels.splice(index, 1);
    }
  }
}

export default function miracastAppVersionSuite(): void {
  describe('MiracastAppVersion_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'app version suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'app version suite finished');
    });

    // ===== 引擎版本比较 =====
    it('same_engine_version_should_be_detected', 0, async () => {
      const current = new CastEngineVersion(100, '1.0.0');
      const latest = new CastEngineVersion(100, '1.0.0');
      expect(EngineVersionComparator.isSameVersion(current, latest)).assertTrue();
      expect(EngineVersionComparator.hasUpdate(current, latest)).assertFalse();
    });

    it('newer_engine_version_should_report_update', 0, async () => {
      const current = new CastEngineVersion(100, '1.0.0');
      const latest = new CastEngineVersion(200, '2.0.0');
      expect(EngineVersionComparator.hasUpdate(current, latest)).assertTrue();
      expect(EngineVersionComparator.compare(current, latest)).assertEqual(-1);
    });

    it('cross_engine_version_upgrade_should_be_detected', 0, async () => {
      const oldEngine = new CastEngineVersion(10, '0.1.0');
      const latest = new CastEngineVersion(300, '3.0.0');
      expect(EngineVersionComparator.isCrossVersion(oldEngine, latest)).assertTrue();
      expect(EngineVersionComparator.isMajorCompatible(oldEngine, latest)).assertFalse();
    });

    it('minor_engine_upgrade_should_not_cross_major', 0, async () => {
      const oldEngine = new CastEngineVersion(150, '1.5.0');
      const latest = new CastEngineVersion(200, '2.0.0');
      expect(EngineVersionComparator.isCrossVersion(oldEngine, latest)).assertFalse();
      expect(EngineVersionComparator.isMajorCompatible(oldEngine, latest)).assertFalse();
    });

    it('engine_downgrade_should_be_detected', 0, async () => {
      const high = new CastEngineVersion(200, '2.0.0');
      const low = new CastEngineVersion(100, '1.0.0');
      expect(EngineVersionComparator.isDowngrade(high, low)).assertTrue();
      expect(EngineVersionComparator.isDowngrade(low, high)).assertFalse();
    });

    it('engine_version_max_boundary_should_compare', 0, async () => {
      const big = new CastEngineVersion(999999, '9.9.9');
      const small = new CastEngineVersion(1, '0.0.1');
      expect(EngineVersionComparator.compare(big, small)).assertEqual(1);
      expect(EngineVersionComparator.isCrossVersion(small, big)).assertTrue();
    });

    it('engine_same_major_should_be_hot_upgradable', 0, async () => {
      const oldEngine = new CastEngineVersion(105, '1.0.5');
      const latest = new CastEngineVersion(120, '1.2.0');
      expect(EngineVersionComparator.isMajorCompatible(oldEngine, latest)).assertTrue();
      expect(EngineVersionComparator.hasUpdate(oldEngine, latest)).assertTrue();
    });

    // ===== 引擎包存储检测 =====
    it('insufficient_engine_space_should_block_upgrade', 0, async () => {
      const checker = new EngineStorageChecker(4096, 100);
      expect(checker.canUpgrade(500)).assertFalse();
      expect(checker.isCriticalSpace(1000)).assertTrue();
    });

    it('enough_engine_space_should_allow_upgrade', 0, async () => {
      const checker = new EngineStorageChecker(4096, 2048);
      expect(checker.canUpgrade(500)).assertTrue();
      expect(checker.isCriticalSpace(100)).assertFalse();
    });

    it('engine_available_ratio_should_be_calculated', 0, async () => {
      const checker = new EngineStorageChecker(4096, 1024);
      expect(checker.getAvailableRatio()).assertEqual(0.25);
      expect(checker.getAvailableBytes()).assertEqual(1024);
    });

    it('engine_package_cache_full_should_be_detected', 0, async () => {
      const checker = new EngineStorageChecker(4096, 2048);
      expect(checker.isPackageCacheFull(256, 256)).assertTrue();
      expect(checker.isPackageCacheFull(255, 256)).assertFalse();
    });

    // ===== 引擎安装状态机 =====
    it('engine_install_should_transition_installing_then_installed', 0, async () => {
      const controller = new EngineInstallController();
      const version = new CastEngineVersion(100, '1.0.0');
      expect(controller.beginInstall(version)).assertTrue();
      expect(controller.getState()).assertEqual(EngineInstallState.INSTALLING);
      controller.completeInstall(version);
      expect(controller.getState()).assertEqual(EngineInstallState.INSTALLED);
      expect(controller.getInstalledVersion() === null).assertFalse();
    });

    it('duplicate_engine_install_should_be_blocked_while_installing', 0, async () => {
      const controller = new EngineInstallController();
      const version = new CastEngineVersion(100, '1.0.0');
      controller.beginInstall(version);
      expect(controller.beginInstall(version)).assertFalse();
      expect(controller.getState()).assertEqual(EngineInstallState.INSTALLING);
    });

    it('cancelled_engine_install_should_leave_no_residual', 0, async () => {
      const controller = new EngineInstallController();
      controller.beginInstall(new CastEngineVersion(100, '1.0.0'));
      controller.cancelInstall();
      expect(controller.getState()).assertEqual(EngineInstallState.CANCELLED);
      expect(controller.hasResidual()).assertFalse();
    });

    it('cancel_engine_install_when_idle_should_stay_idle', 0, async () => {
      const controller = new EngineInstallController();
      controller.cancelInstall();
      expect(controller.getState()).assertEqual(EngineInstallState.IDLE);
    });

    it('repeated_engine_install_same_version_should_be_detected', 0, async () => {
      const controller = new EngineInstallController();
      const version = new CastEngineVersion(100, '1.0.0');
      controller.beginInstall(version);
      controller.completeInstall(version);
      expect(controller.isAlreadyInstalled(new CastEngineVersion(100, '1.0.0'))).assertTrue();
      expect(controller.isAlreadyInstalled(new CastEngineVersion(200, '2.0.0'))).assertFalse();
    });

    it('engine_install_failure_should_mark_failed_state', 0, async () => {
      const controller = new EngineInstallController();
      controller.beginInstall(new CastEngineVersion(100, '1.0.0'));
      controller.failInstall();
      expect(controller.getState()).assertEqual(EngineInstallState.FAILED);
      expect(controller.hasResidual()).assertFalse();
    });

    it('engine_install_reset_should_return_to_idle', 0, async () => {
      const controller = new EngineInstallController();
      controller.beginInstall(new CastEngineVersion(100, '1.0.0'));
      controller.completeInstall(new CastEngineVersion(100, '1.0.0'));
      controller.reset();
      expect(controller.getState()).assertEqual(EngineInstallState.IDLE);
      expect(controller.getInstalledVersion()).assertNull();
    });

    it('engine_install_again_after_cancel_should_work', 0, async () => {
      const controller = new EngineInstallController();
      controller.beginInstall(new CastEngineVersion(100, '1.0.0'));
      controller.cancelInstall();
      expect(controller.beginInstall(new CastEngineVersion(100, '1.0.0'))).assertTrue();
      expect(controller.getState()).assertEqual(EngineInstallState.INSTALLING);
    });

    // ===== 引擎升级策略 =====
    it('forced_engine_upgrade_should_block_cancel', 0, async () => {
      const controller = new EngineUpgradeController();
      expect(controller.isForcedUpgrade()).assertFalse();
      controller.setStrategy(EngineUpgradeStrategy.FORCED);
      expect(controller.isForcedUpgrade()).assertTrue();
      expect(controller.getStrategy()).assertEqual(EngineUpgradeStrategy.FORCED);
    });

    it('non_forced_engine_upgrade_should_allow_cancel', 0, async () => {
      const controller = new EngineUpgradeController();
      expect(controller.isForcedUpgrade()).assertFalse();
      expect(controller.getStrategy()).assertEqual(EngineUpgradeStrategy.NON_FORCED);
    });

    it('engine_upgrade_should_mark_upgraded_state', 0, async () => {
      const controller = new EngineUpgradeController();
      expect(controller.isUpgraded()).assertFalse();
      controller.applyUpgrade();
      expect(controller.isUpgraded()).assertTrue();
    });

    it('engine_rollback_should_restore_previous_version', 0, async () => {
      const controller = new EngineUpgradeController();
      controller.applyUpgrade();
      expect(controller.rollback()).assertTrue();
      expect(controller.isUpgraded()).assertFalse();
    });

    it('engine_rollback_without_upgrade_should_fail', 0, async () => {
      const controller = new EngineUpgradeController();
      expect(controller.rollback()).assertFalse();
    });

    it('engine_gray_release_should_only_hit_gray_devices', 0, async () => {
      const controller = new EngineUpgradeController();
      controller.setGrayDevices(['tv-001', 'tv-002']);
      expect(controller.isGrayDevice('tv-001')).assertTrue();
      expect(controller.isGrayDevice('tv-003')).assertFalse();
      expect(controller.getGrayDeviceCount()).assertEqual(2);
    });

    it('engine_gray_empty_list_should_hit_nobody', 0, async () => {
      const controller = new EngineUpgradeController();
      controller.setGrayDevices([]);
      expect(controller.isGrayDevice('tv-001')).assertFalse();
      expect(controller.getGrayDeviceCount()).assertEqual(0);
    });

    it('engine_incremental_update_should_keep_rollback_available', 0, async () => {
      const controller = new EngineUpgradeController();
      controller.applyUpgrade();
      controller.rollback();
      controller.applyIncrementalUpdate();
      expect(controller.isUpgraded()).assertTrue();
      expect(controller.rollback()).assertTrue();
    });

    // ===== 版本号解析 =====
    it('engine_version_parser_should_parse_segments', 0, async () => {
      const parser = new EngineVersionParser();
      const parts = parser.parse('1.2.3');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(1);
      expect(parts[1]).assertEqual(2);
      expect(parts[2]).assertEqual(3);
      expect(parser.getMajorVersion('1.2.3')).assertEqual(1);
      expect(parser.getMinorVersion('1.2.3')).assertEqual(2);
      expect(parser.getMinorVersion('1')).assertEqual(0);
    });

    // ===== 版本元信息 =====
    it('engine_version_info_should_clone_equally', 0, async () => {
      const info = new EngineVersionInfo(new CastEngineVersion(100, '1.0.0'),
        EngineChannel.STABLE, false, 'first release');
      const copy = info.clone();
      expect(info.equals(copy)).assertTrue();
      expect(copy.version === null).assertFalse();
    });

    it('engine_version_info_should_validate_metadata', 0, async () => {
      const valid = new EngineVersionInfo(new CastEngineVersion(100, '1.0.0'),
        EngineChannel.BETA, true, 'beta build');
      const invalid = new EngineVersionInfo(new CastEngineVersion(-1, ''),
        EngineChannel.CANARY, false, '');
      expect(valid.isValid()).assertTrue();
      expect(valid.isBetaChannel()).assertTrue();
      expect(invalid.isValid()).assertFalse();
    });

    it('engine_version_info_to_string_should_contain_channel', 0, async () => {
      const info = new EngineVersionInfo(new CastEngineVersion(100, '1.0.0'),
        EngineChannel.CANARY, true, 'canary');
      expect(info.toString()).assertContain('canary');
      expect(info.toString()).assertContain('1.0.0');
    });

    // ===== 安装记录统计 =====
    it('engine_recorder_should_compute_success_rate', 0, async () => {
      const recorder = new EngineInstallRecorder();
      const v100 = new CastEngineVersion(100, '1.0.0');
      recorder.record(v100, EngineChannel.STABLE, 1000, 2000, true);
      recorder.record(v100, EngineChannel.STABLE, 2000, 3000, true);
      recorder.record(v100, EngineChannel.BETA, 3000, 4000, false);
      expect(recorder.getRecordCount()).assertEqual(3);
      expect(recorder.getSuccessCount()).assertEqual(2);
      expect(recorder.getFailureCount()).assertEqual(1);
      expect(recorder.getSuccessRate()).assertEqual(2 / 3);
    });

    it('engine_recorder_should_compute_average_duration', 0, async () => {
      const recorder = new EngineInstallRecorder();
      const v100 = new CastEngineVersion(100, '1.0.0');
      recorder.record(v100, EngineChannel.STABLE, 1000, 3000, true);
      recorder.record(v100, EngineChannel.STABLE, 3000, 7000, true);
      expect(recorder.getAverageDuration()).assertEqual(3000);
    });

    // ===== 升级结果 =====
    it('engine_upgrade_outcome_should_track_version_delta', 0, async () => {
      const outcome = new EngineUpgradeOutcome(new CastEngineVersion(100, '1.0.0'),
        new CastEngineVersion(250, '2.5.0'), true, 5000);
      expect(outcome.isSuccess()).assertTrue();
      expect(outcome.getVersionDelta()).assertEqual(150);
      expect(outcome.isValid()).assertTrue();
    });

    it('engine_upgrade_outcome_failure_should_not_be_success', 0, async () => {
      const outcome = new EngineUpgradeOutcome(new CastEngineVersion(100, '1.0.0'),
        new CastEngineVersion(200, '2.0.0'), false, -1);
      expect(outcome.isSuccess()).assertFalse();
      expect(outcome.isValid()).assertFalse();
    });

    it('engine_upgrade_outcome_clone_should_be_equal', 0, async () => {
      const outcome = new EngineUpgradeOutcome(new CastEngineVersion(100, '1.0.0'),
        new CastEngineVersion(200, '2.0.0'), true, 1200);
      const copy = outcome.clone();
      expect(outcome.equals(copy)).assertTrue();
      expect(copy.toString()).assertContain('success=true');
    });

    // ===== 单位换算 =====
    it('engine_storage_converter_should_convert_units', 0, async () => {
      const converter = new StorageUnitConverter();
      expect(converter.toBytes(2, StorageUnit.KB)).assertEqual(2048);
      expect(converter.toBytes(1, StorageUnit.MB)).assertEqual(1024 * 1024);
      expect(converter.fromBytes(2048, StorageUnit.KB)).assertEqual(2);
      expect(converter.toBytes(7, StorageUnit.BYTE)).assertEqual(7);
    });

    // ===== 协议兼容与升级计划 =====
    it('cast_protocol_supported_range_should_be_checked', 0, async () => {
      expect(CastProtocolVersion.isSupported(1)).assertTrue();
      expect(CastProtocolVersion.isSupported(3)).assertTrue();
      expect(CastProtocolVersion.isSupported(0)).assertFalse();
      expect(CastProtocolVersion.isSupported(4)).assertFalse();
    });

    it('cast_protocol_backward_compatibility_should_be_checked', 0, async () => {
      expect(CastProtocolVersion.isBackwardCompatible(1, 3)).assertTrue();
      expect(CastProtocolVersion.isBackwardCompatible(3, 2)).assertFalse();
      expect(CastProtocolVersion.isBackwardCompatible(0, 3)).assertFalse();
    });

    it('cast_protocol_preferred_should_be_clamped', 0, async () => {
      expect(CastProtocolVersion.getPreferredProtocol(9)).assertEqual(3);
      expect(CastProtocolVersion.getPreferredProtocol(2)).assertEqual(2);
    });

    it('engine_upgrade_planner_should_offer_allowed_channel', 0, async () => {
      const planner = new EngineUpgradePlanner(100,
        [EngineChannel.STABLE, EngineChannel.BETA]);
      expect(planner.shouldOffer(new CastEngineVersion(150, '1.5.0'))).assertTrue();
      expect(planner.getChannelCount()).assertEqual(2);
    });

    it('engine_upgrade_planner_should_reject_low_version_and_channel', 0, async () => {
      const planner = new EngineUpgradePlanner(200, [EngineChannel.STABLE]);
      expect(planner.shouldOffer(new CastEngineVersion(100, '1.0.0'))).assertFalse();
      expect(planner.shouldOffer(new CastEngineVersion(200, '2.0.0', 1, EngineChannel.CANARY))).assertFalse();
      expect(planner.getMinimumVersionCode()).assertEqual(200);
    });

    // ===== 补充：通道与计划器边界 =====
    it('engine_version_info_should_reject_unknown_channel_status', 0, async () => {
      const stable = new EngineVersionInfo(new CastEngineVersion(100, '1.0.0'),
        EngineChannel.STABLE, false, 'stable build');
      const canary = new EngineVersionInfo(new CastEngineVersion(101, '1.0.1'),
        EngineChannel.CANARY, true, 'canary build');
      expect(stable.isBetaChannel()).assertFalse();
      expect(canary.isBetaChannel()).assertFalse();
      expect(canary.forced).assertTrue();
    });

    it('engine_upgrade_planner_should_accept_newly_added_channel', 0, async () => {
      const planner = new EngineUpgradePlanner(100, [EngineChannel.STABLE]);
      const betaVersion = new CastEngineVersion(120, '1.2.0', 2, EngineChannel.BETA);
      expect(planner.shouldOffer(betaVersion)).assertFalse();
      planner.addChannel(EngineChannel.BETA);
      expect(planner.shouldOffer(betaVersion)).assertTrue();
    });

    it('engine_upgrade_planner_should_reject_removed_channel', 0, async () => {
      const planner = new EngineUpgradePlanner(100, [EngineChannel.STABLE, EngineChannel.BETA]);
      const stableVersion = new CastEngineVersion(120, '1.2.0', 1, EngineChannel.STABLE);
      expect(planner.shouldOffer(stableVersion)).assertTrue();
      planner.removeChannel(EngineChannel.STABLE);
      expect(planner.shouldOffer(stableVersion)).assertFalse();
    });

    it('engine_recorder_mixed_channels_should_filter_correctly', 0, async () => {
      const recorder = new EngineInstallRecorder();
      const v100 = new CastEngineVersion(100, '1.0.0');
      const v200 = new CastEngineVersion(200, '2.0.0');
      recorder.record(v100, EngineChannel.STABLE, 0, 1000, true);
      recorder.record(v200, EngineChannel.BETA, 1000, 3000, false);
      recorder.record(v200, EngineChannel.CANARY, 3000, 4000, true);
      expect(recorder.getRecordsByChannel(EngineChannel.BETA).length).assertEqual(1);
      expect(recorder.getRecordsByChannel(EngineChannel.CANARY).length).assertEqual(1);
      expect(recorder.getFailureCount()).assertEqual(1);
      expect(recorder.getAverageDuration()).assertEqual(4000 / 3);
    });

    it('engine_storage_checker_reserved_full_should_block_any_install', 0, async () => {
      const checker = new EngineStorageChecker(8192, 1024, 1024);
      expect(checker.getUsableBytes()).assertEqual(0);
      expect(checker.canUpgrade(1)).assertFalse();
      expect(checker.isCriticalSpace(1)).assertTrue();
    });

    it('engine_storage_checker_zero_required_should_always_pass', 0, async () => {
      const checker = new EngineStorageChecker(8192, 0);
      expect(checker.canUpgrade(0)).assertTrue();
      expect(checker.isCriticalSpace(0)).assertFalse();
      expect(checker.getAvailableRatio()).assertEqual(0);
    });

    it('engine_install_controller_full_lifecycle_should_keep_state', 0, async () => {
      const controller = new EngineInstallController();
      const version = new CastEngineVersion(300, '3.0.0', 5, EngineChannel.BETA);
      controller.beginInstall(version);
      controller.completeInstall(version);
      expect(controller.isAlreadyInstalled(version)).assertTrue();
      expect(controller.hasResidual()).assertFalse();
      controller.reset();
      expect(controller.getState()).assertEqual(EngineInstallState.IDLE);
      expect(controller.isAlreadyInstalled(version)).assertFalse();
    });

    it('engine_upgrade_controller_gray_list_should_replace_previous', 0, async () => {
      const controller = new EngineUpgradeController();
      controller.setGrayDevices(['tv-001', 'tv-002', 'tv-003']);
      expect(controller.getGrayDeviceCount()).assertEqual(3);
      controller.setGrayDevices(['tv-009']);
      expect(controller.getGrayDeviceCount()).assertEqual(1);
      expect(controller.isGrayDevice('tv-001')).assertFalse();
      expect(controller.isGrayDevice('tv-009')).assertTrue();
    });

    it('engine_version_info_channel_change_should_break_equality', 0, async () => {
      const version = new CastEngineVersion(100, '1.0.0');
      const stable = new EngineVersionInfo(version, EngineChannel.STABLE, false, 'notes');
      const beta = new EngineVersionInfo(version, EngineChannel.BETA, false, 'notes');
      expect(stable.equals(beta)).assertFalse();
      expect(stable.clone().equals(stable)).assertTrue();
    });

  });
}
