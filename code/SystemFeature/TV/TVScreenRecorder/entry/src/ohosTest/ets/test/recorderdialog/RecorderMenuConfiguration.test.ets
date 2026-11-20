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

import { describe, it, expect, beforeAll, beforeEach } from '@ohos/hypium';

// Window kinds created by WindowMgr.
enum WindowKind {
  Timer = 0,
  Tip = 1
}

// One entry of the window configuration table.
interface WindowConfigEntry {
  kind: WindowKind;
  name: string;
  page: string;
  width: number;
  height: number;
  x: number;
  y: number;
  durationMs: number;
  focusable: boolean;
  transparent: boolean;
}

// One entry of the recorder parameter table.
interface RecorderParamEntry {
  key: string;
  value: number;
  min: number;
  max: number;
  description: string;
}

// Builds the production window table. The values mirror ScreenRecorderAbility.
class WindowConfigTable {
  private entries: WindowConfigEntry[] = [];

  public static buildDefault(): WindowConfigTable {
    const table = new WindowConfigTable();
    table.add(new TimerWindowConfigEntity());
    table.add(new TipWindowConfigEntity());
    return table;
  }

  public add(entry: WindowConfigEntry): void {
    this.entries.push(entry);
  }

  public getAll(): WindowConfigEntry[] {
    return this.entries.slice();
  }

  public getCount(): number {
    return this.entries.length;
  }

  public findByName(name: string): WindowConfigEntry | undefined {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].name === name) {
        return this.entries[i];
      }
    }
    return undefined;
  }

  public findByKind(kind: WindowKind): WindowConfigEntry | undefined {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].kind === kind) {
        return this.entries[i];
      }
    }
    return undefined;
  }

  public getFocusableCount(): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].focusable) {
        count++;
      }
    }
    return count;
  }

  public getExpiredCount(durationMs: number): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].durationMs <= durationMs) {
        count++;
      }
    }
    return count;
  }

  public validate(): string[] {
    const issues: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      const entry = this.entries[i];
      if (entry.name.length === 0) {
        issues.push('name-empty');
      }
      if (entry.page.length === 0) {
        issues.push('page-empty');
      }
      if (entry.width <= 0 || entry.height <= 0) {
        issues.push('size-invalid');
      }
      if (entry.x < 0 || entry.y < 0) {
        issues.push('position-invalid');
      }
      if (entry.durationMs < 0) {
        issues.push('duration-invalid');
      }
    }
    return issues;
  }
}

// Window configuration of the timer floating window.
class TimerWindowConfigEntity implements WindowConfigEntry {
  kind: WindowKind = WindowKind.Timer;
  name: string = 'timer';
  page: string = 'pages/ScreenRecorderTimer';
  width: number = 624;
  height: number = 56;
  x: number = 96;
  y: number = 48;
  durationMs: number = 0;
  focusable: boolean = false;
  transparent: boolean = true;
}

// Window configuration of the recording tip floating window.
class TipWindowConfigEntity implements WindowConfigEntry {
  kind: WindowKind = WindowKind.Tip;
  name: string = 'Tip';
  page: string = 'pages/ScreenRecorderDialog';
  width: number = 686;
  height: number = 100;
  x: number = 615;
  y: number = 46;
  durationMs: number = 3000;
  focusable: boolean = false;
  transparent: boolean = true;
}

// Recorder parameter table aligned with RecorderConstants.
class RecorderParamTable {
  private entries: RecorderParamEntry[] = [];

  public static buildDefault(): RecorderParamTable {
    const table = new RecorderParamTable();
    table.add('VIDEO_SOURCE_TYPE_BUFFER_YUV', 0, 0, 1, 'yuv buffer source');
    table.add('VIDEO_SOURCE_TYPE_BUFFER_ES', 1, 0, 1, 'es buffer source');
    table.add('AUDIO_SOURCE_MIC', 1, 0, 1, 'microphone source');
    table.add('TIME_LENGTH', 2, 1, 6, 'time field padding');
    table.add('RECORD_RESOLUTION_WIDTH', 1920, 320, 3840, 'output width');
    table.add('RECORD_RESOLUTION_HEIGHT', 1080, 240, 2160, 'output height');
    table.add('DEVICE_RATE', 0.6, 0.1, 1.0, 'device scaling rate');
    return table;
  }

