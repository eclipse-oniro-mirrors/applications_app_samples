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

// Lifecycle states of ScreenRecorderAbility (a ServiceExtensionAbility).
enum ExtensionState {
  INIT = 'init',
  CREATED = 'created',
  TERMINATED = 'terminated'
}

// Request routing result of onRequest(startId).
enum RequestRoute {
  START = 'start',
  STOP = 'stop'
}

// Events emitted by the service extension.
enum ExtensionEvent {
  ON_CREATE = 'on_create',
  ON_REQUEST = 'on_request',
  ON_DESTROY = 'on_destroy',
  TERMINATE_SELF = 'terminate_self'
}

// Recording states mirrored from common/Constants.ets.
enum RecorderStateMirror {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

// One lifecycle event of the service extension.
interface ExtensionEventRecord {
  event: ExtensionEvent
  startId: number
  route: string
  succeed: boolean
  timestamp: number
}

// LocalStorage content published by onCreate.
interface ExtensionStorageSnapshot {
  recorderState: number
  hasAbilityContext: boolean
  windowCount: number
}

// Aggregated counters of one extension run.
interface ExtensionRunStats {
  createCount: number
  requestCount: number
  destroyCount: number
  terminateCount: number
  startCount: number
  stopCount: number
}

// Routes the startId of onRequest to a start or stop command.
// Only startId === 1 starts a recording, every other value stops it.
class StartIdRouter {
  public route(startId: number): RequestRoute {
    if (startId === 1) {
      return RequestRoute.START
    }
    return RequestRoute.STOP
  }

  public isStart(startId: number): boolean {
    return this.route(startId) === RequestRoute.START
  }
}

// Journal of the service extension events.
class ExtensionJournal {
  private records: ExtensionEventRecord[] = []
  private clock: number = 1700000000000

  public append(event: ExtensionEvent, startId: number, route: string, succeed: boolean): void {
    const record: ExtensionEventRecord = {
      event: event,
      startId: startId,
      route: route,
      succeed: succeed,
      timestamp: this.clock
    }
    this.records.push(record)
    this.clock += 5
  }

  public getRecords(): ExtensionEventRecord[] {
    return this.records.slice()
  }

  public countEvent(event: ExtensionEvent): number {
    let count = 0
    for (const record of this.records) {
      if (record.event === event) {
        count += 1
      }
    }
    return count
  }

  public countSucceeded(): number {
    let count = 0
    for (const record of this.records) {
      if (record.succeed) {
        count += 1
      }
    }
    return count
  }

  public countFailed(): number {
    return this.records.length - this.countSucceeded()
  }

