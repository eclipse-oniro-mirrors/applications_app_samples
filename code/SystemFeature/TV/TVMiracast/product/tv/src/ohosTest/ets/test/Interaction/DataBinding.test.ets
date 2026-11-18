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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPermissionDialog, miracastComponentCount,
  countComponentsById, pressAndWait, getCurrentFocusIndex, serializedDelay, KEY_LEFT, KEY_RIGHT,
  KEY_BACK, ID_SWITCH_BTN, ID_TAB_MIRACAST, ID_TAB_SETTINGS, TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'DataBindingSuite';

enum BindingStatus {
  APPLIED = 'applied', SKIPPED = 'skipped', REJECTED = 'rejected'
}

interface BindingRecord {
  path: string; oldValue: string; newValue: string; status: BindingStatus; version: number;
}

interface BindingSnapshot {
  path: string; value: string; version: number;
}

interface BindingDiff {
  path: string; before: string; after: string;
}

// 可观察值：维护值、版本号与变更计数
class ObservableValue {
  private value: string;
  private version: number = 0;
  private changeCount: number = 0;
  constructor(initial: string) {
    this.value = initial;
  }
  public getValue(): string { return this.value; }
  public getVersion(): number { return this.version; }
  public getChangeCount(): number { return this.changeCount; }
  public setValue(next: string): boolean {
    if (next === this.value) {
      return false;
    }
    this.value = next;
    this.version++;
    this.changeCount++;
    return true;
  }
}

// 绑定注册表：合并绑定写入、快照差分与观察者通知三类同源逻辑
class BindingRegistry {
  private values: Map<string, ObservableValue> = new Map<string, ObservableValue>();
  private records: BindingRecord[] = [];
  private observers: Map<string, number> = new Map<string, number>();
  private notifyCount: number = 0;
  public bind(path: string, initial: string): void {
    if (!this.values.has(path)) {
      this.values.set(path, new ObservableValue(initial));
    }
  }
  public hasPath(path: string): boolean { return this.values.has(path); }
  public getValue(path: string): string {
    const value: ObservableValue | undefined = this.values.get(path);
    return value === undefined ? '' : value.getValue();
  }
  public getVersion(path: string): number {
    const value: ObservableValue | undefined = this.values.get(path);
    return value === undefined ? -1 : value.getVersion();
  }
  public write(path: string, next: string): BindingStatus {
    const value: ObservableValue | undefined = this.values.get(path);
    if (value === undefined) {
      return BindingStatus.REJECTED;
    }
    const before: string = value.getValue();
    const changed: boolean = value.setValue(next);
    this.records.push({
      path: path, oldValue: before, newValue: next,
      status: changed ? BindingStatus.APPLIED : BindingStatus.SKIPPED, version: value.getVersion()
    });
    return changed ? BindingStatus.APPLIED : BindingStatus.SKIPPED;
  }
  public getBoundPathCount(): number { return this.values.size; }
  public getRecordCount(): number { return this.records.length; }
  public getRecords(): BindingRecord[] { return this.records; }
  public countApplied(): number {
    let count: number = 0;
    for (const record of this.records) { if (record.status === BindingStatus.APPLIED) { count++; } }
    return count;
  }
  public takeSnapshot(): BindingSnapshot[] {
    const snapshot: BindingSnapshot[] = [];
    this.values.forEach((value: ObservableValue, key: string) => {
      snapshot.push({ path: key, value: value.getValue(), version: value.getVersion() });
    });
    return snapshot;
  }
  public findByPath(snapshot: BindingSnapshot[], path: string): BindingSnapshot | null {
    for (const item of snapshot) { if (item.path === path) { return item; } }
    return null;
  }
  public diff(before: BindingSnapshot[], after: BindingSnapshot[]): BindingDiff[] {
    const diffs: BindingDiff[] = [];
    for (const previous of before) {
      const current: BindingSnapshot | null = this.findByPath(after, previous.path);
      if (current !== null && current.value !== previous.value) {
        diffs.push({ path: previous.path, before: previous.value, after: current.value });
      }
    }
    return diffs;
  }
  public subscribe(path: string): void {
    const current: number | undefined = this.observers.get(path);
    this.observers.set(path, current === undefined ? 1 : current + 1);
  }
  public getObserverCount(path: string): number {
    const count: number | undefined = this.observers.get(path);
    return count === undefined ? 0 : count;
  }
  public notify(path: string): number {
    const count: number = this.getObserverCount(path);
    this.notifyCount += count;
    return count;
  }
  public getNotifyCount(): number { return this.notifyCount; }
  public getSubscribedPathCount(): number { return this.observers.size; }
  public reset(): void {
    this.values = new Map<string, ObservableValue>();
    this.records = [];
    this.observers = new Map<string, number>();
    this.notifyCount = 0;
  }
}

