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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  miracastComponentCount,
  triggerSerializedKey,
  serializedDelay,
  pressAndWait,
  waitForPageStable,
  getCurrentFocusIndex,
  checkFocusState,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

const TAG: string = 'BoundaryErrorTestingSuite';

// Boundary dimensions covered by the miracast boundary suite.
enum BoundaryCategory {
  NUMERIC = 'numeric',
  STRING = 'string',
  TEMPORAL = 'temporal',
  SPATIAL = 'spatial',
  IDENTIFIER = 'identifier'
}

// Severity of a miracast error, used to rank recovery requirements.
enum CastErrorSeverity {
  MINOR = 'minor',
  MODERATE = 'moderate',
  SEVERE = 'severe',
  CRITICAL = 'critical'
}

// Device id boundary rules of the miracast service, id length is 1 to 64.
class DeviceIdBoundaryValidator {
  public static readonly MIN_ID_LENGTH: number = 1;
  public static readonly MAX_ID_LENGTH: number = 64;

  public isLengthValid(deviceId: string): boolean {
    return deviceId.length >= DeviceIdBoundaryValidator.MIN_ID_LENGTH &&
      deviceId.length <= DeviceIdBoundaryValidator.MAX_ID_LENGTH;
  }

  public isEmpty(deviceId: string): boolean {
    return deviceId.length === 0;
  }

  public isTooLong(deviceId: string): boolean {
    return deviceId.length > DeviceIdBoundaryValidator.MAX_ID_LENGTH;
  }

  // Device ids reported by the cast engine only contain hex digits and dashes.
  public isHexLike(deviceId: string): boolean {
    if (deviceId.length === 0) {
      return false;
    }
    for (let i: number = 0; i < deviceId.length; i++) {
      const code: number = deviceId.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isLower: boolean = code >= 97 && code <= 102;
      const isUpper: boolean = code >= 65 && code <= 70;
      const isDash: boolean = code === 45;
      if (!isDigit && !isLower && !isUpper && !isDash) {
        return false;
      }
    }
    return true;
  }

  public hasWhitespace(deviceId: string): boolean {
    for (let i: number = 0; i < deviceId.length; i++) {
      const code: number = deviceId.charCodeAt(i);
      if (code === 32 || code === 9 || code === 10) {
        return true;
      }
    }
    return false;
  }

  // Trims the id and rejects it when the trimmed value is empty.
  public normalize(deviceId: string): string {
    return deviceId.trim();
  }

  public isAcceptable(deviceId: string): boolean {
    const trimmed: string = this.normalize(deviceId);
    return this.isLengthValid(trimmed) && !this.hasWhitespace(trimmed);
  }
}

// Tile count boundary model of the multi cast layout, supported range is 1 to 9.
class TileCountBoundaryModel {
  public static readonly MIN_TILES: number = 1;
  public static readonly MAX_TILES: number = 9;
  private tileCount: number;

  constructor(tileCount: number) {
    this.tileCount = tileCount;
  }

  public getTileCount(): number {
    return this.tileCount;
  }

  public isSupported(): boolean {
    return this.tileCount >= TileCountBoundaryModel.MIN_TILES &&
      this.tileCount <= TileCountBoundaryModel.MAX_TILES;
  }

  // Clamps an out of range tile count into the supported range.
  public clamp(): number {
    if (this.tileCount < TileCountBoundaryModel.MIN_TILES) {
      return TileCountBoundaryModel.MIN_TILES;
    }
    if (this.tileCount > TileCountBoundaryModel.MAX_TILES) {
      return TileCountBoundaryModel.MAX_TILES;
    }
    return this.tileCount;
  }

  public getLayoutName(): string {
    if (this.tileCount === 0) {
      return 'empty';
    }
    if (this.tileCount === 1) {
      return 'full';
    }
    if (this.tileCount === 2) {
      return 'split_two';
    }
    if (this.tileCount <= 4) {
      return 'quad';
    }
    if (this.tileCount <= 9) {
      return 'nine';
    }
    return 'overflow';
  }
}

// Classifies errCode values returned by the miracast player service.
class ServiceErrorCodeClassifier {
  public static readonly SUCCESS: number = 0;
  public static readonly FAILURE: number = -1;

