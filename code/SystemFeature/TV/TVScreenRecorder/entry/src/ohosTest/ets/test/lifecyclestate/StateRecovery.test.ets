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

// Recording states mirrored from common/Constants.ets.
enum RecorderStateForRecovery {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

// Failure scenarios that require a recovery.
enum FailureScenario {
  CREATE_ASSET_FAILURE = 'create_asset_failure',
  NATIVE_START_FAILURE = 'native_start_failure',
  ABNORMAL_STOP = 'abnormal_stop',
  NULL_CONTEXT = 'null_context',
  SERVICE_KILLED = 'service_killed'
}

// Result of one recovery attempt.
enum RecoveryResult {
  IDLE_RESTORED = 'idle_restored',
  RESTART_SUCCEEDED = 'restart_succeeded',
  RESTART_FAILED = 'restart_failed',
  GAVE_UP = 'gave_up'
}

// One journal entry of the recovery engine.
interface RecoveryAttempt {
  scenario: FailureScenario
  attempt: number
  fromState: RecorderStateForRecovery
  toState: RecorderStateForRecovery
  result: RecoveryResult
  recoveryMs: number
  timestamp: number
}

// Engine that restores the recorder from Error to Idle and restarts a
// recording after an abnormal stop. The retry budget is bounded so that a
// permanently failing device does not loop forever.
class RecordingRecoveryEngine {
  private state: RecorderStateForRecovery = RecorderStateForRecovery.IDLE
  private attempts: RecoveryAttempt[] = []
  private clock: number = 1700000000000
  private maxRetries: number = 2
  private lastScenario: FailureScenario = FailureScenario.SERVICE_KILLED

  public getState(): RecorderStateForRecovery {
    return this.state
  }

  public setMaxRetries(maxRetries: number): void {
    this.maxRetries = maxRetries
  }

  public fail(scenario: FailureScenario): void {
    this.lastScenario = scenario
    this.state = RecorderStateForRecovery.ERROR
  }

  public abnormalStop(): void {
    this.lastScenario = FailureScenario.ABNORMAL_STOP
    this.state = RecorderStateForRecovery.STOPPED
  }

  // Error -> Idle. Returns false when the engine is not in the Error state.
  public recoverToIdle(recoveryMs: number): boolean {
    if (this.state !== RecorderStateForRecovery.ERROR) {
      return false
    }
    const from = this.state
    this.state = RecorderStateForRecovery.IDLE
    this.append(this.lastScenario, 1, from, RecoveryResult.IDLE_RESTORED, recoveryMs)
    return true
  }

  // Restarts the recording with a bounded retry budget.
  // failuresBeforeSuccess controls how many attempts fail before one succeeds.
  public restart(failuresBeforeSuccess: number, recoveryMs: number): boolean {
    for (let attempt = 1; attempt <= this.maxRetries + 1; attempt++) {
      if (attempt <= failuresBeforeSuccess) {
        this.state = RecorderStateForRecovery.ERROR
        this.append(FailureScenario.NATIVE_START_FAILURE, attempt, RecorderStateForRecovery.IDLE,
          RecoveryResult.RESTART_FAILED, recoveryMs)
        continue
      }
      const from = this.state
      this.state = RecorderStateForRecovery.RECORDING
      this.append(FailureScenario.NATIVE_START_FAILURE, attempt, from, RecoveryResult.RESTART_SUCCEEDED, recoveryMs)
      return true
    }
    this.state = RecorderStateForRecovery.ERROR
    this.append(FailureScenario.NATIVE_START_FAILURE, this.maxRetries + 1, RecorderStateForRecovery.ERROR,
      RecoveryResult.GAVE_UP, recoveryMs)
    return false
  }

  public append(scenario: FailureScenario, attempt: number, fromState: RecorderStateForRecovery,
    result: RecoveryResult, recoveryMs: number): void {
    const record: RecoveryAttempt = {
      scenario: scenario,
      attempt: attempt,
      fromState: fromState,
      toState: this.state,
      result: result,
      recoveryMs: recoveryMs,
      timestamp: this.clock
    }
    this.attempts.push(record)
    this.clock += 5
  }

