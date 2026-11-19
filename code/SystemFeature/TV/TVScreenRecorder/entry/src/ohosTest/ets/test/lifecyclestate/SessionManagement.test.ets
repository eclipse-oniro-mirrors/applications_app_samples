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

// Lifecycle of one screen recording session.
enum RecordingSessionState {
  NONE = 'none',
  STARTING = 'starting',
  ACTIVE = 'active',
  STOPPING = 'stopping',
  CLOSED = 'closed'
}

// Commands accepted by the session manager.
enum RecordingSessionCommand {
  START = 'start',
  STOP = 'stop',
  QUERY = 'query'
}

// One journal entry of a recording session.
interface RecordingSessionRecord {
  sessionId: string
  state: RecordingSessionState
  command: RecordingSessionCommand
  succeed: boolean
  timestamp: number
}

// Snapshot returned by the query command.
interface RecordingSessionSnapshot {
  sessionId: string
  state: RecordingSessionState
  totalSessions: number
  journalSize: number
}

// Aggregated session counters.
interface RecordingSessionSummary {
  totalSessions: number
  startCount: number
  stopCount: number
  queryCount: number
  rejectedCount: number
  lastSessionId: string
}

// Manages the single active recording session of the TV recorder.
// Only one session can be active at a time: a second start request while a
// session is ACTIVE is rejected, and every start or stop is written to the
// journal so that the state can be queried at any time.
class RecordingSessionManager {
  private state: RecordingSessionState = RecordingSessionState.NONE
  private currentSessionId: string = ''
  private journal: RecordingSessionRecord[] = []
  private clock: number = 1700000000000
  private sessionCounter: number = 0
  private startCount: number = 0
  private stopCount: number = 0
  private queryCount: number = 0
  private rejectedCount: number = 0

  public startSession(requestedId: string): boolean {
    if (this.state === RecordingSessionState.ACTIVE || this.state === RecordingSessionState.STARTING) {
      this.rejectedCount += 1
      this.append(requestedId, 'start_rejected', RecordingSessionCommand.START, false)
      return false
    }
    this.sessionCounter += 1
    this.currentSessionId = requestedId
    this.state = RecordingSessionState.STARTING
    this.append(requestedId, 'starting', RecordingSessionCommand.START, true)
    this.state = RecordingSessionState.ACTIVE
    this.append(requestedId, 'active', RecordingSessionCommand.START, true)
    this.startCount += 1
    return true
  }

  public stopSession(): boolean {
    if (this.state !== RecordingSessionState.ACTIVE) {
      this.rejectedCount += 1
      this.append(this.currentSessionId, 'stop_rejected', RecordingSessionCommand.STOP, false)
      return false
    }
    this.state = RecordingSessionState.STOPPING
    this.append(this.currentSessionId, 'stopping', RecordingSessionCommand.STOP, true)
    this.state = RecordingSessionState.CLOSED
    this.append(this.currentSessionId, 'closed', RecordingSessionCommand.STOP, true)
    this.stopCount += 1
    return true
  }

  public querySession(): RecordingSessionSnapshot {
    this.queryCount += 1
    this.append(this.currentSessionId, `${this.state}`, RecordingSessionCommand.QUERY, true)
    const snapshot: RecordingSessionSnapshot = {
      sessionId: this.currentSessionId,
      state: this.state,
      totalSessions: this.sessionCounter,
      journalSize: this.journal.length
    }
    return snapshot
  }

  public append(sessionId: string, _state: string, command: RecordingSessionCommand, succeed: boolean): void {
    const record: RecordingSessionRecord = {
      sessionId: sessionId,
      state: this.state,
      command: command,
      succeed: succeed,
      timestamp: this.clock
    }
    this.journal.push(record)
    this.clock += 5
  }

  public getState(): RecordingSessionState {
    return this.state
  }

  public getActiveSessionId(): string {
    return this.state === RecordingSessionState.ACTIVE ? this.currentSessionId : ''
  }

  public getJournal(): RecordingSessionRecord[] {
    return this.journal.slice()
  }

  public countCommands(command: RecordingSessionCommand): number {
    let count = 0
    for (const record of this.journal) {
      if (record.command === command) {
        count += 1
      }
    }
    return count
  }

  public countSucceededCommands(command: RecordingSessionCommand): number {
    let count = 0
    for (const record of this.journal) {
      if (record.command === command && record.succeed) {
        count += 1
      }
    }
    return count
  }

  public hasSession(sessionId: string): boolean {
    for (const record of this.journal) {
      if (record.sessionId === sessionId) {
        return true
      }
    }
    return false
  }

  public isJournalChronological(): boolean {
    for (let i = 1; i < this.journal.length; i++) {
      if (this.journal[i - 1].timestamp > this.journal[i].timestamp) {
        return false
      }
    }
    return true
  }

