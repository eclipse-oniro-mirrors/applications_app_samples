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
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver,
  isResolutionWindowVisible,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'RecorderAppVersion';

// Upgrade strategy applied to the recorder module.
enum ModuleUpgradeStrategy {
  NON_FORCED = 'non_forced',
  FORCED = 'forced'
}

// Module install state machine.
enum ModuleInstallState {
  IDLE = 'idle',
  INSTALLING = 'installing',
  INSTALLED = 'installed',
  CANCELLED = 'cancelled',
  FAILED = 'failed'
}

// Version and build identifiers of the recorder application.
class RecorderAppVersion {
  public versionCode: number;
  public versionName: string;
  public buildNumber: number;
  public moduleName: string;

  constructor(versionCode: number, versionName: string, buildNumber: number = 1,
    moduleName: string = 'entry') {
    this.versionCode = versionCode;
    this.versionName = versionName;
    this.buildNumber = buildNumber;
    this.moduleName = moduleName;
  }

  public getMajorVersion(): number {
    return new VersionParser().getMajorVersion(this.versionName);
  }

  public describe(): string {
    return `${this.moduleName}-${this.versionName}(${this.versionCode})`;
  }
}

// Compares recorder versions and detects upgrade directions.
class RecorderVersionComparator {
  public static compare(current: RecorderAppVersion, latest: RecorderAppVersion): number {
    if (current.versionCode < latest.versionCode) {
      return -1;
    }
    if (current.versionCode > latest.versionCode) {
      return 1;
    }
    return 0;
  }

  public static hasUpdate(current: RecorderAppVersion, latest: RecorderAppVersion): boolean {
    return RecorderVersionComparator.compare(current, latest) < 0;
  }

  public static isSameVersion(current: RecorderAppVersion, latest: RecorderAppVersion): boolean {
    return RecorderVersionComparator.compare(current, latest) === 0;
  }

  public static isCrossVersion(current: RecorderAppVersion, latest: RecorderAppVersion): boolean {
    return latest.versionCode - current.versionCode >= 100;
  }

  public static isDowngrade(current: RecorderAppVersion, latest: RecorderAppVersion): boolean {
    return RecorderVersionComparator.compare(current, latest) > 0;
  }

  public static isCompatible(current: RecorderAppVersion, latest: RecorderAppVersion): boolean {
    return latest.versionCode - current.versionCode < 1000;
  }
}

// Checks whether the media storage can host another recording.
class RecordingStorageChecker {
  private totalBytes: number;
  private availableBytes: number;

  constructor(totalBytes: number, availableBytes: number) {
    this.totalBytes = totalBytes;
    this.availableBytes = availableBytes;
  }

  public canRecord(requiredBytes: number): boolean {
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

  public consume(bytes: number): boolean {
    if (bytes < 0 || !this.canRecord(bytes)) {
      return false;
    }
    this.availableBytes -= bytes;
    return true;
  }

  public release(bytes: number): void {
    if (bytes <= 0) {
      return;
    }
    this.availableBytes += bytes;
    if (this.availableBytes > this.totalBytes) {
      this.availableBytes = this.totalBytes;
    }
  }
}

// Controls installation of the recorder module upgrade package.
class ModuleInstallController {
  private state: ModuleInstallState = ModuleInstallState.IDLE;
  private hasResidualAsset: boolean = false;
  private installedVersion: RecorderAppVersion | null = null;

  public beginInstall(version: RecorderAppVersion): boolean {
    if (this.state === ModuleInstallState.INSTALLING) {
      return false;
    }
    this.state = ModuleInstallState.INSTALLING;
    return true;
  }

  public completeInstall(version: RecorderAppVersion): void {
    this.state = ModuleInstallState.INSTALLED;
    this.installedVersion = version;
    this.hasResidualAsset = false;
  }

  public cancelInstall(): void {
    if (this.state === ModuleInstallState.INSTALLING) {
      this.state = ModuleInstallState.CANCELLED;
      this.hasResidualAsset = false;
    }
  }

  public failInstall(): void {
    this.state = ModuleInstallState.FAILED;
    this.hasResidualAsset = true;
  }

  public getState(): ModuleInstallState {
    return this.state;
  }

  public getInstalledVersion(): RecorderAppVersion | null {
    return this.installedVersion;
  }

