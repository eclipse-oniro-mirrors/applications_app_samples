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

// State machine of the recorder tip window created by
// WindowMgr.popupRecorderTip. The window is created on demand, stays visible
// for the popup duration and is destroyed when the service is torn down.
enum TipWindowState {
  IDLE = 'idle',
  CREATING = 'creating',
  VISIBLE = 'visible',
  HIDING = 'hiding',
  DESTROYED = 'destroyed'
}

// Floating windows created by ScreenRecorderAbility.
enum RecorderWindowKind {
  TIMER = 'timer',
  TIP = 'tip',
  RESOLUTION = 'resolution'
}

// Category used to group window state transitions.
enum TransitionCategory {
  CREATE_FLOW = 'create_flow',
  SHOW_FLOW = 'show_flow',
  HIDE_FLOW = 'hide_flow',
  RELEASE_FLOW = 'release_flow',
  IDLE = 'idle'
}

// Allowed pair of the tip window state machine.
interface TipTransitionPair {
  from: TipWindowState
  to: TipWindowState
}

// One recorded tip window transition.
interface TipTransitionRecord {
  from: TipWindowState
  to: TipWindowState
  trigger: string
  timestamp: number
}

// One floating window cached by WindowMgr.
interface RecorderWindowEntry {
  name: string
  kind: RecorderWindowKind
  page: string
  x: number
  y: number
  width: number
  height: number
  destroyed: boolean
}

// Aggregated window metrics used by the audit report.
interface WindowMetricsSnapshot {
  totalWindows: number
  timerCount: number
  tipCount: number
  transitionCount: number
  lastTrigger: string
}

// Per category statistics of the state machine.
interface WindowCategoryStat {
  category: TransitionCategory
  count: number
  ratio: number
}

// Candidate transition path evaluated by the validator.
interface TipTransitionPath {
  sequence: TipWindowState[]
  duration: number
  isComplete: boolean
}

// Window geometry applied to the floating windows.
interface RecorderWindowRect {
  x: number
  y: number
  width: number
  height: number
}

// State machine of the recorder tip window.
class TipWindowStateMachine {
  private static readonly ALLOWED: TipTransitionPair[] = [
    { from: TipWindowState.IDLE, to: TipWindowState.CREATING },
    { from: TipWindowState.CREATING, to: TipWindowState.VISIBLE },
    { from: TipWindowState.CREATING, to: TipWindowState.DESTROYED },
    { from: TipWindowState.VISIBLE, to: TipWindowState.HIDING },
    { from: TipWindowState.VISIBLE, to: TipWindowState.DESTROYED },
    { from: TipWindowState.HIDING, to: TipWindowState.IDLE },
    { from: TipWindowState.HIDING, to: TipWindowState.DESTROYED },
    { from: TipWindowState.DESTROYED, to: TipWindowState.CREATING }
  ]

  private state: TipWindowState = TipWindowState.IDLE
  private records: TipTransitionRecord[] = []
  private clock: number = 1700000000000
  private rejectedCount: number = 0

  public canTransition(from: TipWindowState, to: TipWindowState): boolean {
    for (const pair of TipWindowStateMachine.ALLOWED) {
      if (pair.from === from && pair.to === to) {
        return true
      }
    }
    return false
  }

  public transitionTo(to: TipWindowState, trigger: string): boolean {
    if (!this.canTransition(this.state, to)) {
      this.rejectedCount += 1
      return false
    }
    const record: TipTransitionRecord = {
      from: this.state,
      to: to,
      trigger: trigger,
      timestamp: this.clock
    }
    this.records.push(record)
    this.state = to
    this.clock += 10
    return true
  }

  public show(trigger: string): boolean {
    return this.transitionTo(TipWindowState.CREATING, trigger)
  }

  public markVisible(trigger: string): boolean {
    return this.transitionTo(TipWindowState.VISIBLE, trigger)
  }

  public hide(trigger: string): boolean {
    return this.transitionTo(TipWindowState.HIDING, trigger)
  }

  public destroy(trigger: string): boolean {
    return this.transitionTo(TipWindowState.DESTROYED, trigger)
  }

  public getState(): TipWindowState {
    return this.state
  }

  public getHistory(): TipTransitionRecord[] {
    return this.records.slice()
  }

