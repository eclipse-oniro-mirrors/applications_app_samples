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

// Display orientation reported by the TV display.
enum DisplayOrientation {
  PORTRAIT = 'portrait',
  LANDSCAPE = 'landscape',
  ROTATED_180 = 'rotated_180'
}

// Display configuration snapshot consumed by sizeCalc.
interface DisplayConfiguration {
  orientation: DisplayOrientation
  width: number
  height: number
  density: number
  fontScale: number
}

// One recorded configuration change.
interface ConfigChangeRecord {
  configType: string
  oldValue: string
  newValue: string
  applied: boolean
  timestamp: number
}

// Floating window geometry recalculated from the display width.
interface RecorderWindowGeometry {
  x: number
  y: number
  width: number
  height: number
}

// Configuration summary used by the audit report.
interface ConfigAuditSummary {
  totalChanges: number
  appliedChanges: number
  rejectedChanges: number
  successRate: number
  currentOrientation: DisplayOrientation
}

// LocalStorage content owned by ScreenRecorderAbility.
interface RecorderLocalStorage {
  recorderState: number
  hasAbilityContext: boolean
  displayWidth: number
}

// Models utils/SizeCalc.ets: sizeCalc(n) = display.width / 1920 * n.
class SizeCalcModel {
  public static readonly BASE_WIDTH: number = 1920

  public sizeCalc(displayWidth: number, value: number): number {
    return Math.round(displayWidth / SizeCalcModel.BASE_WIDTH * value)
  }

  public scale(displayWidth: number): number {
    return displayWidth / SizeCalcModel.BASE_WIDTH
  }

  public isValidDisplay(displayWidth: number): boolean {
    return displayWidth > 0
  }
}

// Applies display configuration changes to the floating window geometry.
class RecorderConfigManager {
  private config: DisplayConfiguration
  private records: ConfigChangeRecord[] = []
  private sizeCalc: SizeCalcModel = new SizeCalcModel()
  private timerGeometry: RecorderWindowGeometry
  private clock: number = 1700000000000

  constructor() {
    this.config = {
      orientation: DisplayOrientation.LANDSCAPE,
      width: 1920,
      height: 1080,
      density: 1,
      fontScale: 1
    }
    this.timerGeometry = { x: 96, y: 48, width: 624, height: 56 }
  }

  public getConfig(): DisplayConfiguration {
    return this.config
  }

  public getTimerGeometry(): RecorderWindowGeometry {
    return this.timerGeometry
  }

  public getRecords(): ConfigChangeRecord[] {
    return this.records.slice()
  }

  public applyOrientation(orientation: DisplayOrientation): boolean {
    const previous = this.config.orientation
    if (previous === orientation) {
      return false
    }
    this.config.orientation = orientation
    this.record('orientation', previous, orientation, true)
    return true
  }

  public applySize(width: number, height: number): boolean {
    if (!this.sizeCalc.isValidDisplay(width) || height <= 0) {
      this.record('size', `${this.config.width}x${this.config.height}`, `${width}x${height}`, false)
      return false
    }
    const previous = `${this.config.width}x${this.config.height}`
    this.config.width = width
    this.config.height = height
    this.recalculateGeometry()
    this.record('size', previous, `${width}x${height}`, true)
    return true
  }

  public applyDensity(density: number): boolean {
    if (density <= 0) {
      this.record('density', `${this.config.density}`, `${density}`, false)
      return false
    }
    const previous = `${this.config.density}`
    this.config.density = density
    this.record('density', previous, `${density}`, true)
    return true
  }

  public applyFontScale(fontScale: number): boolean {
    if (fontScale <= 0) {
      this.record('font_scale', `${this.config.fontScale}`, `${fontScale}`, false)
      return false
    }
    const previous = `${this.config.fontScale}`
    this.config.fontScale = fontScale
    this.record('font_scale', previous, `${fontScale}`, true)
    return true
  }