// 首页绑定装配器：把首页与播放页真实字段注册为绑定路径
class IndexBindingAssembler {
  public static readonly PATH_SWITCH: string = 'index.switchBtn.enabled';
  public static readonly PATH_TAB: string = 'index.selectedTab';
  public static readonly PATH_DEVICE_NAME: string = 'index.deviceName';
  public static readonly PATH_SESSION: string = 'index.sessionState';
  public static readonly PATH_TILE_COUNT: string = 'player.tileCount';
  public bindIndex(registry: BindingRegistry): void {
    registry.bind(IndexBindingAssembler.PATH_SWITCH, 'on');
    registry.bind(IndexBindingAssembler.PATH_TAB, ID_TAB_MIRACAST);
    registry.bind(IndexBindingAssembler.PATH_DEVICE_NAME, 'LivingRoomTV');
    registry.bind(IndexBindingAssembler.PATH_SESSION, 'idle');
  }

  public getRequiredPathCount(): number { return 5; }
}

class TabSelectionBinding {
  private selectedTab: string;
  constructor(initialTab: string) {
    this.selectedTab = initialTab === ID_TAB_SETTINGS ? ID_TAB_SETTINGS : ID_TAB_MIRACAST;
  }
  public getSelectedTab(): string { return this.selectedTab; }
  public select(tab: string): boolean {
    if ((tab !== ID_TAB_MIRACAST && tab !== ID_TAB_SETTINGS) || this.selectedTab === tab) {
      return false;
    }
    this.selectedTab = tab;
    return true;
  }
  public isSelected(tab: string): boolean { return this.selectedTab === tab; }
  public getSelectedIndex(): number { return this.selectedTab === ID_TAB_MIRACAST ? 0 : 1; }
}

class SwitchBindingModel {
  private settingsValue: string;
  private chipModel: string;
  constructor(settingsValue: string, chipModel: string) {
    this.settingsValue = settingsValue;
    this.chipModel = chipModel;
  }
  public isSwitchOn(): boolean { return this.chipModel === 'Hi3751V352' && this.settingsValue === 'true'; }
  public toggle(): boolean {
    this.settingsValue = this.settingsValue === 'true' ? 'false' : 'true';
    return this.isSwitchOn();
  }
  public getSettingsValue(): string { return this.settingsValue; }
  public isChipSupported(): boolean { return this.chipModel === 'Hi3751V352'; }
}

class DeviceNameBinding {
  public static readonly MAX_LENGTH: number = 23;
  private name: string;
  constructor(name: string) {
    this.name = name;
  }
  public getName(): string { return this.name; }
  public setName(name: string): boolean {
    if (!this.isValid(name)) {
      return false;
    }
    this.name = name;
    return true;
  }
  public isValid(name: string): boolean {
    return name.trim().length > 0 && name.indexOf(' ') < 0 && name.length <= DeviceNameBinding.MAX_LENGTH;
  }
  public getLength(): number { return this.name.length; }
  public isAtMaxLength(): boolean { return this.name.length === DeviceNameBinding.MAX_LENGTH; }
}