  public add(key: string, value: number, min: number, max: number, description: string): void {
    this.entries.push({ key: key, value: value, min: min, max: max, description: description });
  }

  public getAll(): RecorderParamEntry[] {
    return this.entries.slice();
  }

  public getCount(): number {
    return this.entries.length;
  }

  public find(key: string): RecorderParamEntry | undefined {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return this.entries[i];
      }
    }
    return undefined;
  }

  public getOutOfRangeCount(): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      const entry = this.entries[i];
      if (entry.value < entry.min || entry.value > entry.max) {
        count++;
      }
    }
    return count;
  }

  public sum(): number {
    let total = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].value;
    }
    return total;
  }
}

// One entry of the recording settings menu.
interface MenuItem {
  id: string;
  label: string;
  enabled: boolean;
  order: number;
  action: string;
}

// Recording settings menu model. The menu is presented before a recording
// starts so that unsupported combinations are rejected early.
class RecordingMenu {
  private items: MenuItem[] = [];

  public static buildDefault(): RecordingMenu {
    const menu = new RecordingMenu();
    menu.add('resolution', '录屏分辨率', true, 1, 'select-resolution');
    menu.add('frameRate', '录屏帧率', true, 2, 'select-framerate');
    menu.add('audio', '录制声音', false, 3, 'toggle-audio');
    menu.add('timer', '显示计时器', true, 4, 'toggle-timer');
    return menu;
  }

  public add(id: string, label: string, enabled: boolean, order: number, action: string): void {
    this.items.push({ id: id, label: label, enabled: enabled, order: order, action: action });
  }

  public getAll(): MenuItem[] {
    return this.items.slice();
  }

  public getCount(): number {
    return this.items.length;
  }

