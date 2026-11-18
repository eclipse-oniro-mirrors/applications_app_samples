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
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  startAbilityByWant,
  buildEntryWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  checkTextContent,
  checkComponentExists,
  pageComponentCount,
  DELAY_AFTER_BACKGROUND,
  DELAY_AFTER_LAUNCH,
  TIMEOUT_ABILITY_LAUNCH,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  COLOR_MODE_NOT_SET,
  INDEX_PAGE_PATH,
  ENTRY_ABILITY_NAME
} from '../Shared/SharedDriver';

enum RecoveryStage {
  HEALTHY = 'healthy',
  FAILED = 'failed',
  DEGRADED = 'degraded',
  RECOVERED = 'recovered'
}

enum FailureKind {
  LAUNCH_TIMEOUT = 'launch-timeout',
  CONTENT_LOAD = 'content-load',
  COLOR_MODE = 'color-mode',
  NONE = 'none'
}

class BusinessFailure extends Error {
  private readonly code: number;
  private readonly reason: string;

  constructor(name: string, code: number, reason: string) {
    super(reason);
    this.name = name;
    this.code = code;
    this.reason = reason;
  }

  public getCode(): number {
    return this.code;
  }

  public getReason(): string {
    return this.reason;
  }
}

interface RetryAttempt {
  attempt: number;
  succeeded: boolean;
  failureKind: FailureKind;
}

interface RecoveryRecord {
  stage: RecoveryStage;
  failureKind: FailureKind;
  attempt: number;
  recovered: boolean;
}

class RetryPolicy {
  private readonly maxAttempts: number;
  private readonly baseDelayMs: number;

  constructor(maxAttempts: number, baseDelayMs: number) {
    this.maxAttempts = maxAttempts;
    this.baseDelayMs = baseDelayMs;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public delayFor(attempt: number): number {
    if (attempt <= 0) {
      return 0;
    }
    let delay: number = this.baseDelayMs;
    for (let i = 1; i < attempt; i++) {
      delay = delay * 2;
    }
    return delay;
  }

  public isExhausted(attempt: number): boolean {
    return attempt >= this.maxAttempts;
  }

  public describe(): string {
    return `max=${this.maxAttempts},base=${this.baseDelayMs}`;
  }
}

class SimulatedLauncher {
  private readonly failCount: number;
  private attemptCount: number = 0;
  private readonly policy: RetryPolicy;
  private attempts: RetryAttempt[] = [];

  constructor(failCount: number, policy: RetryPolicy) {
    this.failCount = failCount;
    this.policy = policy;
  }

  public async launch(): Promise<boolean> {
    while (!this.policy.isExhausted(this.attemptCount)) {
      this.attemptCount++;
      const delay: number = this.policy.delayFor(this.attemptCount);
      if (delay > 0) {
        await sleepMs(delay);
      }
      if (this.attemptCount > this.failCount) {
        this.attempts.push({
          attempt: this.attemptCount,
          succeeded: true,
          failureKind: FailureKind.NONE
        });
        return true;
      }
      this.attempts.push({
        attempt: this.attemptCount,
        succeeded: false,
        failureKind: FailureKind.LAUNCH_TIMEOUT
      });
    }
    return false;
  }

  public getAttemptCount(): number {
    return this.attemptCount;
  }

  public getAttempts(): RetryAttempt[] {
    return this.attempts.slice(0);
  }

  public getFailureCount(): number {
    let failures: number = 0;
    for (let i = 0; i < this.attempts.length; i++) {
      if (!this.attempts[i].succeeded) {
        failures++;
      }
    }
    return failures;
  }

  public getSuccessAttempt(): number {
    for (let i = 0; i < this.attempts.length; i++) {
      if (this.attempts[i].succeeded) {
        return this.attempts[i].attempt;
      }
    }
    return -1;
  }
}

class ContentLoader {
  private readonly failingCode: number;
  private loadAttempts: number = 0;
  private loadedPath: string = '';
  private lastFailureCode: number = 0;

  constructor(failingCode: number) {
    this.failingCode = failingCode;
  }

  public load(path: string): boolean {
    this.loadAttempts++;
    if (this.failingCode !== 0) {
      this.lastFailureCode = this.failingCode;
      return false;
    }
    this.loadedPath = path;
    return true;
  }

