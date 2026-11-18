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
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  triggerMiracastHome,
  miracastComponentCount,
  isIndexPageVisible,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastErrorRecoverySuite';

const ERR_NONE: number = 0;
const ERR_FAILED: number = -1;
const ERR_SESSION_NULL: number = -2;
const ERR_SCREEN_NULL: number = -3;
const ERR_CALLER_DENIED: number = -4;

const DEVICE_NAME_MAX_LENGTH: number = 23;

interface OperationResult {
  success: boolean;
  message: string;
  errCode: number;
}

class MockCastContext {
  public valid: boolean = true;
  public callerUid: number = 1000;
  public processUid: number = 1000;

  constructor(valid: boolean) {
    this.valid = valid;
  }

  public isCallerMatched(): boolean {
    return this.callerUid === this.processUid;
  }
}

class MiracastOperationExecutor {
  private context: MockCastContext | null = null;
  private screenId: string = '';

  constructor(context: MockCastContext | null) {
    this.context = context;
  }

  public bindScreen(screenId: string): void {
    this.screenId = screenId;
  }

  public getHelper(): boolean {
    if (this.context === null) {
      return false;
    }
    return this.context.valid;
  }

  public createSession(): OperationResult {
    if (!this.getHelper()) {
      const result: OperationResult = { success: false, message: 'context is null', errCode: ERR_FAILED };
      return result;
    }
    const created: OperationResult = { success: true, message: 'session created', errCode: ERR_NONE };
    return created;
  }

  public play(): OperationResult {
    if (!this.getHelper()) {
      const result: OperationResult = { success: false, message: 'context is null', errCode: ERR_SESSION_NULL };
      return result;
    }
    if (this.screenId.length === 0) {
      const result: OperationResult = { success: false, message: 'screen is null', errCode: ERR_SCREEN_NULL };
      return result;
    }
    const started: OperationResult = { success: true, message: 'play started', errCode: ERR_NONE };
    return started;
  }

  public checkCaller(): OperationResult {
    if (this.context === null) {
      const result: OperationResult = { success: false, message: 'context is null', errCode: ERR_FAILED };
      return result;
    }
    if (!this.context.isCallerMatched()) {
      const result: OperationResult = { success: false, message: 'caller denied', errCode: ERR_CALLER_DENIED };
      return result;
    }
    const allowed: OperationResult = { success: true, message: 'caller allowed', errCode: ERR_NONE };
    return allowed;
  }

  public executeWithFault(fault: string): OperationResult {
    if (fault === 'timeout') {
      const timeout: OperationResult = { success: false, message: 'operation timeout', errCode: ERR_FAILED };
      return timeout;
    }
    if (fault === 'denied') {
      const denied: OperationResult = { success: false, message: 'access denied', errCode: ERR_CALLER_DENIED };
      return denied;
    }
    if (fault === 'panic') {
      const panic: OperationResult = { success: false, message: 'service panic', errCode: ERR_SESSION_NULL };
      return panic;
    }
    return this.createSession();
  }
}

class DeviceNameValidator {
  public static isSafeName(name: string): boolean {
    if (name.length === 0) {
      return false;
    }
    if (name.trim().length === 0) {
      return false;
    }
    if (name.includes(' ')) {
      return false;
    }
    if (name.includes('..')) {
      return false;
    }
    if (name.length > DEVICE_NAME_MAX_LENGTH) {
      return false;
    }
    return true;
  }

  public static getViolation(name: string): string {
    if (name.length === 0) {
      return 'name is empty';
    }
    if (name.trim().length === 0) {
      return 'name is blank';
    }
    if (name.includes(' ')) {
      return 'name contains space';
    }
    if (name.length > DEVICE_NAME_MAX_LENGTH) {
      return 'name too long';
    }
    if (name.includes('..')) {
      return 'name contains traversal';
    }
    return '';
  }
}

enum ErrorSeverity {
  INFO = 'info',
  WARNING = 'warning',
  CRITICAL = 'critical'
}

class ErrorEntry {
  public severity: ErrorSeverity;
  public code: number;
  public message: string;
  public timestamp: number;