  public isSuccess(errCode: number): boolean {
    return errCode === ServiceErrorCodeClassifier.SUCCESS;
  }

  public isStandardFailure(errCode: number): boolean {
    return errCode === ServiceErrorCodeClassifier.FAILURE;
  }

  public classify(errCode: number): CastErrorSeverity {
    if (errCode === ServiceErrorCodeClassifier.SUCCESS) {
      return CastErrorSeverity.MINOR;
    }
    if (errCode === ServiceErrorCodeClassifier.FAILURE) {
      return CastErrorSeverity.SEVERE;
    }
    if (errCode > 0 && errCode < 100) {
      return CastErrorSeverity.MODERATE;
    }
    return CastErrorSeverity.CRITICAL;
  }

  // Only transport failures are worth retrying, protocol errors are not.
  public isRetryable(errCode: number): boolean {
    if (this.isSuccess(errCode)) {
      return false;
    }
    return errCode === ServiceErrorCodeClassifier.FAILURE;
  }
}

// Retry backoff model of the service reconnect path, base delay is 400 ms.
class RetryBackoffModel {
  public static readonly BASE_DELAY: number = 400;
  public static readonly MAX_DELAY: number = 2000;
  public static readonly MAX_ATTEMPTS: number = 3;
  private attempts: number = 0;

  public getAttempts(): number {
    return this.attempts;
  }

  // Delay grows linearly with the attempt number and is capped at 2000 ms.
  public getDelay(attempt: number): number {
    if (attempt <= 0) {
      return RetryBackoffModel.BASE_DELAY;
    }
    const delay: number = RetryBackoffModel.BASE_DELAY * attempt;
    return delay > RetryBackoffModel.MAX_DELAY ? RetryBackoffModel.MAX_DELAY : delay;
  }

  public shouldRetry(attempt: number): boolean {
    return attempt < RetryBackoffModel.MAX_ATTEMPTS;
  }

  public recordAttempt(): number {
    this.attempts++;
    return this.attempts;
  }
}

// Screen id boundary rules used when binding a mirror player screen.
class ScreenIdBoundaryModel {
  public static readonly INVALID_SCREEN: number = -1;
  public static readonly MAX_SCREEN_ID: number = 2147483647;
  private screenId: number;

  constructor(screenId: number) {
    this.screenId = screenId;
  }

  public isBound(): boolean {
    return this.screenId >= 0;
  }

  public isValidRange(): boolean {
    return this.screenId >= 0 && this.screenId <= ScreenIdBoundaryModel.MAX_SCREEN_ID;
  }

  // An unbound screen is normalized to the invalid sentinel.
  public normalize(): number {
    if (!this.isValidRange()) {
      return ScreenIdBoundaryModel.INVALID_SCREEN;
    }
    return this.screenId;
  }

  public needsRebind(): boolean {
    return !this.isBound();
  }
}

// Validates the emitter payload of the permission result event id 1000.
class PermissionPayloadBoundaryValidator {
  public static readonly CANCEL_TYPE: number = 2;

  public isPermissionTypeValid(permissionType: number): boolean {
    return permissionType === 0 || permissionType === 1 || permissionType === 2;
  }

  public isDeviceIdValid(deviceId: string): boolean {
    return deviceId.length > 0 && deviceId.length <= 64;
  }

  public isDeviceNameValid(deviceName: string): boolean {
    return deviceName.length > 0 && deviceName.length <= 23;
  }

  public isPayloadValid(permissionType: number, deviceId: string, deviceName: string): boolean {
    return this.isPermissionTypeValid(permissionType) && this.isDeviceIdValid(deviceId) &&
      this.isDeviceNameValid(deviceName);
  }

  public isCancelled(permissionType: number): boolean {
    return permissionType === PermissionPayloadBoundaryValidator.CANCEL_TYPE;
  }
}

// Timeout boundary model, all service delays must stay inside the budget.
class TimeoutBoundaryModel {
  public static readonly SERVICE_START_DELAY: number = 8000;
  public static readonly RECONNECT_DELAY: number = 400;
  public static readonly EMITTER_DELAY: number = 500;
  public static readonly SCREEN_BIND_TIMEOUT: number = 1500;

