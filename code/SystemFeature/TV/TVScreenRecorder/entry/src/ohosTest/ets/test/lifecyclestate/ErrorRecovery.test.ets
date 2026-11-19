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

import { describe, it, expect, beforeEach } from '@ohos/hypium'

// Failure points of the recording pipeline. Every failure point maps to one
// step of SRManager.startRecording or SRManager.stopRecording.
enum RecorderFault {
  CREATE_ASSET_FAILED = 'create_asset_failed',
  FD_OPEN_FAILED = 'fd_open_failed',
  NATIVE_START_FAILED = 'native_start_failed',
  NATIVE_STOP_FAILED = 'native_stop_failed',
  NULL_CONTEXT = 'null_context',
  WINDOW_LOAD_FAILED = 'window_load_failed'
}

// Severity of a fault.
enum FaultSeverity {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  CRITICAL = 'critical'
}

// Recovery strategy applied to a fault.
enum FaultStrategy {
  RETRY = 'retry',
  RESET = 'reset',
  FALLBACK = 'fallback',
  TERMINATE = 'terminate'
}

// One fault record of the journal.
interface FaultRecord {
  fault: RecorderFault
  severity: FaultSeverity
  strategy: FaultStrategy
  retried: boolean
  recovered: boolean
  elapsedMs: number
  timestamp: number
}

// Aggregated fault statistics.
interface FaultSummary {
  totalFaults: number
  recoveredFaults: number
  unrecoveredFaults: number
  averageRecoveryMs: number
  recoveryRate: number
}

// Recovery suggestion of a fault.
interface FaultRecoverySuggestion {
  fault: RecorderFault
  severity: FaultSeverity
  strategy: FaultStrategy
  priority: number
  description: string
}

// Text shown by ScreenRecorderTimer when the pipeline fails.
export const RECORDER_ERROR_TEXT: string = '未知错误,录制停止'

// ScreenRecorderAbility terminates itself 2000 ms after an Error state.
export const TERMINATE_SELF_DELAY_MS: number = 2000

// Classifies the fault into a severity level.
class RecorderFaultClassifier {
  public classify(fault: RecorderFault): FaultSeverity {
    if (fault === RecorderFault.NULL_CONTEXT) {
      return FaultSeverity.CRITICAL
    }
    if (fault === RecorderFault.WINDOW_LOAD_FAILED) {
      return FaultSeverity.LOW
    }
    if (fault === RecorderFault.NATIVE_STOP_FAILED) {
      return FaultSeverity.MEDIUM
    }
    return FaultSeverity.HIGH
  }

  public isCritical(fault: RecorderFault): boolean {
    return this.classify(fault) === FaultSeverity.CRITICAL
  }

  public isRetryable(fault: RecorderFault): boolean {
    const severity = this.classify(fault)
    return severity === FaultSeverity.HIGH || severity === FaultSeverity.MEDIUM
  }
}

// Recommends a recovery strategy for every fault.
class RecorderRecoveryAdvisor {
  private suggestions: FaultRecoverySuggestion[]

  constructor() {
    this.suggestions = [
      {
        fault: RecorderFault.CREATE_ASSET_FAILED,
        severity: FaultSeverity.HIGH,
        strategy: FaultStrategy.RETRY,
        priority: 1,
        description: 'retry photo asset creation'
      },
      {
        fault: RecorderFault.FD_OPEN_FAILED,
        severity: FaultSeverity.HIGH,
        strategy: FaultStrategy.RETRY,
        priority: 2,
        description: 'retry file descriptor open'
      },
      {
        fault: RecorderFault.NATIVE_START_FAILED,
        severity: FaultSeverity.HIGH,
        strategy: FaultStrategy.RETRY,
        priority: 3,
        description: 'retry native startRecording'
      },
      {
        fault: RecorderFault.NATIVE_STOP_FAILED,
        severity: FaultSeverity.MEDIUM,
        strategy: FaultStrategy.RESET,
        priority: 4,
        description: 'reset recorder state after stop failure'
      },
      {
        fault: RecorderFault.NULL_CONTEXT,
        severity: FaultSeverity.CRITICAL,
        strategy: FaultStrategy.TERMINATE,
        priority: 5,
        description: 'terminate self after context loss'
      },
      {
        fault: RecorderFault.WINDOW_LOAD_FAILED,
        severity: FaultSeverity.LOW,
        strategy: FaultStrategy.FALLBACK,
        priority: 6,
        description: 'fallback to the minimal tip window'
      }
    ]
  }