  public getTotalTransitions(): number {
    return this.records.length
  }

  public getRejectedCount(): number {
    return this.rejectedCount
  }

  public hasReached(state: TipWindowState): boolean {
    for (const record of this.records) {
      if (record.to === state) {
        return true
      }
    }
    return false
  }

  public countTo(state: TipWindowState): number {
    let count = 0
    for (const record of this.records) {
      if (record.to === state) {
        count += 1
      }
    }
    return count
  }

  public getLastTrigger(): string {
    if (this.records.length === 0) {
      return ''
    }
    return this.records[this.records.length - 1].trigger
  }

  public isTerminal(): boolean {
    return this.state === TipWindowState.DESTROYED
  }

  public advanceClock(ms: number): void {
    if (ms > 0) {
      this.clock += ms
    }
  }

  public reset(): void {
    this.state = TipWindowState.IDLE
    this.records = []
    this.clock = 1700000000000
    this.rejectedCount = 0
  }
}

// Window cache of WindowMgr: the same name can be stored only once and
// release destroys every cached floating window.
class RecorderWindowRegistry {
  private entries: RecorderWindowEntry[] = []
  private destroyedCount: number = 0
  private releaseCount: number = 0

  public set(name: string, kind: RecorderWindowKind, page: string, rect: RecorderWindowRect): boolean {
    for (const entry of this.entries) {
      if (entry.name === name) {
        return false
      }
    }
    const created: RecorderWindowEntry = {
      name: name,
      kind: kind,
      page: page,
      x: rect.x,
      y: rect.y,
      width: rect.width,
      height: rect.height,
      destroyed: false
    }
    this.entries.push(created)
    return true
  }

  public get(name: string): RecorderWindowEntry | undefined {
    for (const entry of this.entries) {
      if (entry.name === name) {
        return entry
      }
    }
    return undefined
  }

  public size(): number {
    return this.entries.length
  }

  public release(): number {
    let destroyed = 0
    for (const entry of this.entries) {
      entry.destroyed = true
      destroyed += 1
    }
    this.entries = []
    this.destroyedCount += destroyed
    this.releaseCount += 1
    return destroyed
  }

  public getDestroyedCount(): number {
    return this.destroyedCount
  }

  public getReleaseCount(): number {
    return this.releaseCount
  }

  public countKind(kind: RecorderWindowKind): number {
    let count = 0
    for (const entry of this.entries) {
      if (entry.kind === kind) {
        count += 1
      }
    }
    return count
  }
}

// Classifies the transition trigger into a coarse category.
class WindowTransitionClassifier {
  public classify(trigger: string): TransitionCategory {
    if (trigger.includes('show') || trigger.includes('create') || trigger.includes('render')) {
      return TransitionCategory.CREATE_FLOW
    }
    if (trigger.includes('hide') || trigger.includes('timer') || trigger.includes('duration')) {
      return TransitionCategory.HIDE_FLOW
    }
    if (trigger.includes('release') || trigger.includes('destroy')) {
      return TransitionCategory.RELEASE_FLOW
    }
    if (trigger.includes('visible') || trigger.includes('popup')) {
      return TransitionCategory.SHOW_FLOW
    }
    return TransitionCategory.IDLE
  }

  public countByCategory(records: TipTransitionRecord[], category: TransitionCategory): number {
    let count = 0
    for (const record of records) {
      if (this.classify(record.trigger) === category) {
        count += 1
      }
    }
    return count
  }
}

// Builds the window metrics snapshot consumed by the audit report.
class WindowMetricsCalculator {
  private stateMachine: TipWindowStateMachine
  private registry: RecorderWindowRegistry

  constructor(stateMachine: TipWindowStateMachine, registry: RecorderWindowRegistry) {
    this.stateMachine = stateMachine
    this.registry = registry
  }

  public buildSnapshot(): WindowMetricsSnapshot {
    const snapshot: WindowMetricsSnapshot = {
      totalWindows: this.registry.size(),
      timerCount: this.registry.countKind(RecorderWindowKind.TIMER),
      tipCount: this.registry.countKind(RecorderWindowKind.TIP),
      transitionCount: this.stateMachine.getTotalTransitions(),
      lastTrigger: this.stateMachine.getLastTrigger()
    }
    return snapshot
  }
}