  public buildSummary(): RecordingSessionSummary {
    const summary: RecordingSessionSummary = {
      totalSessions: this.sessionCounter,
      startCount: this.startCount,
      stopCount: this.stopCount,
      queryCount: this.queryCount,
      rejectedCount: this.rejectedCount,
      lastSessionId: this.currentSessionId
    }
    return summary
  }

  public reset(): void {
    this.state = RecordingSessionState.NONE
    this.currentSessionId = ''
    this.journal = []
    this.clock = 1700000000000
    this.sessionCounter = 0
    this.startCount = 0
    this.stopCount = 0
    this.queryCount = 0
    this.rejectedCount = 0
  }
}

export default function sessionManagementTest(): void {
  describe('SessionManagement_Test', () => {
    let manager: RecordingSessionManager

    beforeEach(() => {
      manager = new RecordingSessionManager()
    })

    it('session_manager_should_start_with_none_state', 0, () => {
      expect(manager.getState()).assertEqual(RecordingSessionState.NONE)
      expect(manager.getActiveSessionId()).assertEqual('')
      expect(manager.getJournal().length).assertEqual(0)
      expect(manager.buildSummary().totalSessions).assertEqual(0)
    })

    it('session_should_start_successfully', 0, () => {
      expect(manager.startSession('session_001')).assertTrue()
      expect(manager.getState()).assertEqual(RecordingSessionState.ACTIVE)
      expect(manager.buildSummary().startCount).assertEqual(1)
    })

    it('session_should_expose_active_session_id', 0, () => {
      manager.startSession('session_001')
      expect(manager.getActiveSessionId()).assertEqual('session_001')
      expect(manager.hasSession('session_001')).assertTrue()
    })

    it('session_should_reject_second_start_while_active', 0, () => {
      manager.startSession('session_001')
      expect(manager.startSession('session_002')).assertFalse()
      expect(manager.getActiveSessionId()).assertEqual('session_001')
      expect(manager.buildSummary().totalSessions).assertEqual(1)
    })

    it('session_rejection_should_be_journaled', 0, () => {
      manager.startSession('session_001')
      manager.startSession('session_002')
      expect(manager.buildSummary().rejectedCount).assertEqual(1)
      const journal = manager.getJournal()
      const last = journal[journal.length - 1]
      expect(last.succeed).assertFalse()
      expect(last.command).assertEqual(RecordingSessionCommand.START)
    })

    it('session_should_stop_successfully', 0, () => {
      manager.startSession('session_001')
      expect(manager.stopSession()).assertTrue()
      expect(manager.getState()).assertEqual(RecordingSessionState.CLOSED)
      expect(manager.buildSummary().stopCount).assertEqual(1)
    })

    it('session_should_clear_active_id_after_stop', 0, () => {
      manager.startSession('session_001')
      manager.stopSession()
      expect(manager.getActiveSessionId()).assertEqual('')
    })

    it('stop_without_active_session_should_be_rejected', 0, () => {
      expect(manager.stopSession()).assertFalse()
      expect(manager.getState()).assertEqual(RecordingSessionState.NONE)
      expect(manager.buildSummary().rejectedCount).assertEqual(1)
    })

    it('stop_after_stop_should_be_rejected', 0, () => {
      manager.startSession('session_001')
      manager.stopSession()
      expect(manager.stopSession()).assertFalse()
      expect(manager.buildSummary().stopCount).assertEqual(1)
      expect(manager.buildSummary().rejectedCount).assertEqual(1)
    })

    it('query_should_return_session_snapshot', 0, () => {
      manager.startSession('session_001')
      const snapshot: RecordingSessionSnapshot = manager.querySession()
      expect(snapshot.sessionId).assertEqual('session_001')
      expect(snapshot.state).assertEqual(RecordingSessionState.ACTIVE)
      expect(snapshot.totalSessions).assertEqual(1)
      expect(snapshot.journalSize).assertLarger(2)
    })

    it('query_should_count_calls', 0, () => {
      manager.querySession()
      manager.querySession()
      manager.querySession()
      expect(manager.buildSummary().queryCount).assertEqual(3)
      expect(manager.countCommands(RecordingSessionCommand.QUERY)).assertEqual(3)
    })

    it('query_should_work_in_all_states', 0, () => {
      expect(manager.querySession().state).assertEqual(RecordingSessionState.NONE)
      manager.startSession('session_001')
      expect(manager.querySession().state).assertEqual(RecordingSessionState.ACTIVE)
      manager.stopSession()
      expect(manager.querySession().state).assertEqual(RecordingSessionState.CLOSED)
    })

    it('journal_should_record_start_events', 0, () => {
      manager.startSession('session_001')
      expect(manager.countCommands(RecordingSessionCommand.START)).assertEqual(2)
      expect(manager.countSucceededCommands(RecordingSessionCommand.START)).assertEqual(2)
    })

    it('journal_should_record_stop_events', 0, () => {
      manager.startSession('session_001')
      manager.stopSession()
      expect(manager.countCommands(RecordingSessionCommand.STOP)).assertEqual(2)
      expect(manager.countSucceededCommands(RecordingSessionCommand.STOP)).assertEqual(2)
    })

    it('journal_should_be_chronological', 0, () => {
      manager.startSession('session_001')
      manager.querySession()
      manager.stopSession()
      expect(manager.isJournalChronological()).assertTrue()
    })

    it('journal_should_keep_session_ids', 0, () => {
      manager.startSession('session_alpha')
      manager.stopSession()
      manager.startSession('session_beta')
      expect(manager.hasSession('session_alpha')).assertTrue()
      expect(manager.hasSession('session_beta')).assertTrue()
      expect(manager.hasSession('session_gamma')).assertFalse()
    })

    it('summary_should_count_sessions', 0, () => {
      manager.startSession('session_001')
      manager.stopSession()
      manager.startSession('session_002')
      const summary = manager.buildSummary()
      expect(summary.totalSessions).assertEqual(2)
      expect(summary.startCount).assertEqual(2)
      expect(summary.stopCount).assertEqual(1)
      expect(summary.lastSessionId).assertEqual('session_002')
    })

    it('summary_should_report_rejections', 0, () => {
      manager.startSession('session_001')
      manager.startSession('session_002')
      manager.stopSession()
      manager.stopSession()
      expect(manager.buildSummary().rejectedCount).assertEqual(2)
    })

    it('session_should_support_multiple_cycles', 0, () => {
      for (let cycle = 0; cycle < 5; cycle++) {
        expect(manager.startSession(`session_cycle_${cycle}`)).assertTrue()
        expect(manager.stopSession()).assertTrue()
      }
      const summary = manager.buildSummary()
      expect(summary.totalSessions).assertEqual(5)
      expect(summary.startCount).assertEqual(5)
      expect(summary.stopCount).assertEqual(5)
      expect(manager.getState()).assertEqual(RecordingSessionState.CLOSED)
    })

    it('only_one_active_session_should_exist', 0, () => {
      expect(manager.startSession('session_001')).assertTrue()
      for (let i = 0; i < 10; i++) {
        expect(manager.startSession(`session_duplicate_${i}`)).assertFalse()
      }
      expect(manager.getActiveSessionId()).assertEqual('session_001')
      expect(manager.buildSummary().totalSessions).assertEqual(1)
      expect(manager.buildSummary().rejectedCount).assertEqual(10)
    })

    it('session_should_handle_rapid_restart', 0, () => {
      manager.startSession('session_001')
      manager.stopSession()
      expect(manager.startSession('session_002')).assertTrue()
      expect(manager.getState()).assertEqual(RecordingSessionState.ACTIVE)
      expect(manager.getActiveSessionId()).assertEqual('session_002')
    })

    it('session_should_reset_all_counters', 0, () => {
      manager.startSession('session_001')
      manager.querySession()
      manager.reset()
      expect(manager.getState()).assertEqual(RecordingSessionState.NONE)
      expect(manager.getJournal().length).assertEqual(0)
      expect(manager.buildSummary().totalSessions).assertEqual(0)
      expect(manager.buildSummary().queryCount).assertEqual(0)
    })

    it('session_should_handle_command_stress', 0, () => {
      for (let i = 0; i < 50; i++) {
        manager.startSession(`session_stress_${i}`)
        manager.querySession()
        manager.stopSession()
      }
      const summary = manager.buildSummary()
      expect(summary.totalSessions).assertEqual(50)
      expect(summary.startCount).assertEqual(50)
      expect(summary.stopCount).assertEqual(50)
      expect(summary.queryCount).assertEqual(50)
      expect(manager.isJournalChronological()).assertTrue()
    })

    it('comprehensive_session_management_scenario', 0, () => {
      expect(manager.startSession('session_main')).assertTrue()
      expect(manager.getActiveSessionId()).assertEqual('session_main')
      expect(manager.startSession('session_second')).assertFalse()

      const activeSnapshot = manager.querySession()
      expect(activeSnapshot.state).assertEqual(RecordingSessionState.ACTIVE)
      expect(activeSnapshot.sessionId).assertEqual('session_main')

      expect(manager.stopSession()).assertTrue()
      const closedSnapshot = manager.querySession()
      expect(closedSnapshot.state).assertEqual(RecordingSessionState.CLOSED)

      expect(manager.startSession('session_recovery')).assertTrue()
      expect(manager.stopSession()).assertTrue()

      const summary = manager.buildSummary()
      expect(summary.totalSessions).assertEqual(2)
      expect(summary.startCount).assertEqual(2)
      expect(summary.stopCount).assertEqual(2)
      expect(summary.rejectedCount).assertEqual(1)
      expect(manager.countCommands(RecordingSessionCommand.QUERY)).assertEqual(2)
      expect(manager.isJournalChronological()).assertTrue()
    })
  })
}