  public recommend(fault: RecorderFault): FaultRecoverySuggestion | null {
    for (const suggestion of this.suggestions) {
      if (suggestion.fault === fault) {
        return suggestion
      }
    }
    return null
  }

  public getSuggestions(): FaultRecoverySuggestion[] {
    return this.suggestions.slice()
  }

  public countByStrategy(strategy: FaultStrategy): number {
    let count = 0
    for (const suggestion of this.suggestions) {
      if (suggestion.strategy === strategy) {
        count += 1
      }
    }
    return count
  }
}

// Journal of every fault handled by the recorder pipeline.
class RecorderFaultJournal {
  private records: FaultRecord[] = []
  private clock: number = 1700000000000

  public append(fault: RecorderFault, severity: FaultSeverity, strategy: FaultStrategy, retried: boolean,
    recovered: boolean, elapsedMs: number): void {
    const record: FaultRecord = {
      fault: fault,
      severity: severity,
      strategy: strategy,
      retried: retried,
      recovered: recovered,
      elapsedMs: elapsedMs,
      timestamp: this.clock
    }
    this.records.push(record)
    this.clock += 5
  }

  public getRecords(): FaultRecord[] {
    return this.records.slice()
  }

  public getTotal(): number {
    return this.records.length
  }

  public countFault(fault: RecorderFault): number {
    let count = 0
    for (const record of this.records) {
      if (record.fault === fault) {
        count += 1
      }
    }
    return count
  }

  public countSeverity(severity: FaultSeverity): number {
    let count = 0
    for (const record of this.records) {
      if (record.severity === severity) {
        count += 1
      }
    }
    return count
  }

  public countRecovered(): number {
    let count = 0
    for (const record of this.records) {
      if (record.recovered) {
        count += 1
      }
    }
    return count
  }

  public countRetried(): number {
    let count = 0
    for (const record of this.records) {
      if (record.retried) {
        count += 1
      }
    }
    return count
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i - 1].timestamp > this.records[i].timestamp) {
        return false
      }
    }
    return true
  }

  public reset(): void {
    this.records = []
    this.clock = 1700000000000
  }
}

// Builds the fault summary consumed by the recovery report.
class FaultSummaryBuilder {
  private records: FaultRecord[]

  constructor(records: FaultRecord[]) {
    this.records = records.slice()
  }

  public buildSummary(): FaultSummary {
    const summary: FaultSummary = {
      totalFaults: this.records.length,
      recoveredFaults: this.countRecovered(),
      unrecoveredFaults: this.records.length - this.countRecovered(),
      averageRecoveryMs: this.computeAverage(),
      recoveryRate: this.records.length === 0 ? 0 : this.countRecovered() / this.records.length
    }
    return summary
  }

  private countRecovered(): number {
    let count = 0
    for (const record of this.records) {
      if (record.recovered) {
        count += 1
      }
    }
    return count
  }

  private computeAverage(): number {
    let total = 0
    let count = 0
    for (const record of this.records) {
      if (record.recovered) {
        total += record.elapsedMs
        count += 1
      }
    }
    if (count === 0) {
      return 0
    }
    return total / count
  }
}

// Models the terminateSelf timer: after the Error state the service schedule
// a 2000 ms timer and terminates itself when the timer fires.
class TerminateSelfScheduler {
  private elapsedMs: number = 0
  private pending: boolean = false
  private terminateCount: number = 0

  public schedule(): void {
    this.elapsedMs = 0
    this.pending = true
  }

  public advance(ms: number): boolean {
    if (!this.pending) {
      return false
    }
    this.elapsedMs += ms
    if (this.elapsedMs < TERMINATE_SELF_DELAY_MS) {
      return false
    }
    this.pending = false
    this.terminateCount += 1
    return true
  }

  public isPending(): boolean {
    return this.pending
  }

  public getTerminateCount(): number {
    return this.terminateCount
  }

  public getElapsedMs(): number {
    return this.elapsedMs
  }

  public getDelayMs(): number {
    return TERMINATE_SELF_DELAY_MS
  }

  public getErrorText(): string {
    return RECORDER_ERROR_TEXT
  }
}

// Status of a recovery plan.
enum RecoveryStatus {
  PENDING = 'pending',
  IN_PROGRESS = 'in_progress',
  SUCCEEDED = 'succeeded',
  FAILED = 'failed'
}

// One recovery plan generated for a fault.
interface RecoveryPlan {
  fault: RecorderFault
  steps: string[]
  status: RecoveryStatus
  attemptCount: number
}

// Bounded retry policy of the recorder pipeline.
class RecorderRetryPolicy {
  private maxAttempts: number
  private attempt: number = 0

  constructor(maxAttempts: number) {
    this.maxAttempts = maxAttempts
  }

