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

// Keys published into the LocalStorage of ScreenRecorderAbility.
enum PersistSlot {
  RECORDER_STATE = 'recorderState',
  ABILITY_CONTEXT = 'SRAbilityContext',
  DISPLAY_WIDTH = 'displayWidth',
  LAST_OUTPUT_FILE = 'lastOutputFile'
}

// One persisted entry.
interface PersistEntry {
  slot: PersistSlot
  value: string
  version: number
  updatedAt: number
}

// Snapshot of the persisted store, used by the restart scenarios.
interface PersistSnapshot {
  entryCount: number
  recorderState: number
  hasAbilityContext: boolean
  displayWidth: number
  lastOutputFile: string
}

// Models the LocalStorage of the recorder service extension. The recorder
// state and the ability context are written in onCreate and restored when the
// service is started again after a restart.
class RecorderStateStore {
  private entries: Map<PersistSlot, PersistEntry> = new Map<PersistSlot, PersistEntry>()
  private clock: number = 1700000000000

  public put(slot: PersistSlot, value: string, version: number): boolean {
    const previous = this.entries.get(slot)
    const entry: PersistEntry = {
      slot: slot,
      value: value,
      version: version,
      updatedAt: this.clock
    }
    this.entries.set(slot, entry)
    this.clock += 5
    return previous === undefined
  }

  public get(slot: PersistSlot): string {
    const entry = this.entries.get(slot)
    if (entry === undefined) {
      return ''
    }
    return entry.value
  }

  public getVersion(slot: PersistSlot): number {
    const entry = this.entries.get(slot)
    if (entry === undefined) {
      return 0
    }
    return entry.version
  }

  public getUpdatedAt(slot: PersistSlot): number {
    const entry = this.entries.get(slot)
    if (entry === undefined) {
      return 0
    }
    return entry.updatedAt
  }

  public has(slot: PersistSlot): boolean {
    return this.entries.has(slot)
  }

  public size(): number {
    return this.entries.size
  }

  public getRecorderState(): number {
    const raw = this.get(PersistSlot.RECORDER_STATE)
    if (raw === '') {
      return 0
    }
    return Number(raw)
  }

  public getDisplayWidth(): number {
    const raw = this.get(PersistSlot.DISPLAY_WIDTH)
    if (raw === '') {
      return 0
    }
    return Number(raw)
  }

  public setRecorderState(state: number, version: number): void {
    this.put(PersistSlot.RECORDER_STATE, `${state}`, version)
  }

  public setAbilityContext(value: string, version: number): void {
    this.put(PersistSlot.ABILITY_CONTEXT, value, version)
  }

  public setDisplayWidth(width: number, version: number): void {
    this.put(PersistSlot.DISPLAY_WIDTH, `${width}`, version)
  }

  public buildSnapshot(): PersistSnapshot {
    const snapshot: PersistSnapshot = {
      entryCount: this.entries.size,
      recorderState: this.getRecorderState(),
      hasAbilityContext: this.get(PersistSlot.ABILITY_CONTEXT) !== '',
      displayWidth: this.getDisplayWidth(),
      lastOutputFile: this.get(PersistSlot.LAST_OUTPUT_FILE)
    }
    return snapshot
  }

  // Copies every entry into a fresh store, which models a restart.
  public restoreInto(target: RecorderStateStore): number {
    let copied = 0
    const keys = this.entries.keys()
    for (const key of keys) {
      const source = this.entries.get(key)
      if (source !== undefined) {
        const copy: PersistEntry = {
          slot: source.slot,
          value: source.value,
          version: source.version,
          updatedAt: source.updatedAt
        }
        target.entries.set(copy.slot, copy)
        copied += 1
      }
    }
    return copied
  }

  public isChronological(): boolean {
    let previous = 0
    const keys = this.entries.keys()
    for (const key of keys) {
      const entry = this.entries.get(key)
      if (entry !== undefined) {
        if (previous > entry.updatedAt) {
          return false
        }
        previous = entry.updatedAt
      }
    }
    return true
  }