  public getLoadAttempts(): number {
    return this.loadAttempts;
  }

  public getLoadedPath(): string {
    return this.loadedPath;
  }

  public getLastFailureCode(): number {
    return this.lastFailureCode;
  }

  public isLoaded(): boolean {
    return this.loadedPath.length > 0;
  }
}

class ColorModeFallback {
  private mode: number = COLOR_MODE_NOT_SET;
  private degradationCount: number = 0;
  private successCount: number = 0;
  private failureCodes: number[] = [];

  public apply(requestedMode: number, shouldFail: boolean): boolean {
    if (shouldFail) {
      this.degradationCount++;
      const failure: BusinessFailure = new BusinessFailure('BusinessError', 401, 'setColorMode denied');
      this.failureCodes.push(failure.getCode());
      this.mode = COLOR_MODE_NOT_SET;
      return false;
    }
    this.mode = requestedMode;
    this.successCount++;
    return true;
  }

  public getMode(): number {
    return this.mode;
  }

  public getDegradationCount(): number {
    return this.degradationCount;
  }

  public getSuccessCount(): number {
    return this.successCount;
  }

  public getLastFailureCode(): number {
    if (this.failureCodes.length === 0) {
      return 0;
    }
    return this.failureCodes[this.failureCodes.length - 1];
  }

  public isUsable(): boolean {
    return this.mode === COLOR_MODE_NOT_SET || this.mode === 0 || this.mode === 1;
  }

  public reset(): void {
    this.mode = COLOR_MODE_NOT_SET;
    this.degradationCount = 0;
    this.successCount = 0;
    this.failureCodes = [];
  }
}

class RecoveryJournal {
  private records: RecoveryRecord[] = [];

  public add(stage: RecoveryStage, kind: FailureKind, attempt: number, recovered: boolean): void {
    this.records.push({
      stage: stage,
      failureKind: kind,
      attempt: attempt,
      recovered: recovered
    });
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public countByStage(stage: RecoveryStage): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].stage === stage) {
        count++;
      }
    }
    return count;
  }

  public countByKind(kind: FailureKind): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].failureKind === kind) {
        count++;
      }
    }
    return count;
  }

  public recoveredCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].recovered) {
        count++;
      }
    }
    return count;
  }

  public firstRecoveredAttempt(): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].recovered) {
        return this.records[i].attempt;
      }
    }
    return -1;
  }

  public isFullyRecovered(): boolean {
    return this.records.length > 0 && this.recoveredCount() === this.records.length;
  }
}

class RecoveryGate {
  private stage: RecoveryStage = RecoveryStage.HEALTHY;
  private transitions: number = 0;

  public fail(): boolean {
    if (this.stage !== RecoveryStage.HEALTHY) {
      return false;
    }
    this.stage = RecoveryStage.FAILED;
    this.transitions++;
    return true;
  }

  public degrade(): boolean {
    if (this.stage !== RecoveryStage.FAILED) {
      return false;
    }
    this.stage = RecoveryStage.DEGRADED;
    this.transitions++;
    return true;
  }

  public recover(): boolean {
    if (this.stage !== RecoveryStage.FAILED && this.stage !== RecoveryStage.DEGRADED) {
      return false;
    }
    this.stage = RecoveryStage.RECOVERED;
    this.transitions++;
    return true;
  }

  public reset(): boolean {
    if (this.stage !== RecoveryStage.RECOVERED) {
      return false;
    }
    this.stage = RecoveryStage.HEALTHY;
    this.transitions++;
    return true;
  }

  public getStage(): RecoveryStage {
    return this.stage;
  }

  public getTransitions(): number {
    return this.transitions;
  }

  public isOperational(): boolean {
    return this.stage === RecoveryStage.HEALTHY || this.stage === RecoveryStage.RECOVERED;
  }
}

function toBusinessError(error: BusinessError): BusinessError {
  return error;
}

