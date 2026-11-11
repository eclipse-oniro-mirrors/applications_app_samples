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

/**
 * TestHelper - Encapsulates common test operations for ScreenLockFile test suites.
 * Provides high-level utilities for API testing, state management, and validation.
 */

import { screenLockFileManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { PairingCounts, SharedDriverExt } from './SharedDriverExt';
import {
  DOMAIN, TAG,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED,
  RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED,
  MAX_HISTORY_SIZE, API_CALL_INTERVAL, STRESS_TEST_ITERATIONS
} from './TestConstants';

export interface ApiCallResult {
  success: boolean;
  errorCode: number;
  errorMessage: string;
  timestamp: number;
}

export interface StateSnapshot {
  keyStatus: number;
  operationResult: string;
  pairingText: string;
  historyEmpty: boolean;
}

export interface LatencyStats {
  min: number;
  max: number;
  avg: number;
  count: number;
}

export class TestHelper {
  private driver: SharedDriver;
  private extDriver: SharedDriverExt;

  constructor(driver: SharedDriver) {
    this.driver = driver;
    this.extDriver = new SharedDriverExt(driver);
  }

  getExtDriver(): SharedDriverExt {
    return this.extDriver;
  }

  getDriver(): SharedDriver {
    return this.driver;
  }

  queryKeyState(): ApiCallResult {
    const result: ApiCallResult = {
      success: false,
      errorCode: 0,
      errorMessage: '',
      timestamp: Date.now()
    };
    try {
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      result.success = status === KEY_STATUS_NOT_EXIST ||
        status === KEY_STATUS_RELEASED ||
        status === KEY_STATUS_EXIST;
      result.errorCode = 0;
      result.errorMessage = `KeyStatus=${status}`;
      hilog.info(DOMAIN, TAG, 'queryKeyState succeeded: status=%{public}d', status);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      result.success = false;
      result.errorCode = err.code;
      result.errorMessage = err.message;
      hilog.error(DOMAIN, TAG, 'queryKeyState failed: code=%{public}d, msg=%{public}s', err.code, err.message);
    }
    return result;
  }

  acquireAccess(): ApiCallResult {
    const result: ApiCallResult = {
      success: false,
      errorCode: 0,
      errorMessage: '',
      timestamp: Date.now()
    };
    try {
      const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
      result.success = status === ACCESS_STATUS_GRANTED || status === ACCESS_STATUS_DENIED;
      result.errorCode = 0;
      result.errorMessage = `AccessStatus=${status}`;
      hilog.info(DOMAIN, TAG, 'acquireAccess succeeded: status=%{public}d', status);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      result.success = false;
      result.errorCode = err.code;
      result.errorMessage = err.message;
      hilog.error(DOMAIN, TAG, 'acquireAccess failed: code=%{public}d, msg=%{public}s', err.code, err.message);
    }
    return result;
  }

  releaseAccess(): ApiCallResult {
    const result: ApiCallResult = {
      success: false,
      errorCode: 0,
      errorMessage: '',
      timestamp: Date.now()
    };
    try {
      const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
      result.success = status === RELEASE_STATUS_GRANTED || status === RELEASE_STATUS_DENIED;
      result.errorCode = 0;
      result.errorMessage = `ReleaseStatus=${status}`;
      hilog.info(DOMAIN, TAG, 'releaseAccess succeeded: status=%{public}d', status);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      result.success = false;
      result.errorCode = err.code;
      result.errorMessage = err.message;
      hilog.error(DOMAIN, TAG, 'releaseAccess failed: code=%{public}d, msg=%{public}s', err.code, err.message);
    }
    return result;
  }

  isValidKeyStatus(status: number): boolean {
    return status === KEY_STATUS_NOT_EXIST ||
      status === KEY_STATUS_RELEASED ||
      status === KEY_STATUS_EXIST;
  }

  isValidAccessStatus(status: number): boolean {
    return status === ACCESS_STATUS_GRANTED || status === ACCESS_STATUS_DENIED;
  }

  isValidReleaseStatus(status: number): boolean {
    return status === RELEASE_STATUS_GRANTED || status === RELEASE_STATUS_DENIED;
  }

  getKeyStatusName(status: number): string {
    if (status === KEY_STATUS_NOT_EXIST) {
      return 'KEY_NOT_EXIST';
    }
    if (status === KEY_STATUS_RELEASED) {
      return 'KEY_RELEASED';
    }
    if (status === KEY_STATUS_EXIST) {
      return 'KEY_EXIST';
    }
    return 'UNKNOWN';
  }

  getAccessStatusName(status: number): string {
    if (status === ACCESS_STATUS_GRANTED) {
      return 'ACCESS_GRANTED';
    }
    if (status === ACCESS_STATUS_DENIED) {
      return 'ACCESS_DENIED';
    }
    return 'UNKNOWN';
  }

  getReleaseStatusName(status: number): string {
    if (status === RELEASE_STATUS_GRANTED) {
      return 'RELEASE_GRANTED';
    }
    if (status === RELEASE_STATUS_DENIED) {
      return 'RELEASE_DENIED';
    }
    return 'UNKNOWN';
  }

  async captureStateSnapshot(): Promise<StateSnapshot> {
    const snapshot: StateSnapshot = {
      keyStatus: KEY_STATUS_NOT_EXIST,
      operationResult: '',
      pairingText: '',
      historyEmpty: true
    };
    try {
      snapshot.keyStatus = screenLockFileManager.queryAppKeyState();
    } catch (error) {
      hilog.warn(DOMAIN, TAG, 'captureStateSnapshot: queryAppKeyState failed');
    }
    snapshot.operationResult = await this.extDriver.getOperationResult();
    snapshot.pairingText = await this.extDriver.getPairingStatusText();
    snapshot.historyEmpty = await this.extDriver.isHistoryEmpty();
    return snapshot;
  }

  async resetToCleanState(): Promise<void> {
    await this.extDriver.clearHistoryAndWait();
    await this.extDriver.waitTimeout();
  }

  async performAcquireReleaseCycle(): Promise<boolean> {
    const acquireResult: ApiCallResult = this.acquireAccess();
    if (!acquireResult.success || acquireResult.errorCode !== 0) {
      hilog.info(DOMAIN, TAG, 'acquireAccess denied or failed, skipping release');
      return false;
    }
    const releaseResult: ApiCallResult = this.releaseAccess();
    return releaseResult.success;
  }

  async measureApiLatency(apiCall: () => void, iterations: number): Promise<LatencyStats> {
    const latencies: number[] = [];
    for (let i: number = 0; i < iterations; i++) {
      const start: number = Date.now();
      apiCall();
      const end: number = Date.now();
      latencies.push(end - start);
    }
    return this.calculateLatencyStats(latencies);
  }

  private calculateLatencyStats(latencies: number[]): LatencyStats {
    const stats: LatencyStats = { min: 0, max: 0, avg: 0, count: latencies.length };
    if (latencies.length === 0) {
      return stats;
    }
    let minVal: number = latencies[0];
    let maxVal: number = latencies[0];
    let sum: number = 0;
    for (let i: number = 0; i < latencies.length; i++) {
      if (latencies[i] < minVal) {
        minVal = latencies[i];
      }
      if (latencies[i] > maxVal) {
        maxVal = latencies[i];
      }
      sum = sum + latencies[i];
    }
    stats.min = minVal;
    stats.max = maxVal;
    stats.avg = sum / latencies.length;
    return stats;
  }

  async stressTestQuery(iterations: number): Promise<boolean> {
    let allValid: boolean = true;
    for (let i: number = 0; i < iterations; i++) {
      const result: ApiCallResult = this.queryKeyState();
      if (!result.success) {
        allValid = false;
        hilog.error(DOMAIN, TAG, 'stressTestQuery failed at iteration %{public}d', i);
        break;
      }
    }
    return allValid;
  }

  async stressTestAcquireRelease(iterations: number): Promise<boolean> {
    let allValid: boolean = true;
    for (let i: number = 0; i < iterations; i++) {
      const acquireResult: ApiCallResult = this.acquireAccess();
      if (!acquireResult.success) {
        allValid = false;
        break;
      }
      const releaseResult: ApiCallResult = this.releaseAccess();
      if (!releaseResult.success) {
        allValid = false;
        break;
      }
    }
    return allValid;
  }

  async verifyStateConsistency(): Promise<boolean> {
    const status1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
    const status2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
    return status1 === status2 && this.isValidKeyStatus(status1);
  }

  async verifyHistoryLimit(): Promise<boolean> {
    await this.extDriver.clearHistoryAndWait();
    for (let i: number = 0; i < MAX_HISTORY_SIZE + 5; i++) {
      await this.extDriver.clickQueryButton();
    }
    await this.extDriver.waitTimeout();
    const isEmpty: boolean = await this.extDriver.isHistoryEmpty();
    return !isEmpty;
  }

  async verifyPairingSymmetry(): Promise<boolean> {
    await this.extDriver.clearHistoryAndWait();
    for (let i: number = 0; i < 3; i++) {
      this.acquireAccess();
    }
    for (let i: number = 0; i < 3; i++) {
      this.releaseAccess();
    }
    await this.extDriver.waitTimeout();
    const counts: PairingCounts = await this.extDriver.parsePairingCounts();
    return counts.pending === 0;
  }

  generateTestData(count: number): string[] {
    const data: string[] = [];
    for (let i: number = 0; i < count; i++) {
      data.push(`test_data_${i}_${Date.now()}`);
    }
    return data;
  }

  formatTimestamp(): string {
    const now: Date = new Date();
    const hours: string = now.getHours().toString().padStart(2, '0');
    const minutes: string = now.getMinutes().toString().padStart(2, '0');
    const seconds: string = now.getSeconds().toString().padStart(2, '0');
    return `${hours}:${minutes}:${seconds}`;
  }

  async waitForStableState(maxWaitMs: number): Promise<boolean> {
    const startTime: number = Date.now();
    let lastStatus: number = KEY_STATUS_NOT_EXIST;
    let stableCount: number = 0;
    while (Date.now() - startTime < maxWaitMs) {
      try {
        const currentStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        if (currentStatus === lastStatus) {
          stableCount = stableCount + 1;
          if (stableCount >= 3) {
            return true;
          }
        } else {
          stableCount = 0;
          lastStatus = currentStatus;
        }
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'waitForStableState: query failed');
      }
      await new Promise<void>((resolve: Function) => {
        setTimeout(() => {
          resolve();
        }, API_CALL_INTERVAL);
      });
    }
    return false;
  }
}