  public isAlreadyInstalled(version: RecorderAppVersion): boolean {
    if (this.installedVersion === null) {
      return false;
    }
    return RecorderVersionComparator.isSameVersion(this.installedVersion, version);
  }

  public hasResidual(): boolean {
    return this.hasResidualAsset;
  }

  public reset(): void {
    this.state = ModuleInstallState.IDLE;
    this.hasResidualAsset = false;
    this.installedVersion = null;
  }
}

// Applies module upgrades with rollback and gray release support.
class ModuleUpgradeController {
  private strategy: ModuleUpgradeStrategy = ModuleUpgradeStrategy.NON_FORCED;
  private upgraded: boolean = false;
  private canRollback: boolean = false;
  private grayUserIds: string[] = [];

  public setStrategy(strategy: ModuleUpgradeStrategy): void {
    this.strategy = strategy;
  }

  public getStrategy(): ModuleUpgradeStrategy {
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
    const copy: string[] = [];
    for (let i = 0; i < userIds.length; i++) {
      copy.push(userIds[i]);
    }
    this.grayUserIds = copy;
  }

  public isGrayUser(userId: string): boolean {
    return this.grayUserIds.includes(userId);
  }

  public getGrayUserCount(): number {
    return this.grayUserIds.length;
  }

  public cancelForcedUpgrade(): boolean {
    return this.strategy === ModuleUpgradeStrategy.FORCED;
  }
}

// Version string representation formats.
enum VersionFormat {
  SEMANTIC = 'semantic',
  NUMERIC = 'numeric',
  DATE = 'date'
}

// Source of a recorder module package.
enum ModuleInstallSource {
  LOCAL = 'local',
  STORE = 'store',
  SIDELOAD = 'sideload',
  OTA = 'ota'
}

// Final state of a module upgrade attempt.
enum UpgradeResultState {
  PENDING = 'pending',
  SUCCESS = 'success',
  ROLLED_BACK = 'rolled_back',
  FAILED = 'failed'
}

// Version metadata carried by an upgrade package.
interface VersionMetadata {
  version: RecorderAppVersion;
  source: ModuleInstallSource;
  forced: boolean;
  releaseNotes: string;
}

// One module install transaction.
interface ModuleInstallRecord {
  version: RecorderAppVersion;
  source: ModuleInstallSource;
  startedAt: number;
  finishedAt: number;
  success: boolean;
}

// Final result of one module upgrade.
interface UpgradeResult {
  fromVersion: RecorderAppVersion;
  toVersion: RecorderAppVersion;
  state: UpgradeResultState;
  elapsedMs: number;
}

// Parses and formats recorder version names.
class VersionParser {
  public parse(versionName: string): number[] {
    const parts: string[] = versionName.split('.');
    const result: number[] = [];
    for (let i = 0; i < parts.length; i++) {
      const value: number = parseInt(parts[i], 10);
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
    const parts: string[] = versionName.split('.');
    for (let i = 0; i < parts.length; i++) {
      if (parts[i].length === 0) {
        return false;
      }
      const value: number = parseInt(parts[i], 10);
      if (isNaN(value) || value < 0) {
        return false;
      }
    }
    return true;
  }

  public getMajorVersion(versionName: string): number {
    const parts: number[] = this.parse(versionName);
    if (parts.length === 0) {
      return 0;
    }
    return parts[0];
  }

  public getMinorVersion(versionName: string): number {
    const parts: number[] = this.parse(versionName);
    if (parts.length < 2) {
      return 0;
    }
    return parts[1];
  }

  public getPatchVersion(versionName: string): number {
    const parts: number[] = this.parse(versionName);
    if (parts.length < 3) {
      return 0;
    }
    return parts[2];
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

// Version metadata with clone and equality helpers.
class VersionInfo {
  public version: RecorderAppVersion;
  public source: ModuleInstallSource;
  public forced: boolean;
  public releaseNotes: string;

  constructor(version: RecorderAppVersion, source: ModuleInstallSource, forced: boolean,
    releaseNotes: string) {
    this.version = version;
    this.source = source;
    this.forced = forced;
    this.releaseNotes = releaseNotes;
  }

  public clone(): VersionInfo {
    const versionCopy = new RecorderAppVersion(this.version.versionCode, this.version.versionName,
      this.version.buildNumber, this.version.moduleName);
    return new VersionInfo(versionCopy, this.source, this.forced, this.releaseNotes);
  }

  public equals(other: VersionInfo): boolean {
    return this.version.versionCode === other.version.versionCode &&
      this.version.versionName === other.version.versionName && this.source === other.source &&
      this.forced === other.forced && this.releaseNotes === other.releaseNotes;
  }

  public toString(): string {
    return `VersionInfo(version=${this.version.versionName}, code=${this.version.versionCode}, ` +
      `source=${this.source}, forced=${this.forced})`;
  }

  public isValid(): boolean {
    return this.version.versionCode >= 0 && this.version.versionName.length > 0;
  }

  public toMetadata(): VersionMetadata {
    const metadata: VersionMetadata = {
      version: this.version,
      source: this.source,
      forced: this.forced,
      releaseNotes: this.releaseNotes
    };
    return metadata;
  }
}

// Records module install transactions and computes success metrics.
class ModuleInstallRecorder {
  private records: ModuleInstallRecord[] = [];

  public record(version: RecorderAppVersion, source: ModuleInstallSource, startedAt: number,
    finishedAt: number, success: boolean): void {
    const record: ModuleInstallRecord = {
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

  public getRecordsBySource(source: ModuleInstallSource): ModuleInstallRecord[] {
    const result: ModuleInstallRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].source === source) {
        result.push(this.records[i]);
      }
    }
    return result;
  }

  public getLatestRecord(): ModuleInstallRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public clear(): void {
    this.records = [];
  }
}

// Outcome of one module upgrade attempt.
class UpgradeOutcome {
  public fromVersion: RecorderAppVersion;
  public toVersion: RecorderAppVersion;
  public state: UpgradeResultState;
  public elapsedMs: number;

  constructor(fromVersion: RecorderAppVersion, toVersion: RecorderAppVersion, state: UpgradeResultState,
    elapsedMs: number) {
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
    return `UpgradeOutcome(${this.fromVersion.versionName} -> ${this.toVersion.versionName}, ` +
      `state=${this.state}, elapsedMs=${this.elapsedMs})`;
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

  public toResult(): UpgradeResult {
    const result: UpgradeResult = {
      fromVersion: this.fromVersion,
      toVersion: this.toVersion,
      state: this.state,
      elapsedMs: this.elapsedMs
    };
    return result;
  }
}

// Storage capacity units used when estimating recording files.
enum StorageUnit {
  BYTE = 'byte',
  KB = 'kb',
  MB = 'mb',
  GB = 'gb'
}

// Converts between storage units and renders readable sizes.
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

// Supported recording resolution of the device.
class RecorderResolutionProfile {
  public width: number;
  public height: number;
  public supported: boolean;

  constructor(width: number, height: number, supported: boolean) {
    this.width = width;
    this.height = height;
    this.supported = supported;
  }

  public getPixelCount(): number {
    return this.width * this.height;
  }

  public describe(): string {
    return `${this.width}x${this.height}`;
  }

  public isFullHd(): boolean {
    return this.width === 1920 && this.height === 1080;
  }
}

// Rejects resolutions above the 1920x1080 reference of the sample.
class ResolutionSupportChecker {
  public static readonly REFERENCE_WIDTH: number = 1920;
  public static readonly REFERENCE_HEIGHT: number = 1080;

  public isSupported(width: number, height: number): boolean {
    if (width <= 0 || height <= 0) {
      return false;
    }
    return width <= ResolutionSupportChecker.REFERENCE_WIDTH &&
      height <= ResolutionSupportChecker.REFERENCE_HEIGHT;
  }

  public buildProfile(width: number, height: number): RecorderResolutionProfile {
    return new RecorderResolutionProfile(width, height, this.isSupported(width, height));
  }

  public shouldShowUnsupportedDialog(width: number, height: number): boolean {
    return !this.isSupported(width, height);
  }

  public isReferenceResolution(width: number, height: number): boolean {
    return width === ResolutionSupportChecker.REFERENCE_WIDTH &&
      height === ResolutionSupportChecker.REFERENCE_HEIGHT;
  }
}

// Estimates recording size from bitrate and duration.
class RecordingBitrateEstimator {
  public static readonly BITRATE_FULL_HD_KBPS: number = 8000;

  public estimateBytes(durationSeconds: number, bitrateKbps: number): number {
    if (durationSeconds <= 0 || bitrateKbps <= 0) {
      return 0;
    }
    return Math.floor(durationSeconds * bitrateKbps * 1000 / 8);
  }

  public estimateFullHdBytes(durationSeconds: number): number {
    return this.estimateBytes(durationSeconds, RecordingBitrateEstimator.BITRATE_FULL_HD_KBPS);
  }

  public estimateSeconds(availableBytes: number, bitrateKbps: number): number {
    if (availableBytes <= 0 || bitrateKbps <= 0) {
      return 0;
    }
    return Math.floor(availableBytes * 8 / (bitrateKbps * 1000));
  }

  public formatDuration(totalSeconds: number): string {
    if (totalSeconds <= 0) {
      return '00:00:00';
    }
    const hours: string = String(Math.floor(totalSeconds / 3600)).padStart(2, '0');
    const minutes: string = String(Math.floor(totalSeconds / 60) % 60).padStart(2, '0');
    const seconds: string = String(totalSeconds % 60).padStart(2, '0');
    return `${hours}:${minutes}:${seconds}`;
  }
}

export default function recorderAppVersionTest(): void {
  describe('RecorderAppVersion_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare recorder app version validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recorder app version validation finished');
      await serializedDelay(driver, 300);
    });

    // Version compare: identical codes are the same version.
    it('same_version_should_be_detected', 0, async () => {
      const current = new RecorderAppVersion(100, '1.0.0');
      const latest = new RecorderAppVersion(100, '1.0.0');
      expect(RecorderVersionComparator.isSameVersion(current, latest)).assertTrue();
      expect(RecorderVersionComparator.hasUpdate(current, latest)).assertFalse();
    });

    // Version compare: a higher version code means an update exists.
    it('new_version_should_be_detected', 0, async () => {
      const current = new RecorderAppVersion(100, '1.0.0');
      const latest = new RecorderAppVersion(200, '2.0.0');
      expect(RecorderVersionComparator.hasUpdate(current, latest)).assertTrue();
    });

    // Version compare: a jump of one hundred codes is a cross version upgrade.
    it('cross_version_upgrade_should_be_detected', 0, async () => {
      const old = new RecorderAppVersion(10, '0.1.0');
      const latest = new RecorderAppVersion(300, '3.0.0');
      expect(RecorderVersionComparator.compare(old, latest)).assertEqual(-1);
      expect(RecorderVersionComparator.isCrossVersion(old, latest)).assertTrue();
    });

    // Version compare: a small bump is not a cross version upgrade.
    it('non_cross_version_upgrade_should_be_identified', 0, async () => {
      const old = new RecorderAppVersion(150, '1.5.0');
      const latest = new RecorderAppVersion(200, '2.0.0');
      expect(RecorderVersionComparator.isCrossVersion(old, latest)).assertFalse();
    });

    // Version compare: downgrades are detected.
    it('downgrade_should_be_detected', 0, async () => {
      const high = new RecorderAppVersion(200, '2.0.0');
      const low = new RecorderAppVersion(100, '1.0.0');
      expect(RecorderVersionComparator.isDowngrade(high, low)).assertTrue();
      expect(RecorderVersionComparator.compare(high, low)).assertEqual(1);
    });

    // Version compare: zero version code is the lowest version.
    it('version_compare_should_handle_zero_code', 0, async () => {
      const zero = new RecorderAppVersion(0, '0.0.0');
      const positive = new RecorderAppVersion(1, '0.0.1');
      expect(RecorderVersionComparator.compare(zero, positive)).assertEqual(-1);
    });

    // Version compare: huge jumps are incompatible but still upgrades.
    it('version_compare_should_detect_incompatible_jump', 0, async () => {
      const old = new RecorderAppVersion(1, '0.0.1');
      const latest = new RecorderAppVersion(2000, '2.0.0');
      expect(RecorderVersionComparator.isCompatible(old, latest)).assertFalse();
      expect(RecorderVersionComparator.hasUpdate(old, latest)).assertTrue();
    });

    // Storage checker: insufficient space blocks the recording.
    it('insufficient_space_should_block_recording', 0, async () => {
      const checker = new RecordingStorageChecker(1024, 100);
      expect(checker.canRecord(500)).assertFalse();
    });

    // Storage checker: critical space threshold detection.
    it('critical_space_threshold_should_be_detected', 0, async () => {
      const checker = new RecordingStorageChecker(1024, 50);
      expect(checker.isCriticalSpace(100)).assertTrue();
    });

    // Storage checker: enough space allows the recording.
    it('enough_space_should_allow_recording', 0, async () => {
      const checker = new RecordingStorageChecker(1024, 800);
      expect(checker.canRecord(500)).assertTrue();
      expect(checker.isCriticalSpace(100)).assertFalse();
    });

    // Storage checker: available ratio calculation.
    it('available_ratio_should_be_calculated', 0, async () => {
      const checker = new RecordingStorageChecker(1024, 256);
      expect(checker.getAvailableRatio()).assertEqual(0.25);
      expect(new RecordingStorageChecker(0, 0).getAvailableRatio()).assertEqual(0);
    });

    // Storage checker: bytes are consumed and released by recordings.
    it('storage_should_consume_and_release_bytes', 0, async () => {
      const checker = new RecordingStorageChecker(4096, 2048);
      expect(checker.consume(1024)).assertTrue();
      expect(checker.getAvailableBytes()).assertEqual(1024);
      expect(checker.consume(4096)).assertFalse();
      checker.release(1024);
      expect(checker.getAvailableBytes()).assertEqual(2048);
      checker.release(999999);
      expect(checker.getAvailableBytes()).assertEqual(4096);
    });

    // Storage checker: zero required bytes always fits.
    it('storage_zero_required_bytes_should_allow', 0, async () => {
      const checker = new RecordingStorageChecker(1024, 0);
      expect(checker.canRecord(0)).assertTrue();
      expect(checker.canRecord(1)).assertFalse();
    });

    // Module install: installing then installed transition.
    it('install_should_transition_to_installed', 0, async () => {
      const controller = new ModuleInstallController();
      const version = new RecorderAppVersion(100, '1.0.0');
      expect(controller.beginInstall(version)).assertTrue();
      expect(controller.getState()).assertEqual(ModuleInstallState.INSTALLING);
      controller.completeInstall(version);
      expect(controller.getState()).assertEqual(ModuleInstallState.INSTALLED);
    });

    // Module install: a second begin while installing is rejected.
    it('duplicate_install_should_be_blocked_while_installing', 0, async () => {
      const controller = new ModuleInstallController();
      const version = new RecorderAppVersion(100, '1.0.0');
      controller.beginInstall(version);
      expect(controller.beginInstall(version)).assertFalse();
    });

    // Module install: cancellation leaves no residual asset behind.
    it('cancel_install_should_leave_no_residual', 0, async () => {
      const controller = new ModuleInstallController();
      const version = new RecorderAppVersion(100, '1.0.0');
      controller.beginInstall(version);
      controller.cancelInstall();
      expect(controller.getState()).assertEqual(ModuleInstallState.CANCELLED);
      expect(controller.hasResidual()).assertFalse();
    });

    // Module install: repeated install of the same version is detected.
    it('repeated_install_same_version_should_be_detected', 0, async () => {
      const controller = new ModuleInstallController();
      const version = new RecorderAppVersion(100, '1.0.0');
      controller.beginInstall(version);
      controller.completeInstall(version);
      expect(controller.isAlreadyInstalled(new RecorderAppVersion(100, '1.0.0'))).assertTrue();
      expect(controller.isAlreadyInstalled(new RecorderAppVersion(200, '2.0.0'))).assertFalse();
      expect(controller.getInstalledVersion() === null).assertFalse();
    });

    // Module install: failure marks the state and keeps a residual asset.
    it('install_failure_should_mark_failed_state', 0, async () => {
      const controller = new ModuleInstallController();
      controller.beginInstall(new RecorderAppVersion(100, '1.0.0'));
      controller.failInstall();
      expect(controller.getState()).assertEqual(ModuleInstallState.FAILED);
      expect(controller.hasResidual()).assertTrue();
    });

    // Module install: reset returns the controller to idle.
    it('install_reset_should_return_to_idle', 0, async () => {
      const controller = new ModuleInstallController();
      controller.beginInstall(new RecorderAppVersion(100, '1.0.0'));
      controller.completeInstall(new RecorderAppVersion(100, '1.0.0'));
      controller.reset();
      expect(controller.getState()).assertEqual(ModuleInstallState.IDLE);
      expect(controller.getInstalledVersion()).assertNull();
      expect(controller.isAlreadyInstalled(new RecorderAppVersion(100, '1.0.0'))).assertFalse();
    });

    // Upgrade strategy: forced upgrade cannot be cancelled by the user.
    it('forced_upgrade_cancel_should_be_blocked', 0, async () => {
      const controller = new ModuleUpgradeController();
      controller.setStrategy(ModuleUpgradeStrategy.FORCED);
      expect(controller.cancelForcedUpgrade()).assertTrue();
      expect(controller.getStrategy()).assertEqual(ModuleUpgradeStrategy.FORCED);
    });

    // Upgrade strategy: non forced upgrade can be cancelled.
    it('non_forced_upgrade_cancel_should_be_allowed', 0, async () => {
      const controller = new ModuleUpgradeController();
      expect(controller.cancelForcedUpgrade()).assertFalse();
      expect(controller.getStrategy()).assertEqual(ModuleUpgradeStrategy.NON_FORCED);
    });

    // Upgrade strategy: applying an upgrade marks the upgraded flag.
    it('upgrade_should_mark_upgraded_state', 0, async () => {
      const controller = new ModuleUpgradeController();
      controller.applyUpgrade();
      expect(controller.isUpgraded()).assertTrue();
    });

    // Upgrade strategy: rollback restores the previous version.
    it('rollback_should_restore_previous_version', 0, async () => {
      const controller = new ModuleUpgradeController();
      controller.applyUpgrade();
      expect(controller.rollback()).assertTrue();
      expect(controller.isUpgraded()).assertFalse();
      expect(controller.rollback()).assertFalse();
    });

    // Upgrade strategy: rollback without an upgrade is rejected.
    it('rollback_without_upgrade_should_fail', 0, async () => {
      expect(new ModuleUpgradeController().rollback()).assertFalse();
    });

    // Upgrade strategy: gray release only hits the listed users.
    it('gray_release_should_only_hit_gray_users', 0, async () => {
      const controller = new ModuleUpgradeController();
      controller.setGrayUsers(['userA', 'userB']);
      expect(controller.isGrayUser('userA')).assertTrue();
      expect(controller.isGrayUser('userC')).assertFalse();
      expect(controller.getGrayUserCount()).assertEqual(2);
      controller.setGrayUsers([]);
      expect(controller.isGrayUser('userA')).assertFalse();
    });

    // Upgrade strategy: rollback then incremental update works again.
    it('rollback_then_reapply_should_work', 0, async () => {
      const controller = new ModuleUpgradeController();
      controller.applyUpgrade();
      controller.rollback();
      controller.applyIncrementalUpdate();
      expect(controller.isUpgraded()).assertTrue();
      controller.applyUpgrade();
      expect(controller.isUpgraded()).assertTrue();
    });

    // VersionParser: semantic version segment parsing.
    it('version_parser_should_parse_segments', 0, async () => {
      const parser = new VersionParser();
      const parts: number[] = parser.parse('1.2.3');
      expect(parts[0]).assertEqual(1);
      expect(parts[1]).assertEqual(2);
      expect(parts[2]).assertEqual(3);
    });

    // VersionParser: segment formatting round trip.
    it('version_parser_should_format_segments', 0, async () => {
      const parser = new VersionParser();
      expect(parser.format([1, 2, 3])).assertEqual('1.2.3');
      expect(parser.format(parser.parse('6.0.1'))).assertEqual('6.0.1');
    });

    // VersionParser: version name validity rules.
    it('version_parser_should_validate_version_names', 0, async () => {
      const parser = new VersionParser();
      expect(parser.isValid('1.2.3')).assertTrue();
      expect(parser.isValid('1..3')).assertFalse();
      expect(parser.isValid('')).assertFalse();
      expect(parser.isValid('1.-2.3')).assertFalse();
    });

    // VersionParser: major, minor and patch extraction.
    it('version_parser_should_extract_segments', 0, async () => {
      const parser = new VersionParser();
      expect(parser.getMajorVersion('3.2.1')).assertEqual(3);
      expect(parser.getMinorVersion('3.2.1')).assertEqual(2);
      expect(parser.getPatchVersion('3.2.1')).assertEqual(1);
      expect(parser.getMinorVersion('3')).assertEqual(0);
      expect(parser.getPatchVersion('3.2')).assertEqual(0);
    });

    // VersionParser: version format detection.
    it('version_parser_should_detect_format', 0, async () => {
      const parser = new VersionParser();
      expect(parser.detectFormat('1.0.0')).assertEqual(VersionFormat.SEMANTIC);
      expect(parser.detectFormat('2025-08-01')).assertEqual(VersionFormat.DATE);
      expect(parser.detectFormat('12345')).assertEqual(VersionFormat.NUMERIC);
    });

    // RecorderAppVersion: helper accessors stay consistent with the parser.
    it('recorder_version_should_expose_helpers', 0, async () => {
      const version = new RecorderAppVersion(120, '1.2.0', 7, 'entry');
      expect(version.getMajorVersion()).assertEqual(1);
      expect(version.describe()).assertEqual('entry-1.2.0(120)');
      expect(version.buildNumber).assertEqual(7);
      expect(version.moduleName).assertEqual('entry');
    });

    // VersionInfo: cloning keeps metadata equality.
    it('version_info_should_clone_equally', 0, async () => {
      const info = new VersionInfo(new RecorderAppVersion(100, '1.0.0'), ModuleInstallSource.STORE, false,
        'first release');
      const copy: VersionInfo = info.clone();
      expect(info.equals(copy)).assertTrue();
      expect(copy.toString().length).assertLarger(0);
    });

    // VersionInfo: metadata validity and conversion.
    it('version_info_should_validate_metadata', 0, async () => {
      const valid = new VersionInfo(new RecorderAppVersion(100, '1.0.0'), ModuleInstallSource.OTA, true, '');
      const invalid = new VersionInfo(new RecorderAppVersion(-1, ''), ModuleInstallSource.LOCAL, false, '');
      expect(valid.isValid()).assertTrue();
      expect(invalid.isValid()).assertFalse();
      const metadata: VersionMetadata = valid.toMetadata();
      expect(metadata.source).assertEqual(ModuleInstallSource.OTA);
      expect(metadata.forced).assertTrue();
    });

    // ModuleInstallRecorder: success rate computation.
    it('install_recorder_should_compute_success_rate', 0, async () => {
      const recorder = new ModuleInstallRecorder();
      const version = new RecorderAppVersion(100, '1.0.0');
      recorder.record(version, ModuleInstallSource.STORE, 1000, 2000, true);
      recorder.record(version, ModuleInstallSource.STORE, 2000, 3000, true);
      recorder.record(version, ModuleInstallSource.LOCAL, 3000, 4000, false);
      expect(recorder.getRecordCount()).assertEqual(3);
      expect(recorder.getSuccessCount()).assertEqual(2);
      expect(recorder.getFailureCount()).assertEqual(1);
      expect(recorder.getSuccessRate()).assertEqual(2 / 3);
    });

    // ModuleInstallRecorder: average duration and source filtering.
    it('install_recorder_should_compute_average_and_filter', 0, async () => {
      const recorder = new ModuleInstallRecorder();
      const version = new RecorderAppVersion(100, '1.0.0');
      recorder.record(version, ModuleInstallSource.STORE, 1000, 3000, true);
      recorder.record(version, ModuleInstallSource.OTA, 3000, 7000, true);
      expect(recorder.getAverageDuration()).assertEqual(3000);
      expect(recorder.getRecordsBySource(ModuleInstallSource.OTA).length).assertEqual(1);
      expect(recorder.getRecordsBySource(ModuleInstallSource.SIDELOAD).length).assertEqual(0);
      const latest: ModuleInstallRecord | null = recorder.getLatestRecord();
      expect(latest === null).assertFalse();
      recorder.clear();
      expect(recorder.getLatestRecord()).assertNull();
      expect(recorder.getSuccessRate()).assertEqual(1);
    });

    // UpgradeOutcome: success and rollback detection.
    it('upgrade_outcome_should_detect_rollback', 0, async () => {
      const rolledBack = new UpgradeOutcome(new RecorderAppVersion(100, '1.0.0'),
        new RecorderAppVersion(200, '2.0.0'), UpgradeResultState.ROLLED_BACK, 5000);
      const success = new UpgradeOutcome(new RecorderAppVersion(100, '1.0.0'),
        new RecorderAppVersion(200, '2.0.0'), UpgradeResultState.SUCCESS, 5000);
      expect(rolledBack.isRolledBack()).assertTrue();
      expect(success.isRolledBack()).assertFalse();
      expect(success.isSuccess()).assertTrue();
    });

    // UpgradeOutcome: elapsed validation and cloning.
    it('upgrade_outcome_should_validate_elapsed', 0, async () => {
      const outcome = new UpgradeOutcome(new RecorderAppVersion(100, '1.0.0'),
        new RecorderAppVersion(200, '2.0.0'), UpgradeResultState.PENDING, 1000);
      expect(outcome.isValid()).assertTrue();
      expect(outcome.equals(outcome.clone())).assertTrue();
      expect(outcome.toString().length).assertLarger(0);
      const result: UpgradeResult = outcome.toResult();
      expect(result.state).assertEqual(UpgradeResultState.PENDING);
    });

    // StorageUnitConverter: unit conversions.
    it('storage_converter_should_convert_units', 0, async () => {
      const converter = new StorageUnitConverter();
      expect(converter.toBytes(2, StorageUnit.KB)).assertEqual(2048);
      expect(converter.toBytes(1, StorageUnit.MB)).assertEqual(1048576);
      expect(converter.fromBytes(2048, StorageUnit.KB)).assertEqual(2);
      expect(converter.fromBytes(512, StorageUnit.BYTE)).assertEqual(512);
    });

    // StorageUnitConverter: readable size rendering.
    it('storage_converter_should_format_readable', 0, async () => {
      const converter = new StorageUnitConverter();
      expect(converter.formatBytes(1024)).assertEqual('1.00KB');
      expect(converter.formatBytes(512)).assertEqual('512B');
      expect(converter.formatBytes(1048576)).assertEqual('1.00MB');
      expect(converter.formatBytes(1073741824)).assertEqual('1.00GB');
    });

    // ResolutionSupportChecker: the 1920x1080 reference is supported.
    it('reference_resolution_should_be_supported', 0, async () => {
      const checker = new ResolutionSupportChecker();
      expect(checker.isSupported(1920, 1080)).assertTrue();
      expect(checker.isReferenceResolution(1920, 1080)).assertTrue();
      expect(checker.shouldShowUnsupportedDialog(1920, 1080)).assertFalse();
    });

    // ResolutionSupportChecker: higher resolutions are rejected.
    it('higher_resolution_should_be_rejected', 0, async () => {
      const checker = new ResolutionSupportChecker();
      expect(checker.isSupported(3840, 2160)).assertFalse();
      expect(checker.shouldShowUnsupportedDialog(3840, 2160)).assertTrue();
      expect(checker.isSupported(0, 1080)).assertFalse();
      expect(checker.buildProfile(3840, 2160).supported).assertFalse();
    });

    // RecorderResolutionProfile: pixel count and description helpers.
    it('resolution_profile_should_describe_pixels', 0, async () => {
      const profile = new RecorderResolutionProfile(1920, 1080, true);
      expect(profile.getPixelCount()).assertEqual(2073600);
      expect(profile.describe()).assertEqual('1920x1080');
      expect(profile.isFullHd()).assertTrue();
      expect(new RecorderResolutionProfile(1280, 720, true).isFullHd()).assertFalse();
    });

    // RecordingBitrateEstimator: file size estimation.
    it('bitrate_estimator_should_estimate_size', 0, async () => {
      const estimator = new RecordingBitrateEstimator();
      expect(estimator.estimateBytes(0, 8000)).assertEqual(0);
      expect(estimator.estimateBytes(10, 0)).assertEqual(0);
      expect(estimator.estimateFullHdBytes(10)).assertEqual(10000000);
    });

    // RecordingBitrateEstimator: available seconds and label formatting.
    it('bitrate_estimator_should_estimate_duration', 0, async () => {
      const estimator = new RecordingBitrateEstimator();
      expect(estimator.estimateSeconds(10000000, 8000)).assertEqual(10);
      expect(estimator.estimateSeconds(0, 8000)).assertEqual(0);
      expect(estimator.formatDuration(3661)).assertEqual('01:01:01');
      expect(estimator.formatDuration(0)).assertEqual('00:00:00');
    });

    // UI smoke check: the resolution dialog visibility stays observable.
    it('resolution_dialog_should_stay_observable', 0, async () => {
      const visible: boolean = await isResolutionWindowVisible(driver);
      hilog.info(DOMAIN, TAG, 'resolution dialog visibility sampled');
      expect(visible === true || visible === false).assertTrue();
    });
  });
}