  // Re-applies the timer window rect after the display width changed.
  public recalculateGeometry(): RecorderWindowGeometry {
    const width = this.config.width
    this.timerGeometry = {
      x: this.sizeCalc.sizeCalc(width, 96),
      y: this.sizeCalc.sizeCalc(width, 48),
      width: this.sizeCalc.sizeCalc(width, 624),
      height: this.sizeCalc.sizeCalc(width, 56)
    }
    return this.timerGeometry
  }

  public countChanges(configType: string): number {
    let count = 0
    for (const record of this.records) {
      if (record.configType === configType) {
        count += 1
      }
    }
    return count
  }

  public countApplied(): number {
    let count = 0
    for (const record of this.records) {
      if (record.applied) {
        count += 1
      }
    }
    return count
  }

  public buildAuditSummary(): ConfigAuditSummary {
    const summary: ConfigAuditSummary = {
      totalChanges: this.records.length,
      appliedChanges: this.countApplied(),
      rejectedChanges: this.records.length - this.countApplied(),
      successRate: this.records.length === 0 ? 0 : this.countApplied() / this.records.length,
      currentOrientation: this.config.orientation
    }
    return summary
  }

  private record(configType: string, oldValue: string, newValue: string, applied: boolean): void {
    const record: ConfigChangeRecord = {
      configType: configType,
      oldValue: oldValue,
      newValue: newValue,
      applied: applied,
      timestamp: this.clock
    }
    this.records.push(record)
    this.clock += 5
  }
}

// LocalStorage that survives display configuration changes.
class RecorderLocalStorageHolder {
  private storage: RecorderLocalStorage = {
    recorderState: 0,
    hasAbilityContext: false,
    displayWidth: 1920
  }

  public prepare(displayWidth: number): void {
    this.storage = {
      recorderState: 0,
      hasAbilityContext: true,
      displayWidth: displayWidth
    }
  }

  public setRecorderState(state: number): void {
    this.storage.recorderState = state
  }

  public applyDisplayWidth(width: number): void {
    this.storage.displayWidth = width
  }

  public snapshot(): RecorderLocalStorage {
    return this.storage
  }

  public clear(): void {
    this.storage = {
      recorderState: 0,
      hasAbilityContext: false,
      displayWidth: 0
    }
  }
}