// Validates whether a transition path follows the documented lifecycle.
class TipTransitionPathValidator {
  private static readonly SHOW_PATH: TipWindowState[] = [
    TipWindowState.IDLE,
    TipWindowState.CREATING,
    TipWindowState.VISIBLE
  ]

  private static readonly HIDE_PATH: TipWindowState[] = [
    TipWindowState.VISIBLE,
    TipWindowState.HIDING,
    TipWindowState.DESTROYED
  ]

  public isValidPath(path: TipTransitionPath): boolean {
    if (path.sequence.length < 2) {
      return false
    }
    if (!path.isComplete) {
      return false
    }
    return this.matches(TipTransitionPathValidator.SHOW_PATH, path.sequence) ||
      this.matches(TipTransitionPathValidator.HIDE_PATH, path.sequence)
  }

  private matches(pattern: TipWindowState[], sequence: TipWindowState[]): boolean {
    let index = 0
    for (const state of sequence) {
      if (index < pattern.length && state === pattern[index]) {
        index += 1
      }
    }
    return index === pattern.length
  }

  public estimateDuration(path: TipTransitionPath): number {
    return path.sequence.length * 50
  }
}

// Models WindowMgr.popupRecorderTip: show the tip window, keep it visible for
// the popup duration (3000 ms) and invoke the completion callback afterwards.
class TipPopupScheduler {
  public static readonly POPUP_DURATION_MS: number = 3000

  private machine: TipWindowStateMachine
  private elapsedMs: number = 0
  private callbackCount: number = 0
  private pendingCallback: boolean = false

  constructor(machine: TipWindowStateMachine) {
    this.machine = machine
  }

  public popup(): boolean {
    if (this.machine.getState() === TipWindowState.VISIBLE) {
      return false
    }
    if (!this.machine.show('show_tip_popup')) {
      return false
    }
    this.machine.markVisible('popup_visible')
    this.elapsedMs = 0
    this.pendingCallback = true
    return true
  }

  public advance(ms: number): boolean {
    if (!this.pendingCallback) {
      return false
    }
    this.elapsedMs += ms
    if (this.elapsedMs < TipPopupScheduler.POPUP_DURATION_MS) {
      return false
    }
    this.pendingCallback = false
    this.callbackCount += 1
    this.machine.hide('popup_duration_elapsed')
    this.machine.destroy('popup_released')
    return true
  }

  public getElapsedMs(): number {
    return this.elapsedMs
  }

  public getCallbackCount(): number {
    return this.callbackCount
  }

  public hasPendingCallback(): boolean {
    return this.pendingCallback
  }

  public getDurationMs(): number {
    return TipPopupScheduler.POPUP_DURATION_MS
  }
}

// Audit report of one tip window round.
class TipWindowAuditReport {
  private showCount: number
  private hideCount: number
  private releaseCount: number
  private title: string

  constructor(showCount: number, hideCount: number, releaseCount: number, title: string) {
    this.showCount = showCount
    this.hideCount = hideCount
    this.releaseCount = releaseCount
    this.title = title
  }

  public getShowCount(): number {
    return this.showCount
  }

  public getHideCount(): number {
    return this.hideCount
  }

  public getReleaseCount(): number {
    return this.releaseCount
  }

  public getTitle(): string {
    return this.title
  }

  public computeDelta(): number {
    return this.showCount - this.hideCount
  }

  public isBalanced(): boolean {
    return this.computeDelta() === 0
  }

  public toString(): string {
    return `${this.title} show=${this.showCount} hide=${this.hideCount} release=${this.releaseCount}`
  }
}