  public getLastEvent(): string {
    if (this.records.length === 0) {
      return ''
    }
    return this.records[this.records.length - 1].event
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

// Window cache owned by WindowMgr: duplicate names are ignored and release
// destroys every cached floating window.
class ExtensionWindowRegistry {
  private names: string[] = []
  private destroyedCount: number = 0
  private released: boolean = false

  public set(name: string): boolean {
    if (this.released) {
      return false
    }
    for (const existing of this.names) {
      if (existing === name) {
        return false
      }
    }
    this.names.push(name)
    return true
  }

  public has(name: string): boolean {
    for (const existing of this.names) {
      if (existing === name) {
        return true
      }
    }
    return false
  }

  public release(): number {
    const destroyed = this.names.length
    this.destroyedCount += destroyed
    this.names = []
    this.released = true
    return destroyed
  }

  public size(): number {
    return this.names.length
  }

  public getDestroyedCount(): number {
    return this.destroyedCount
  }

  public isReleased(): boolean {
    return this.released
  }
}

// Singleton registry mirroring SRManager / WindowMgr / InputConsumer resets.
class ExtensionSingletonRegistry {
  private static instance: ExtensionSingletonRegistry
  private managerCreated: boolean = false
  private windowManagerCreated: boolean = false
  private inputConsumerCreated: boolean = false
  private resetCount: number = 0

  public static getInstance(): ExtensionSingletonRegistry {
    if (!ExtensionSingletonRegistry.instance) {
      ExtensionSingletonRegistry.instance = new ExtensionSingletonRegistry()
    }
    return ExtensionSingletonRegistry.instance
  }

  public createAll(): void {
    this.managerCreated = true
    this.windowManagerCreated = true
    this.inputConsumerCreated = true
  }

  public resetAll(): void {
    this.managerCreated = false
    this.windowManagerCreated = false
    this.inputConsumerCreated = false
    this.resetCount += 1
  }

  public isReady(): boolean {
    return this.managerCreated && this.windowManagerCreated && this.inputConsumerCreated
  }

  public getResetCount(): number {
    return this.resetCount
  }
}

// Deterministic model of ScreenRecorderAbility.
// onCreate prepares SRManager, WindowMgr and the LocalStorage keys,
// onRequest routes the startId, onDestroy releases every window and resets
// the singletons. The Error state schedules terminateSelf after 2000 ms.
class ScreenRecorderExtensionHarness {
  private state: ExtensionState = ExtensionState.INIT
  private recordingState: RecorderStateMirror = RecorderStateMirror.IDLE
  private journal: ExtensionJournal = new ExtensionJournal()
  private windows: ExtensionWindowRegistry = new ExtensionWindowRegistry()
  private router: StartIdRouter = new StartIdRouter()
  private storage: ExtensionStorageSnapshot = {
    recorderState: 0,
    hasAbilityContext: false,
    windowCount: 0
  }
  private createCount: number = 0
  private requestCount: number = 0
  private destroyCount: number = 0
  private terminateCount: number = 0
  private startCount: number = 0
  private stopCount: number = 0
  private terminateDelayMs: number = 0
  private elapsedSinceErrorMs: number = 0

  public onCreate(): boolean {
    if (this.state !== ExtensionState.INIT) {
      return false
    }
    this.state = ExtensionState.CREATED
    this.createCount += 1
    this.recordingState = RecorderStateMirror.IDLE
    this.storage = {
      recorderState: RecorderStateMirror.IDLE,
      hasAbilityContext: true,
      windowCount: 0
    }
    ExtensionSingletonRegistry.getInstance().createAll()
    this.journal.append(ExtensionEvent.ON_CREATE, 0, 'create', true)
    return true
  }

  public onRequest(startId: number): boolean {
    if (this.state !== ExtensionState.CREATED) {
      this.journal.append(ExtensionEvent.ON_REQUEST, startId, 'rejected', false)
      return false
    }
    this.requestCount += 1
    const route = this.router.route(startId)
    if (route === RequestRoute.START) {
      if (this.recordingState === RecorderStateMirror.RECORDING) {
        this.journal.append(ExtensionEvent.ON_REQUEST, startId, 'start_rejected', false)
        return false
      }
      this.recordingState = RecorderStateMirror.RECORDING
      this.startCount += 1
      this.journal.append(ExtensionEvent.ON_REQUEST, startId, 'start', true)
      return true
    }
    if (this.recordingState !== RecorderStateMirror.RECORDING) {
      this.journal.append(ExtensionEvent.ON_REQUEST, startId, 'stop_rejected', false)
      return false
    }
    this.recordingState = RecorderStateMirror.STOPPED
    this.stopCount += 1
    this.journal.append(ExtensionEvent.ON_REQUEST, startId, 'stop', true)
    return true
  }

  public onError(): void {
    this.recordingState = RecorderStateMirror.ERROR
    this.terminateDelayMs = 2000
    this.elapsedSinceErrorMs = 0
    this.journal.append(ExtensionEvent.ON_REQUEST, 0, 'error', false)
  }

  public advance(ms: number): boolean {
    if (this.terminateDelayMs === 0) {
      return false
    }
    this.elapsedSinceErrorMs += ms
    if (this.elapsedSinceErrorMs >= this.terminateDelayMs && this.terminateCount === 0) {
      this.terminateCount += 1
      this.terminateDelayMs = 0
      this.journal.append(ExtensionEvent.TERMINATE_SELF, 0, 'terminate', true)
      return true
    }
    return false
  }

  public onDestroy(): boolean {
    if (this.state === ExtensionState.TERMINATED) {
      return false
    }
    this.state = ExtensionState.TERMINATED
    this.destroyCount += 1
    this.windows.release()
    this.storage = {
      recorderState: this.recordingState,
      hasAbilityContext: false,
      windowCount: 0
    }
    ExtensionSingletonRegistry.getInstance().resetAll()
    this.journal.append(ExtensionEvent.ON_DESTROY, 0, 'destroy', true)
    return true
  }

  public openWindow(name: string): boolean {
    const added = this.windows.set(name)
    this.storage.windowCount = this.windows.size()
    return added
  }

  public getState(): ExtensionState {
    return this.state
  }

  public getRecordingState(): RecorderStateMirror {
    return this.recordingState
  }

  public getStorage(): ExtensionStorageSnapshot {
    return this.storage
  }

  public getJournal(): ExtensionEventRecord[] {
    return this.journal.getRecords()
  }

  public getWindows(): ExtensionWindowRegistry {
    return this.windows
  }

  public getTerminateCount(): number {
    return this.terminateCount
  }

  public getStartCount(): number {
    return this.startCount
  }

  public getStopCount(): number {
    return this.stopCount
  }

  public buildStats(): ExtensionRunStats {
    const stats: ExtensionRunStats = {
      createCount: this.createCount,
      requestCount: this.requestCount,
      destroyCount: this.destroyCount,
      terminateCount: this.terminateCount,
      startCount: this.startCount,
      stopCount: this.stopCount
    }
    return stats
  }
}

export default function extensionLifecycleTest(): void {
  describe('ExtensionLifecycle_Test', () => {
    let harness: ScreenRecorderExtensionHarness

    // Every case gets a fresh service extension instance.
    beforeEach(() => {
      harness = new ScreenRecorderExtensionHarness()
      ExtensionSingletonRegistry.getInstance().resetAll()
    })

    it('extension_should_start_in_init_state', 0, () => {
      expect(harness.getState()).assertEqual(ExtensionState.INIT)
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.IDLE)
      expect(harness.getStorage().hasAbilityContext).assertFalse()
    })

    it('extension_should_enter_created_state_after_on_create', 0, () => {
      const created = harness.onCreate()
      expect(created).assertTrue()
      expect(harness.getState()).assertEqual(ExtensionState.CREATED)
      expect(harness.getJournal().length).assertEqual(1)
      expect(harness.getJournal()[0].event).assertEqual(ExtensionEvent.ON_CREATE)
    })

    it('extension_should_not_create_twice', 0, () => {
      expect(harness.onCreate()).assertTrue()
      expect(harness.onCreate()).assertFalse()
      expect(harness.buildStats().createCount).assertEqual(1)
      expect(harness.getJournal().length).assertEqual(1)
    })

    it('on_create_should_prepare_local_storage', 0, () => {
      harness.onCreate()
      const storage = harness.getStorage()
      expect(storage.recorderState).assertEqual(RecorderStateMirror.IDLE)
      expect(storage.hasAbilityContext).assertTrue()
      expect(storage.windowCount).assertEqual(0)
    })

    it('on_create_should_prepare_recorder_state_idle', 0, () => {
      harness.onCreate()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.IDLE)
      expect(harness.getStartCount()).assertEqual(0)
    })

    it('on_create_should_initialize_singletons', 0, () => {
      harness.onCreate()
      expect(ExtensionSingletonRegistry.getInstance().isReady()).assertTrue()
    })

    it('request_before_create_should_be_rejected', 0, () => {
      expect(harness.onRequest(1)).assertFalse()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.IDLE)
      const journal = harness.getJournal()
      expect(journal[0].route).assertEqual('rejected')
      expect(journal[0].succeed).assertFalse()
    })

    it('start_id_one_should_start_recording', 0, () => {
      harness.onCreate()
      expect(harness.onRequest(1)).assertTrue()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.RECORDING)
      expect(harness.getStartCount()).assertEqual(1)
      expect(harness.getStopCount()).assertEqual(0)
    })