export default function abilityErrorRecoveryTest(): void {  describe('AbilityErrorRecoveryTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityErrorRecoveryTest beforeAll: preparing EntryAbility');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (error) {
        logError(`AbilityErrorRecoveryTest beforeAll error: ${error}`);
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (error) {
        logError(`AbilityErrorRecoveryTest afterAll error: ${error}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0100
     * @tc.name testRecoveryRetryPolicyBackoff
     * @tc.desc Verify exponential backoff doubles from the base delay for attempts one to four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryRetryPolicyBackoff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: RetryPolicy = new RetryPolicy(4, 5);
          expect(policy.delayFor(0)).assertEqual(0);
          expect(policy.delayFor(1)).assertEqual(5);
          expect(policy.delayFor(2)).assertEqual(10);
          expect(policy.delayFor(3)).assertEqual(20);
          expect(policy.delayFor(4)).assertEqual(40);
          expect(policy.isExhausted(3)).assertFalse();
          expect(policy.isExhausted(4)).assertTrue();
          expect(policy.getMaxAttempts()).assertEqual(4);
          expect(policy.describe()).assertEqual('max=4,base=5');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0200
     * @tc.name testRecoveryLaunchSucceedsAfterTwoFailures
     * @tc.desc Verify launcher with two injected failures succeeds on third attempt while retry policy holds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryLaunchSucceedsAfterTwoFailures', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: RetryPolicy = new RetryPolicy(5, 1);
          const launcher: SimulatedLauncher = new SimulatedLauncher(2, policy);
          const succeeded: boolean = await launcher.launch();
          expect(succeeded).assertTrue();
          expect(launcher.getAttemptCount()).assertEqual(3);
          expect(launcher.getFailureCount()).assertEqual(2);
          expect(launcher.getSuccessAttempt()).assertEqual(3);
          expect(launcher.getAttempts().length).assertEqual(3);
          expect(launcher.getAttempts()[2].succeeded).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0300
     * @tc.name testRecoveryLaunchExhaustsAllAttempts
     * @tc.desc Verify launcher with failures beyond the policy gives up after exactly three failed attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryLaunchExhaustsAllAttempts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: RetryPolicy = new RetryPolicy(3, 1);
          const launcher: SimulatedLauncher = new SimulatedLauncher(9, policy);
          const succeeded: boolean = await launcher.launch();
          expect(succeeded).assertFalse();
          expect(launcher.getAttemptCount()).assertEqual(3);
          expect(launcher.getFailureCount()).assertEqual(3);
          expect(launcher.getSuccessAttempt()).assertEqual(-1);
          expect(policy.isExhausted(launcher.getAttemptCount())).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0400
     * @tc.name testRecoveryLaunchZeroFailureImmediate
     * @tc.desc Verify a zero-failure launcher succeeds on the first attempt with no backoff applied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryLaunchZeroFailureImmediate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: RetryPolicy = new RetryPolicy(3, 10);
          const launcher: SimulatedLauncher = new SimulatedLauncher(0, policy);
          const succeeded: boolean = await launcher.launch();
          expect(succeeded).assertTrue();
          expect(launcher.getAttemptCount()).assertEqual(1);
          expect(launcher.getFailureCount()).assertEqual(0);
          expect(launcher.getSuccessAttempt()).assertEqual(1);
          expect(policy.delayFor(launcher.getAttemptCount())).assertEqual(10);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0500
     * @tc.name testRecoveryContentLoadFailureCode
     * @tc.desc Verify content loader with failure code 1002 reports that code and stays unloaded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryContentLoadFailureCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const loader: ContentLoader = new ContentLoader(1002);
          expect(loader.load(INDEX_PAGE_PATH)).assertFalse();
          expect(loader.getLoadAttempts()).assertEqual(1);
          expect(loader.getLoadedPath()).assertEqual('');
          expect(loader.getLastFailureCode()).assertEqual(1002);
          expect(loader.isLoaded()).assertFalse();
          expect(loader.load(INDEX_PAGE_PATH)).assertFalse();
          expect(loader.getLoadAttempts()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0600
     * @tc.name testRecoveryContentLoadSuccessPath
     * @tc.desc Verify content loader with no failure records the exact Index page path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryContentLoadSuccessPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const loader: ContentLoader = new ContentLoader(0);
          expect(loader.load(INDEX_PAGE_PATH)).assertTrue();
          expect(loader.getLoadAttempts()).assertEqual(1);
          expect(loader.getLoadedPath()).assertEqual('pages/Index');
          expect(loader.getLastFailureCode()).assertEqual(0);
          expect(loader.isLoaded()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0700
     * @tc.name testRecoveryColorModeDegradesToNotSet
     * @tc.desc Verify failed color mode application degrades to COLOR_MODE_NOT_SET with code 401 recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryColorModeDegradesToNotSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fallback: ColorModeFallback = new ColorModeFallback();
          expect(fallback.apply(1, true)).assertFalse();
          expect(fallback.getMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(fallback.getDegradationCount()).assertEqual(1);
          expect(fallback.getSuccessCount()).assertEqual(0);
          expect(fallback.getLastFailureCode()).assertEqual(401);
          expect(fallback.isUsable()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0800
     * @tc.name testRecoveryColorModeAppliesAfterDegradation
     * @tc.desc Verify a later successful color mode write overrides the degraded default and stays usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryColorModeAppliesAfterDegradation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fallback: ColorModeFallback = new ColorModeFallback();
          expect(fallback.apply(0, false)).assertTrue();
          expect(fallback.getMode()).assertEqual(0);
          expect(fallback.apply(1, true)).assertFalse();
          expect(fallback.getMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(fallback.apply(1, false)).assertTrue();
          expect(fallback.getMode()).assertEqual(1);
          expect(fallback.getDegradationCount()).assertEqual(1);
          expect(fallback.getSuccessCount()).assertEqual(2);
          expect(fallback.isUsable()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_0900
     * @tc.name testRecoveryGateStageSequence
     * @tc.desc Verify gate walks healthy to failed to degraded to recovered to healthy with four transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryGateStageSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: RecoveryGate = new RecoveryGate();
          expect(gate.getStage()).assertEqual(RecoveryStage.HEALTHY);
          expect(gate.isOperational()).assertTrue();
          expect(gate.fail()).assertTrue();
          expect(gate.degrade()).assertTrue();
          expect(gate.recover()).assertTrue();
          expect(gate.reset()).assertTrue();
          expect(gate.getStage()).assertEqual(RecoveryStage.HEALTHY);
          expect(gate.getTransitions()).assertEqual(4);
          expect(gate.isOperational()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1000
     * @tc.name testRecoveryGateRejectsIllegalStages
     * @tc.desc Verify degrade from healthy, recover from recovered and reset from healthy all return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryGateRejectsIllegalStages', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: RecoveryGate = new RecoveryGate();
          expect(gate.degrade()).assertFalse();
          expect(gate.recover()).assertFalse();
          expect(gate.reset()).assertFalse();
          expect(gate.getTransitions()).assertEqual(0);
          expect(gate.fail()).assertTrue();
          expect(gate.fail()).assertFalse();
          expect(gate.getTransitions()).assertEqual(1);
          expect(gate.getStage()).assertEqual(RecoveryStage.FAILED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1100
     * @tc.name testRecoveryGateDirectRecovery
     * @tc.desc Verify failed stage recovers directly without passing through degraded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryGateDirectRecovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: RecoveryGate = new RecoveryGate();
          gate.fail();
          expect(gate.recover()).assertTrue();
          expect(gate.getStage()).assertEqual(RecoveryStage.RECOVERED);
          expect(gate.getTransitions()).assertEqual(2);
          expect(gate.isOperational()).assertTrue();
          expect(gate.degrade()).assertFalse();
          expect(gate.getStage()).assertEqual(RecoveryStage.RECOVERED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1200
     * @tc.name testRecoveryJournalCountsByStageAndKind
     * @tc.desc Verify journal aggregates records by stage and failure kind with correct recovery tally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryJournalCountsByStageAndKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journal: RecoveryJournal = new RecoveryJournal();
          journal.add(RecoveryStage.FAILED, FailureKind.LAUNCH_TIMEOUT, 1, false);
          journal.add(RecoveryStage.FAILED, FailureKind.LAUNCH_TIMEOUT, 2, false);
          journal.add(RecoveryStage.RECOVERED, FailureKind.LAUNCH_TIMEOUT, 3, true);
          journal.add(RecoveryStage.DEGRADED, FailureKind.COLOR_MODE, 1, true);
          expect(journal.getRecordCount()).assertEqual(4);
          expect(journal.countByStage(RecoveryStage.FAILED)).assertEqual(2);
          expect(journal.countByKind(FailureKind.LAUNCH_TIMEOUT)).assertEqual(3);
          expect(journal.countByKind(FailureKind.COLOR_MODE)).assertEqual(1);
          expect(journal.recoveredCount()).assertEqual(2);
          expect(journal.firstRecoveredAttempt()).assertEqual(3);
          expect(journal.isFullyRecovered()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1300
     * @tc.name testRecoveryJournalEmptyBoundary
     * @tc.desc Verify empty journal reports zero counts and not fully recovered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryJournalEmptyBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const journal: RecoveryJournal = new RecoveryJournal();
          expect(journal.getRecordCount()).assertEqual(0);
          expect(journal.countByStage(RecoveryStage.HEALTHY)).assertEqual(0);
          expect(journal.countByKind(FailureKind.NONE)).assertEqual(0);
          expect(journal.recoveredCount()).assertEqual(0);
          expect(journal.firstRecoveredAttempt()).assertEqual(-1);
          expect(journal.isFullyRecovered()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1400
     * @tc.name testRecoveryBusinessErrorNameAssertion
     * @tc.desc Verify thrown BusinessFailure exposes name BusinessError and code 401 when caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryBusinessErrorNameAssertion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            throw new BusinessFailure('BusinessError', 401, 'setColorMode denied');
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            const failure: BusinessFailure = e as BusinessFailure;
            expect(failure.getCode()).assertEqual(401);
            expect(failure.getReason()).assertEqual('setColorMode denied');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1500
     * @tc.name testRecoveryBusinessErrorFromKitType
     * @tc.desc Verify BusinessError structural fields survive a catch and keep name and code intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryBusinessErrorFromKitType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const businessError: BusinessError = {
            code: 1600001,
            name: 'BusinessError',
            message: 'ability stage service unavailable'
          };
          try {
            if (businessError.code !== 0) {
              throw new BusinessFailure(businessError.name, businessError.code, businessError.message);
            }
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            const failure: BusinessFailure = e as BusinessFailure;
            expect(failure.getCode()).assertEqual(1600001);
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1600
     * @tc.name testRecoveryRealLaunchAfterFailureRetry
     * @tc.desc Verify model retries twice then a real EntryAbility launch renders a readable Text page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryRealLaunchAfterFailureRetry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const policy: RetryPolicy = new RetryPolicy(4, 1);
          const launcher: SimulatedLauncher = new SimulatedLauncher(2, policy);
          const retried: boolean = await launcher.launch();
          expect(retried).assertTrue();
          expect(launcher.getSuccessAttempt()).assertEqual(3);
          expect(launcher.getFailureCount()).assertEqual(2);
          await launchEntryAbility();
          await sleepMs(DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver);
          expect(stable).assertTrue();
          expect(await checkComponentExists(driver, 'Text')).assertTrue();
          const readable: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
            await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(readable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1700
     * @tc.name testRecoveryRealPageUsableAfterBackgroundFailure
     * @tc.desc Verify page remains usable with positive component count after a background and foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryRealPageUsableAfterBackgroundFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          const deadline: number = Date.now() + TIMEOUT_ABILITY_LAUNCH;
          let stable: boolean = false;
          while (Date.now() < deadline && !stable) {
            stable = await waitForIndexPageStable(driver);
            if (!stable) {
              await sleepMs(100);
            }
          }
          expect(stable).assertTrue();
          const components: number = await pageComponentCount(driver);
          expect(components > 0).assertTrue();
          expect(await checkComponentExists(driver, 'Text')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYRECOVER_1800
     * @tc.name testRecoveryRealRecoveryKeepsEntryAbilityName
     * @tc.desc Verify want rebuilt during recovery still targets EntryAbility with a non empty bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryRealRecoveryKeepsEntryAbilityName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recoveredWant = buildEntryWant();
          expect(recoveredWant.abilityName).assertEqual(ENTRY_ABILITY_NAME);
          expect((recoveredWant.bundleName === undefined ? 0 : recoveredWant.bundleName.length) > 0).assertTrue();
          await startAbilityByWant(recoveredWant);
          await sleepMs(DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const fallback: ColorModeFallback = new ColorModeFallback();
          fallback.apply(COLOR_MODE_NOT_SET, false);
          expect(fallback.getMode()).assertEqual(COLOR_MODE_NOT_SET);
          expect(fallback.isUsable()).assertTrue();
          fallback.reset();
          expect(fallback.getDegradationCount()).assertEqual(0);
          expect(fallback.getSuccessCount()).assertEqual(0);
        } finally {
          done();
        }
      })
  })
}
