/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  getDriver,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkComponentExistsByKey,
  checkTextContent,
  pageComponentCount,
  measureElapsed,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  COLOR_MODE_NOT_SET,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum RecoveryOutcome {
  SUCCESS = 'success',
  RETRIED_SUCCESS = 'retriedSuccess',
  DEGRADED = 'degraded',
  FAILED = 'failed'
}

enum FailureCategory {
  REGISTER_CALLBACK = 'registerCallback',
  LOAD_CONTENT = 'loadContent',
  SET_COLOR_MODE = 'setColorMode',
  RESTORE_STATE = 'restoreState'
}

const ERROR_CODE_INVALID_PARAM: number = 401;

const ERROR_CODE_INTERNAL: number = 16000001;

const ERROR_CODE_CAPABILITY: number = 16000050;

const MAX_RETRY_ATTEMPTS: number = 4;

const BASE_BACKOFF_MS: number = 50;

const MAX_BACKOFF_MS: number = 800;

interface FailureRecord {
  category: FailureCategory;
  code: number;
  attempt: number;
  recovered: boolean;
}

interface RetryPlan {
  attemptIndex: number;
  delayMs: number;
  cumulativeMs: number;
}

interface RecoverySnapshot {
  colorMode: number;
  registeredCallbackId: number;
  contentLoaded: boolean;
  stateVersion: number;
}

class StageBusinessError extends Error implements BusinessError {
  public code: number = 0;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
    this.name = 'BusinessError';
  }
}

function makeBusinessError(code: number, message: string): StageBusinessError {
  return new StageBusinessError(code, message);
}