export default function configurationChangesTest(): void {
  describe('ConfigurationChanges_Test', () => {
    let manager: RecorderConfigManager
    let holder: RecorderLocalStorageHolder
    let sizeCalc: SizeCalcModel

    beforeEach(() => {
      manager = new RecorderConfigManager()
      holder = new RecorderLocalStorageHolder()
      sizeCalc = new SizeCalcModel()
    })

    it('size_calc_should_return_identity_for_1920', 0, () => {
      expect(sizeCalc.sizeCalc(1920, 96)).assertEqual(96)
      expect(sizeCalc.sizeCalc(1920, 624)).assertEqual(624)
      expect(sizeCalc.sizeCalc(1920, 56)).assertEqual(56)
    })

    it('size_calc_should_scale_half_for_960', 0, () => {
      expect(sizeCalc.sizeCalc(960, 96)).assertEqual(48)
      expect(sizeCalc.sizeCalc(960, 624)).assertEqual(312)
      expect(sizeCalc.sizeCalc(960, 56)).assertEqual(28)
    })

    it('size_calc_should_scale_for_1280', 0, () => {
      expect(sizeCalc.sizeCalc(1280, 96)).assertEqual(64)
      expect(sizeCalc.sizeCalc(1280, 48)).assertEqual(32)
      expect(sizeCalc.sizeCalc(1280, 624)).assertEqual(416)
    })

    it('size_calc_should_round_to_integer', 0, () => {
      expect(sizeCalc.sizeCalc(1000, 96)).assertEqual(50)
      expect(sizeCalc.sizeCalc(1280, 56)).assertEqual(37)
      expect(sizeCalc.sizeCalc(1920, 0)).assertEqual(0)
    })

    it('size_calc_should_report_display_scale', 0, () => {
      expect(sizeCalc.scale(1920)).assertEqual(1)
      expect(sizeCalc.scale(960)).assertEqual(0.5)
      expect(sizeCalc.isValidDisplay(0)).assertFalse()
      expect(sizeCalc.isValidDisplay(1920)).assertTrue()
    })

    it('config_manager_should_start_with_default_display', 0, () => {
      const config = manager.getConfig()
      expect(config.orientation).assertEqual(DisplayOrientation.LANDSCAPE)
      expect(config.width).assertEqual(1920)
      expect(config.height).assertEqual(1080)
      expect(config.density).assertEqual(1)
    })

    it('config_manager_should_apply_rotation_change', 0, () => {
      expect(manager.applyOrientation(DisplayOrientation.ROTATED_180)).assertTrue()
      expect(manager.getConfig().orientation).assertEqual(DisplayOrientation.ROTATED_180)
      expect(manager.countChanges('orientation')).assertEqual(1)
    })

    it('config_manager_should_ignore_same_orientation', 0, () => {
      expect(manager.applyOrientation(DisplayOrientation.LANDSCAPE)).assertFalse()
      expect(manager.getRecords().length).assertEqual(0)
    })

    it('config_manager_should_apply_size_change', 0, () => {
      expect(manager.applySize(1280, 720)).assertTrue()
      const config = manager.getConfig()
      expect(config.width).assertEqual(1280)
      expect(config.height).assertEqual(720)
      expect(manager.countChanges('size')).assertEqual(1)
    })

    it('config_manager_should_recalculate_timer_rect_on_size_change', 0, () => {
      manager.applySize(960, 540)
      const geometry = manager.getTimerGeometry()
      expect(geometry.x).assertEqual(48)
      expect(geometry.y).assertEqual(24)
      expect(geometry.width).assertEqual(312)
      expect(geometry.height).assertEqual(28)
    })

    it('config_manager_should_keep_timer_rect_for_1920', 0, () => {
      manager.applySize(1920, 1080)
      const geometry = manager.getTimerGeometry()
      expect(geometry.x).assertEqual(96)
      expect(geometry.y).assertEqual(48)
      expect(geometry.width).assertEqual(624)
      expect(geometry.height).assertEqual(56)
    })

    it('config_manager_should_recalculate_geometry_deterministically', 0, () => {
      manager.applySize(1280, 720)
      const first = manager.getTimerGeometry()
      const second = manager.recalculateGeometry()
      expect(first.x).assertEqual(second.x)
      expect(first.width).assertEqual(second.width)
      expect(first.height).assertEqual(second.height)
    })

    it('config_manager_should_reject_zero_width', 0, () => {
      expect(manager.applySize(0, 720)).assertFalse()
      expect(manager.getConfig().width).assertEqual(1920)
      expect(manager.countChanges('size')).assertEqual(1)
    })

    it('config_manager_should_reject_negative_height', 0, () => {
      expect(manager.applySize(1280, -1)).assertFalse()
      expect(manager.getConfig().height).assertEqual(1080)
    })

    it('config_manager_should_reject_negative_density', 0, () => {
      expect(manager.applyDensity(-2)).assertFalse()
      expect(manager.getConfig().density).assertEqual(1)
      expect(manager.applyDensity(2)).assertTrue()
      expect(manager.getConfig().density).assertEqual(2)
    })

    it('config_manager_should_apply_font_scale', 0, () => {
      expect(manager.applyFontScale(1.5)).assertTrue()
      expect(manager.getConfig().fontScale).assertEqual(1.5)
      expect(manager.applyFontScale(0)).assertFalse()
      expect(manager.getConfig().fontScale).assertEqual(1.5)
    })

    it('config_change_records_should_be_chronological', 0, () => {
      manager.applyOrientation(DisplayOrientation.PORTRAIT)
      manager.applySize(1280, 720)
      manager.applyDensity(2)
      const records = manager.getRecords()
      expect(records.length).assertEqual(3)
      for (let i = 1; i < records.length; i++) {
        expect(records[i - 1].timestamp).assertLessOrEqual(records[i].timestamp)
      }
    })

    it('config_manager_should_audit_applied_and_rejected', 0, () => {
      manager.applySize(1280, 720)
      manager.applySize(0, 720)
      manager.applyDensity(2)
      const summary = manager.buildAuditSummary()
      expect(summary.totalChanges).assertEqual(3)
      expect(summary.appliedChanges).assertEqual(2)
      expect(summary.rejectedChanges).assertEqual(1)
      expect(summary.successRate).assertEqual(2 / 3)
      expect(summary.currentOrientation).assertEqual(DisplayOrientation.LANDSCAPE)
    })

    it('local_storage_should_preserve_recorder_state', 0, () => {
      holder.prepare(1920)
      holder.setRecorderState(1)
      expect(holder.snapshot().recorderState).assertEqual(1)
      expect(holder.snapshot().hasAbilityContext).assertTrue()
    })

    it('local_storage_should_survive_rotation', 0, () => {
      holder.prepare(1920)
      holder.setRecorderState(1)
      manager.applyOrientation(DisplayOrientation.PORTRAIT)
      expect(holder.snapshot().recorderState).assertEqual(1)
      expect(manager.getConfig().orientation).assertEqual(DisplayOrientation.PORTRAIT)
    })

    it('local_storage_should_track_display_width', 0, () => {
      holder.prepare(1920)
      manager.applySize(1280, 720)
      holder.applyDisplayWidth(manager.getConfig().width)
      expect(holder.snapshot().displayWidth).assertEqual(1280)
    })

    it('local_storage_should_restore_after_recreate', 0, () => {
      holder.prepare(1920)
      holder.setRecorderState(2)
      holder.applyDisplayWidth(960)
      const restored = holder.snapshot()
      expect(restored.recorderState).assertEqual(2)
      expect(restored.displayWidth).assertEqual(960)
      expect(restored.hasAbilityContext).assertTrue()
    })

    it('local_storage_should_clear_on_destroy', 0, () => {
      holder.prepare(1920)
      holder.clear()
      const cleared = holder.snapshot()
      expect(cleared.hasAbilityContext).assertFalse()
      expect(cleared.displayWidth).assertEqual(0)
      expect(cleared.recorderState).assertEqual(0)
    })

    it('config_manager_should_handle_rapid_changes', 0, () => {
      for (let i = 0; i < 30; i++) {
        const width = i % 2 === 0 ? 1920 : 960
        manager.applySize(width, 1080)
      }
      expect(manager.countChanges('size')).assertEqual(30)
      expect(manager.getConfig().width).assertEqual(960)
    })

    it('config_manager_should_handle_all_orientations', 0, () => {
      const orientations: DisplayOrientation[] = [
        DisplayOrientation.PORTRAIT,
        DisplayOrientation.LANDSCAPE,
        DisplayOrientation.ROTATED_180,
        DisplayOrientation.LANDSCAPE
      ]
      for (const orientation of orientations) {
        manager.applyOrientation(orientation)
      }
      expect(manager.countChanges('orientation')).assertEqual(4)
      expect(manager.getConfig().orientation).assertEqual(DisplayOrientation.LANDSCAPE)
    })

    it('comprehensive_configuration_change_scenario', 0, () => {
      holder.prepare(1920)
      holder.setRecorderState(1)

      expect(manager.applyOrientation(DisplayOrientation.PORTRAIT)).assertTrue()
      expect(manager.applySize(1280, 720)).assertTrue()
      expect(manager.applyDensity(1.5)).assertTrue()
      expect(manager.applyFontScale(1.2)).assertTrue()
      expect(manager.applySize(0, 720)).assertFalse()

      const geometry = manager.getTimerGeometry()
      expect(geometry.x).assertEqual(64)
      expect(geometry.width).assertEqual(416)
      expect(geometry.height).assertEqual(37)

      holder.applyDisplayWidth(manager.getConfig().width)
      expect(holder.snapshot().recorderState).assertEqual(1)
      expect(holder.snapshot().displayWidth).assertEqual(1280)

      const summary = manager.buildAuditSummary()
      expect(summary.totalChanges).assertEqual(5)
      expect(summary.appliedChanges).assertEqual(4)
      expect(summary.rejectedChanges).assertEqual(1)
      expect(summary.currentOrientation).assertEqual(DisplayOrientation.PORTRAIT)
    })
  })
}