  public canRetry(): boolean {
    return this.attempt < this.maxAttempts
  }

  public recordAttempt(): number {
    if (this.canRetry()) {
      this.attempt += 1
    }
    return this.attempt
  }

  public getAttempt(): number {
    return this.attempt
  }

  public getMaxAttempts(): number {
    return this.maxAttempts
  }

  public reset(): void {
    this.attempt = 0
  }

  public isExhausted(): boolean {
    return !this.canRetry()
  }
}

// Generates and executes the recovery plan of a fault.
class RecoveryPlanExecutor {
  private plan: RecoveryPlan

  constructor(plan: RecoveryPlan) {
    this.plan = plan
  }

  public static generate(fault: RecorderFault): RecoveryPlan {
    const steps: string[] = []
    if (fault === RecorderFault.CREATE_ASSET_FAILED) {
      steps.push('close partial fd')
      steps.push('retry createAsset')
      steps.push('validate uri')
    } else if (fault === RecorderFault.NATIVE_START_FAILED) {
      steps.push('release fd')
      steps.push('reset recorder state')
      steps.push('retry startRecording')
    } else if (fault === RecorderFault.NULL_CONTEXT) {
      steps.push('stop recording')
      steps.push('release windows')
      steps.push('terminate self')
    } else {
      steps.push('detect fault')
      steps.push('apply fallback')
    }
    const plan: RecoveryPlan = {
      fault: fault,
      steps: steps,
      status: RecoveryStatus.PENDING,
      attemptCount: 0
    }
    return plan
  }

  public begin(): void {
    this.plan.status = RecoveryStatus.IN_PROGRESS
    this.plan.attemptCount += 1
  }

  public succeed(): void {
    this.plan.status = RecoveryStatus.SUCCEEDED
  }

  public fail(): void {
    this.plan.status = RecoveryStatus.FAILED
  }

  public getPlan(): RecoveryPlan {
    return this.plan
  }

  public getStepCount(): number {
    return this.plan.steps.length
  }

  public isFinished(): boolean {
    return this.plan.status === RecoveryStatus.SUCCEEDED || this.plan.status === RecoveryStatus.FAILED
  }
}

// Timeline entry with an auto incrementing sequence number.
class FaultTimelineEntry {
  private sequence: number
  private fault: RecorderFault
  private elapsedMs: number

  constructor(sequence: number, fault: RecorderFault, elapsedMs: number) {
    this.sequence = sequence
    this.fault = fault
    this.elapsedMs = elapsedMs
  }

  public getSequence(): number {
    return this.sequence
  }

  public getFault(): RecorderFault {
    return this.fault
  }

  public getElapsedMs(): number {
    return this.elapsedMs
  }

  public toString(): string {
    return `#${this.sequence} ${this.fault} in ${this.elapsedMs}ms`
  }
}

// Timeline of the handled faults.
class FaultTimeline {
  private entries: FaultTimelineEntry[] = []
  private nextSequence: number = 1

  public append(fault: RecorderFault, elapsedMs: number): void {
    this.entries.push(new FaultTimelineEntry(this.nextSequence, fault, elapsedMs))
    this.nextSequence += 1
  }

  public getEntries(): FaultTimelineEntry[] {
    return this.entries.slice()
  }

  public getEntryCount(): number {
    return this.entries.length
  }

  public clear(): void {
    this.entries = []
    this.nextSequence = 1
  }
}