  public clear(): void {
    this.entries = new Map<PersistSlot, PersistEntry>()
  }
}

export default function statePersistenceTest(): void {
  describe('StatePersistence_Test', () => {
    let store: RecorderStateStore

    beforeEach(() => {
      store = new RecorderStateStore()
    })

    it('store_should_start_empty', 0, () => {
      expect(store.size()).assertEqual(0)
      expect(store.has(PersistSlot.RECORDER_STATE)).assertFalse()
      expect(store.getRecorderState()).assertEqual(0)
      expect(store.get(PersistSlot.ABILITY_CONTEXT)).assertEqual('')
    })

    it('store_should_persist_recorder_state', 0, () => {
      store.setRecorderState(1, 1)
      expect(store.has(PersistSlot.RECORDER_STATE)).assertTrue()
      expect(store.getRecorderState()).assertEqual(1)
      expect(store.size()).assertEqual(1)
    })

    it('store_should_hold_all_recorder_states', 0, () => {
      const states: number[] = [0, 1, 2, 3]
      for (const state of states) {
        store.setRecorderState(state, 1)
        expect(store.getRecorderState()).assertEqual(state)
      }
      expect(store.size()).assertEqual(1)
    })

    it('store_should_persist_ability_context', 0, () => {
      store.setAbilityContext('context:recorder', 1)
      expect(store.get(PersistSlot.ABILITY_CONTEXT)).assertEqual('context:recorder')
      expect(store.buildSnapshot().hasAbilityContext).assertTrue()
    })

    it('store_should_keep_multiple_slots', 0, () => {
      store.setRecorderState(1, 1)
      store.setAbilityContext('context:recorder', 1)
      store.setDisplayWidth(1920, 1)
      store.put(PersistSlot.LAST_OUTPUT_FILE, 'REC_20260101_120000.mp4', 1)
      expect(store.size()).assertEqual(4)
      expect(store.buildSnapshot().entryCount).assertEqual(4)
    })

    it('store_should_overwrite_slot_value', 0, () => {
      store.setRecorderState(1, 1)
      expect(store.put(PersistSlot.RECORDER_STATE, '2', 2)).assertFalse()
      expect(store.getRecorderState()).assertEqual(2)
      expect(store.getVersion(PersistSlot.RECORDER_STATE)).assertEqual(2)
    })

    it('store_should_report_slot_presence', 0, () => {
      expect(store.has(PersistSlot.RECORDER_STATE)).assertFalse()
      store.setRecorderState(1, 1)
      expect(store.has(PersistSlot.RECORDER_STATE)).assertTrue()
      expect(store.has(PersistSlot.DISPLAY_WIDTH)).assertFalse()
    })

    it('store_should_track_update_order', 0, () => {
      store.setRecorderState(1, 1)
      store.setDisplayWidth(1280, 1)
      expect(store.getUpdatedAt(PersistSlot.RECORDER_STATE))
        .assertLess(store.getUpdatedAt(PersistSlot.DISPLAY_WIDTH))
      expect(store.isChronological()).assertTrue()
    })

    it('store_should_snapshot_persisted_values', 0, () => {
      store.setRecorderState(1, 1)
      store.setDisplayWidth(1280, 1)
      store.put(PersistSlot.LAST_OUTPUT_FILE, 'REC_20260101_120000.mp4', 1)
      const snapshot: PersistSnapshot = store.buildSnapshot()
      expect(snapshot.recorderState).assertEqual(1)
      expect(snapshot.displayWidth).assertEqual(1280)
      expect(snapshot.lastOutputFile).assertContain('REC_')
    })

    it('store_should_restore_after_restart', 0, () => {
      store.setRecorderState(1, 1)
      store.setAbilityContext('context:recorder', 1)
      const restarted = new RecorderStateStore()
      expect(store.restoreInto(restarted)).assertEqual(2)
      expect(restarted.getRecorderState()).assertEqual(1)
      expect(restarted.get(PersistSlot.ABILITY_CONTEXT)).assertEqual('context:recorder')
    })

    it('restore_should_copy_entry_count', 0, () => {
      store.setRecorderState(2, 1)
      store.setDisplayWidth(960, 1)
      store.put(PersistSlot.LAST_OUTPUT_FILE, 'REC_20260101_120500.mp4', 1)
      const restarted = new RecorderStateStore()
      store.restoreInto(restarted)
      expect(restarted.size()).assertEqual(3)
      expect(restarted.buildSnapshot().entryCount).assertEqual(3)
    })

    it('restore_should_not_alias_source_store', 0, () => {
      store.setRecorderState(1, 1)
      const restarted = new RecorderStateStore()
      store.restoreInto(restarted)
      store.clear()
      expect(restarted.getRecorderState()).assertEqual(1)
      expect(restarted.size()).assertEqual(1)
    })

    it('restore_should_keep_display_width', 0, () => {
      store.setDisplayWidth(1920, 3)
      const restarted = new RecorderStateStore()
      store.restoreInto(restarted)
      expect(restarted.getDisplayWidth()).assertEqual(1920)
      expect(restarted.getVersion(PersistSlot.DISPLAY_WIDTH)).assertEqual(3)
    })

    it('store_should_clear_all_entries', 0, () => {
      store.setRecorderState(1, 1)
      store.setAbilityContext('context:recorder', 1)
      store.clear()
      expect(store.size()).assertEqual(0)
      expect(store.has(PersistSlot.RECORDER_STATE)).assertFalse()
      expect(store.getRecorderState()).assertEqual(0)
    })

    it('store_should_report_zero_version_for_missing_slot', 0, () => {
      expect(store.getVersion(PersistSlot.RECORDER_STATE)).assertEqual(0)
      expect(store.getUpdatedAt(PersistSlot.LAST_OUTPUT_FILE)).assertEqual(0)
    })

    it('store_should_survive_missing_ability_context', 0, () => {
      store.setRecorderState(2, 1)
      const snapshot = store.buildSnapshot()
      expect(snapshot.hasAbilityContext).assertFalse()
      expect(snapshot.recorderState).assertEqual(2)
    })

    it('store_should_handle_many_slots', 0, () => {
      for (let i = 0; i < 100; i++) {
        store.put(PersistSlot.LAST_OUTPUT_FILE, `REC_20260101_12${i}.mp4`, i)
      }
      expect(store.size()).assertEqual(1)
      expect(store.get(PersistSlot.LAST_OUTPUT_FILE)).assertContain('REC_20260101_1299')
    })

    it('store_should_persist_last_output_file', 0, () => {
      store.put(PersistSlot.LAST_OUTPUT_FILE, 'REC_20260101_120000.mp4', 1)
      const restarted = new RecorderStateStore()
      store.restoreInto(restarted)
      expect(restarted.get(PersistSlot.LAST_OUTPUT_FILE)).assertEqual('REC_20260101_120000.mp4')
    })

    it('comprehensive_state_persistence_scenario', 0, () => {
      store.setRecorderState(0, 1)
      store.setAbilityContext('context:recorder', 1)
      store.setDisplayWidth(1920, 1)

      store.setRecorderState(1, 2)
      expect(store.getRecorderState()).assertEqual(1)

      const restarted = new RecorderStateStore()
      expect(store.restoreInto(restarted)).assertEqual(3)
      expect(restarted.getRecorderState()).assertEqual(1)
      expect(restarted.getDisplayWidth()).assertEqual(1920)
      expect(restarted.buildSnapshot().hasAbilityContext).assertTrue()

      restarted.setRecorderState(2, 3)
      expect(restarted.getRecorderState()).assertEqual(2)
      expect(restarted.getVersion(PersistSlot.RECORDER_STATE)).assertEqual(3)
    })
  })
}