function makeRecoveryError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class BackoffPolicy {
  private baseMs: number;

  private capMs: number;

  private maxAttempts: number;

  constructor(baseMs: number, capMs: number, maxAttempts: number) {
    this.baseMs = baseMs;
    this.capMs = capMs;
    this.maxAttempts = maxAttempts;
  }

  public delayForAttempt(attemptIndex: number): number {
    if (attemptIndex < 0) {
      throw makeRecoveryError('BackoffPolicyError', 'negative attempt index');
    }
    if (attemptIndex >= this.maxAttempts) {
      throw makeRecoveryError('BackoffPolicyError', 'attempt index out of range');
    }
    let delay: number = this.baseMs;
    for (let i: number = 0; i < attemptIndex; i++) {
      delay = delay * 2;
      if (delay >= this.capMs) {
        return this.capMs;
      }
    }
    return delay;
  }

  public buildPlan(): RetryPlan[] {
    const plan: RetryPlan[] = [];
    let cumulative: number = 0;
    for (let i: number = 0; i < this.maxAttempts; i++) {
      const delay: number = this.delayForAttempt(i);
      cumulative += delay;
      const entry: RetryPlan = {
        attemptIndex: i,
        delayMs: delay,
        cumulativeMs: cumulative
      };
      plan.push(entry);
    }
    return plan;
  }

  public totalDelay(): number {
    const plan: RetryPlan[] = this.buildPlan();
    if (plan.length === 0) {
      return 0;
    }
    return plan[plan.length - 1].cumulativeMs;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public isExhausted(attemptIndex: number): boolean {
    return attemptIndex >= this.maxAttempts;
  }

  public isMonotonicNonDecreasing(): boolean {
    const plan: RetryPlan[] = this.buildPlan();
    for (let i: number = 1; i < plan.length; i++) {
      if (plan[i].delayMs < plan[i - 1].delayMs) {
        return false;
      }
    }
    return true;
  }
}

class RecoveryExecutor {
  private failures: FailureRecord[] = [];

  private policy: BackoffPolicy;

  private snapshot: RecoverySnapshot;

  constructor(policy: BackoffPolicy) {
    this.policy = policy;
    this.snapshot = {
      colorMode: COLOR_MODE_NOT_SET,
      registeredCallbackId: -1,
      contentLoaded: false,
      stateVersion: 0
    };
  }

  public getSnapshot(): RecoverySnapshot {
    const copy: RecoverySnapshot = {
      colorMode: this.snapshot.colorMode,
      registeredCallbackId: this.snapshot.registeredCallbackId,
      contentLoaded: this.snapshot.contentLoaded,
      stateVersion: this.snapshot.stateVersion
    };
    return copy;
  }

  public getFailures(): FailureRecord[] {
    const copy: FailureRecord[] = [];
    for (let i: number = 0; i < this.failures.length; i++) {
      copy.push(this.failures[i]);
    }
    return copy;
  }

  public getFailureCount(category: FailureCategory): number {
    let count: number = 0;
    for (let i: number = 0; i < this.failures.length; i++) {
      if (this.failures[i].category === category) {
        count++;
      }
    }
    return count;
  }

  private recordFailure(category: FailureCategory, code: number, attempt: number, recovered: boolean): void {
    const record: FailureRecord = {
      category: category,
      code: code,
      attempt: attempt,
      recovered: recovered
    };
    this.failures.push(record);
  }

  public registerEnvironmentCallback(callbackId: number, failTimes: number): RecoveryOutcome {
    let attempt: number = 0;
    while (attempt < this.policy.getMaxAttempts()) {
      if (attempt < failTimes) {
        this.recordFailure(FailureCategory.REGISTER_CALLBACK, ERROR_CODE_INTERNAL, attempt, false);
        attempt++;
        continue;
      }
      this.snapshot.registeredCallbackId = callbackId;
      this.snapshot.stateVersion++;
      this.recordFailure(FailureCategory.REGISTER_CALLBACK, 0, attempt, true);
      return attempt === 0 ? RecoveryOutcome.SUCCESS : RecoveryOutcome.RETRIED_SUCCESS;
    }
    this.snapshot.registeredCallbackId = -1;
    return RecoveryOutcome.FAILED;
  }

  public loadContent(pagePath: string, failTimes: number): RecoveryOutcome {
    if (pagePath.length === 0) {
      throw makeBusinessError(ERROR_CODE_INVALID_PARAM, 'empty page path');
    }
    let attempt: number = 0;
    while (attempt < this.policy.getMaxAttempts()) {
      if (attempt < failTimes) {
        this.recordFailure(FailureCategory.LOAD_CONTENT, ERROR_CODE_CAPABILITY, attempt, false);
        attempt++;
        continue;
      }
      this.snapshot.contentLoaded = true;
      this.snapshot.stateVersion++;
      this.recordFailure(FailureCategory.LOAD_CONTENT, 0, attempt, true);
      return attempt === 0 ? RecoveryOutcome.SUCCESS : RecoveryOutcome.RETRIED_SUCCESS;
    }
    this.snapshot.contentLoaded = false;
    return RecoveryOutcome.FAILED;
  }

  public applyColorMode(requested: number, failTimes: number): RecoveryOutcome {
    let attempt: number = 0;
    while (attempt < this.policy.getMaxAttempts()) {
      if (attempt < failTimes) {
        this.recordFailure(FailureCategory.SET_COLOR_MODE, ERROR_CODE_INTERNAL, attempt, false);
        attempt++;
        continue;
      }
      this.snapshot.colorMode = requested;
      this.snapshot.stateVersion++;
      this.recordFailure(FailureCategory.SET_COLOR_MODE, 0, attempt, true);
      return attempt === 0 ? RecoveryOutcome.SUCCESS : RecoveryOutcome.RETRIED_SUCCESS;
    }
    this.snapshot.colorMode = COLOR_MODE_NOT_SET;
    return RecoveryOutcome.DEGRADED;
  }

  public isConsistent(): boolean {
    if (this.snapshot.registeredCallbackId >= 0 && !this.snapshot.contentLoaded) {
      return false;
    }
    if (this.snapshot.stateVersion < 0) {
      return false;
    }
    return true;
  }

  public reset(): void {
    this.failures = [];
    this.snapshot = {
      colorMode: COLOR_MODE_NOT_SET,
      registeredCallbackId: -1,
      contentLoaded: false,
      stateVersion: 0
    };
  }
}

class FailureClassifier {
  public static isRetryable(code: number): boolean {
    if (code === ERROR_CODE_INVALID_PARAM) {
      return false;
    }
    if (code === ERROR_CODE_CAPABILITY) {
      return false;
    }
    return code === ERROR_CODE_INTERNAL;
  }

  public static severity(code: number): string {
    if (code === ERROR_CODE_INVALID_PARAM) {
      return 'caller';
    }
    if (code === ERROR_CODE_CAPABILITY) {
      return 'capability';
    }
    if (code === ERROR_CODE_INTERNAL) {
      return 'transient';
    }
    return 'unknown';
  }

  public static describe(category: FailureCategory, code: number): string {
    return `${category}:${code}:${FailureClassifier.severity(code)}`;
  }

  public static requiresUserAction(code: number): boolean {
    return code === ERROR_CODE_INVALID_PARAM;
  }
}

class RecoveryJournal {
  private entries: string[] = [];

  public append(category: FailureCategory, outcome: RecoveryOutcome): void {
    this.entries.push(`${category}=${outcome}`);
  }

  public size(): number {
    return this.entries.length;
  }

  public lastEntry(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1];
  }

  public countOutcome(outcome: RecoveryOutcome): number {
    let count: number = 0;
    const marker: string = `=${outcome}`;
    for (let i: number = 0; i < this.entries.length; i++) {
      if (this.entries[i].indexOf(marker) >= 0) {
        count++;
      }
    }
    return count;
  }

  public toText(): string {
    let text: string = '';
    for (let i: number = 0; i < this.entries.length; i++) {
      if (i > 0) {
        text += '|';
      }
      text += this.entries[i];
    }
    return text;
  }

  public clear(): void {
    this.entries = [];
  }
}