    it('start_id_two_should_stop_recording', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      expect(harness.onRequest(2)).assertTrue()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.STOPPED)
      expect(harness.getStopCount()).assertEqual(1)
    })

    it('start_id_zero_should_route_to_stop', 0, () => {
      const router = new StartIdRouter()
      expect(router.route(0)).assertEqual(RequestRoute.STOP)
      expect(router.route(0)).assertEqual(RequestRoute.STOP)
    })

    it('start_id_hundred_should_route_to_stop', 0, () => {
      const router = new StartIdRouter()
      expect(router.route(100)).assertEqual(RequestRoute.STOP)
      expect(router.isStart(100)).assertFalse()
      expect(router.isStart(1)).assertTrue()
    })

    it('start_when_recording_should_be_rejected', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      expect(harness.onRequest(1)).assertFalse()
      expect(harness.getStartCount()).assertEqual(1)
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.RECORDING)
    })

    it('stop_when_idle_should_be_rejected', 0, () => {
      harness.onCreate()
      expect(harness.onRequest(2)).assertFalse()
      expect(harness.getStopCount()).assertEqual(0)
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.IDLE)
    })

    it('start_stop_cycle_should_increment_counters', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      harness.onRequest(2)
      const stats = harness.buildStats()
      expect(stats.requestCount).assertEqual(2)
      expect(stats.startCount).assertEqual(1)
      expect(stats.stopCount).assertEqual(1)
    })

    it('on_destroy_should_reach_terminated_state', 0, () => {
      harness.onCreate()
      expect(harness.onDestroy()).assertTrue()
      expect(harness.getState()).assertEqual(ExtensionState.TERMINATED)
      expect(harness.buildStats().destroyCount).assertEqual(1)
    })

    it('on_destroy_should_release_windows', 0, () => {
      harness.onCreate()
      harness.openWindow('timerWindow')
      harness.openWindow('tipWindow')
      expect(harness.getWindows().size()).assertEqual(2)
      harness.onDestroy()
      expect(harness.getWindows().size()).assertEqual(0)
      expect(harness.getWindows().getDestroyedCount()).assertEqual(2)
      expect(harness.getWindows().isReleased()).assertTrue()
    })

    it('on_destroy_should_clear_local_storage_footprint', 0, () => {
      harness.onCreate()
      harness.openWindow('tipWindow')
      harness.onDestroy()
      const storage = harness.getStorage()
      expect(storage.windowCount).assertEqual(0)
      expect(storage.hasAbilityContext).assertFalse()
    })

    it('on_destroy_should_reset_singletons', 0, () => {
      harness.onCreate()
      expect(ExtensionSingletonRegistry.getInstance().isReady()).assertTrue()
      harness.onDestroy()
      expect(ExtensionSingletonRegistry.getInstance().isReady()).assertFalse()
      expect(ExtensionSingletonRegistry.getInstance().getResetCount()).assertLargerOrEqual(1)
    })

    it('request_after_destroy_should_be_rejected', 0, () => {
      harness.onCreate()
      harness.onDestroy()
      expect(harness.onRequest(1)).assertFalse()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.IDLE)
    })

    it('on_destroy_should_be_idempotent', 0, () => {
      harness.onCreate()
      expect(harness.onDestroy()).assertTrue()
      expect(harness.onDestroy()).assertFalse()
      expect(harness.buildStats().destroyCount).assertEqual(1)
    })

    it('error_state_should_schedule_terminate_after_2000ms', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      harness.onError()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.ERROR)
      expect(harness.advance(1999)).assertFalse()
      expect(harness.getTerminateCount()).assertEqual(0)
    })

    it('terminate_should_fire_at_2000ms_boundary', 0, () => {
      harness.onCreate()
      harness.onError()
      expect(harness.advance(2000)).assertTrue()
      expect(harness.getTerminateCount()).assertEqual(1)
      const journal = harness.getJournal()
      expect(journal[journal.length - 1].event).assertEqual(ExtensionEvent.TERMINATE_SELF)
    })

    it('terminate_should_fire_only_once', 0, () => {
      harness.onCreate()
      harness.onError()
      harness.advance(2000)
      expect(harness.advance(2000)).assertFalse()
      expect(harness.getTerminateCount()).assertEqual(1)
    })

    it('advance_without_error_should_do_nothing', 0, () => {
      harness.onCreate()
      expect(harness.advance(5000)).assertFalse()
      expect(harness.getTerminateCount()).assertEqual(0)
    })

    it('journal_should_keep_event_order', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      harness.onRequest(2)
      harness.onDestroy()
      const journal = harness.getJournal()
      expect(journal.length).assertEqual(4)
      expect(journal[0].event).assertEqual(ExtensionEvent.ON_CREATE)
      expect(journal[1].event).assertEqual(ExtensionEvent.ON_REQUEST)
      expect(journal[2].event).assertEqual(ExtensionEvent.ON_REQUEST)
      expect(journal[3].event).assertEqual(ExtensionEvent.ON_DESTROY)
    })

    it('journal_should_count_events_by_type', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      harness.onRequest(2)
      const journal = new ExtensionJournal()
      journal.append(ExtensionEvent.ON_CREATE, 0, 'create', true)
      journal.append(ExtensionEvent.ON_REQUEST, 1, 'start', true)
      journal.append(ExtensionEvent.ON_REQUEST, 2, 'stop', true)
      expect(journal.countEvent(ExtensionEvent.ON_REQUEST)).assertEqual(2)
      expect(journal.countEvent(ExtensionEvent.ON_CREATE)).assertEqual(1)
      expect(journal.countSucceeded()).assertEqual(3)
    })

    it('journal_should_report_last_event', 0, () => {
      harness.onCreate()
      harness.onDestroy()
      const journal = harness.getJournal()
      expect(journal[journal.length - 1].event).assertEqual(ExtensionEvent.ON_DESTROY)
    })

    it('journal_timestamps_should_be_chronological', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      harness.onRequest(2)
      harness.onDestroy()
      const journal = harness.getJournal()
      for (let i = 1; i < journal.length; i++) {
        expect(journal[i - 1].timestamp).assertLessOrEqual(journal[i].timestamp)
      }
    })

    it('journal_should_track_failed_requests', 0, () => {
      harness.onCreate()
      harness.onRequest(2)
      const journal = harness.getJournal()
      let failed = 0
      for (const record of journal) {
        if (!record.succeed) {
          failed += 1
        }
      }
      expect(failed).assertEqual(1)
    })

    it('journal_should_reset_all_counters', 0, () => {
      const journal = new ExtensionJournal()
      journal.append(ExtensionEvent.ON_CREATE, 0, 'create', true)
      expect(journal.getRecords().length).assertEqual(1)
      journal.reset()
      expect(journal.getRecords().length).assertEqual(0)
      expect(journal.countSucceeded()).assertEqual(0)
      expect(journal.getLastEvent()).assertEqual('')
    })

    it('window_registry_should_ignore_duplicate_names', 0, () => {
      const registry = new ExtensionWindowRegistry()
      expect(registry.set('timerWindow')).assertTrue()
      expect(registry.set('timerWindow')).assertFalse()
      expect(registry.size()).assertEqual(1)
      expect(registry.has('timerWindow')).assertTrue()
    })

    it('window_registry_should_allow_distinct_windows', 0, () => {
      harness.onCreate()
      expect(harness.openWindow('timerWindow')).assertTrue()
      expect(harness.openWindow('tipWindow')).assertTrue()
      expect(harness.openWindow('resolutionWindow')).assertTrue()
      expect(harness.getWindows().size()).assertEqual(3)
      expect(harness.getStorage().windowCount).assertEqual(3)
    })

    it('window_registry_should_reject_set_after_release', 0, () => {
      const registry = new ExtensionWindowRegistry()
      registry.set('timerWindow')
      registry.release()
      expect(registry.set('timerWindow')).assertFalse()
      expect(registry.isReleased()).assertTrue()
    })

    it('stats_should_report_zero_before_on_create', 0, () => {
      const stats = harness.buildStats()
      expect(stats.createCount).assertEqual(0)
      expect(stats.requestCount).assertEqual(0)
      expect(stats.destroyCount).assertEqual(0)
      expect(stats.terminateCount).assertEqual(0)
    })

    it('stats_should_report_start_stop_balance', 0, () => {
      harness.onCreate()
      for (let round = 0; round < 4; round++) {
        harness.onRequest(1)
        harness.onRequest(2)
      }
      const stats = harness.buildStats()
      expect(stats.startCount).assertEqual(4)
      expect(stats.stopCount).assertEqual(4)
      expect(stats.startCount - stats.stopCount).assertEqual(0)
    })

    it('recording_state_should_persist_in_local_storage', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      let storage = harness.getStorage()
      expect(storage.recorderState).assertEqual(RecorderStateMirror.IDLE)
      harness.onDestroy()
      storage = harness.getStorage()
      expect(storage.recorderState).assertEqual(RecorderStateMirror.RECORDING)
    })

    it('ability_context_should_be_kept_until_destroy', 0, () => {
      harness.onCreate()
      expect(harness.getStorage().hasAbilityContext).assertTrue()
      harness.onRequest(1)
      expect(harness.getStorage().hasAbilityContext).assertTrue()
      harness.onDestroy()
      expect(harness.getStorage().hasAbilityContext).assertFalse()
    })

    it('full_lifecycle_ordering_should_be_create_request_destroy', 0, () => {
      harness.onCreate()
      harness.onRequest(1)
      harness.onDestroy()
      const journal = harness.getJournal()
      expect(journal[0].event).assertEqual(ExtensionEvent.ON_CREATE)
      expect(journal[1].event).assertEqual(ExtensionEvent.ON_REQUEST)
      expect(journal[2].event).assertEqual(ExtensionEvent.ON_DESTROY)
      expect(journal[1].route).assertEqual('start')
      expect(journal[2].route).assertEqual('destroy')
    })

    it('multiple_start_stop_cycles_should_be_supported', 0, () => {
      harness.onCreate()
      for (let round = 0; round < 5; round++) {
        expect(harness.onRequest(1)).assertTrue()
        expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.RECORDING)
        expect(harness.onRequest(2)).assertTrue()
        expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.STOPPED)
        harness.getWindows().release()
      }
      expect(harness.getStartCount()).assertEqual(5)
      expect(harness.getStopCount()).assertEqual(5)
      expect(harness.buildStats().requestCount).assertEqual(10)
    })

    it('extension_should_handle_request_stress', 0, () => {
      harness.onCreate()
      for (let i = 0; i < 100; i++) {
        const startId = i % 2 === 0 ? 1 : 2
        harness.onRequest(startId)
      }
      const stats = harness.buildStats()
      expect(stats.requestCount).assertEqual(100)
      expect(stats.startCount).assertEqual(50)
      expect(stats.stopCount).assertEqual(50)
      expect(harness.getJournal().length).assertEqual(101)
    })

    it('comprehensive_extension_lifecycle_scenario', 0, () => {
      expect(harness.onCreate()).assertTrue()
      expect(harness.openWindow('timerWindow')).assertTrue()
      expect(harness.openWindow('tipWindow')).assertTrue()
      expect(harness.onRequest(1)).assertTrue()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.RECORDING)
      expect(harness.onRequest(2)).assertTrue()
      expect(harness.getRecordingState()).assertEqual(RecorderStateMirror.STOPPED)
      expect(harness.onDestroy()).assertTrue()

      const stats = harness.buildStats()
      expect(stats.createCount).assertEqual(1)
      expect(stats.destroyCount).assertEqual(1)
      expect(stats.startCount).assertEqual(1)
      expect(stats.stopCount).assertEqual(1)
      expect(harness.getWindows().getDestroyedCount()).assertEqual(2)
      expect(harness.getJournal().length).assertEqual(4)
    })
  })
}
