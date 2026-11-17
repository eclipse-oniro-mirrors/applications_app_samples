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

// Lifecycle phases of the recorder tip dialog (ScreenRecorderDialog).
enum TipDialogPhase {
  CREATED = 'created',
  SHOWING = 'showing',
  VISIBLE = 'visible',
  HIDING = 'hiding',
  HIDDEN = 'hidden',
  DESTROYED = 'destroyed'
}

// Side effects that ScreenRecorderAbility performs around the tip window.
enum TipDialogEffect {
  LOAD_CONTENT = 'load_content',
  SHOW_WINDOW = 'show_window',
  START_TIMER = 'start_timer',
  HIDE_WINDOW = 'hide_window',
  INVOKE_CALLBACK = 'invoke_callback',
  TERMINATE_SELF = 'terminate_self'
}

// One lifecycle record of the tip dialog.
interface TipDialogLifecycleRecord {
  phase: TipDialogPhase
  durationMs: number
  effect: TipDialogEffect
  succeeded: boolean
  timestamp: number
}

// Aggregated lifecycle statistics of the tip dialog.
interface TipDialogLifecycleStats {
  totalPhases: number
  succeededPhases: number
  failedPhases: number
  averageDurationMs: number
  lastPhase: string
}

// Tracker that models the aboutToAppear / aboutToDisappear contract of the
// tip dialog: the window is shown, kept visible for the popup duration and
// hidden right before the service terminates itself.
class TipDialogLifecycleTracker {
  private records: TipDialogLifecycleRecord[] = []
  private clock: number = 1700000000000

  public record(phase: TipDialogPhase, effect: TipDialogEffect, durationMs: number, succeeded: boolean): void {
    const record: TipDialogLifecycleRecord = {
      phase: phase,
      effect: effect,
      durationMs: durationMs,
      succeeded: succeeded,
      timestamp: this.clock
    }
    this.records.push(record)
    this.clock += durationMs > 0 ? durationMs : 1
  }

  public aboutToAppear(): void {
    this.record(TipDialogPhase.CREATED, TipDialogEffect.LOAD_CONTENT, 12, true)
    this.record(TipDialogPhase.SHOWING, TipDialogEffect.SHOW_WINDOW, 8, true)
    this.record(TipDialogPhase.VISIBLE, TipDialogEffect.START_TIMER, 3000, true)
  }

  public aboutToDisappear(callbackFired: boolean): void {
    this.record(TipDialogPhase.HIDING, TipDialogEffect.HIDE_WINDOW, 6, true)
    this.record(TipDialogPhase.HIDDEN, TipDialogEffect.INVOKE_CALLBACK, 4, callbackFired)
    this.record(TipDialogPhase.DESTROYED, TipDialogEffect.TERMINATE_SELF, 2, callbackFired)
  }

  public getRecords(): TipDialogLifecycleRecord[] {
    return this.records.slice()
  }

  public getTotalPhases(): number {
    return this.records.length
  }

  public hasPhase(phase: TipDialogPhase): boolean {
    for (const record of this.records) {
      if (record.phase === phase) {
        return true
      }
    }
    return false
  }

  public countPhase(phase: TipDialogPhase): number {
    let count = 0
    for (const record of this.records) {
      if (record.phase === phase) {
        count += 1
      }
    }
    return count
  }

  public countSucceeded(): number {
    let count = 0
    for (const record of this.records) {
      if (record.succeeded) {
        count += 1
      }
    }
    return count
  }

  public getSuccessRate(): number {
    if (this.records.length === 0) {
      return 0
    }
    return this.countSucceeded() / this.records.length
  }

  public getAverageDuration(): number {
    if (this.records.length === 0) {
      return 0
    }
    let total = 0
    for (const record of this.records) {
      total += record.durationMs
    }
    return total / this.records.length
  }

  public buildStats(): TipDialogLifecycleStats {
    const stats: TipDialogLifecycleStats = {
      totalPhases: this.records.length,
      succeededPhases: this.countSucceeded(),
      failedPhases: this.records.length - this.countSucceeded(),
      averageDurationMs: this.getAverageDuration(),
      lastPhase: this.records.length === 0 ? '' : this.records[this.records.length - 1].phase
    }
    return stats
  }

  public getOrderedPhases(): TipDialogPhase[] {
    const phases: TipDialogPhase[] = []
    for (const record of this.records) {
      phases.push(record.phase)
    }
    return phases
  }

  public isTerminated(): boolean {
    return this.records.length > 0 && this.records[this.records.length - 1].phase === TipDialogPhase.DESTROYED
  }

  public reset(): void {
    this.records = []
    this.clock = 1700000000000
  }
}