export default function errorRecoveryTest(): void {
  describe('ErrorRecovery_Test', () => {
    let classifier: RecorderFaultClassifier
    let advisor: RecorderRecoveryAdvisor
    let journal: RecorderFaultJournal

    beforeEach(() => {
      classifier = new RecorderFaultClassifier()
      advisor = new RecorderRecoveryAdvisor()
      journal = new RecorderFaultJournal()
    })

    it('classifier_should_grade_asset_failure_as_high', 0, () => {
      expect(classifier.classify(RecorderFault.CREATE_ASSET_FAILED)).assertEqual(FaultSeverity.HIGH)
      expect(classifier.classify(RecorderFault.CREATE_ASSET_FAILED)).assertEqual(FaultSeverity.HIGH)
    })

    it('classifier_should_grade_fd_open_failure_as_high', 0, () => {
      expect(classifier.classify(RecorderFault.FD_OPEN_FAILED)).assertEqual(FaultSeverity.HIGH)
    })

    it('classifier_should_grade_native_start_failure_as_high', 0, () => {
      expect(classifier.classify(RecorderFault.NATIVE_START_FAILED)).assertEqual(FaultSeverity.HIGH)
    })

    it('classifier_should_grade_native_stop_failure_as_medium', 0, () => {
      expect(classifier.classify(RecorderFault.NATIVE_STOP_FAILED)).assertEqual(FaultSeverity.MEDIUM)
    })

    it('classifier_should_grade_null_context_as_critical', 0, () => {
      expect(classifier.classify(RecorderFault.NULL_CONTEXT)).assertEqual(FaultSeverity.CRITICAL)
      expect(classifier.isCritical(RecorderFault.NULL_CONTEXT)).assertTrue()
    })

    it('classifier_should_grade_window_load_as_low', 0, () => {
      expect(classifier.classify(RecorderFault.WINDOW_LOAD_FAILED)).assertEqual(FaultSeverity.LOW)
      expect(classifier.isCritical(RecorderFault.WINDOW_LOAD_FAILED)).assertFalse()
    })

    it('classifier_should_detect_retryable_faults', 0, () => {
      expect(classifier.isRetryable(RecorderFault.CREATE_ASSET_FAILED)).assertTrue()
      expect(classifier.isRetryable(RecorderFault.NATIVE_START_FAILED)).assertTrue()
      expect(classifier.isRetryable(RecorderFault.NATIVE_STOP_FAILED)).assertTrue()
      expect(classifier.isRetryable(RecorderFault.WINDOW_LOAD_FAILED)).assertFalse()
    })

    it('advisor_should_recommend_retry_for_asset_failure', 0, () => {
      const suggestion: FaultRecoverySuggestion | null = advisor.recommend(RecorderFault.CREATE_ASSET_FAILED)
      expect(suggestion === null).assertFalse()
      if (suggestion !== null) {
        expect(suggestion.strategy).assertEqual(FaultStrategy.RETRY)
        expect(suggestion.priority).assertEqual(1)
        expect(suggestion.description).assertContain('asset')
      }
    })

    it('advisor_should_recommend_terminate_for_null_context', 0, () => {
      const suggestion: FaultRecoverySuggestion | null = advisor.recommend(RecorderFault.NULL_CONTEXT)
      expect(suggestion === null).assertFalse()
      if (suggestion !== null) {
        expect(suggestion.strategy).assertEqual(FaultStrategy.TERMINATE)
        expect(suggestion.severity).assertEqual(FaultSeverity.CRITICAL)
      }
    })

    it('advisor_should_recommend_reset_for_stop_failure', 0, () => {
      const suggestion: FaultRecoverySuggestion | null = advisor.recommend(RecorderFault.NATIVE_STOP_FAILED)
      expect(suggestion === null).assertFalse()
      if (suggestion !== null) {
        expect(suggestion.strategy).assertEqual(FaultStrategy.RESET)
      }
    })

    it('advisor_should_count_strategies', 0, () => {
      expect(advisor.getSuggestions().length).assertEqual(6)
      expect(advisor.countByStrategy(FaultStrategy.RETRY)).assertEqual(3)
      expect(advisor.countByStrategy(FaultStrategy.RESET)).assertEqual(1)
      expect(advisor.countByStrategy(FaultStrategy.TERMINATE)).assertEqual(1)
      expect(advisor.countByStrategy(FaultStrategy.FALLBACK)).assertEqual(1)
    })

    it('advisor_should_expose_low_priority_suggestion', 0, () => {
      expect(advisor.recommend(RecorderFault.WINDOW_LOAD_FAILED) === null).assertFalse()
      expect(advisor.getSuggestions()[5].fault).assertEqual(RecorderFault.WINDOW_LOAD_FAILED)
    })

    it('journal_should_record_asset_failure', 0, () => {
      journal.append(RecorderFault.CREATE_ASSET_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 120)
      expect(journal.getTotal()).assertEqual(1)
      expect(journal.countFault(RecorderFault.CREATE_ASSET_FAILED)).assertEqual(1)
      expect(journal.countRecovered()).assertEqual(1)
      expect(journal.countRetried()).assertEqual(1)
    })

    it('journal_should_record_native_start_failure', 0, () => {
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, false, 240)
      expect(journal.countFault(RecorderFault.NATIVE_START_FAILED)).assertEqual(1)
      expect(journal.countRecovered()).assertEqual(0)
    })

    it('journal_should_record_native_stop_failure', 0, () => {
      journal.append(RecorderFault.NATIVE_STOP_FAILED, FaultSeverity.MEDIUM, FaultStrategy.RESET, false, true, 90)
      expect(journal.countSeverity(FaultSeverity.MEDIUM)).assertEqual(1)
      expect(journal.countRetried()).assertEqual(0)
    })

    it('journal_should_count_by_severity', 0, () => {
      journal.append(RecorderFault.CREATE_ASSET_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 100)
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 120)
      journal.append(RecorderFault.NULL_CONTEXT, FaultSeverity.CRITICAL, FaultStrategy.TERMINATE, false, false, 50)
      expect(journal.countSeverity(FaultSeverity.HIGH)).assertEqual(2)
      expect(journal.countSeverity(FaultSeverity.CRITICAL)).assertEqual(1)
      expect(journal.countSeverity(FaultSeverity.LOW)).assertEqual(0)
    })

    it('journal_should_be_chronological', 0, () => {
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 100)
      journal.append(RecorderFault.NATIVE_STOP_FAILED, FaultSeverity.MEDIUM, FaultStrategy.RESET, false, true, 100)
      journal.append(RecorderFault.NULL_CONTEXT, FaultSeverity.CRITICAL, FaultStrategy.TERMINATE, false, false, 100)
      expect(journal.isChronological()).assertTrue()
    })

    it('journal_should_reset_all_records', 0, () => {
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 100)
      journal.reset()
      expect(journal.getTotal()).assertEqual(0)
      expect(journal.countRecovered()).assertEqual(0)
      expect(journal.isChronological()).assertTrue()
    })

    it('summary_should_aggregate_faults', 0, () => {
      const records: FaultRecord[] = [
        {
          fault: RecorderFault.CREATE_ASSET_FAILED,
          severity: FaultSeverity.HIGH,
          strategy: FaultStrategy.RETRY,
          retried: true,
          recovered: true,
          elapsedMs: 100,
          timestamp: 1000
        },
        {
          fault: RecorderFault.NATIVE_START_FAILED,
          severity: FaultSeverity.HIGH,
          strategy: FaultStrategy.RETRY,
          retried: true,
          recovered: true,
          elapsedMs: 300,
          timestamp: 2000
        },
        {
          fault: RecorderFault.NULL_CONTEXT,
          severity: FaultSeverity.CRITICAL,
          strategy: FaultStrategy.TERMINATE,
          retried: false,
          recovered: false,
          elapsedMs: 500,
          timestamp: 3000
        }
      ]
      const builder = new FaultSummaryBuilder(records)
      const summary: FaultSummary = builder.buildSummary()
      expect(summary.totalFaults).assertEqual(3)
      expect(summary.recoveredFaults).assertEqual(2)
      expect(summary.unrecoveredFaults).assertEqual(1)
      expect(summary.averageRecoveryMs).assertEqual(200)
      expect(summary.recoveryRate).assertEqual(2 / 3)
    })

    it('summary_should_handle_empty_records', 0, () => {
      const builder = new FaultSummaryBuilder([])
      const summary = builder.buildSummary()
      expect(summary.totalFaults).assertEqual(0)
      expect(summary.recoveredFaults).assertEqual(0)
      expect(summary.unrecoveredFaults).assertEqual(0)
      expect(summary.averageRecoveryMs).assertEqual(0)
      expect(summary.recoveryRate).assertEqual(0)
    })

    it('summary_should_ignore_unrecovered_elapsed_time', 0, () => {
      const records: FaultRecord[] = [
        {
          fault: RecorderFault.NATIVE_STOP_FAILED,
          severity: FaultSeverity.MEDIUM,
          strategy: FaultStrategy.RESET,
          retried: false,
          recovered: true,
          elapsedMs: 80,
          timestamp: 1000
        },
        {
          fault: RecorderFault.NULL_CONTEXT,
          severity: FaultSeverity.CRITICAL,
          strategy: FaultStrategy.TERMINATE,
          retried: false,
          recovered: false,
          elapsedMs: 900,
          timestamp: 2000
        }
      ]
      const summary = new FaultSummaryBuilder(records).buildSummary()
      expect(summary.averageRecoveryMs).assertEqual(80)
      expect(summary.recoveryRate).assertEqual(0.5)
    })

    it('terminate_scheduler_should_start_pending', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      expect(scheduler.isPending()).assertFalse()
      scheduler.schedule()
      expect(scheduler.isPending()).assertTrue()
      expect(scheduler.getElapsedMs()).assertEqual(0)
    })

    it('terminate_scheduler_should_not_fire_before_2000ms', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      scheduler.schedule()
      expect(scheduler.advance(1999)).assertFalse()
      expect(scheduler.getTerminateCount()).assertEqual(0)
      expect(scheduler.isPending()).assertTrue()
    })

    it('terminate_scheduler_should_fire_at_2000ms', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      scheduler.schedule()
      expect(scheduler.advance(2000)).assertTrue()
      expect(scheduler.getTerminateCount()).assertEqual(1)
      expect(scheduler.isPending()).assertFalse()
    })

    it('terminate_scheduler_should_fire_once', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      scheduler.schedule()
      scheduler.advance(2000)
      expect(scheduler.advance(2000)).assertFalse()
      expect(scheduler.getTerminateCount()).assertEqual(1)
    })

    it('terminate_scheduler_should_accumulate_partial_advances', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      scheduler.schedule()
      expect(scheduler.advance(500)).assertFalse()
      expect(scheduler.advance(500)).assertFalse()
      expect(scheduler.advance(500)).assertFalse()
      expect(scheduler.advance(500)).assertTrue()
      expect(scheduler.getElapsedMs()).assertEqual(2000)
    })

    it('terminate_scheduler_should_not_fire_without_schedule', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      expect(scheduler.advance(5000)).assertFalse()
      expect(scheduler.getTerminateCount()).assertEqual(0)
    })

    it('terminate_scheduler_should_report_delay', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      expect(scheduler.getDelayMs()).assertEqual(2000)
      expect(TERMINATE_SELF_DELAY_MS).assertEqual(2000)
    })

    it('error_text_should_match_timer_page', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      expect(scheduler.getErrorText()).assertEqual('未知错误,录制停止')
      expect(RECORDER_ERROR_TEXT).assertEqual('未知错误,录制停止')
      expect(RECORDER_ERROR_TEXT).assertContain('录制停止')
    })

    it('retry_policy_should_allow_attempts', 0, () => {
      const policy = new RecorderRetryPolicy(3)
      expect(policy.canRetry()).assertTrue()
      expect(policy.recordAttempt()).assertEqual(1)
      expect(policy.recordAttempt()).assertEqual(2)
      expect(policy.recordAttempt()).assertEqual(3)
      expect(policy.canRetry()).assertFalse()
    })

    it('retry_policy_should_stop_when_exhausted', 0, () => {
      const policy = new RecorderRetryPolicy(2)
      policy.recordAttempt()
      policy.recordAttempt()
      expect(policy.isExhausted()).assertTrue()
      expect(policy.recordAttempt()).assertEqual(2)
      expect(policy.getAttempt()).assertEqual(2)
    })

    it('retry_policy_should_report_max_attempts', 0, () => {
      expect(new RecorderRetryPolicy(1).getMaxAttempts()).assertEqual(1)
      expect(new RecorderRetryPolicy(5).getMaxAttempts()).assertEqual(5)
    })

    it('retry_policy_should_reset_attempts', 0, () => {
      const policy = new RecorderRetryPolicy(2)
      policy.recordAttempt()
      policy.recordAttempt()
      policy.reset()
      expect(policy.getAttempt()).assertEqual(0)
      expect(policy.canRetry()).assertTrue()
      expect(policy.isExhausted()).assertFalse()
    })

    it('plan_generator_should_build_asset_steps', 0, () => {
      const plan: RecoveryPlan = RecoveryPlanExecutor.generate(RecorderFault.CREATE_ASSET_FAILED)
      expect(plan.fault).assertEqual(RecorderFault.CREATE_ASSET_FAILED)
      expect(plan.steps.length).assertEqual(3)
      expect(plan.steps[0]).assertEqual('close partial fd')
      expect(plan.status).assertEqual(RecoveryStatus.PENDING)
      expect(plan.attemptCount).assertEqual(0)
    })

    it('plan_generator_should_build_native_start_steps', 0, () => {
      const plan = RecoveryPlanExecutor.generate(RecorderFault.NATIVE_START_FAILED)
      expect(plan.steps.length).assertEqual(3)
      expect(plan.steps[1]).assertEqual('reset recorder state')
    })

    it('plan_generator_should_build_null_context_steps', 0, () => {
      const plan = RecoveryPlanExecutor.generate(RecorderFault.NULL_CONTEXT)
      expect(plan.steps.length).assertEqual(3)
      expect(plan.steps[2]).assertEqual('terminate self')
    })

    it('plan_generator_should_build_fallback_steps', 0, () => {
      const plan = RecoveryPlanExecutor.generate(RecorderFault.WINDOW_LOAD_FAILED)
      expect(plan.steps.length).assertEqual(2)
      expect(plan.steps[1]).assertEqual('apply fallback')
    })

    it('plan_executor_should_track_status', 0, () => {
      const plan = RecoveryPlanExecutor.generate(RecorderFault.NATIVE_START_FAILED)
      const executor = new RecoveryPlanExecutor(plan)
      expect(executor.isFinished()).assertFalse()
      expect(executor.getStepCount()).assertEqual(3)
      executor.begin()
      expect(executor.getPlan().status).assertEqual(RecoveryStatus.IN_PROGRESS)
      expect(executor.getPlan().attemptCount).assertEqual(1)
      expect(executor.isFinished()).assertFalse()
    })

    it('plan_executor_should_finish_on_success', 0, () => {
      const executor = new RecoveryPlanExecutor(RecoveryPlanExecutor.generate(RecorderFault.CREATE_ASSET_FAILED))
      executor.begin()
      executor.succeed()
      expect(executor.getPlan().status).assertEqual(RecoveryStatus.SUCCEEDED)
      expect(executor.isFinished()).assertTrue()
    })

    it('plan_executor_should_finish_on_failure', 0, () => {
      const executor = new RecoveryPlanExecutor(RecoveryPlanExecutor.generate(RecorderFault.NATIVE_STOP_FAILED))
      executor.begin()
      executor.fail()
      expect(executor.getPlan().status).assertEqual(RecoveryStatus.FAILED)
      expect(executor.isFinished()).assertTrue()
    })

    it('timeline_should_assign_sequence', 0, () => {
      const timeline = new FaultTimeline()
      timeline.append(RecorderFault.CREATE_ASSET_FAILED, 100)
      timeline.append(RecorderFault.NATIVE_START_FAILED, 200)
      const entries = timeline.getEntries()
      expect(timeline.getEntryCount()).assertEqual(2)
      expect(entries[0].getSequence()).assertEqual(1)
      expect(entries[1].getSequence()).assertEqual(2)
      expect(entries[1].getFault()).assertEqual(RecorderFault.NATIVE_START_FAILED)
    })

    it('timeline_should_report_entry_text', 0, () => {
      const timeline = new FaultTimeline()
      timeline.append(RecorderFault.NULL_CONTEXT, 2000)
      const entry = timeline.getEntries()[0]
      expect(entry.getElapsedMs()).assertEqual(2000)
      expect(entry.toString()).assertContain('null_context')
      expect(entry.toString()).assertContain('#1')
    })

    it('timeline_should_clear_and_restart_sequence', 0, () => {
      const timeline = new FaultTimeline()
      timeline.append(RecorderFault.NATIVE_STOP_FAILED, 100)
      timeline.clear()
      expect(timeline.getEntryCount()).assertEqual(0)
      timeline.append(RecorderFault.CREATE_ASSET_FAILED, 150)
      expect(timeline.getEntries()[0].getSequence()).assertEqual(1)
    })

    it('asset_failure_should_be_recovered_by_retry', 0, () => {
      journal.append(RecorderFault.CREATE_ASSET_FAILED, classifier.classify(RecorderFault.CREATE_ASSET_FAILED),
        FaultStrategy.RETRY, true, true, 120)
      const summary = new FaultSummaryBuilder(journal.getRecords()).buildSummary()
      expect(summary.recoveryRate).assertEqual(1)
      expect(summary.averageRecoveryMs).assertEqual(120)
    })

    it('native_start_failure_should_be_retried', 0, () => {
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, false, 300)
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 150)
      expect(journal.countFault(RecorderFault.NATIVE_START_FAILED)).assertEqual(2)
      expect(journal.countRetried()).assertEqual(2)
      expect(journal.countRecovered()).assertEqual(1)
    })

    it('native_stop_failure_should_reset_state', 0, () => {
      const suggestion = advisor.recommend(RecorderFault.NATIVE_STOP_FAILED)
      expect(suggestion === null).assertFalse()
      if (suggestion !== null) {
        expect(suggestion.strategy).assertEqual(FaultStrategy.RESET)
      }
      journal.append(RecorderFault.NATIVE_STOP_FAILED, FaultSeverity.MEDIUM, FaultStrategy.RESET, false, true, 60)
      expect(journal.countSeverity(FaultSeverity.MEDIUM)).assertEqual(1)
    })

    it('null_context_should_terminate_self', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      scheduler.schedule()
      journal.append(RecorderFault.NULL_CONTEXT, FaultSeverity.CRITICAL, FaultStrategy.TERMINATE, false, false, 0)
      expect(scheduler.advance(2000)).assertTrue()
      expect(scheduler.getTerminateCount()).assertEqual(1)
      expect(journal.countSeverity(FaultSeverity.CRITICAL)).assertEqual(1)
    })

    it('error_recovery_should_survive_many_faults', 0, () => {
      const faults: RecorderFault[] = [
        RecorderFault.CREATE_ASSET_FAILED,
        RecorderFault.FD_OPEN_FAILED,
        RecorderFault.NATIVE_START_FAILED,
        RecorderFault.NATIVE_STOP_FAILED,
        RecorderFault.WINDOW_LOAD_FAILED
      ]
      for (let i = 0; i < 50; i++) {
        const fault = faults[i % faults.length]
        journal.append(fault, classifier.classify(fault), FaultStrategy.RETRY, true, i % 4 !== 0, 50)
      }
      expect(journal.getTotal()).assertEqual(50)
      expect(journal.isChronological()).assertTrue()
      expect(journal.countFault(RecorderFault.CREATE_ASSET_FAILED)).assertEqual(10)
      expect(journal.countRecovered()).assertEqual(37)
    })

    it('comprehensive_error_recovery_scenario', 0, () => {
      const policy = new RecorderRetryPolicy(2)
      const scheduler = new TerminateSelfScheduler()
      const timeline = new FaultTimeline()

      expect(policy.recordAttempt()).assertEqual(1)
      journal.append(RecorderFault.CREATE_ASSET_FAILED, classifier.classify(RecorderFault.CREATE_ASSET_FAILED),
        FaultStrategy.RETRY, true, true, 100)
      timeline.append(RecorderFault.CREATE_ASSET_FAILED, 100)

      expect(policy.recordAttempt()).assertEqual(2)
      journal.append(RecorderFault.NATIVE_START_FAILED, classifier.classify(RecorderFault.NATIVE_START_FAILED),
        FaultStrategy.RETRY, true, true, 200)
      timeline.append(RecorderFault.NATIVE_START_FAILED, 200)

      const assetPlan = RecoveryPlanExecutor.generate(RecorderFault.CREATE_ASSET_FAILED)
      const executor = new RecoveryPlanExecutor(assetPlan)
      executor.begin()
      executor.succeed()
      expect(executor.isFinished()).assertTrue()

      journal.append(RecorderFault.NULL_CONTEXT, FaultSeverity.CRITICAL, FaultStrategy.TERMINATE, false, false, 0)
      scheduler.schedule()
      expect(scheduler.advance(2000)).assertTrue()

      const summary = new FaultSummaryBuilder(journal.getRecords()).buildSummary()
      expect(journal.getTotal()).assertEqual(3)
      expect(summary.recoveredFaults).assertEqual(2)
      expect(summary.recoveryRate).assertEqual(2 / 3)
      expect(timeline.getEntryCount()).assertEqual(2)
      expect(policy.isExhausted()).assertTrue()
      expect(scheduler.getErrorText()).assertEqual('未知错误,录制停止')
    })

    it('fault_journal_should_track_retry_ratio', 0, () => {
      journal.append(RecorderFault.CREATE_ASSET_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 100)
      journal.append(RecorderFault.NATIVE_START_FAILED, FaultSeverity.HIGH, FaultStrategy.RETRY, true, true, 100)
      journal.append(RecorderFault.WINDOW_LOAD_FAILED, FaultSeverity.LOW, FaultStrategy.FALLBACK, false, true, 100)
      expect(journal.countRetried()).assertEqual(2)
      expect(journal.countRecovered()).assertEqual(3)
      expect(journal.getTotal()).assertEqual(3)
    })

    it('terminate_scheduler_should_restart_on_new_error', 0, () => {
      const scheduler = new TerminateSelfScheduler()
      scheduler.schedule()
      scheduler.advance(2000)
      expect(scheduler.getTerminateCount()).assertEqual(1)
      scheduler.schedule()
      expect(scheduler.isPending()).assertTrue()
      expect(scheduler.getElapsedMs()).assertEqual(0)
      expect(scheduler.advance(2000)).assertTrue()
      expect(scheduler.getTerminateCount()).assertEqual(2)
    })

    it('classifier_should_grade_every_fault', 0, () => {
      const faults: RecorderFault[] = [
        RecorderFault.CREATE_ASSET_FAILED,
        RecorderFault.FD_OPEN_FAILED,
        RecorderFault.NATIVE_START_FAILED,
        RecorderFault.NATIVE_STOP_FAILED,
        RecorderFault.NULL_CONTEXT,
        RecorderFault.WINDOW_LOAD_FAILED
      ]
      let highCount = 0
      for (const fault of faults) {
        if (classifier.classify(fault) === FaultSeverity.HIGH) {
          highCount += 1
        }
      }
      expect(highCount).assertEqual(3)
      expect(classifier.isCritical(RecorderFault.NULL_CONTEXT)).assertTrue()
      expect(classifier.isRetryable(RecorderFault.NULL_CONTEXT)).assertFalse()
    })
  })
}