export default function dialogStateManagementTest(): void {
  describe('DialogStateManagement_Test', () => {
    let machine: TipWindowStateMachine
    let registry: RecorderWindowRegistry
    let timerRect: RecorderWindowRect
    let tipRect: RecorderWindowRect

    beforeEach(() => {
      machine = new TipWindowStateMachine()
      registry = new RecorderWindowRegistry()
      // Timer window geometry used by ScreenRecorderAbility.
      timerRect = { x: 96, y: 48, width: 624, height: 56 }
      // Tip window geometry used by ScreenRecorderAbility.
      tipRect = { x: 615, y: 46, width: 686, height: 100 }
    })

    it('tip_window_should_start_idle', 0, () => {
      expect(machine.getState()).assertEqual(TipWindowState.IDLE)
      expect(machine.getTotalTransitions()).assertEqual(0)
      expect(machine.isTerminal()).assertFalse()
      expect(machine.canTransition(TipWindowState.IDLE, TipWindowState.CREATING)).assertTrue()
    })

    it('tip_window_should_enter_creating_state', 0, () => {
      expect(machine.show('show_tip')).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.CREATING)
      expect(machine.countTo(TipWindowState.CREATING)).assertEqual(1)
    })

    it('tip_window_should_reach_visible_state', 0, () => {
      machine.show('show_tip')
      expect(machine.markVisible('render_complete')).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.VISIBLE)
      expect(machine.hasReached(TipWindowState.VISIBLE)).assertTrue()
    })

    it('tip_window_should_enter_hiding_state', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      expect(machine.hide('duration_elapsed')).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.HIDING)
      expect(machine.countTo(TipWindowState.HIDING)).assertEqual(1)
    })

    it('tip_window_should_finish_in_destroyed_state', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.hide('duration_elapsed')
      expect(machine.destroy('release_windows')).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.DESTROYED)
      expect(machine.isTerminal()).assertTrue()
    })

    it('tip_window_should_reject_skipped_transition', 0, () => {
      expect(machine.transitionTo(TipWindowState.VISIBLE, 'skip_creating')).assertFalse()
      expect(machine.getState()).assertEqual(TipWindowState.IDLE)
      expect(machine.getRejectedCount()).assertEqual(1)
      expect(machine.getTotalTransitions()).assertEqual(0)
    })

    it('tip_window_should_reject_hide_from_creating', 0, () => {
      machine.show('show_tip')
      expect(machine.hide('bad_hide')).assertFalse()
      expect(machine.getState()).assertEqual(TipWindowState.CREATING)
      expect(machine.getRejectedCount()).assertEqual(1)
    })

    it('tip_window_should_count_rejected_transitions', 0, () => {
      machine.transitionTo(TipWindowState.VISIBLE, 'bad_1')
      machine.transitionTo(TipWindowState.DESTROYED, 'bad_2')
      machine.transitionTo(TipWindowState.HIDING, 'bad_3')
      expect(machine.getRejectedCount()).assertEqual(3)
      expect(machine.getTotalTransitions()).assertEqual(0)
    })

    it('tip_window_should_keep_full_transition_history', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.hide('duration_elapsed')
      machine.destroy('release_windows')
      const history = machine.getHistory()
      expect(history.length).assertEqual(4)
      expect(history[0].from).assertEqual(TipWindowState.IDLE)
      expect(history[0].to).assertEqual(TipWindowState.CREATING)
      expect(history[1].to).assertEqual(TipWindowState.VISIBLE)
      expect(history[2].to).assertEqual(TipWindowState.HIDING)
      expect(history[3].to).assertEqual(TipWindowState.DESTROYED)
    })

    it('tip_window_history_should_be_chronological', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.hide('duration_elapsed')
      machine.destroy('release_windows')
      const history = machine.getHistory()
      for (let i = 1; i < history.length; i++) {
        expect(history[i - 1].timestamp).assertLessOrEqual(history[i].timestamp)
      }
    })

    it('tip_window_should_count_visits_per_state', 0, () => {
      for (let round = 0; round < 3; round++) {
        machine.show('show_tip')
        machine.markVisible('render_complete')
        machine.hide('duration_elapsed')
        machine.destroy('release_windows')
        machine.transitionTo(TipWindowState.CREATING, 'recreate_tip')
      }
      expect(machine.countTo(TipWindowState.CREATING)).assertEqual(4)
      expect(machine.countTo(TipWindowState.VISIBLE)).assertEqual(3)
      expect(machine.countTo(TipWindowState.DESTROYED)).assertEqual(3)
    })

    it('tip_window_should_support_recreate_after_destroy', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.destroy('release_early')
      expect(machine.getState()).assertEqual(TipWindowState.DESTROYED)
      expect(machine.transitionTo(TipWindowState.CREATING, 'recreate_tip')).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.CREATING)
    })

    it('tip_window_should_reset_to_idle', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      expect(machine.getTotalTransitions()).assertEqual(2)
      machine.reset()
      expect(machine.getState()).assertEqual(TipWindowState.IDLE)
      expect(machine.getTotalTransitions()).assertEqual(0)
      expect(machine.getRejectedCount()).assertEqual(0)
      expect(machine.getLastTrigger()).assertEqual('')
    })

    it('tip_window_should_report_last_trigger', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      expect(machine.getLastTrigger()).assertEqual('render_complete')
      machine.hide('duration_elapsed')
      expect(machine.getLastTrigger()).assertEqual('duration_elapsed')
    })

    it('tip_window_should_report_terminal_state', 0, () => {
      expect(machine.isTerminal()).assertFalse()
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.hide('duration_elapsed')
      expect(machine.isTerminal()).assertFalse()
      machine.destroy('release_windows')
      expect(machine.isTerminal()).assertTrue()
    })

    it('window_registry_should_store_timer_window', 0, () => {
      expect(registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)).assertTrue()
      expect(registry.size()).assertEqual(1)
      expect(registry.countKind(RecorderWindowKind.TIMER)).assertEqual(1)
      expect(registry.get('timerWindow') === undefined).assertFalse()
    })

    it('window_registry_should_apply_timer_rect', 0, () => {
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      const entry = registry.get('timerWindow')
      expect(entry === undefined).assertFalse()
      if (entry !== undefined) {
        expect(entry.x).assertEqual(96)
        expect(entry.y).assertEqual(48)
        expect(entry.width).assertEqual(624)
        expect(entry.height).assertEqual(56)
        expect(entry.page).assertEqual('ScreenRecorderTimer')
      }
    })

    it('window_registry_should_apply_tip_rect', 0, () => {
      registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      const entry = registry.get('tipWindow')
      expect(entry === undefined).assertFalse()
      if (entry !== undefined) {
        expect(entry.x).assertEqual(615)
        expect(entry.y).assertEqual(46)
        expect(entry.width).assertEqual(686)
        expect(entry.height).assertEqual(100)
      }
    })

    it('window_registry_should_ignore_duplicate_name', 0, () => {
      expect(registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)).assertTrue()
      expect(registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)).assertFalse()
      expect(registry.size()).assertEqual(1)
    })

    it('window_registry_should_keep_first_entry_on_duplicate', 0, () => {
      const otherRect: RecorderWindowRect = { x: 0, y: 0, width: 10, height: 10 }
      registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      registry.set('tipWindow', RecorderWindowKind.TIP, 'OtherPage', otherRect)
      const entry = registry.get('tipWindow')
      expect(entry === undefined).assertFalse()
      if (entry !== undefined) {
        expect(entry.page).assertEqual('ScreenRecorderDialog')
        expect(entry.width).assertEqual(686)
      }
    })

    it('window_registry_should_return_undefined_for_missing_name', 0, () => {
      expect(registry.get('missingWindow') === undefined).assertTrue()
      expect(registry.size()).assertEqual(0)
    })

    it('window_registry_should_release_all_windows', 0, () => {
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      registry.set('resolutionWindow', RecorderWindowKind.RESOLUTION, 'ResolutionNotSupportedDialog', tipRect)
      const destroyed = registry.release()
      expect(destroyed).assertEqual(3)
      expect(registry.size()).assertEqual(0)
      expect(registry.getReleaseCount()).assertEqual(1)
    })

    it('window_registry_should_be_empty_after_release', 0, () => {
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      registry.release()
      expect(registry.get('timerWindow') === undefined).assertTrue()
      expect(registry.countKind(RecorderWindowKind.TIMER)).assertEqual(0)
    })

    it('window_registry_should_accumulate_destroyed_count', 0, () => {
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      registry.release()
      registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      registry.release()
      expect(registry.getDestroyedCount()).assertEqual(2)
      expect(registry.getReleaseCount()).assertEqual(2)
    })

    it('window_registry_should_allow_recreate_after_release', 0, () => {
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      registry.release()
      expect(registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)).assertTrue()
      expect(registry.size()).assertEqual(1)
    })

    it('window_registry_should_count_kind_after_multiple_sets', 0, () => {
      registry.set('tipWindowA', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      registry.set('tipWindowB', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      expect(registry.countKind(RecorderWindowKind.TIP)).assertEqual(2)
      expect(registry.countKind(RecorderWindowKind.TIMER)).assertEqual(1)
      expect(registry.countKind(RecorderWindowKind.RESOLUTION)).assertEqual(0)
    })

    it('trigger_classifier_should_detect_create_flow', 0, () => {
      const classifier = new WindowTransitionClassifier()
      expect(classifier.classify('show_tip')).assertEqual(TransitionCategory.CREATE_FLOW)
      expect(classifier.classify('create_tip_window')).assertEqual(TransitionCategory.CREATE_FLOW)
      expect(classifier.classify('render_tip')).assertEqual(TransitionCategory.CREATE_FLOW)
    })

    it('trigger_classifier_should_detect_hide_flow', 0, () => {
      const classifier = new WindowTransitionClassifier()
      expect(classifier.classify('hide_tip')).assertEqual(TransitionCategory.HIDE_FLOW)
      expect(classifier.classify('timer_elapsed')).assertEqual(TransitionCategory.HIDE_FLOW)
      expect(classifier.classify('duration_finished')).assertEqual(TransitionCategory.HIDE_FLOW)
    })

    it('trigger_classifier_should_detect_release_flow', 0, () => {
      const classifier = new WindowTransitionClassifier()
      expect(classifier.classify('release_windows')).assertEqual(TransitionCategory.RELEASE_FLOW)
      expect(classifier.classify('destroy_tip')).assertEqual(TransitionCategory.RELEASE_FLOW)
    })

    it('trigger_classifier_should_detect_show_flow', 0, () => {
      const classifier = new WindowTransitionClassifier()
      expect(classifier.classify('popup_visible')).assertEqual(TransitionCategory.SHOW_FLOW)
      expect(classifier.classify('visible_confirm')).assertEqual(TransitionCategory.SHOW_FLOW)
    })

    it('trigger_classifier_should_fallback_to_idle', 0, () => {
      const classifier = new WindowTransitionClassifier()
      expect(classifier.classify('unknown_event')).assertEqual(TransitionCategory.IDLE)
      expect(classifier.classify('')).assertEqual(TransitionCategory.IDLE)
    })

    it('trigger_classifier_should_count_records_by_category', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.hide('duration_elapsed')
      machine.destroy('release_windows')
      const classifier = new WindowTransitionClassifier()
      const records = machine.getHistory()
      expect(classifier.countByCategory(records, TransitionCategory.CREATE_FLOW)).assertEqual(2)
      expect(classifier.countByCategory(records, TransitionCategory.HIDE_FLOW)).assertEqual(1)
      expect(classifier.countByCategory(records, TransitionCategory.RELEASE_FLOW)).assertEqual(1)
    })

    it('metrics_should_snapshot_window_counts', 0, () => {
      registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)
      registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)
      const calculator = new WindowMetricsCalculator(machine, registry)
      const snapshot: WindowMetricsSnapshot = calculator.buildSnapshot()
      expect(snapshot.totalWindows).assertEqual(2)
      expect(snapshot.timerCount).assertEqual(1)
      expect(snapshot.tipCount).assertEqual(1)
    })

    it('metrics_should_report_transition_count', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      const calculator = new WindowMetricsCalculator(machine, registry)
      expect(calculator.buildSnapshot().transitionCount).assertEqual(2)
    })

    it('metrics_should_report_last_trigger', 0, () => {
      machine.show('show_tip')
      machine.markVisible('popup_visible')
      const calculator = new WindowMetricsCalculator(machine, registry)
      expect(calculator.buildSnapshot().lastTrigger).assertEqual('popup_visible')
    })

    it('metrics_should_report_zero_for_empty_runtime', 0, () => {
      const calculator = new WindowMetricsCalculator(machine, registry)
      const snapshot: WindowMetricsSnapshot = calculator.buildSnapshot()
      expect(snapshot.totalWindows).assertEqual(0)
      expect(snapshot.timerCount).assertEqual(0)
      expect(snapshot.tipCount).assertEqual(0)
      expect(snapshot.transitionCount).assertEqual(0)
      expect(snapshot.lastTrigger).assertEqual('')
    })

    it('path_validator_should_accept_show_path', 0, () => {
      const validator = new TipTransitionPathValidator()
      const path: TipTransitionPath = {
        sequence: [TipWindowState.IDLE, TipWindowState.CREATING, TipWindowState.VISIBLE],
        duration: 30,
        isComplete: true
      }
      expect(validator.isValidPath(path)).assertTrue()
      expect(validator.estimateDuration(path)).assertEqual(150)
    })

    it('path_validator_should_accept_hide_path', 0, () => {
      const validator = new TipTransitionPathValidator()
      const path: TipTransitionPath = {
        sequence: [TipWindowState.VISIBLE, TipWindowState.HIDING, TipWindowState.DESTROYED],
        duration: 20,
        isComplete: true
      }
      expect(validator.isValidPath(path)).assertTrue()
    })

    it('path_validator_should_reject_incomplete_path', 0, () => {
      const validator = new TipTransitionPathValidator()
      const path: TipTransitionPath = {
        sequence: [TipWindowState.IDLE, TipWindowState.CREATING],
        duration: 10,
        isComplete: false
      }
      expect(validator.isValidPath(path)).assertFalse()
    })

    it('path_validator_should_reject_short_path', 0, () => {
      const validator = new TipTransitionPathValidator()
      const path: TipTransitionPath = {
        sequence: [TipWindowState.VISIBLE],
        duration: 5,
        isComplete: true
      }
      expect(validator.isValidPath(path)).assertFalse()
    })

    it('path_validator_should_reject_unknown_sequence', 0, () => {
      const validator = new TipTransitionPathValidator()
      const path: TipTransitionPath = {
        sequence: [TipWindowState.HIDING, TipWindowState.IDLE, TipWindowState.CREATING],
        duration: 15,
        isComplete: true
      }
      expect(validator.isValidPath(path)).assertFalse()
    })

    it('path_validator_should_estimate_duration_by_length', 0, () => {
      const validator = new TipTransitionPathValidator()
      const first: TipTransitionPath = {
        sequence: [TipWindowState.VISIBLE, TipWindowState.HIDING, TipWindowState.DESTROYED],
        duration: 0,
        isComplete: true
      }
      const second: TipTransitionPath = {
        sequence: [TipWindowState.VISIBLE, TipWindowState.HIDING],
        duration: 0,
        isComplete: true
      }
      expect(validator.estimateDuration(first)).assertLarger(validator.estimateDuration(second))
    })

    it('popup_scheduler_should_show_tip_window', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      expect(scheduler.popup()).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.VISIBLE)
      expect(scheduler.getElapsedMs()).assertEqual(0)
      expect(scheduler.hasPendingCallback()).assertTrue()
    })

    it('popup_scheduler_should_not_fire_before_duration', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      scheduler.popup()
      expect(scheduler.advance(2999)).assertFalse()
      expect(scheduler.getCallbackCount()).assertEqual(0)
      expect(machine.getState()).assertEqual(TipWindowState.VISIBLE)
      expect(scheduler.hasPendingCallback()).assertTrue()
    })

    it('popup_scheduler_should_fire_at_duration', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      scheduler.popup()
      expect(scheduler.advance(3000)).assertTrue()
      expect(scheduler.getCallbackCount()).assertEqual(1)
      expect(scheduler.hasPendingCallback()).assertFalse()
    })

    it('popup_scheduler_should_ignore_duplicate_popup', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      expect(scheduler.popup()).assertTrue()
      expect(scheduler.popup()).assertFalse()
      expect(machine.getTotalTransitions()).assertEqual(2)
      expect(scheduler.getCallbackCount()).assertEqual(0)
    })

    it('popup_scheduler_should_destroy_window_after_callback', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      scheduler.popup()
      scheduler.advance(3000)
      expect(machine.getState()).assertEqual(TipWindowState.DESTROYED)
      expect(machine.hasReached(TipWindowState.HIDING)).assertTrue()
      expect(machine.isTerminal()).assertTrue()
    })

    it('popup_scheduler_should_report_3000ms_duration', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      expect(scheduler.getDurationMs()).assertEqual(3000)
      expect(TipPopupScheduler.POPUP_DURATION_MS).assertEqual(3000)
    })

    it('popup_scheduler_should_fire_callback_once', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      scheduler.popup()
      scheduler.advance(3000)
      expect(scheduler.advance(3000)).assertFalse()
      expect(scheduler.getCallbackCount()).assertEqual(1)
    })

    it('popup_scheduler_should_allow_next_round', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      scheduler.popup()
      scheduler.advance(3000)
      expect(scheduler.popup()).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.VISIBLE)
      scheduler.advance(3000)
      expect(scheduler.getCallbackCount()).assertEqual(2)
    })

    it('popup_scheduler_should_accumulate_elapsed_time', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      scheduler.popup()
      scheduler.advance(1000)
      scheduler.advance(1000)
      expect(scheduler.getElapsedMs()).assertEqual(2000)
      expect(scheduler.getCallbackCount()).assertEqual(0)
      expect(scheduler.advance(1000)).assertTrue()
      expect(scheduler.getElapsedMs()).assertEqual(3000)
    })

    it('audit_report_should_compute_delta', 0, () => {
      const report = new TipWindowAuditReport(3, 2, 1, 'tip_round')
      expect(report.getShowCount()).assertEqual(3)
      expect(report.getHideCount()).assertEqual(2)
      expect(report.getReleaseCount()).assertEqual(1)
      expect(report.computeDelta()).assertEqual(1)
      expect(report.isBalanced()).assertFalse()
    })

    it('audit_report_should_detect_balance', 0, () => {
      const balanced = new TipWindowAuditReport(2, 2, 1, 'balanced')
      expect(balanced.isBalanced()).assertTrue()
      expect(balanced.computeDelta()).assertEqual(0)
      const unbalanced = new TipWindowAuditReport(4, 1, 1, 'unbalanced')
      expect(unbalanced.isBalanced()).assertFalse()
      expect(unbalanced.computeDelta()).assertEqual(3)
    })

    it('audit_report_should_render_title', 0, () => {
      const report = new TipWindowAuditReport(1, 1, 1, 'recorder_tip_audit')
      expect(report.getTitle()).assertEqual('recorder_tip_audit')
      expect(report.toString()).assertContain('recorder_tip_audit')
      expect(report.toString()).assertContain('show=1')
    })

    it('tip_window_should_survive_many_rounds', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      for (let round = 0; round < 20; round++) {
        expect(scheduler.popup()).assertTrue()
        expect(scheduler.advance(3000)).assertTrue()
      }
      expect(scheduler.getCallbackCount()).assertEqual(20)
      expect(machine.countTo(TipWindowState.VISIBLE)).assertEqual(20)
      expect(machine.countTo(TipWindowState.DESTROYED)).assertEqual(20)
    })

    it('tip_window_state_machine_should_be_resettable', 0, () => {
      machine.show('show_tip')
      machine.markVisible('render_complete')
      machine.transitionTo(TipWindowState.IDLE, 'bad_trigger')
      expect(machine.getRejectedCount()).assertEqual(1)
      machine.reset()
      expect(machine.getState()).assertEqual(TipWindowState.IDLE)
      expect(machine.getHistory().length).assertEqual(0)
      expect(machine.canTransition(TipWindowState.IDLE, TipWindowState.CREATING)).assertTrue()
    })

    it('comprehensive_tip_window_scenario', 0, () => {
      const scheduler = new TipPopupScheduler(machine)
      expect(registry.set('timerWindow', RecorderWindowKind.TIMER, 'ScreenRecorderTimer', timerRect)).assertTrue()
      expect(registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)).assertTrue()
      expect(registry.set('tipWindow', RecorderWindowKind.TIP, 'ScreenRecorderDialog', tipRect)).assertFalse()

      expect(scheduler.popup()).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.VISIBLE)
      expect(scheduler.advance(3000)).assertTrue()
      expect(machine.getState()).assertEqual(TipWindowState.DESTROYED)

      const calculator = new WindowMetricsCalculator(machine, registry)
      const snapshot: WindowMetricsSnapshot = calculator.buildSnapshot()
      expect(snapshot.totalWindows).assertEqual(2)
      expect(snapshot.timerCount).assertEqual(1)
      expect(snapshot.tipCount).assertEqual(1)
      expect(snapshot.transitionCount).assertEqual(4)

      expect(registry.release()).assertEqual(2)
      expect(registry.size()).assertEqual(0)
      expect(registry.getDestroyedCount()).assertEqual(2)

      const report = new TipWindowAuditReport(1, 1, 1, 'comprehensive_tip')
      expect(report.isBalanced()).assertTrue()
      expect(report.toString()).assertContain('comprehensive_tip')
    })
  })
}