export default function dialogLifecycleTest(): void {
  describe('DialogLifecycle_Test', () => {
    let tracker: TipDialogLifecycleTracker

    // Every case starts from a clean tracker so the phase counters stay stable.
    beforeEach(() => {
      tracker = new TipDialogLifecycleTracker()
    })

    it('tip_dialog_should_reach_visible_phase_after_appear', 0, () => {
      tracker.aboutToAppear()
      expect(tracker.hasPhase(TipDialogPhase.CREATED)).assertTrue()
      expect(tracker.hasPhase(TipDialogPhase.SHOWING)).assertTrue()
      expect(tracker.hasPhase(TipDialogPhase.VISIBLE)).assertTrue()
      expect(tracker.isTerminated()).assertFalse()
    })

    it('tip_dialog_should_apply_effects_in_order_on_appear', 0, () => {
      tracker.aboutToAppear()
      const records = tracker.getRecords()
      expect(records.length).assertEqual(3)
      expect(records[0].effect).assertEqual(TipDialogEffect.LOAD_CONTENT)
      expect(records[1].effect).assertEqual(TipDialogEffect.SHOW_WINDOW)
      expect(records[2].effect).assertEqual(TipDialogEffect.START_TIMER)
    })

    it('tip_dialog_should_terminate_self_after_disappear', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      expect(tracker.hasPhase(TipDialogPhase.DESTROYED)).assertTrue()
      expect(tracker.isTerminated()).assertTrue()
      const records = tracker.getRecords()
      expect(records[records.length - 1].effect).assertEqual(TipDialogEffect.TERMINATE_SELF)
    })

    it('tip_dialog_should_keep_visible_for_3000ms', 0, () => {
      tracker.aboutToAppear()
      const records = tracker.getRecords()
      let visibleDuration = 0
      for (const record of records) {
        if (record.phase === TipDialogPhase.VISIBLE) {
          visibleDuration = record.durationMs
        }
      }
      expect(visibleDuration).assertEqual(3000)
    })

    it('tip_dialog_should_hide_window_before_callback', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      const phases = tracker.getOrderedPhases()
      const hideIndex = phases.indexOf(TipDialogPhase.HIDING)
      const callbackIndex = phases.indexOf(TipDialogPhase.HIDDEN)
      expect(hideIndex).assertLargerOrEqual(0)
      expect(callbackIndex).assertLarger(hideIndex)
    })

    it('tip_dialog_lifecycle_records_should_be_chronological', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      const records = tracker.getRecords()
      for (let i = 1; i < records.length; i++) {
        expect(records[i - 1].timestamp).assertLessOrEqual(records[i].timestamp)
      }
    })

    it('tip_dialog_should_report_complete_phase_sequence', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      const phases = tracker.getOrderedPhases()
      expect(phases.length).assertEqual(6)
      expect(phases[0]).assertEqual(TipDialogPhase.CREATED)
      expect(phases[1]).assertEqual(TipDialogPhase.SHOWING)
      expect(phases[2]).assertEqual(TipDialogPhase.VISIBLE)
      expect(phases[3]).assertEqual(TipDialogPhase.HIDING)
      expect(phases[4]).assertEqual(TipDialogPhase.HIDDEN)
      expect(phases[5]).assertEqual(TipDialogPhase.DESTROYED)
    })

    it('tip_dialog_should_report_full_success_rate', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      expect(tracker.countSucceeded()).assertEqual(6)
      expect(tracker.getSuccessRate()).assertEqual(1)
    })

    it('tip_dialog_should_mark_failed_callback', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(false)
      const stats = tracker.buildStats()
      expect(stats.totalPhases).assertEqual(6)
      expect(stats.succeededPhases).assertEqual(4)
      expect(stats.failedPhases).assertEqual(2)
    })

    it('tip_dialog_stats_should_aggregate_durations', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      const stats = tracker.buildStats()
      expect(stats.lastPhase).assertEqual(TipDialogPhase.DESTROYED)
      expect(stats.averageDurationMs).assertLarger(0)
      const expected = (12 + 8 + 3000 + 6 + 4 + 2) / 6
      expect(stats.averageDurationMs).assertEqual(expected)
    })

    it('tip_dialog_tracker_should_reset_between_rounds', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      expect(tracker.getTotalPhases()).assertEqual(6)
      tracker.reset()
      expect(tracker.getTotalPhases()).assertEqual(0)
      expect(tracker.getOrderedPhases().length).assertEqual(0)
      expect(tracker.isTerminated()).assertFalse()
    })

    it('tip_dialog_should_count_repeated_visible_phase', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToAppear()
      expect(tracker.countPhase(TipDialogPhase.VISIBLE)).assertEqual(2)
      expect(tracker.countPhase(TipDialogPhase.CREATED)).assertEqual(2)
      expect(tracker.isTerminated()).assertFalse()
    })

    it('tip_dialog_should_keep_last_phase_after_destroy', 0, () => {
      tracker.aboutToAppear()
      tracker.aboutToDisappear(true)
      const stats = tracker.buildStats()
      expect(stats.lastPhase).assertEqual(TipDialogPhase.DESTROYED)
      expect(tracker.hasPhase(TipDialogPhase.HIDDEN)).assertTrue()
    })

    it('tip_dialog_should_track_multiple_popup_rounds', 0, () => {
      for (let round = 0; round < 3; round++) {
        tracker.aboutToAppear()
        tracker.aboutToDisappear(true)
      }
      expect(tracker.getTotalPhases()).assertEqual(18)
      expect(tracker.countPhase(TipDialogPhase.VISIBLE)).assertEqual(3)
      expect(tracker.countPhase(TipDialogPhase.DESTROYED)).assertEqual(3)
    })

    it('comprehensive_tip_dialog_lifecycle_scenario', 0, () => {
      tracker.aboutToAppear()
      const appeared = tracker.getRecords()
      expect(appeared.length).assertEqual(3)
      expect(appeared[2].phase).assertEqual(TipDialogPhase.VISIBLE)

      tracker.aboutToDisappear(true)
      const completed = tracker.getRecords()
      expect(completed.length).assertEqual(6)
      expect(completed[3].phase).assertEqual(TipDialogPhase.HIDING)
      expect(completed[5].phase).assertEqual(TipDialogPhase.DESTROYED)

      const stats = tracker.buildStats()
      expect(stats.succeededPhases).assertEqual(6)
      expect(tracker.getSuccessRate()).assertEqual(1)
      expect(tracker.isTerminated()).assertTrue()
    })
  })
}