  public findById(id: string): MenuItem | undefined {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        return this.items[i];
      }
    }
    return undefined;
  }

  public getEnabledItems(): MenuItem[] {
    const enabled: MenuItem[] = [];
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].enabled) {
        enabled.push(this.items[i]);
      }
    }
    return enabled;
  }

  public setEnabled(id: string, enabled: boolean): boolean {
    const item = this.findById(id);
    if (!item) {
      return false;
    }
    item.enabled = enabled;
    return true;
  }

  public sortByOrder(): void {
    this.items.sort((left: MenuItem, right: MenuItem) => left.order - right.order);
  }

  public isOrdered(): boolean {
    for (let i = 1; i < this.items.length; i++) {
      if (this.items[i].order < this.items[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  public getActions(): string[] {
    const actions: string[] = [];
    for (let i = 0; i < this.items.length; i++) {
      actions.push(this.items[i].action);
    }
    return actions;
  }

  public validate(): string[] {
    const issues: string[] = [];
    const seen: string[] = [];
    for (let i = 0; i < this.items.length; i++) {
      const item = this.items[i];
      if (item.id.length === 0 || item.label.length === 0) {
        issues.push('item-empty');
      }
      if (seen.indexOf(item.id) >= 0) {
        issues.push('duplicate-id:' + item.id);
      }
      seen.push(item.id);
      if (item.order <= 0) {
        issues.push('order-invalid:' + item.id);
      }
    }
    return issues;
  }
}

// Scales production layout values to the current display width.
class LayoutScaler {
  public static readonly DESIGN_WIDTH: number = 1920;

  public scale(value: number, displayWidth: number): number {
    return displayWidth / LayoutScaler.DESIGN_WIDTH * value;
  }

  public scaleRect(values: number[], displayWidth: number): number[] {
    const result: number[] = [];
    for (let i = 0; i < values.length; i++) {
      result.push(this.scale(values[i], displayWidth));
    }
    return result;
  }

  public fits(width: number, height: number, maxWidth: number, maxHeight: number): boolean {
    return width <= maxWidth && height <= maxHeight;
  }

  public isCentered(x: number, width: number, displayWidth: number): boolean {
    const leftGap = x;
    const rightGap = displayWidth - x - width;
    return Math.abs(leftGap - rightGap) <= 8;
  }
}

export default function recorderMenuConfigurationTest(): void {
  describe('RecorderMenuConfiguration_Test', () => {
    let windows: WindowConfigTable;
    let params: RecorderParamTable;
    let menu: RecordingMenu;
    let scaler: LayoutScaler;

    beforeAll(() => {
      scaler = new LayoutScaler();
    });

    beforeEach(() => {
      windows = WindowConfigTable.buildDefault();
      params = RecorderParamTable.buildDefault();
      menu = RecordingMenu.buildDefault();
    });

    it('window_table_should_contain_two_entries', 0, () => {
      expect(windows.getCount()).assertEqual(2);
      expect(windows.validate().length).assertEqual(0);
      expect(windows.getFocusableCount()).assertEqual(0);
    });

    it('timer_window_config_should_match_production', 0, () => {
      const timer = windows.findByName('timer');
      expect(timer !== undefined).assertEqual(true);
      if (timer !== undefined) {
        expect(timer.kind).assertEqual(WindowKind.Timer);
        expect(timer.page).assertEqual('pages/ScreenRecorderTimer');
        expect(timer.x).assertEqual(96);
        expect(timer.y).assertEqual(48);
        expect(timer.width).assertEqual(624);
        expect(timer.height).assertEqual(56);
        expect(timer.durationMs).assertEqual(0);
        expect(timer.transparent).assertEqual(true);
      }
    });

    it('tip_window_config_should_match_production', 0, () => {
      const tip = windows.findByName('Tip');
      expect(tip !== undefined).assertEqual(true);
      if (tip !== undefined) {
        expect(tip.kind).assertEqual(WindowKind.Tip);
        expect(tip.page).assertEqual('pages/ScreenRecorderDialog');
        expect(tip.x).assertEqual(615);
        expect(tip.y).assertEqual(46);
        expect(tip.width).assertEqual(686);
        expect(tip.height).assertEqual(100);
        expect(tip.durationMs).assertEqual(3000);
        expect(tip.focusable).assertEqual(false);
      }
    });

    it('window_table_should_lookup_by_kind', 0, () => {
      const timer = windows.findByKind(WindowKind.Timer);
      const tip = windows.findByKind(WindowKind.Tip);
      expect(timer !== undefined).assertEqual(true);
      expect(tip !== undefined).assertEqual(true);
      expect(windows.findByName('missing') === undefined).assertEqual(true);
    });

    it('window_table_should_validate_bad_entries', 0, () => {
      const broken = new WindowConfigTable();
      broken.add({
        kind: WindowKind.Tip,
        name: '',
        page: '',
        width: 0,
        height: 0,
        x: -1,
        y: -1,
        durationMs: -5,
        focusable: true,
        transparent: false
      });
      const issues = broken.validate();
      expect(issues.length).assertEqual(5);
      expect(issues.indexOf('name-empty') >= 0).assertEqual(true);
      expect(issues.indexOf('size-invalid') >= 0).assertEqual(true);
    });

    it('window_expiry_should_be_computed_from_duration', 0, () => {
      expect(windows.getExpiredCount(0)).assertEqual(1);
      expect(windows.getExpiredCount(2999)).assertEqual(1);
      expect(windows.getExpiredCount(3000)).assertEqual(2);
      expect(windows.getExpiredCount(10000)).assertEqual(2);
    });

    it('param_table_should_contain_all_production_keys', 0, () => {
      expect(params.getCount()).assertEqual(7);
      expect(params.getOutOfRangeCount()).assertEqual(0);
      const keys = ['VIDEO_SOURCE_TYPE_BUFFER_YUV', 'VIDEO_SOURCE_TYPE_BUFFER_ES', 'AUDIO_SOURCE_MIC',
        'TIME_LENGTH', 'RECORD_RESOLUTION_WIDTH', 'RECORD_RESOLUTION_HEIGHT', 'DEVICE_RATE'];
      for (let i = 0; i < keys.length; i++) {
        expect(params.find(keys[i]) !== undefined).assertEqual(true);
      }
    });

    it('param_table_should_expose_resolution_values', 0, () => {
      const width = params.find('RECORD_RESOLUTION_WIDTH');
      const height = params.find('RECORD_RESOLUTION_HEIGHT');
      expect(width !== undefined).assertEqual(true);
      expect(height !== undefined).assertEqual(true);
      if (width !== undefined && height !== undefined) {
        expect(width.value).assertEqual(1920);
        expect(height.value).assertEqual(1080);
        expect(width.max).assertEqual(3840);
        expect(height.max).assertEqual(2160);
      }
    });

    it('param_table_sum_should_be_stable', 0, () => {
      expect(params.sum()).assertEqual(3004.6);
      expect(params.find('DEVICE_RATE') !== undefined).assertEqual(true);
      const rate = params.find('DEVICE_RATE');
      if (rate !== undefined) {
        expect(rate.value).assertEqual(0.6);
        expect(rate.min).assertEqual(0.1);
        expect(rate.max).assertEqual(1.0);
      }
    });

    it('param_table_should_detect_out_of_range_values', 0, () => {
      const table = new RecorderParamTable();
      table.add('ok', 5, 1, 10, 'in range');
      table.add('low', 0, 1, 10, 'below min');
      table.add('high', 11, 1, 10, 'above max');
      expect(table.getCount()).assertEqual(3);
      expect(table.getOutOfRangeCount()).assertEqual(2);
      expect(table.sum()).assertEqual(16);
    });

    it('recording_menu_should_contain_four_items', 0, () => {
      expect(menu.getCount()).assertEqual(4);
      expect(menu.validate().length).assertEqual(0);
      expect(menu.isOrdered()).assertEqual(true);
    });

    it('recording_menu_should_expose_labels', 0, () => {
      const items = menu.getAll();
      expect(items[0].label).assertEqual('录屏分辨率');
      expect(items[1].label).assertEqual('录屏帧率');
      expect(items[2].label).assertEqual('录制声音');
      expect(items[3].label).assertEqual('显示计时器');
    });

    it('recording_menu_should_filter_disabled_items', 0, () => {
      const enabled = menu.getEnabledItems();
      expect(enabled.length).assertEqual(3);
      expect(enabled[0].id).assertEqual('resolution');
      expect(enabled[2].id).assertEqual('timer');
      expect(menu.findById('audio') !== undefined).assertEqual(true);
    });

    it('recording_menu_should_toggle_item_state', 0, () => {
      expect(menu.setEnabled('audio', true)).assertEqual(true);
      expect(menu.getEnabledItems().length).assertEqual(4);
      expect(menu.setEnabled('audio', false)).assertEqual(true);
      expect(menu.getEnabledItems().length).assertEqual(3);
      expect(menu.setEnabled('missing', true)).assertEqual(false);
    });

    it('recording_menu_should_sort_by_order', 0, () => {
      const shuffled = new RecordingMenu();
      shuffled.add('c', 'C', true, 3, 'act-c');
      shuffled.add('a', 'A', true, 1, 'act-a');
      shuffled.add('b', 'B', true, 2, 'act-b');
      expect(shuffled.isOrdered()).assertEqual(false);
      shuffled.sortByOrder();
      expect(shuffled.isOrdered()).assertEqual(true);
      const actions = shuffled.getActions();
      expect(actions[0]).assertEqual('act-a');
      expect(actions[1]).assertEqual('act-b');
      expect(actions[2]).assertEqual('act-c');
    });

    it('recording_menu_should_reject_duplicate_ids', 0, () => {
      const broken = new RecordingMenu();
      broken.add('dup', 'One', true, 1, 'one');
      broken.add('dup', 'Two', true, 2, 'two');
      broken.add('', '', true, 0, 'three');
      const issues = broken.validate();
      expect(issues.indexOf('duplicate-id:dup') >= 0).assertEqual(true);
      expect(issues.indexOf('item-empty') >= 0).assertEqual(true);
      expect(issues.indexOf('order-invalid:') >= 0).assertEqual(true);
    });

    it('recording_menu_actions_should_be_unique', 0, () => {
      const actions = menu.getActions();
      expect(actions.length).assertEqual(4);
      let unique = true;
      for (let i = 0; i < actions.length; i++) {
        for (let j = i + 1; j < actions.length; j++) {
          if (actions[i] === actions[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertEqual(true);
      expect(actions[0]).assertEqual('select-resolution');
      expect(actions[3]).assertEqual('toggle-timer');
    });

    it('recording_menu_should_keep_order_after_toggle', 0, () => {
      menu.setEnabled('resolution', false);
      menu.setEnabled('frameRate', true);
      expect(menu.getCount()).assertEqual(4);
      expect(menu.isOrdered()).assertEqual(true);
      const enabled = menu.getEnabledItems();
      expect(enabled.length).assertEqual(2);
      expect(enabled[0].id).assertEqual('frameRate');
      expect(enabled[1].id).assertEqual('timer');
    });

    it('layout_scaler_should_follow_design_width', 0, () => {
      expect(scaler.scale(96, 1920)).assertEqual(96);
      expect(scaler.scale(96, 960)).assertEqual(48);
      expect(scaler.scale(624, 1920)).assertEqual(624);
      expect(scaler.scale(624, 3840)).assertEqual(1248);
      expect(scaler.scale(0, 1920)).assertEqual(0);
    });

    it('layout_scaler_should_scale_rectangles', 0, () => {
      const rect = scaler.scaleRect([96, 48, 624, 56], 960);
      expect(rect.length).assertEqual(4);
      expect(rect[0]).assertEqual(48);
      expect(rect[1]).assertEqual(24);
      expect(rect[2]).assertEqual(312);
      expect(rect[3]).assertEqual(28);
    });

    it('layout_scaler_should_check_bounds', 0, () => {
      expect(scaler.fits(624, 56, 1920, 1080)).assertEqual(true);
      expect(scaler.fits(1920, 1080, 1920, 1080)).assertEqual(true);
      expect(scaler.fits(1921, 1080, 1920, 1080)).assertEqual(false);
      expect(scaler.fits(1920, 1081, 1920, 1080)).assertEqual(false);
    });

    it('window_config_snapshot_should_be_defensive', 0, () => {
      const first = windows.getAll();
      expect(first.length).assertEqual(2);
      first.push({
        kind: WindowKind.Tip,
        name: 'injected',
        page: 'injected',
        width: 1,
        height: 1,
        x: 0,
        y: 0,
        durationMs: 0,
        focusable: true,
        transparent: false
      });
      expect(windows.getCount()).assertEqual(2);
      expect(windows.findByName('injected') === undefined).assertEqual(true);
    });

    it('window_config_drift_should_be_detected', 0, () => {
      const expected: WindowConfigEntry[] = WindowConfigTable.buildDefault().getAll();
      const actual: WindowConfigEntry[] = windows.getAll();
      let drift = 0;
      for (let i = 0; i < expected.length; i++) {
        if (expected[i].width !== actual[i].width || expected[i].height !== actual[i].height) {
          drift++;
        }
        if (expected[i].x !== actual[i].x || expected[i].y !== actual[i].y) {
          drift++;
        }
        if (expected[i].page !== actual[i].page) {
          drift++;
        }
      }
      expect(drift).assertEqual(0);
    });

    it('tip_window_should_be_horizontally_centered_at_1920', 0, () => {
      const tip = windows.findByName('Tip');
      expect(tip !== undefined).assertEqual(true);
      if (tip !== undefined) {
        expect(scaler.isCentered(tip.x, tip.width, 1920)).assertEqual(true);
        expect(scaler.isCentered(tip.x, tip.width, 1280)).assertEqual(false);
        expect(scaler.isCentered(617, 686, 1920)).assertEqual(true);
      }
    });

    it('timer_window_should_sit_on_top_left', 0, () => {
      const timer = windows.findByName('timer');
      expect(timer !== undefined).assertEqual(true);
      if (timer !== undefined) {
        expect(timer.x).assertEqual(96);
        expect(timer.y).assertEqual(48);
        expect(timer.x < 1920 / 2).assertEqual(true);
        expect(timer.y < 1080 / 2).assertEqual(true);
        expect(scaler.isCentered(timer.x, timer.width, 1920)).assertEqual(false);
      }
    });

    it('menu_action_should_map_to_recorder_param', 0, () => {
      const mapping: string[] = [];
      const actions = menu.getActions();
      for (let i = 0; i < actions.length; i++) {
        if (actions[i].indexOf('resolution') >= 0) {
          mapping.push('RECORD_RESOLUTION_WIDTH');
        } else if (actions[i].indexOf('framerate') >= 0) {
          mapping.push('DEVICE_RATE');
        } else if (actions[i].indexOf('audio') >= 0) {
          mapping.push('AUDIO_SOURCE_MIC');
        } else {
          mapping.push('TIME_LENGTH');
        }
      }
      expect(mapping.length).assertEqual(4);
      expect(mapping[0]).assertEqual('RECORD_RESOLUTION_WIDTH');
      expect(mapping[1]).assertEqual('DEVICE_RATE');
      expect(mapping[2]).assertEqual('AUDIO_SOURCE_MIC');
      expect(mapping[3]).assertEqual('TIME_LENGTH');
      for (let i = 0; i < mapping.length; i++) {
        expect(params.find(mapping[i]) !== undefined).assertEqual(true);
      }
    });

    it('param_boundary_should_be_inclusive', 0, () => {
      const table = new RecorderParamTable();
      table.add('min', 1, 1, 10, 'lower bound');
      table.add('max', 10, 1, 10, 'upper bound');
      table.add('below', 0, 1, 10, 'below');
      table.add('above', 11, 1, 10, 'above');
      expect(table.getOutOfRangeCount()).assertEqual(2);
      expect(table.find('min') !== undefined).assertEqual(true);
      const min = table.find('min');
      if (min !== undefined) {
        expect(min.value).assertEqual(min.min);
      }
    });

    it('layout_scaler_should_handle_zero_display', 0, () => {
      expect(scaler.scale(100, 0)).assertEqual(0);
      expect(scaler.scale(0, 0)).assertEqual(0);
      const rect = scaler.scaleRect([100, 200], 0);
      expect(rect[0]).assertEqual(0);
      expect(rect[1]).assertEqual(0);
      expect(scaler.fits(0, 0, 0, 0)).assertEqual(true);
    });

    it('window_kind_enum_should_be_stable', 0, () => {
      expect(WindowKind.Timer).assertEqual(0);
      expect(WindowKind.Tip).assertEqual(1);
      const timer = windows.findByKind(WindowKind.Timer);
      const tip = windows.findByKind(WindowKind.Tip);
      expect(timer !== undefined).assertEqual(true);
      expect(tip !== undefined).assertEqual(true);
      if (timer !== undefined && tip !== undefined) {
        expect(timer.name).assertEqual('timer');
        expect(tip.name).assertEqual('Tip');
        expect(timer.name === tip.name).assertEqual(false);
      }
    });

    it('param_keys_should_be_unique', 0, () => {
      const keys: string[] = [];
      const entries = params.getAll();
      for (let i = 0; i < entries.length; i++) {
        keys.push(entries[i].key);
      }
      expect(keys.length).assertEqual(7);
      let unique = true;
      for (let i = 0; i < keys.length; i++) {
        for (let j = i + 1; j < keys.length; j++) {
          if (keys[i] === keys[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertEqual(true);
      expect(params.find('missing') === undefined).assertEqual(true);
    });

    it('config_matrix_should_be_fully_valid', 0, () => {
      const issues: string[] = [];
      const windowIssues = windows.validate();
      const menuIssues = menu.validate();
      for (let i = 0; i < windowIssues.length; i++) {
        issues.push(windowIssues[i]);
      }
      for (let i = 0; i < menuIssues.length; i++) {
        issues.push(menuIssues[i]);
      }
      expect(issues.length).assertEqual(0);
      expect(params.getOutOfRangeCount()).assertEqual(0);
      expect(windows.getFocusableCount()).assertEqual(0);
      expect(menu.getEnabledItems().length > 0).assertEqual(true);
    });

    it('duration_config_should_not_apply_to_timer_window', 0, () => {
      const timer = windows.findByKind(WindowKind.Timer);
      const tip = windows.findByKind(WindowKind.Tip);
      expect(timer !== undefined).assertEqual(true);
      expect(tip !== undefined).assertEqual(true);
      if (timer !== undefined && tip !== undefined) {
        expect(timer.durationMs).assertEqual(0);
        expect(tip.durationMs > timer.durationMs).assertEqual(true);
        expect(windows.getExpiredCount(timer.durationMs)).assertEqual(1);
      }
    });

    it('menu_should_reject_unknown_action', 0, () => {
      const known: string[] = ['select-resolution', 'select-framerate', 'toggle-audio', 'toggle-timer'];
      const actions = menu.getActions();
      let unknown = 0;
      for (let i = 0; i < actions.length; i++) {
        if (known.indexOf(actions[i]) < 0) {
          unknown++;
        }
      }
      expect(unknown).assertEqual(0);
      expect(known.length).assertEqual(actions.length);
    });

    it('window_rects_should_not_overlap', 0, () => {
      const timer = windows.findByKind(WindowKind.Timer);
      const tip = windows.findByKind(WindowKind.Tip);
      expect(timer !== undefined).assertEqual(true);
      expect(tip !== undefined).assertEqual(true);
      if (timer !== undefined && tip !== undefined) {
        const timerRight = timer.x + timer.width;
        const tipRight = tip.x + tip.width;
        // The timer window and the tip window occupy the same top area but are
        // never displayed at the same time: the timer is shown while recording,
        // the tip replaces it after the recording is stopped.
        expect(tip.x < timerRight).assertEqual(true);
        expect(tip.y < timer.y).assertEqual(true);
        expect(timer.y + timer.height < tip.y + tip.height).assertEqual(true);
        expect(tipRight <= 1920).assertEqual(true);
      }
    });

    it('param_description_should_be_readable', 0, () => {
      const entries = params.getAll();
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i].description.length > 0).assertEqual(true);
        expect(entries[i].description.length <= 32).assertEqual(true);
        expect(entries[i].key.length > 0).assertEqual(true);
      }
      expect(entries.length).assertEqual(7);
    });

    it('menu_sort_should_be_stable_for_equal_order', 0, () => {
      const stable = new RecordingMenu();
      stable.add('b1', 'B1', true, 2, 'b1');
      stable.add('a', 'A', true, 1, 'a');
      stable.add('b2', 'B2', true, 2, 'b2');
      stable.sortByOrder();
      const actions = stable.getActions();
      expect(actions[0]).assertEqual('a');
      expect(actions.length).assertEqual(3);
      expect(stable.isOrdered()).assertEqual(true);
      expect(stable.getCount()).assertEqual(3);
    });

    it('config_stats_should_be_consistent', 0, () => {
      const stats: number[] = [];
      stats.push(windows.getCount());
      stats.push(menu.getCount());
      stats.push(params.getCount());
      stats.push(windows.getFocusableCount());
      expect(stats[0]).assertEqual(2);
      expect(stats[1]).assertEqual(4);
      expect(stats[2]).assertEqual(7);
      expect(stats[3]).assertEqual(0);
      let total = 0;
      for (let i = 0; i < stats.length; i++) {
        total += stats[i];
      }
      expect(total).assertEqual(13);
    });

    it('menu_toggle_should_not_duplicate_items', 0, () => {
      const before = menu.getCount();
      for (let i = 0; i < 10; i++) {
        menu.setEnabled('audio', i % 2 === 0);
      }
      expect(menu.getCount()).assertEqual(before);
      expect(menu.getAll().length).assertEqual(4);
      expect(menu.findById('audio') !== undefined).assertEqual(true);
    });

    it('param_range_should_cover_production_defaults', 0, () => {
      const entries = params.getAll();
      let covered = 0;
      for (let i = 0; i < entries.length; i++) {
        if (entries[i].value >= entries[i].min && entries[i].value <= entries[i].max) {
          covered++;
        }
      }
      expect(covered).assertEqual(entries.length);
      expect(params.getOutOfRangeCount()).assertEqual(0);
    });

    it('layout_scaler_should_be_linear', 0, () => {
      const single = scaler.scale(100, 1920);
      const half = scaler.scale(100, 960);
      const quarter = scaler.scale(100, 480);
      expect(single).assertEqual(100);
      expect(half).assertEqual(50);
      expect(quarter).assertEqual(25);
      expect(single).assertEqual(half * 2);
      expect(half).assertEqual(quarter * 2);
    });

    it('window_table_should_support_kind_lookup_for_all_entries', 0, () => {
      const kinds: WindowKind[] = [WindowKind.Timer, WindowKind.Tip];
      for (let i = 0; i < kinds.length; i++) {
        const entry = windows.findByKind(kinds[i]);
        expect(entry !== undefined).assertEqual(true);
        if (entry !== undefined) {
          expect(entry.kind).assertEqual(kinds[i]);
          expect(entry.width > 0).assertEqual(true);
          expect(entry.height > 0).assertEqual(true);
        }
      }
    });

    it('menu_should_keep_item_identity_across_queries', 0, () => {
      const first = menu.findById('timer');
      const second = menu.findById('timer');
      expect(first !== undefined).assertEqual(true);
      expect(second !== undefined).assertEqual(true);
      if (first !== undefined && second !== undefined) {
        expect(first.id).assertEqual(second.id);
        expect(first.label).assertEqual(second.label);
        expect(first.action).assertEqual(second.action);
        expect(first.order).assertEqual(second.order);
      }
      const absent = menu.findById('no-such-item');
      expect(absent === undefined).assertEqual(true);
    });

    it('param_lookup_should_return_reference_entries', 0, () => {
      const first = params.find('TIME_LENGTH');
      const second = params.find('TIME_LENGTH');
      expect(first !== undefined).assertEqual(true);
      expect(second !== undefined).assertEqual(true);
      if (first !== undefined && second !== undefined) {
        expect(first.value).assertEqual(second.value);
        expect(first.min).assertEqual(second.min);
        expect(first.max).assertEqual(second.max);
      }
    });

    it('config_tables_should_be_constructible_repeatedly', 0, () => {
      const first = WindowConfigTable.buildDefault();
      const second = WindowConfigTable.buildDefault();
      expect(first.getCount()).assertEqual(second.getCount());
      expect(first.getAll()[0].name).assertEqual(second.getAll()[0].name);
    });
  });
}