  constructor(severity: ErrorSeverity, code: number, message: string, timestamp: number) {
    this.severity = severity;
    this.code = code;
    this.message = message;
    this.timestamp = timestamp;
  }

  public getSeverity(): ErrorSeverity {
    return this.severity;
  }

  public getCode(): number {
    return this.code;
  }

  public getMessage(): string {
    return this.message;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public isCritical(): boolean {
    return this.severity === ErrorSeverity.CRITICAL;
  }

  public isWarning(): boolean {
    return this.severity === ErrorSeverity.WARNING;
  }

  public clone(): ErrorEntry {
    return new ErrorEntry(this.severity, this.code, this.message, this.timestamp);
  }

  public equals(other: ErrorEntry): boolean {
    return this.severity === other.severity && this.code === other.code &&
      this.message === other.message && this.timestamp === other.timestamp;
  }

  public toString(): string {
    return `ErrorEntry{severity: ${this.severity}, code: ${this.code}, message: ${this.message}}`;
  }
}

class ErrorCatalog {
  public static createSessionNull(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.CRITICAL, 2001, 'session is null', Date.now());
  }

  public static createScreenNull(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.WARNING, 2002, 'screen is null', Date.now());
  }

  public static createTimeout(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.WARNING, 2003, 'operation timeout', Date.now());
  }

  public static createCallerDenied(): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.CRITICAL, 2004, 'caller denied', Date.now());
  }

  public static createUnknownOperation(code: number): ErrorEntry {
    return new ErrorEntry(ErrorSeverity.WARNING, code, 'unknown operation', Date.now());
  }
}

class FaultInjector {
  private injectedCount: number = 0;
  private faults: string[] = [];

  public inject(fault: string): boolean {
    this.faults.push(fault);
    this.injectedCount++;
    return this.isKnownFault(fault);
  }

  public isKnownFault(fault: string): boolean {
    return fault === 'timeout' || fault === 'denied' || fault === 'panic';
  }

  public getInjectedCount(): number {
    return this.injectedCount;
  }

  public getFaults(): string[] {
    return [...this.faults];
  }

  public hasFault(fault: string): boolean {
    return this.faults.includes(fault);
  }

  public getUnknownFaultCount(): number {
    return this.faults.filter((fault: string) => !this.isKnownFault(fault)).length;
  }

  public reset(): void {
    this.injectedCount = 0;
    this.faults = [];
  }
}

// 错误日志：单例收集运行期错误码，供恢复策略统计使用
class ErrorLogManager {
  private static instance: ErrorLogManager | null = null;
  private entries: ErrorEntry[] = [];

  public static getInstance(): ErrorLogManager {
    if (ErrorLogManager.instance === null) {
      ErrorLogManager.instance = new ErrorLogManager();
    }
    return ErrorLogManager.instance;
  }

  public add(entry: ErrorEntry): void {
    this.entries.push(entry);
  }

  public getEntries(): ErrorEntry[] {
    return [...this.entries];
  }

  public size(): number {
    return this.entries.length;
  }

  public clear(): void {
    this.entries = [];
  }
}

// 重连退避：按尝试次数线性增长，超过上限返回 -1
class ReconnectBackoff {
  private maxAttempts: number;
  private baseDelay: number;
  private attempt: number = 0;

  constructor(maxAttempts: number, baseDelay: number) {
    this.maxAttempts = maxAttempts;
    this.baseDelay = baseDelay;
  }

  public canRetry(): boolean {
    return this.attempt < this.maxAttempts;
  }

  public nextDelay(): number {
    if (!this.canRetry()) {
      return -1;
    }
    this.attempt++;
    return this.baseDelay * this.attempt;
  }

  public getAttempt(): number {
    return this.attempt;
  }

  public reset(): void {
    this.attempt = 0;
  }
}

// 错误码统计：提供极值查询，便于快速定位异常区间
class ErrorStatistics {
  private entries: ErrorEntry[] = [];

  public add(entry: ErrorEntry): void {
    this.entries.push(entry);
  }

  public getCount(): number {
    return this.entries.length;
  }