  public isServiceStartDelayValid(delay: number): boolean {
    return delay >= 0 && delay <= TimeoutBoundaryModel.SERVICE_START_DELAY;
  }

  public isReconnectDelayValid(delay: number): boolean {
    return delay >= 0 && delay <= TimeoutBoundaryModel.RECONNECT_DELAY;
  }

  public isEmitterDelayValid(delay: number): boolean {
    return delay >= 0 && delay <= TimeoutBoundaryModel.EMITTER_DELAY;
  }

  public isScreenBindTimeoutValid(timeout: number): boolean {
    return timeout >= TimeoutBoundaryModel.SCREEN_BIND_TIMEOUT && timeout <= 5000;
  }
}

// Boundary case metadata, used by the statistics layer.
class BoundaryCaseModel {
  private caseId: number;
  private category: BoundaryCategory;
  private description: string;
  private expectedRecovery: boolean;
  private severity: CastErrorSeverity;

  constructor(caseId: number, category: BoundaryCategory, description: string, expectedRecovery: boolean,
    severity: CastErrorSeverity) {
    this.caseId = caseId;
    this.category = category;
    this.description = description;
    this.expectedRecovery = expectedRecovery;
    this.severity = severity;
  }

  public getCaseId(): number {
    return this.caseId;
  }

  public getCategory(): BoundaryCategory {
    return this.category;
  }

  public expectsRecovery(): boolean {
    return this.expectedRecovery;
  }

  public hasValidDescription(): boolean {
    return this.description.length > 0;
  }

  public equals(other: BoundaryCaseModel): boolean {
    return this.caseId === other.getCaseId() && this.category === other.getCategory();
  }

  public clone(): BoundaryCaseModel {
    return new BoundaryCaseModel(this.caseId, this.category, this.description, this.expectedRecovery, this.severity);
  }

  public toString(): string {
    return 'BoundaryCase(' + this.caseId + ', ' + this.category + ')';
  }
}

// Boundary execution result, judged against the expected recovery flag.
class BoundaryResultModel {
  private caseId: number;
  private passed: boolean;
  private recovered: boolean;
  private elapsedMs: number;

  constructor(caseId: number, passed: boolean, recovered: boolean, elapsedMs: number) {
    this.caseId = caseId;
    this.passed = passed;
    this.recovered = recovered;
    this.elapsedMs = elapsedMs;
  }

  public getCaseId(): number {
    return this.caseId;
  }

  public isPassed(): boolean {
    return this.passed;
  }

  public isRecovered(): boolean {
    return this.recovered;
  }
}

// Aggregates boundary cases and results into pass and recovery rates.
class BoundaryStatistics {
  private cases: BoundaryCaseModel[] = [];
  private results: BoundaryResultModel[] = [];

  public addCase(boundaryCase: BoundaryCaseModel): void {
    this.cases.push(boundaryCase.clone());
  }

  public addResult(result: BoundaryResultModel): void {
    this.results.push(result);
  }

  public clear(): void {
    this.cases = [];
    this.results = [];
  }

  public getCaseCount(): number {
    return this.cases.length;
  }

  public getResultCount(): number {
    return this.results.length;
  }

  public getPassRate(): number {
    if (this.results.length === 0) {
      return 0;
    }
    let passed: number = 0;
    for (const result of this.results) {
      if (result.isPassed()) {
        passed++;
      }
    }
    return passed / this.results.length;
  }

  public getRecoveryRate(): number {
    if (this.results.length === 0) {
      return 0;
    }
    let recovered: number = 0;
    for (const result of this.results) {
      if (result.isRecovered()) {
        recovered++;
      }
    }
    return recovered / this.results.length;
  }

  public getCaseCountByCategory(category: BoundaryCategory): number {
    let count: number = 0;
    for (const boundaryCase of this.cases) {
      if (boundaryCase.getCategory() === category) {
        count++;
      }
    }
    return count;
  }
}

// Boundary raw value provider, records extreme strings used by the suite.
class BoundaryDataProvider {
  private values: string[] = [];