export default function errorRecoveryTest(): void {
  describe('ErrorRecoveryTest', () => {
    let driver: Driver = getDriver();
    let policy: BackoffPolicy = new BackoffPolicy(BASE_BACKOFF_MS, MAX_BACKOFF_MS, MAX_RETRY_ATTEMPTS);

    beforeAll(async () => {
      driver = getDriver();
      policy = new BackoffPolicy(BASE_BACKOFF_MS, MAX_BACKOFF_MS, MAX_RETRY_ATTEMPTS);
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('ErrorRecoveryTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0100
     * @tc.name testBackoffDelaysDoublePerAttempt
     * @tc.desc Verify exponential backoff model: base 50 ms over 4 attempts -> delays 50, 100, 200, 400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackoffDelaysDoublePerAttempt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const backoff: BackoffPolicy = new BackoffPolicy(BASE_BACKOFF_MS, MAX_BACKOFF_MS, 4);
        expect(backoff.delayForAttempt(0)).assertEqual(50);
        expect(backoff.delayForAttempt(1)).assertEqual(100);
        expect(backoff.delayForAttempt(2)).assertEqual(200);
        expect(backoff.delayForAttempt(3)).assertEqual(400);
        expect(backoff.isMonotonicNonDecreasing()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0200
     * @tc.name testBackoffRespectsCap
     * @tc.desc Verify backoff ceiling: base 50 ms cap 200 ms over 6 attempts -> delays saturate at 200 from the third attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackoffRespectsCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const backoff: BackoffPolicy = new BackoffPolicy(50, 200, 6);
        const plan: RetryPlan[] = backoff.buildPlan();
        expect(plan.length).assertEqual(6);
        expect(plan[0].delayMs).assertEqual(50);
        expect(plan[1].delayMs).assertEqual(100);
        expect(plan[2].delayMs).assertEqual(200);
        expect(plan[3].delayMs).assertEqual(200);
        expect(plan[5].delayMs).assertEqual(200);
        expect(backoff.totalDelay()).assertEqual(950);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0300
     * @tc.name testBackoffRejectsOutOfRangeAttempt
     * @tc.desc Verify backoff guard: attempt index -1 and index equal to max attempts -> throws Error named BackoffPolicyError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackoffRejectsOutOfRangeAttempt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const backoff: BackoffPolicy = new BackoffPolicy(50, 800, 3);
        try {
          backoff.delayForAttempt(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackoffPolicyError');
          expect(e.message).assertEqual('negative attempt index');
        }
        try {
          backoff.delayForAttempt(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BackoffPolicyError');
          expect(e.message).assertEqual('attempt index out of range');
        }
        expect(backoff.isExhausted(2)).assertFalse();
        expect(backoff.isExhausted(3)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0400
     * @tc.name testRegisterCallbackSucceedsOnFirstAttempt
     * @tc.desc Verify no-failure registration: register with failTimes 0 -> outcome success, callback id 5 persisted, stateVersion 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterCallbackSucceedsOnFirstAttempt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.registerEnvironmentCallback(5, 0);
        expect(outcome).assertEqual(RecoveryOutcome.SUCCESS);
        expect(executor.getSnapshot().registeredCallbackId).assertEqual(5);
        expect(executor.getSnapshot().stateVersion).assertEqual(1);
        expect(executor.getFailureCount(FailureCategory.REGISTER_CALLBACK)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0500
     * @tc.name testRegisterCallbackRecoversAfterTwoFailures
     * @tc.desc Verify retry recovery: registration fails twice then succeeds -> outcome retriedSuccess and
     * callback id 9 stored; a registered callback without loaded content is inconsistent, and becomes
     * consistent once content loading succeeds as well
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterCallbackRecoversAfterTwoFailures', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.registerEnvironmentCallback(9, 2);
        expect(outcome).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.getSnapshot().registeredCallbackId).assertEqual(9);
        expect(executor.getFailureCount(FailureCategory.REGISTER_CALLBACK)).assertEqual(3);
        expect(executor.isConsistent()).assertFalse();
        expect(executor.loadContent('pages/Index', 0)).assertEqual(RecoveryOutcome.SUCCESS);
        expect(executor.getSnapshot().contentLoaded).assertTrue();
        expect(executor.isConsistent()).assertTrue();
        expect(executor.getSnapshot().stateVersion).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0600
     * @tc.name testRegisterCallbackExhaustsRetries
     * @tc.desc Verify retry exhaustion: registration fails all 4 attempts -> outcome failed, callback id -1, 4 failure records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterCallbackExhaustsRetries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.registerEnvironmentCallback(3, MAX_RETRY_ATTEMPTS);
        expect(outcome).assertEqual(RecoveryOutcome.FAILED);
        expect(executor.getSnapshot().registeredCallbackId).assertEqual(-1);
        expect(executor.getFailureCount(FailureCategory.REGISTER_CALLBACK)).assertEqual(MAX_RETRY_ATTEMPTS);
        expect(executor.getSnapshot().stateVersion).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0700
     * @tc.name testRegisterFailureCarriesBusinessErrorCode
     * @tc.desc Verify BusinessError carry: simulated registration failure record -> code 16000001 and recoverable classification true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterFailureCarriesBusinessErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        executor.registerEnvironmentCallback(4, 1);
        const failures: FailureRecord[] = executor.getFailures();
        expect(failures[0].code).assertEqual(ERROR_CODE_INTERNAL);
        expect(failures[0].recovered).assertFalse();
        expect(FailureClassifier.isRetryable(failures[0].code)).assertTrue();
        expect(FailureClassifier.severity(failures[0].code)).assertEqual('transient');
        expect(failures[1].recovered).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0800
     * @tc.name testLoadContentFailsThenRecovers
     * @tc.desc Verify loadContent retry: page path valid but first load errors -> retriedSuccess and contentLoaded true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadContentFailsThenRecovers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.loadContent('pages/Index', 1);
        expect(outcome).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.getSnapshot().contentLoaded).assertTrue();
        expect(executor.getFailureCount(FailureCategory.LOAD_CONTENT)).assertEqual(2);
        const failures: FailureRecord[] = executor.getFailures();
        expect(failures[0].code).assertEqual(ERROR_CODE_CAPABILITY);
        expect(FailureClassifier.isRetryable(failures[0].code)).assertFalse();
        expect(FailureClassifier.severity(failures[0].code)).assertEqual('capability');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_0900
     * @tc.name testLoadContentRejectsEmptyPath
     * @tc.desc Verify loadContent argument guard: empty page path -> throws BusinessError with code 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadContentRejectsEmptyPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        try {
          executor.loadContent('', 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect((e as BusinessError).code).assertEqual(ERROR_CODE_INVALID_PARAM);
          expect(e.message).assertEqual('empty page path');
        }
        expect(executor.getSnapshot().contentLoaded).assertFalse();
        expect(FailureClassifier.requiresUserAction(ERROR_CODE_INVALID_PARAM)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1000
     * @tc.name testLoadContentPermanentFailureLeavesPageUnloaded
     * @tc.desc Verify permanent load failure: four failing attempts -> outcome failed and contentLoaded false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadContentPermanentFailureLeavesPageUnloaded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.loadContent('pages/Index', 10);
        expect(outcome).assertEqual(RecoveryOutcome.FAILED);
        expect(executor.getSnapshot().contentLoaded).assertFalse();
        expect(executor.getFailureCount(FailureCategory.LOAD_CONTENT)).assertEqual(MAX_RETRY_ATTEMPTS);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1100
     * @tc.name testSetColorModeDegradesToNotSet
     * @tc.desc Verify setColorMode degradation: all 4 attempts fail -> outcome degraded and colorMode falls back to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetColorModeDegradesToNotSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.applyColorMode(1, MAX_RETRY_ATTEMPTS);
        expect(outcome).assertEqual(RecoveryOutcome.DEGRADED);
        expect(executor.getSnapshot().colorMode).assertEqual(COLOR_MODE_NOT_SET);
        expect(executor.getFailureCount(FailureCategory.SET_COLOR_MODE)).assertEqual(MAX_RETRY_ATTEMPTS);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1200
     * @tc.name testSetColorModeSucceedsAfterSingleFailure
     * @tc.desc Verify setColorMode recovery: one failure then success -> retriedSuccess and requested mode 0 stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetColorModeSucceedsAfterSingleFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const outcome: RecoveryOutcome = executor.applyColorMode(0, 1);
        expect(outcome).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.getSnapshot().colorMode).assertEqual(0);
        expect(executor.getSnapshot().stateVersion).assertEqual(1);
        expect(executor.getFailures().length).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1300
     * @tc.name testRecoveredStateIsConsistent
     * @tc.desc Verify consistency after mixed recovery: callback plus content plus color mode all recovered -> isConsistent true and stateVersion 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveredStateIsConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        expect(executor.registerEnvironmentCallback(2, 1)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.loadContent('pages/Index', 2)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.applyColorMode(0, 1)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        const snapshot: RecoverySnapshot = executor.getSnapshot();
        expect(snapshot.registeredCallbackId).assertEqual(2);
        expect(snapshot.contentLoaded).assertTrue();
        expect(snapshot.colorMode).assertEqual(0);
        expect(snapshot.stateVersion).assertEqual(3);
        expect(executor.isConsistent()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1400
     * @tc.name testCallbackWithoutContentIsInconsistent
     * @tc.desc Verify consistency predicate: callback registered but content never loaded -> isConsistent false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCallbackWithoutContentIsInconsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        executor.registerEnvironmentCallback(8, 0);
        expect(executor.isConsistent()).assertFalse();
        executor.loadContent('pages/Index', 0);
        expect(executor.isConsistent()).assertTrue();
        expect(executor.getSnapshot().stateVersion).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1500
     * @tc.name testFailureClassificationMatrix
     * @tc.desc Verify error code classification: 401 caller, 16000050 capability, 16000001 transient, unknown code not retryable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFailureClassificationMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(FailureClassifier.severity(ERROR_CODE_INVALID_PARAM)).assertEqual('caller');
        expect(FailureClassifier.severity(ERROR_CODE_CAPABILITY)).assertEqual('capability');
        expect(FailureClassifier.severity(ERROR_CODE_INTERNAL)).assertEqual('transient');
        expect(FailureClassifier.severity(9999)).assertEqual('unknown');
        expect(FailureClassifier.isRetryable(ERROR_CODE_INTERNAL)).assertTrue();
        expect(FailureClassifier.isRetryable(ERROR_CODE_INVALID_PARAM)).assertFalse();
        expect(FailureClassifier.isRetryable(9999)).assertFalse();
        expect(FailureClassifier.describe(FailureCategory.LOAD_CONTENT, ERROR_CODE_CAPABILITY))
          .assertEqual('loadContent:16000050:capability');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1600
     * @tc.name testJournalRecordsOutcomeSequence
     * @tc.desc Verify recovery journal: three appends with mixed outcomes -> size 3, last entry degraded, retriedSuccess count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJournalRecordsOutcomeSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const journal: RecoveryJournal = new RecoveryJournal();
        journal.append(FailureCategory.SET_COLOR_MODE, RecoveryOutcome.DEGRADED);
        journal.append(FailureCategory.LOAD_CONTENT, RecoveryOutcome.RETRIED_SUCCESS);
        journal.append(FailureCategory.REGISTER_CALLBACK, RecoveryOutcome.FAILED);
        expect(journal.size()).assertEqual(3);
        expect(journal.lastEntry()).assertEqual('registerCallback=failed');
        expect(journal.countOutcome(RecoveryOutcome.RETRIED_SUCCESS)).assertEqual(1);
        expect(journal.countOutcome(RecoveryOutcome.SUCCESS)).assertEqual(0);
        expect(journal.toText()).assertEqual('setColorMode=degraded|loadContent=retriedSuccess|registerCallback=failed');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1700
     * @tc.name testJournalClearResetsEntries
     * @tc.desc Verify journal reset: two appends then clear -> size 0 and last entry empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJournalClearResetsEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const journal: RecoveryJournal = new RecoveryJournal();
        journal.append(FailureCategory.LOAD_CONTENT, RecoveryOutcome.SUCCESS);
        journal.append(FailureCategory.LOAD_CONTENT, RecoveryOutcome.SUCCESS);
        expect(journal.countOutcome(RecoveryOutcome.SUCCESS)).assertEqual(2);
        journal.clear();
        expect(journal.size()).assertEqual(0);
        expect(journal.lastEntry()).assertEqual('');
        expect(journal.toText()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1800
     * @tc.name testExecutorResetRestoresDefaults
     * @tc.desc Verify executor reset: after successful recovery then reset -> callback id -1, content false, color mode -1, zero failures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorResetRestoresDefaults', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        executor.registerEnvironmentCallback(6, 0);
        executor.loadContent('pages/Index', 0);
        executor.reset();
        const snapshot: RecoverySnapshot = executor.getSnapshot();
        expect(snapshot.registeredCallbackId).assertEqual(-1);
        expect(snapshot.contentLoaded).assertFalse();
        expect(snapshot.colorMode).assertEqual(COLOR_MODE_NOT_SET);
        expect(snapshot.stateVersion).assertEqual(0);
        expect(executor.getFailures().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_1900
     * @tc.name testRetryCostWithinBudget
     * @tc.desc Verify retry budget: four-attempt plan cumulative delay 750 ms stays under 1 second and matches sum 50+100+200+400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRetryCostWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const backoff: BackoffPolicy = new BackoffPolicy(BASE_BACKOFF_MS, MAX_BACKOFF_MS, MAX_RETRY_ATTEMPTS);
        const plan: RetryPlan[] = backoff.buildPlan();
        expect(plan[3].cumulativeMs).assertEqual(750);
        expect(backoff.totalDelay()).assertEqual(750);
        expect(backoff.totalDelay() <= 1000).assertTrue();
        expect(plan[0].cumulativeMs).assertEqual(50);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2000
     * @tc.name testUiRecoversPageAfterRelaunch
     * @tc.desc Verify real recovery: background then foreground EntryAbility -> Index page visible again after recovery window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRecoversPageAfterRelaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const firstStable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(firstStable).assertTrue();
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        const recovered: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(recovered).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2100
     * @tc.name testUiStateConsistentWithLivePage
     * @tc.desc Verify model matches device: successful callback plus content recovery while page live -> executor consistent and HelloWorld present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStateConsistentWithLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        expect(executor.registerEnvironmentCallback(31, 1)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.loadContent('pages/Index', 1)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.isConsistent()).assertTrue();
        const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(present).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2200
     * @tc.name testUiColorModeFallbackKeepsPageReadable
     * @tc.desc Verify degradation does not break UI: color mode degrades to not-set while live page -> text content still readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiColorModeFallbackKeepsPageReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        expect(executor.applyColorMode(1, MAX_RETRY_ATTEMPTS)).assertEqual(RecoveryOutcome.DEGRADED);
        expect(executor.getSnapshot().colorMode).assertEqual(COLOR_MODE_NOT_SET);
        const readable: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        expect(readable).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2300
     * @tc.name testUiRepeatedRecoveryKeepsComponentCount
     * @tc.desc Verify 3 recovery rounds on live page: component count equals baseline after each round and executor stays consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiRepeatedRecoveryKeepsComponentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const baseline: number = await pageComponentCount(driver);
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        for (let i: number = 0; i < 3; i++) {
          executor.reset();
          executor.registerEnvironmentCallback(40 + i, i);
          executor.loadContent('pages/Index', i);
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_LAUNCH);
          const current: number = await pageComponentCount(driver);
          expect(current).assertEqual(baseline);
        }
        expect(executor.isConsistent()).assertTrue();
        expect(executor.getSnapshot().contentLoaded).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2400
     * @tc.name testRecoveryThroughputWithinBudget
     * @tc.desc Verify recovery loop throughput: 200 executor cycles -> 200 successes and elapsed time under 2000 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRecoveryThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        const startTime: number = Date.now();
        let successes: number = 0;
        for (let i: number = 0; i < 200; i++) {
          executor.reset();
          const outcome: RecoveryOutcome = executor.registerEnvironmentCallback(i, 1);
          if (outcome === RecoveryOutcome.RETRIED_SUCCESS) {
            successes++;
          }
        }
        const elapsed: number = measureElapsed(startTime);
        expect(successes).assertEqual(200);
        expect(elapsed <= 2000).assertTrue();
        logInfo(`ErrorRecoveryTest: 200 recovery cycles in ${elapsed} ms`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2500
     * @tc.name testUnexpectedErrorPropagatesNamed
     * @tc.desc Verify unexpected error surfacing: recovery with error name RecoveryUnexpectedError -> catch asserts exact name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnexpectedErrorPropagatesNamed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        try {
          throw makeRecoveryError('RecoveryUnexpectedError', 'callback slot released');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RecoveryUnexpectedError');
          expect(e.message).assertEqual('callback slot released');
        }
        executor.registerEnvironmentCallback(1, 0);
        expect(executor.getSnapshot().registeredCallbackId).assertEqual(1);
        logError('ErrorRecoveryTest: unexpected error path exercised');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2600
     * @tc.name testBusinessErrorCodePropagatesFromThrow
     * @tc.desc Verify BusinessError propagation: throwing BusinessError code 16000001 -> catch sees name BusinessError and numeric code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBusinessErrorCodePropagatesFromThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          throw makeBusinessError(ERROR_CODE_INTERNAL, 'environment callback rejected');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect((e as BusinessError).code).assertEqual(16000001);
          expect(e.message).assertEqual('environment callback rejected');
          expect(FailureClassifier.isRetryable((e as BusinessError).code)).assertTrue();
        }
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        expect(executor.applyColorMode(1, 1)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.getSnapshot().colorMode).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2700
     * @tc.name testPartialRecoveryLeavesSingleDependencyMissing
     * @tc.desc Verify partial recovery accounting: callback and color mode recover but content fails all attempts -> consistency false and contentLoaded false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPartialRecoveryLeavesSingleDependencyMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        expect(executor.registerEnvironmentCallback(17, 1)).assertEqual(RecoveryOutcome.RETRIED_SUCCESS);
        expect(executor.applyColorMode(0, 0)).assertEqual(RecoveryOutcome.SUCCESS);
        expect(executor.loadContent('pages/Index', MAX_RETRY_ATTEMPTS)).assertEqual(RecoveryOutcome.FAILED);
        const snapshot: RecoverySnapshot = executor.getSnapshot();
        expect(snapshot.contentLoaded).assertFalse();
        expect(snapshot.registeredCallbackId).assertEqual(17);
        expect(snapshot.colorMode).assertEqual(0);
        expect(executor.isConsistent()).assertFalse();
        expect(executor.getFailureCount(FailureCategory.LOAD_CONTENT)).assertEqual(MAX_RETRY_ATTEMPTS);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ERRORRECOVERY_2800
     * @tc.name testSuccessiveFailuresAccumulateAcrossCategories
     * @tc.desc Verify per-category failure accumulation: one failed registration plus one failed color mode -> total records 8 across two categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSuccessiveFailuresAccumulateAcrossCategories', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const executor: RecoveryExecutor = new RecoveryExecutor(policy);
        expect(executor.registerEnvironmentCallback(1, MAX_RETRY_ATTEMPTS)).assertEqual(RecoveryOutcome.FAILED);
        expect(executor.applyColorMode(1, MAX_RETRY_ATTEMPTS)).assertEqual(RecoveryOutcome.DEGRADED);
        expect(executor.getFailureCount(FailureCategory.REGISTER_CALLBACK)).assertEqual(MAX_RETRY_ATTEMPTS);
        expect(executor.getFailureCount(FailureCategory.SET_COLOR_MODE)).assertEqual(MAX_RETRY_ATTEMPTS);
        expect(executor.getFailures().length).assertEqual(MAX_RETRY_ATTEMPTS * 2);
        expect(executor.getSnapshot().registeredCallbackId).assertEqual(-1);
        expect(executor.getSnapshot().colorMode).assertEqual(COLOR_MODE_NOT_SET);
      } finally {
        done();
      }
    })
  })
}