  public getAttempts(): RecoveryAttempt[] {
    return this.attempts.slice()
  }

  public countResult(result: RecoveryResult): number {
    let count = 0
    for (const record of this.attempts) {
      if (record.result === result) {
        count += 1
      }
    }
    return count
  }

  public getSuccessRate(): number {
    const succeeded = this.countResult(RecoveryResult.IDLE_RESTORED) +
      this.countResult(RecoveryResult.RESTART_SUCCEEDED)
    if (this.attempts.length === 0) {
      return 0
    }
    return succeeded / this.attempts.length
  }

  public getAverageRecoveryMs(): number {
    if (this.attempts.length === 0) {
      return 0
    }
    let total = 0
    for (const record of this.attempts) {
      total += record.recoveryMs
    }
    return total / this.attempts.length
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.attempts.length; i++) {
      if (this.attempts[i - 1].timestamp > this.attempts[i].timestamp) {
        return false
      }
    }
    return true
  }

  public reset(): void {
    this.state = RecorderStateForRecovery.IDLE
    this.attempts = []
    this.clock = 1700000000000
    this.lastScenario = FailureScenario.SERVICE_KILLED
  }
}

export default function stateRecoveryTest(): void {
  describe('StateRecovery_Test', () => {
    let engine: RecordingRecoveryEngine

    beforeEach(() => {
      engine = new RecordingRecoveryEngine()
    })

    it('engine_should_start_idle', 0, () => {
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.IDLE)
      expect(engine.getAttempts().length).assertEqual(0)
      expect(engine.getSuccessRate()).assertEqual(0)
    })

    it('engine_should_enter_error_on_failure', 0, () => {
      engine.fail(FailureScenario.CREATE_ASSET_FAILURE)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.ERROR)
    })

    it('engine_should_recover_from_error_to_idle', 0, () => {
      engine.fail(FailureScenario.NATIVE_START_FAILURE)
      expect(engine.recoverToIdle(120)).assertTrue()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.IDLE)
    })

    it('recover_should_do_nothing_when_idle', 0, () => {
      expect(engine.recoverToIdle(50)).assertFalse()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.IDLE)
      expect(engine.getAttempts().length).assertEqual(0)
    })

    it('recover_should_journal_idle_restored', 0, () => {
      engine.fail(FailureScenario.ABNORMAL_STOP)
      engine.recoverToIdle(200)
      const attempts = engine.getAttempts()
      expect(attempts.length).assertEqual(1)
      expect(attempts[0].result).assertEqual(RecoveryResult.IDLE_RESTORED)
      expect(attempts[0].fromState).assertEqual(RecorderStateForRecovery.ERROR)
      expect(attempts[0].toState).assertEqual(RecorderStateForRecovery.IDLE)
    })

    it('recover_should_keep_failure_scenario', 0, () => {
      engine.fail(FailureScenario.NULL_CONTEXT)
      engine.recoverToIdle(80)
      expect(engine.getAttempts()[0].scenario).assertEqual(FailureScenario.NULL_CONTEXT)
    })

    it('recover_should_handle_null_context', 0, () => {
      engine.fail(FailureScenario.NULL_CONTEXT)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.ERROR)
      expect(engine.recoverToIdle(60)).assertTrue()
      expect(engine.countResult(RecoveryResult.IDLE_RESTORED)).assertEqual(1)
    })

    it('recover_should_handle_asset_failure', 0, () => {
      engine.fail(FailureScenario.CREATE_ASSET_FAILURE)
      engine.recoverToIdle(90)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.IDLE)
      expect(engine.getAttempts()[0].recoveryMs).assertEqual(90)
    })

    it('recover_should_handle_native_failure', 0, () => {
      engine.fail(FailureScenario.NATIVE_START_FAILURE)
      engine.recoverToIdle(70)
      expect(engine.countResult(RecoveryResult.IDLE_RESTORED)).assertEqual(1)
    })

    it('restart_should_start_recording', 0, () => {
      expect(engine.restart(0, 100)).assertTrue()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.RECORDING)
      expect(engine.countResult(RecoveryResult.RESTART_SUCCEEDED)).assertEqual(1)
    })

    it('restart_should_fail_once_then_succeed', 0, () => {
      expect(engine.restart(1, 100)).assertTrue()
      expect(engine.countResult(RecoveryResult.RESTART_FAILED)).assertEqual(1)
      expect(engine.countResult(RecoveryResult.RESTART_SUCCEEDED)).assertEqual(1)
      expect(engine.getAttempts().length).assertEqual(2)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.RECORDING)
    })

    it('restart_should_respect_retry_limit', 0, () => {
      expect(engine.restart(2, 100)).assertTrue()
      expect(engine.countResult(RecoveryResult.RESTART_FAILED)).assertEqual(2)
      expect(engine.countResult(RecoveryResult.RESTART_SUCCEEDED)).assertEqual(1)
    })

    it('restart_should_give_up_after_limit', 0, () => {
      expect(engine.restart(3, 100)).assertFalse()
      expect(engine.countResult(RecoveryResult.GAVE_UP)).assertEqual(1)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.ERROR)
    })

    it('restart_should_use_configured_retry_budget', 0, () => {
      engine.setMaxRetries(1)
      expect(engine.restart(1, 100)).assertTrue()
      engine.setMaxRetries(0)
      expect(engine.restart(1, 100)).assertFalse()
      expect(engine.countResult(RecoveryResult.GAVE_UP)).assertEqual(1)
    })

    it('restart_after_abnormal_stop_should_work', 0, () => {
      engine.abnormalStop()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.STOPPED)
      expect(engine.restart(0, 150)).assertTrue()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.RECORDING)
    })

    it('restart_should_keep_attempt_numbers', 0, () => {
      engine.restart(2, 100)
      const attempts = engine.getAttempts()
      expect(attempts[0].attempt).assertEqual(1)
      expect(attempts[1].attempt).assertEqual(2)
      expect(attempts[2].attempt).assertEqual(3)
    })

    it('recovery_should_compute_success_rate', 0, () => {
      engine.fail(FailureScenario.ABNORMAL_STOP)
      engine.recoverToIdle(100)
      engine.restart(0, 100)
      expect(engine.getSuccessRate()).assertEqual(1)
      engine.restart(3, 100)
      expect(engine.getSuccessRate()).assertLess(1)
    })

    it('recovery_should_compute_average_time', 0, () => {
      engine.fail(FailureScenario.ABNORMAL_STOP)
      engine.recoverToIdle(100)
      engine.restart(0, 300)
      expect(engine.getAverageRecoveryMs()).assertEqual(200)
    })

    it('recovery_journal_should_be_chronological', 0, () => {
      engine.fail(FailureScenario.ABNORMAL_STOP)
      engine.recoverToIdle(100)
      engine.restart(1, 100)
      expect(engine.isChronological()).assertTrue()
    })

    it('recovery_should_handle_repeated_failures', 0, () => {
      for (let cycle = 0; cycle < 5; cycle++) {
        engine.fail(FailureScenario.SERVICE_KILLED)
        expect(engine.recoverToIdle(50)).assertTrue()
      }
      expect(engine.countResult(RecoveryResult.IDLE_RESTORED)).assertEqual(5)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.IDLE)
    })

    it('recovery_engine_should_reset', 0, () => {
      engine.fail(FailureScenario.SERVICE_KILLED)
      engine.recoverToIdle(100)
      engine.reset()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.IDLE)
      expect(engine.getAttempts().length).assertEqual(0)
      expect(engine.getAverageRecoveryMs()).assertEqual(0)
    })

    it('comprehensive_state_recovery_scenario', 0, () => {
      engine.fail(FailureScenario.CREATE_ASSET_FAILURE)
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.ERROR)
      expect(engine.recoverToIdle(120)).assertTrue()

      expect(engine.restart(1, 200)).assertTrue()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.RECORDING)

      engine.abnormalStop()
      expect(engine.getState()).assertEqual(RecorderStateForRecovery.STOPPED)
      expect(engine.restart(0, 150)).assertTrue()

      const attempts = engine.getAttempts()
      expect(attempts.length).assertEqual(4)
      expect(engine.isChronological()).assertTrue()
      expect(engine.countResult(RecoveryResult.RESTART_SUCCEEDED)).assertEqual(2)
    })
  })
}