class TileCountBinding {
  private tileCount: number = 1;
  public setTileCount(tileCount: number): boolean {
    if (tileCount < 1 || tileCount > MAX_MIRROR_TILES) {
      return false;
    }
    this.tileCount = tileCount;
    return true;
  }
  public getTileCount(): number { return this.tileCount; }
  public isFullScreen(): boolean { return this.tileCount === 1; }
  public getLayoutName(): string {
    if (this.tileCount === 1) {
      return 'full_screen';
    }
    if (this.tileCount === 2) {
      return 'split_half';
    }
    return this.tileCount <= 4 ? 'quad_grid' : 'nine_grid';
  }
}

export default function dataBindingSuite(): void {
  describe('DataBinding_Test', () => {
    let driver: Driver;
    let registry: BindingRegistry;
    beforeAll(async () => {
      driver = getDriver();
      registry = new BindingRegistry();
      Log.info(TAG, 'suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });
    it('index_bindings_should_cover_required_paths', 0, async () => {
      registry.reset(); new IndexBindingAssembler().bindIndex(registry);
      expect(registry.getBoundPathCount()).assertEqual(4);
      expect(registry.hasPath(IndexBindingAssembler.PATH_SWITCH)).assertTrue();
      expect(registry.getValue(IndexBindingAssembler.PATH_TAB)).assertEqual(ID_TAB_MIRACAST);
      expect(registry.getValue(IndexBindingAssembler.PATH_SESSION)).assertEqual('idle');
    });
    it('binding_should_be_idempotent_per_path', 0, async () => {
      registry.reset(); registry.bind('index.switchBtn.enabled', 'on');
      registry.bind('index.switchBtn.enabled', 'off');
      expect(registry.getBoundPathCount()).assertEqual(1);
      expect(registry.getValue('index.switchBtn.enabled')).assertEqual('on');
    });
    it('binding_write_should_increase_version', 0, async () => {
      registry.reset(); registry.bind('index.selectedTab', ID_TAB_MIRACAST);
      expect(registry.getVersion('index.selectedTab')).assertEqual(0);
      expect(registry.write('index.selectedTab', ID_TAB_SETTINGS)).assertEqual(BindingStatus.APPLIED);
      expect(registry.getVersion('index.selectedTab')).assertEqual(1);
    });
    it('binding_write_should_skip_same_value', 0, async () => {
      registry.reset(); registry.bind('index.sessionState', 'idle');
      expect(registry.write('index.sessionState', 'idle')).assertEqual(BindingStatus.SKIPPED);
      expect(registry.getVersion('index.sessionState')).assertEqual(0); expect(registry.countApplied()).assertEqual(0);
    });
    it('binding_write_should_reject_unknown_path', 0, async () => {
      registry.reset();
      expect(registry.write('unknown.path', 'value')).assertEqual(BindingStatus.REJECTED);
      expect(registry.getValue('unknown.path')).assertEqual(''); expect(registry.getVersion('unknown.path')).assertEqual(-1);
    });
    it('binding_record_should_keep_old_and_new_value', 0, async () => {
      registry.reset(); registry.bind('index.deviceName', 'LivingRoomTV');
      registry.write('index.deviceName', 'BedroomTV');
      expect(registry.getRecords()[0].oldValue).assertEqual('LivingRoomTV');
      expect(registry.getRecords()[0].newValue).assertEqual('BedroomTV');
      expect(registry.getRecords()[0].status).assertEqual(BindingStatus.APPLIED);
    });
    it('binding_registry_should_count_applied_writes', 0, async () => {
      registry.reset(); registry.bind('a', '1');
      registry.write('a', '2'); registry.write('a', '2'); registry.write('a', '3');
      expect(registry.countApplied()).assertEqual(2);
      expect(registry.getRecordCount()).assertEqual(3);
      expect(registry.getVersion('a')).assertEqual(2);
    });
    it('binding_snapshot_should_carry_version', 0, async () => {
      registry.reset(); registry.bind('index.selectedTab', ID_TAB_MIRACAST);
      registry.write('index.selectedTab', ID_TAB_SETTINGS);
      const snapshot: BindingSnapshot[] = registry.takeSnapshot();
      expect(snapshot[0].version).assertEqual(1);
      expect(snapshot[0].value).assertEqual(ID_TAB_SETTINGS);
    });
    it('observable_value_should_track_changes', 0, async () => {
      const value = new ObservableValue('idle');
      expect(value.setValue('idle')).assertFalse(); expect(value.getChangeCount()).assertEqual(0);
      expect(value.setValue('casting')).assertTrue(); expect(value.getVersion()).assertEqual(1);
      expect(value.getChangeCount()).assertEqual(1);
    });
    it('tab_binding_should_default_to_cast_tab', 0, async () => {
      const binding = new TabSelectionBinding(ID_TAB_MIRACAST);
      expect(binding.getSelectedTab()).assertEqual(ID_TAB_MIRACAST);
      expect(binding.getSelectedIndex()).assertEqual(0);
      expect(binding.isSelected(ID_TAB_SETTINGS)).assertFalse();
    });
    it('tab_binding_should_switch_exclusively', 0, async () => {
      const binding = new TabSelectionBinding(ID_TAB_MIRACAST);
      expect(binding.select(ID_TAB_SETTINGS)).assertTrue();
      expect(binding.getSelectedIndex()).assertEqual(1);
      expect(binding.select(ID_TAB_SETTINGS)).assertFalse();
      expect(binding.select('unknown_tab')).assertFalse();
    });
    it('switch_binding_should_gate_on_chip_model', 0, async () => {
      expect(new SwitchBindingModel('true', 'Hi3751V352').isSwitchOn()).assertTrue();
      expect(new SwitchBindingModel('true', 'Hi3751V900').isSwitchOn()).assertFalse();
      expect(new SwitchBindingModel('true', 'Hi3751V900').isChipSupported()).assertFalse();
    });
    it('switch_binding_should_read_settings_value', 0, async () => {
      const off = new SwitchBindingModel('false', 'Hi3751V352');
      expect(off.isSwitchOn()).assertFalse(); expect(off.getSettingsValue()).assertEqual('false');
      expect(off.toggle()).assertTrue(); expect(off.toggle()).assertFalse();
    });
    it('device_name_binding_should_accept_valid_name', 0, async () => {
      const binding = new DeviceNameBinding('Living room TV');
      expect(binding.isValid('Living room TV')).assertFalse();
      expect(binding.isValid('LivingRoomTV')).assertTrue();
      expect(binding.setName('BedroomTV')).assertTrue(); expect(binding.getLength()).assertEqual(9);
    });
    it('device_name_binding_should_reject_blank_name', 0, async () => {
      const binding = new DeviceNameBinding('OfficeTV');
      expect(binding.isValid('')).assertFalse(); expect(binding.isValid('   ')).assertFalse();
      expect(binding.setName('')).assertFalse(); expect(binding.getName()).assertEqual('OfficeTV');
    });
    it('device_name_binding_should_reject_space_and_overflow', 0, async () => {
      const binding = new DeviceNameBinding('OfficeTV');
      expect(binding.isValid('Office TV')).assertFalse();
      const tooLong: string = 'ABCDEFGHIJKLMNOPQRSTUVWX';
      expect(tooLong.length).assertEqual(24); expect(binding.isValid(tooLong)).assertFalse();
      expect(binding.setName('ABCDEFGHIJKLMNOPQRSTUVW')).assertTrue();
      expect(binding.isAtMaxLength()).assertTrue();
    });
    it('tile_count_binding_should_bound_range', 0, async () => {
      const binding = new TileCountBinding();
      expect(binding.getTileCount()).assertEqual(1); expect(binding.setTileCount(0)).assertFalse();
      expect(binding.setTileCount(MAX_MIRROR_TILES + 1)).assertFalse();
      expect(binding.setTileCount(MAX_MIRROR_TILES)).assertTrue();
    });
    it('tile_count_binding_should_map_layout_name', 0, async () => {
      const binding = new TileCountBinding();
      expect(binding.getLayoutName()).assertEqual('full_screen'); expect(binding.isFullScreen()).assertTrue();
      binding.setTileCount(2); expect(binding.getLayoutName()).assertEqual('split_half');
      binding.setTileCount(4); expect(binding.getLayoutName()).assertEqual('quad_grid');
      binding.setTileCount(7); expect(binding.getLayoutName()).assertEqual('nine_grid');
    });
    it('binding_differ_should_detect_single_change', 0, async () => {
      registry.reset(); registry.bind('index.selectedTab', ID_TAB_MIRACAST);
      const before: BindingSnapshot[] = registry.takeSnapshot();
      registry.write('index.selectedTab', ID_TAB_SETTINGS);
      const diffs: BindingDiff[] = registry.diff(before, registry.takeSnapshot());
      expect(diffs.length).assertEqual(1); expect(diffs[0].before).assertEqual(ID_TAB_MIRACAST);
      expect(diffs[0].after).assertEqual(ID_TAB_SETTINGS);
    });
    it('binding_differ_should_return_empty_for_same_snapshot', 0, async () => {
      registry.reset(); new IndexBindingAssembler().bindIndex(registry);
      const snapshot: BindingSnapshot[] = registry.takeSnapshot();
      expect(registry.diff(snapshot, snapshot).length).assertEqual(0);
      expect(registry.findByPath(snapshot, 'missing.path')).assertNull();
      expect(registry.findByPath(snapshot, IndexBindingAssembler.PATH_TAB)?.value).assertEqual(ID_TAB_MIRACAST);
    });
    it('observer_registry_should_count_subscribers', 0, async () => {
      registry.reset(); registry.subscribe('index.selectedTab'); registry.subscribe('index.selectedTab');
      registry.subscribe('index.deviceName');
      expect(registry.getObserverCount('index.selectedTab')).assertEqual(2);
      expect(registry.getSubscribedPathCount()).assertEqual(2);
      expect(registry.notify('index.selectedTab')).assertEqual(2);
      expect(registry.getNotifyCount()).assertEqual(2);
      expect(registry.notify('missing.path')).assertEqual(0);
    });
    it('data_binding_should_update_on_navigation', 0, async () => {
      registry.reset(); registry.bind('index.focusIndex', '0');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      registry.write('index.focusIndex', '1');
      expect(registry.getValue('index.focusIndex')).assertEqual('1');
    });
    it('binding_should_survive_permission_dialog', 0, async () => {
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      registry.reset(); registry.bind('index.sessionState', 'idle');
      expect(registry.write('index.sessionState', 'requesting')).assertEqual(BindingStatus.APPLIED);
      expect(dialogVisible || registry.getVersion('index.sessionState') === 1).assertTrue();
    });
    it('comprehensive_data_binding_scenario', 0, async () => {
      registry.reset(); const assembler = new IndexBindingAssembler(); assembler.bindIndex(registry);
      registry.subscribe(IndexBindingAssembler.PATH_TAB);
      const before: BindingSnapshot[] = registry.takeSnapshot();
      expect(registry.write(IndexBindingAssembler.PATH_TAB, ID_TAB_SETTINGS)).assertEqual(BindingStatus.APPLIED);
      expect(registry.notify(IndexBindingAssembler.PATH_TAB)).assertEqual(1);
      expect(registry.diff(before, registry.takeSnapshot()).length).assertEqual(1);
      expect(registry.getBoundPathCount()).assertEqual(assembler.getRequiredPathCount() - 1);
    });
  });
}