  public provide(rawValue: string): void {
    this.values.push(rawValue);
  }

  public clear(): void {
    this.values = [];
  }

  public getValueCount(): number {
    return this.values.length;
  }

  public getMaxRawLength(): number {
    let maxLength: number = 0;
    for (const value of this.values) {
      if (value.length > maxLength) {
        maxLength = value.length;
      }
    }
    return maxLength;
  }

  public countOfLength(targetLength: number): number {
    let count: number = 0;
    for (const value of this.values) {
      if (value.length === targetLength) {
        count++;
      }
    }
    return count;
  }

  // Builds a repeated character string used for length boundary probes.
  public buildRepeated(character: string, repeat: number): string {
    let result: string = '';
    for (let i: number = 0; i < repeat; i++) {
      result += character;
    }
    return result;
  }
}

export default function boundaryErrorTestingSuite(): void {
  describe('BoundaryErrorTesting_Suite', () => {
    let driver: Driver;
    let provider: BoundaryDataProvider;

    beforeAll(async () => {
      driver = getDriver();
      provider = new BoundaryDataProvider();
      Log.info(TAG, 'suite start');
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      Log.info(TAG, 'suite end');
    });
    it('device_id_empty_should_be_rejected', 0, async () => {
      const validator = new DeviceIdBoundaryValidator();
      expect(validator.isEmpty('')).assertTrue();
      expect(validator.isLengthValid('')).assertFalse();
      expect(validator.isAcceptable('')).assertFalse();
      expect(validator.isHexLike('')).assertFalse();
    });

    it('device_id_max_length_should_be_accepted', 0, async () => {
      const validator = new DeviceIdBoundaryValidator();
      const maxId: string = provider.buildRepeated('a', DeviceIdBoundaryValidator.MAX_ID_LENGTH);
      expect(maxId.length).assertEqual(64);
      expect(validator.isLengthValid(maxId)).assertTrue();
      expect(validator.isTooLong(maxId)).assertFalse();
      expect(validator.isAcceptable(maxId)).assertTrue();
    });

    it('device_id_over_max_length_should_be_rejected', 0, async () => {
      const validator = new DeviceIdBoundaryValidator();
      const overId: string = provider.buildRepeated('b', 65);
      expect(overId.length).assertEqual(65);
      expect(validator.isTooLong(overId)).assertTrue();
      expect(validator.isLengthValid(overId)).assertFalse();
      expect(validator.isAcceptable(overId)).assertFalse();
    });

    it('device_id_hex_like_should_be_detected', 0, async () => {
      const validator = new DeviceIdBoundaryValidator();
      expect(validator.isHexLike('a1b2c3')).assertTrue();
      expect(validator.isHexLike('A1B2C3')).assertTrue();
      expect(validator.isHexLike('a1-b2')).assertTrue();
      expect(validator.isHexLike('a1g2')).assertFalse();
      expect(validator.isHexLike('device 1')).assertFalse();
    });

    it('device_id_normalize_should_trim_padding', 0, async () => {
      const validator = new DeviceIdBoundaryValidator();
      expect(validator.normalize('  bd12  ')).assertEqual('bd12');
      expect(validator.normalize('   ')).assertEqual('');
      expect(validator.isAcceptable('  bd12  ')).assertTrue();
    });

    it('tile_count_zero_should_be_unsupported', 0, async () => {
      const model = new TileCountBoundaryModel(0);
      expect(model.isSupported()).assertFalse();
      expect(model.getLayoutName()).assertEqual('empty');
      expect(model.clamp()).assertEqual(1);
    });

    it('tile_count_one_should_be_full_layout', 0, async () => {
      const model = new TileCountBoundaryModel(1);
      expect(model.isSupported()).assertTrue();
      expect(model.getLayoutName()).assertEqual('full');
      expect(model.clamp()).assertEqual(1);
    });

    it('tile_count_nine_should_be_nine_layout', 0, async () => {
      const model = new TileCountBoundaryModel(MAX_MIRROR_TILES);
      expect(model.getTileCount()).assertEqual(9);
      expect(model.isSupported()).assertTrue();
      expect(model.getLayoutName()).assertEqual('nine');
      expect(model.clamp()).assertEqual(9);
    });

    it('tile_count_ten_should_be_overflow', 0, async () => {
      const model = new TileCountBoundaryModel(10);
      expect(model.isSupported()).assertFalse();
      expect(model.getLayoutName()).assertEqual('overflow');
      expect(model.clamp()).assertEqual(9);
    });

    it('tile_count_two_and_four_should_use_expected_layout', 0, async () => {
      expect(new TileCountBoundaryModel(2).getLayoutName()).assertEqual('split_two');
      expect(new TileCountBoundaryModel(3).getLayoutName()).assertEqual('quad');
      expect(new TileCountBoundaryModel(4).getLayoutName()).assertEqual('quad');
      expect(new TileCountBoundaryModel(5).getLayoutName()).assertEqual('nine');
    });

    it('success_code_should_be_minor', 0, async () => {
      const classifier = new ServiceErrorCodeClassifier();
      expect(classifier.isSuccess(0)).assertTrue();
      expect(classifier.classify(0)).assertEqual(CastErrorSeverity.MINOR);
      expect(classifier.isRetryable(0)).assertFalse();
    });

    it('failure_code_should_be_severe_and_retryable', 0, async () => {
      const classifier = new ServiceErrorCodeClassifier();
      expect(classifier.isStandardFailure(-1)).assertTrue();
      expect(classifier.classify(-1)).assertEqual(CastErrorSeverity.SEVERE);
      expect(classifier.isRetryable(-1)).assertTrue();
      expect(classifier.isSuccess(-1)).assertFalse();
    });

    it('retry_delay_should_grow_linearly', 0, async () => {
      const backoff = new RetryBackoffModel();
      expect(backoff.getDelay(1)).assertEqual(400);
      expect(backoff.getDelay(2)).assertEqual(800);
      expect(backoff.getDelay(3)).assertEqual(1200);
    });

    it('retry_should_stop_after_three_attempts', 0, async () => {
      const backoff = new RetryBackoffModel();
      expect(backoff.shouldRetry(0)).assertTrue();
      expect(backoff.shouldRetry(2)).assertTrue();
      expect(backoff.shouldRetry(3)).assertFalse();
      expect(backoff.shouldRetry(4)).assertFalse();
    });

    it('retry_attempts_should_be_recorded', 0, async () => {
      const backoff = new RetryBackoffModel();
      expect(backoff.getAttempts()).assertEqual(0);
      expect(backoff.recordAttempt()).assertEqual(1);
      expect(backoff.recordAttempt()).assertEqual(2);
      expect(backoff.getAttempts()).assertEqual(2);
    });


    it('screen_id_zero_should_be_bound', 0, async () => {
      const screen = new ScreenIdBoundaryModel(0);
      expect(screen.isBound()).assertTrue();
      expect(screen.isValidRange()).assertTrue();
      expect(screen.normalize()).assertEqual(0);
      expect(screen.needsRebind()).assertFalse();
    });


    it('permission_type_forever_should_be_valid', 0, async () => {
      const validator = new PermissionPayloadBoundaryValidator();
      expect(validator.isPermissionTypeValid(0)).assertTrue();
      expect(validator.isPermissionTypeValid(1)).assertTrue();
      expect(validator.isCancelled(0)).assertFalse();
    });

    it('payload_empty_device_id_should_be_rejected', 0, async () => {
      const validator = new PermissionPayloadBoundaryValidator();
      expect(validator.isDeviceIdValid('')).assertFalse();
      expect(validator.isDeviceIdValid('bd12')).assertTrue();
      expect(validator.isPayloadValid(0, '', 'TV')).assertFalse();
      expect(validator.isPayloadValid(0, 'bd12', 'TV')).assertTrue();
    });

    it('payload_device_name_over_23_should_be_rejected', 0, async () => {
      const validator = new PermissionPayloadBoundaryValidator();
      const name23: string = provider.buildRepeated('n', 23);
      const name24: string = provider.buildRepeated('n', 24);
      expect(validator.isDeviceNameValid(name23)).assertTrue();
      expect(validator.isDeviceNameValid(name24)).assertFalse();
      expect(validator.isPayloadValid(1, 'bd12', name24)).assertFalse();
    });

    it('service_start_delay_boundary_should_be_valid', 0, async () => {
      const model = new TimeoutBoundaryModel();
      expect(model.isServiceStartDelayValid(0)).assertTrue();
      expect(model.isServiceStartDelayValid(8000)).assertTrue();
      expect(model.isServiceStartDelayValid(7999)).assertTrue();
      expect(model.isServiceStartDelayValid(8001)).assertFalse();
    });

    it('reconnect_delay_boundary_should_be_valid', 0, async () => {
      const model = new TimeoutBoundaryModel();
      expect(model.isReconnectDelayValid(400)).assertTrue();
      expect(model.isReconnectDelayValid(401)).assertFalse();
      expect(model.isReconnectDelayValid(0)).assertTrue();
      expect(model.isReconnectDelayValid(-400)).assertFalse();
    });

    it('emitter_and_screen_timeouts_should_be_valid', 0, async () => {
      const model = new TimeoutBoundaryModel();
      expect(model.isEmitterDelayValid(500)).assertTrue();
      expect(model.isEmitterDelayValid(501)).assertFalse();
      expect(model.isScreenBindTimeoutValid(1500)).assertTrue();
      expect(model.isScreenBindTimeoutValid(1499)).assertFalse();
      expect(model.isScreenBindTimeoutValid(5000)).assertTrue();
      expect(model.isScreenBindTimeoutValid(5001)).assertFalse();
    });

    it('boundary_case_model_should_clone', 0, async () => {
      const original = new BoundaryCaseModel(7, BoundaryCategory.IDENTIFIER, 'device id length', true,
        CastErrorSeverity.MODERATE);
      const cloned: BoundaryCaseModel = original.clone();
      expect(original.equals(cloned)).assertTrue();
      expect(cloned.getCaseId()).assertEqual(7);
      expect(cloned.getCategory()).assertEqual(BoundaryCategory.IDENTIFIER);
      expect(cloned.expectsRecovery()).assertTrue();
      expect(cloned.hasValidDescription()).assertTrue();
      expect(cloned.toString().includes('identifier')).assertTrue();
    });

    it('boundary_statistics_should_compute_rates', 0, async () => {
      const stats = new BoundaryStatistics();
      stats.addCase(new BoundaryCaseModel(1, BoundaryCategory.NUMERIC, 'a', true, CastErrorSeverity.MINOR));
      stats.addCase(new BoundaryCaseModel(2, BoundaryCategory.NUMERIC, 'b', true, CastErrorSeverity.MINOR));
      stats.addCase(new BoundaryCaseModel(3, BoundaryCategory.STRING, 'c', false, CastErrorSeverity.SEVERE));
      stats.addResult(new BoundaryResultModel(1, true, true, 10));
      stats.addResult(new BoundaryResultModel(2, true, false, 20));
      stats.addResult(new BoundaryResultModel(3, false, true, 30));
      expect(stats.getCaseCount()).assertEqual(3);
      expect(stats.getResultCount()).assertEqual(3);
      expect(stats.getCaseCountByCategory(BoundaryCategory.NUMERIC)).assertEqual(2);
      expect(stats.getPassRate()).assertEqual(2 / 3);
      expect(stats.getRecoveryRate()).assertEqual(2 / 3);
      stats.clear();
      expect(stats.getCaseCount()).assertEqual(0);
      expect(stats.getPassRate()).assertEqual(0);
      expect(stats.getRecoveryRate()).assertEqual(0);
    });

    it('boundary_data_provider_should_track_lengths', 0, async () => {
      provider.clear();
      provider.provide('a');
      provider.provide('abcd');
      provider.provide('');
      expect(provider.getValueCount()).assertEqual(3);
      expect(provider.getMaxRawLength()).assertEqual(4);
      expect(provider.countOfLength(0)).assertEqual(1);
      expect(provider.countOfLength(4)).assertEqual(1);
      expect(provider.buildRepeated('x', 3)).assertEqual('xxx');
    });



  });
}