  public getMaxCode(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    let max: number = this.entries[0].getCode();
    for (let i = 1; i < this.entries.length; i++) {
      const code: number = this.entries[i].getCode();
      if (code > max) {
        max = code;
      }
    }
    return max;
  }

  public getMinCode(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    let min: number = this.entries[0].getCode();
    for (let i = 1; i < this.entries.length; i++) {
      const code: number = this.entries[i].getCode();
      if (code < min) {
        min = code;
      }
    }
    return min;
  }
}

export default function miracastErrorRecoverySuite(): void {
  describe('MiracastErrorRecovery_Test', () => {
    let driver: Driver;
    let logManager: ErrorLogManager;

    beforeAll(async () => {
      driver = getDriver();
      logManager = ErrorLogManager.getInstance();
      logManager.clear();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      logManager.clear();
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('get_helper_should_fail_when_context_is_null', 0, async () => {
      const executor = new MiracastOperationExecutor(null);
      expect(executor.getHelper()).assertFalse();
    });

    it('get_helper_should_succeed_with_valid_context', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      expect(executor.getHelper()).assertTrue();
      const invalid = new MiracastOperationExecutor(new MockCastContext(false));
      expect(invalid.getHelper()).assertFalse();
    });

    it('create_session_with_null_context_should_fail', 0, async () => {
      const executor = new MiracastOperationExecutor(null);
      const result: OperationResult = executor.createSession();
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('context is null');
      expect(result.errCode).assertEqual(ERR_FAILED);
    });

    it('create_session_with_valid_context_should_succeed', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const result: OperationResult = executor.createSession();
      expect(result.success).assertTrue();
      expect(result.errCode).assertEqual(ERR_NONE);
      expect(result.message).assertEqual('session created');
    });

    it('play_without_screen_should_return_failure', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const result: OperationResult = executor.play();
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('screen is null');
      expect(result.errCode).assertEqual(ERR_SCREEN_NULL);
    });

    it('play_with_bound_screen_should_succeed', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      executor.bindScreen('screen_1');
      const result: OperationResult = executor.play();
      expect(result.success).assertTrue();
      expect(result.errCode).assertEqual(ERR_NONE);
      expect(result.message).assertEqual('play started');
    });

    it('check_caller_should_reject_mismatched_uid', 0, async () => {
      const context = new MockCastContext(true);
      context.callerUid = 1000;
      context.processUid = 2000;
      const executor = new MiracastOperationExecutor(context);
      const result: OperationResult = executor.checkCaller();
      expect(result.success).assertFalse();
      expect(result.errCode).assertEqual(ERR_CALLER_DENIED);
      expect(result.message).assertEqual('caller denied');
    });

    it('check_caller_should_allow_matched_uid', 0, async () => {
      const context = new MockCastContext(true);
      context.callerUid = 3000;
      context.processUid = 3000;
      const executor = new MiracastOperationExecutor(context);
      const result: OperationResult = executor.checkCaller();
      expect(result.success).assertTrue();
      expect(result.errCode).assertEqual(ERR_NONE);
      expect(context.isCallerMatched()).assertTrue();
    });

    it('check_caller_should_fail_on_null_context', 0, async () => {
      const executor = new MiracastOperationExecutor(null);
      const result: OperationResult = executor.checkCaller();
      expect(result.success).assertFalse();
      expect(result.errCode).assertEqual(ERR_FAILED);
      expect(result.message).assertEqual('context is null');
    });

    it('fault_injection_timeout_should_be_handled', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const result: OperationResult = executor.executeWithFault('timeout');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('operation timeout');
      expect(result.errCode).assertEqual(ERR_FAILED);
    });

    it('fault_injection_denied_should_be_handled', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const result: OperationResult = executor.executeWithFault('denied');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('access denied');
      expect(result.errCode).assertEqual(ERR_CALLER_DENIED);
    });

    it('fault_injection_panic_should_be_handled', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const result: OperationResult = executor.executeWithFault('panic');
      expect(result.success).assertFalse();
      expect(result.message).assertEqual('service panic');
      expect(result.errCode).assertEqual(ERR_SESSION_NULL);
    });

    it('fault_injection_without_known_fault_should_succeed', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const result: OperationResult = executor.executeWithFault('none');
      expect(result.success).assertTrue();
      expect(result.errCode).assertEqual(ERR_NONE);
    });

    it('empty_device_name_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isSafeName('')).assertFalse();
      expect(DeviceNameValidator.getViolation('')).assertEqual('name is empty');
    });

    it('blank_device_name_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isSafeName('   ')).assertFalse();
      expect(DeviceNameValidator.getViolation('   ')).assertEqual('name is blank');
    });

    it('device_name_with_space_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isSafeName('My TV')).assertFalse();
      expect(DeviceNameValidator.getViolation('My TV')).assertEqual('name contains space');
    });

    it('device_name_length_should_be_limited_to_twenty_three', 0, async () => {
      const maxName: string = 'abcdefghijklmnopqrstuvw';
      expect(maxName.length).assertEqual(DEVICE_NAME_MAX_LENGTH);
      expect(DeviceNameValidator.isSafeName(maxName)).assertTrue();
      const tooLong: string = maxName + 'x';
      expect(DeviceNameValidator.isSafeName(tooLong)).assertFalse();
      expect(DeviceNameValidator.getViolation(tooLong)).assertEqual('name too long');
    });

    it('device_name_with_traversal_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isSafeName('../cast')).assertFalse();
      expect(DeviceNameValidator.isSafeName('..')).assertFalse();
      expect(DeviceNameValidator.getViolation('../cast')).assertEqual('name contains traversal');
    });

    it('safe_device_name_should_pass_validation', 0, async () => {
      expect(DeviceNameValidator.isSafeName('LivingRoomTV')).assertTrue();
      expect(DeviceNameValidator.isSafeName('Cast-01')).assertTrue();
      expect(DeviceNameValidator.getViolation('LivingRoomTV')).assertEqual('');
    });

    it('error_entry_should_clone_and_compare', 0, async () => {
      const entry = new ErrorEntry(ErrorSeverity.CRITICAL, 2001, 'session is null', 1700000000000);
      const copy: ErrorEntry = entry.clone();
      expect(entry.equals(copy)).assertTrue();
      expect(copy.isCritical()).assertTrue();
      expect(copy.isWarning()).assertFalse();
      expect(copy.getCode()).assertEqual(2001);
      expect(copy.getTimestamp()).assertEqual(1700000000000);
      expect(copy.toString().includes('session is null')).assertTrue();
      const other = new ErrorEntry(ErrorSeverity.WARNING, 2001, 'session is null', 1700000000000);
      expect(entry.equals(other)).assertFalse();
    });

    it('error_catalog_should_produce_standard_entries', 0, async () => {
      const sessionError: ErrorEntry = ErrorCatalog.createSessionNull();
      expect(sessionError.getCode()).assertEqual(2001);
      expect(sessionError.isCritical()).assertTrue();
      const screenError: ErrorEntry = ErrorCatalog.createScreenNull();
      expect(screenError.getCode()).assertEqual(2002);
      expect(screenError.isWarning()).assertTrue();
      const timeoutError: ErrorEntry = ErrorCatalog.createTimeout();
      expect(timeoutError.getCode()).assertEqual(2003);
      const deniedError: ErrorEntry = ErrorCatalog.createCallerDenied();
      expect(deniedError.getCode()).assertEqual(2004);
      expect(deniedError.isCritical()).assertTrue();
    });

    it('error_catalog_should_accept_custom_code', 0, async () => {
      const entry: ErrorEntry = ErrorCatalog.createUnknownOperation(2999);
      expect(entry.getCode()).assertEqual(2999);
      expect(entry.getMessage()).assertEqual('unknown operation');
      expect(entry.getSeverity()).assertEqual(ErrorSeverity.WARNING);
    });

    it('fault_injector_should_track_injections', 0, async () => {
      const injector = new FaultInjector();
      expect(injector.inject('timeout')).assertTrue();
      expect(injector.inject('denied')).assertTrue();
      expect(injector.inject('custom')).assertFalse();
      expect(injector.getInjectedCount()).assertEqual(3);
      expect(injector.hasFault('timeout')).assertTrue();
      expect(injector.hasFault('custom')).assertTrue();
      expect(injector.getUnknownFaultCount()).assertEqual(1);
      expect(injector.getFaults().length).assertEqual(3);
      injector.reset();
      expect(injector.getInjectedCount()).assertEqual(0);
      expect(injector.getFaults().length).assertEqual(0);
    });

    it('reconnect_backoff_should_grow_linearly', 0, async () => {
      const backoff = new ReconnectBackoff(3, 400);
      expect(backoff.canRetry()).assertTrue();
      expect(backoff.nextDelay()).assertEqual(400);
      expect(backoff.nextDelay()).assertEqual(800);
      expect(backoff.nextDelay()).assertEqual(1200);
      expect(backoff.nextDelay()).assertEqual(-1);
      expect(backoff.canRetry()).assertFalse();
      expect(backoff.getAttempt()).assertEqual(3);
      backoff.reset();
      expect(backoff.getAttempt()).assertEqual(0);
      expect(backoff.nextDelay()).assertEqual(400);
    });

    it('partial_failure_should_not_block_other_operations', 0, async () => {
      const executor = new MiracastOperationExecutor(new MockCastContext(true));
      const failed: OperationResult = executor.executeWithFault('timeout');
      executor.bindScreen('screen_partial');
      const succeeded: OperationResult = executor.play();
      expect(failed.success).assertFalse();
      expect(succeeded.success).assertTrue();
      expect(failed.errCode).assertEqual(ERR_FAILED);
      expect(succeeded.errCode).assertEqual(ERR_NONE);
    });

    it('device_name_with_leading_space_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isSafeName(' Cast')).assertFalse();
      expect(DeviceNameValidator.getViolation(' Cast')).assertEqual('name contains space');
      expect(DeviceNameValidator.isSafeName('Cast ')).assertFalse();
      expect(DeviceNameValidator.isSafeName('C a s t')).assertFalse();
    });

    it('error_entry_should_compare_equal_entries', 0, async () => {
      const first = new ErrorEntry(ErrorSeverity.WARNING, 2003, 'operation timeout', 1000);
      const second = new ErrorEntry(ErrorSeverity.WARNING, 2003, 'operation timeout', 1000);
      expect(first.equals(second)).assertTrue();
      expect(second.clone().equals(first)).assertTrue();
      expect(first.isWarning()).assertTrue();
      expect(first.isCritical()).assertFalse();
    });


    it('recovery_should_preserve_player_limit_constant', 0, async () => {
      expect(MAX_MIRROR_TILES).assertEqual(9);
      const statistics = new ErrorStatistics();
      statistics.add(ErrorCatalog.createUnknownOperation(2010));
      expect(statistics.getMaxCode()).assertEqual(2010);
      expect(statistics.getMinCode()).assertEqual(2010);
    });

    it('fault_injector_should_support_repeated_cycles', 0, async () => {
      const injector = new FaultInjector();
      expect(injector.inject('timeout')).assertTrue();
      injector.reset();
      expect(injector.getInjectedCount()).assertEqual(0);
      expect(injector.isKnownFault('panic')).assertTrue();
      expect(injector.inject('panic')).assertTrue();
      expect(injector.getInjectedCount()).assertEqual(1);
      expect(injector.getFaults().length).assertEqual(1);
    });

    it('error_severity_enum_should_be_stable', 0, async () => {
      expect(ErrorSeverity.INFO).assertEqual('info');
      expect(ErrorSeverity.WARNING).assertEqual('warning');
      expect(ErrorSeverity.CRITICAL).assertEqual('critical');
      const entry = new ErrorEntry(ErrorSeverity.INFO, 2000, 'informational', Date.now());
      expect(entry.isCritical()).assertFalse();
      expect(entry.isWarning()).assertFalse();
      expect(entry.getSeverity()).assertEqual(ErrorSeverity.INFO);
    });

  });
}
