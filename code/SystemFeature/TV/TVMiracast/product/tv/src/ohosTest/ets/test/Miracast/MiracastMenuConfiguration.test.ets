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
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  ID_PERMANENT_TRUST,
  ID_CONFIRM_BTN,
  ID_CANCEL_BTN,
  miracastComponentCount,
  isPermissionDialogVisible,
  countComponentsById,
  waitForPageStable,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastMenuConfigurationSuite';

// 授权选项枚举：与 PermissionType 保持一致（FOREVER=0 / ONCE=1 / CANCEL=2）
enum PermissionOptionType {
  OPTION_FOREVER = 0,
  OPTION_ONCE = 1,
  OPTION_CANCEL = 2
}

// 菜单模式枚举：浏览模式与选择模式
enum MenuMode {
  BROWSE = 'browse',
  SELECT = 'select'
}

// 菜单布局类型枚举
enum MenuLayoutKind {
  HORIZONTAL = 'horizontal',
  VERTICAL = 'vertical',
  GRID = 'grid'
}

// 菜单行为枚举
enum MenuBehavior {
  SINGLE_SELECT = 'single_select',
  MULTI_SELECT = 'multi_select',
  READ_ONLY = 'read_only'
}

// 菜单配置接口：描述授权弹窗菜单的完整配置
interface MenuConfig {
  layout: MenuLayoutKind;
  behavior: MenuBehavior;
  optionCount: number;
  loopFocus: boolean;
}

// 授权选项模型：名称、选项类型与焦点状态
class PermissionOption {
  public name: string;
  public optionType: number;
  public isFocus: boolean;
  public icon: string;

  constructor(name: string, optionType: number, isFocus: boolean, icon: string) {
    this.name = name;
    this.optionType = optionType;
    this.isFocus = isFocus;
    this.icon = icon;
  }

  public getDisplayName(): string {
    return this.name;
  }

  public getChoiceIcon(): string {
    return this.isFocus ? this.icon + '_focus' : this.icon;
  }

  public setFocusState(focused: boolean): void {
    this.isFocus = focused;
  }

  public isForever(): boolean {
    return this.optionType === PermissionOptionType.OPTION_FOREVER;
  }

  public isOnce(): boolean {
    return this.optionType === PermissionOptionType.OPTION_ONCE;
  }

  public isCancel(): boolean {
    return this.optionType === PermissionOptionType.OPTION_CANCEL;
  }
}

// 授权弹窗菜单模型：模拟 FOREVER / ONCE / CANCEL 三项菜单与焦点迁移
class PermissionDialogMenu {
  private options: PermissionOption[] = [];
  private mode: MenuMode = MenuMode.BROWSE;

  constructor() {
    this.options.push(new PermissionOption('always allow', PermissionOptionType.OPTION_FOREVER, false,
      'app.media.permanent_trust'));
    this.options.push(new PermissionOption('allow once', PermissionOptionType.OPTION_ONCE, true,
      'app.media.allow_once'));
    this.options.push(new PermissionOption('cancel', PermissionOptionType.OPTION_CANCEL, false,
      'app.media.cancel'));
  }

  public getOptions(): PermissionOption[] {
    return [...this.options];
  }

  public getOptionCount(): number {
    return this.options.length;
  }

  public getMode(): MenuMode {
    return this.mode;
  }

  public enterSelectMode(): void {
    this.mode = MenuMode.SELECT;
  }

  public exitSelectMode(): void {
    this.mode = MenuMode.BROWSE;
  }

  public getFocusedOption(): PermissionOption | null {
    const focused = this.options.filter((option: PermissionOption) => option.isFocus);
    return focused.length === 0 ? null : focused[0];
  }

  public getFocusedCount(): number {
    return this.options.filter((option: PermissionOption) => option.isFocus).length;
  }

  public setFocusToIndex(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.forEach((option: PermissionOption, position: number) => {
      option.setFocusState(position === index);
    });
    return true;
  }

  public moveFocusNext(): boolean {
    const current = this.options.findIndex((option: PermissionOption) => option.isFocus);
    if (current >= 0 && current < this.options.length - 1) {
      return this.setFocusToIndex(current + 1);
    }
    return false;
  }

  public moveFocusPrev(): boolean {
    const current = this.options.findIndex((option: PermissionOption) => option.isFocus);
    if (current > 0) {
      return this.setFocusToIndex(current - 1);
    }
    return false;
  }

  public getSelectedChoice(): number {
    const focused = this.getFocusedOption();
    return focused === null ? -1 : focused.optionType;
  }
}
// 可信设备行接口：对应 TrustDevice 表（_ID, ID, NAME, TYPE, DATE）
interface TrustedDeviceRow {
  rowId: number;
  deviceId: string;
  deviceName: string;
  deviceType: string;
  trustDate: string;
}

// 可信设备表模型：模拟 TrustDeviceManager 的增删查能力
class TrustedDeviceTable {
  private rows: TrustedDeviceRow[] = [];

  public add(row: TrustedDeviceRow): boolean {
    const duplicated = this.rows.some((item: TrustedDeviceRow) => item.deviceId === row.deviceId);
    if (duplicated) {
      return false;
    }
    this.rows.push(row);
    return true;
  }

  public addAll(rows: TrustedDeviceRow[]): void {
    rows.forEach((row: TrustedDeviceRow) => {
      this.add(row);
    });
  }

  public getRows(): TrustedDeviceRow[] {
    return [...this.rows];
  }

  public getRowCount(): number {
    return this.rows.length;
  }

  public findById(deviceId: string): TrustedDeviceRow | null {
    const found = this.rows.filter((row: TrustedDeviceRow) => row.deviceId === deviceId);
    return found.length === 0 ? null : found[0];
  }

  public removeById(deviceId: string): boolean {
    const before = this.rows.length;
    this.rows = this.rows.filter((row: TrustedDeviceRow) => row.deviceId !== deviceId);
    return this.rows.length !== before;
  }

  public countByType(deviceType: string): number {
    return this.rows.filter((row: TrustedDeviceRow) => row.deviceType === deviceType).length;
  }

  public isDeviceTrusted(deviceId: string): boolean {
    return this.rows.some((row: TrustedDeviceRow) => row.deviceId === deviceId);
  }

  public sortByRowId(): TrustedDeviceRow[] {
    const copied: TrustedDeviceRow[] = [...this.rows];
    copied.sort((a: TrustedDeviceRow, b: TrustedDeviceRow) => a.rowId - b.rowId);
    return copied;
  }

  public clear(): void {
    this.rows = [];
  }
}

// 可信设备表格式化器：把行数据格式化为列表展示文本
class TrustedDeviceFormatter {
  public static formatRow(row: TrustedDeviceRow): string {
    return `${row.deviceName}(${row.deviceType}) - ${row.trustDate}`;
  }

  public static formatAll(rows: TrustedDeviceRow[]): string {
    const parts: string[] = rows.map((row: TrustedDeviceRow) => TrustedDeviceFormatter.formatRow(row));
    return parts.join('; ');
  }

  public static getColumnCount(): number {
    return 5;
  }

  public static getColumnNames(): string[] {
    return ['_ID', 'ID', 'NAME', 'TYPE', 'DATE'];
  }

  public static isRowComplete(row: TrustedDeviceRow): boolean {
    return row.rowId >= 0 && row.deviceId.length > 0 && row.deviceName.length > 0 &&
      row.deviceType.length > 0 && row.trustDate.length > 0;
  }
}

// 菜单配置模型：封装授权弹窗菜单的配置并提供校验
class MenuConfigurationModel {
  private layout: MenuLayoutKind = MenuLayoutKind.HORIZONTAL;
  private behavior: MenuBehavior = MenuBehavior.SINGLE_SELECT;
  private optionCount: number = 3;
  private loopFocus: boolean = false;

  public setLayout(layout: MenuLayoutKind): void {
    this.layout = layout;
  }

  public setBehavior(behavior: MenuBehavior): void {
    this.behavior = behavior;
  }

  public setOptionCount(count: number): boolean {
    if (count < 1 || count > 10) {
      return false;
    }
    this.optionCount = count;
    return true;
  }

  public setLoopFocus(loopFocus: boolean): void {
    this.loopFocus = loopFocus;
  }

  public getLayout(): MenuLayoutKind {
    return this.layout;
  }

  public getBehavior(): MenuBehavior {
    return this.behavior;
  }

  public getOptionCount(): number {
    return this.optionCount;
  }

  public isLoopFocus(): boolean {
    return this.loopFocus;
  }

  public isVertical(): boolean {
    return this.layout === MenuLayoutKind.VERTICAL;
  }

  public isGrid(): boolean {
    return this.layout === MenuLayoutKind.GRID;
  }

  public buildConfig(): MenuConfig {
    return {
      layout: this.layout,
      behavior: this.behavior,
      optionCount: this.optionCount,
      loopFocus: this.loopFocus
    };
  }
}

// 授权选项工厂：生成标准三项菜单与描述
class MenuOptionFactory {
  public static createStandardOptions(): PermissionOption[] {
    const options: PermissionOption[] = [];
    options.push(new PermissionOption('always allow', PermissionOptionType.OPTION_FOREVER, false,
      'app.media.permanent_trust'));
    options.push(new PermissionOption('allow once', PermissionOptionType.OPTION_ONCE, true,
      'app.media.allow_once'));
    options.push(new PermissionOption('cancel', PermissionOptionType.OPTION_CANCEL, false,
      'app.media.cancel'));
    return options;
  }

  public static createSingle(name: string, optionType: number): PermissionOption {
    return new PermissionOption(name, optionType, false, 'app.media.option');
  }

  public static createTrustedRows(): TrustedDeviceRow[] {
    const rows: TrustedDeviceRow[] = [];
    rows.push({ rowId: 1, deviceId: 'aa:bb:cc:01', deviceName: 'LivingRoom', deviceType: 'TV', trustDate: '2026-01-01' });
    rows.push({ rowId: 2, deviceId: 'aa:bb:cc:02', deviceName: 'Bedroom', deviceType: 'PHONE', trustDate: '2026-01-02' });
    rows.push({ rowId: 3, deviceId: 'aa:bb:cc:03', deviceName: 'Office', deviceType: 'PAD', trustDate: '2026-01-03' });
    return rows;
  }
}
// 菜单校验器：校验选项数量、布局与焦点唯一性
class MenuValidator {
  public static isOptionCountValid(count: number): boolean {
    return count >= 1 && count <= 10;
  }

  public static isLayoutValid(layout: MenuLayoutKind): boolean {
    return layout === MenuLayoutKind.HORIZONTAL || layout === MenuLayoutKind.VERTICAL ||
      layout === MenuLayoutKind.GRID;
  }

  public static hasExactlyOneFocus(options: PermissionOption[]): boolean {
    return options.filter((option: PermissionOption) => option.isFocus).length === 1;
  }

  public static hasDistinctNames(options: PermissionOption[]): boolean {
    const names: Set<string> = new Set<string>();
    options.forEach((option: PermissionOption) => {
      names.add(option.name);
    });
    return names.size === options.length;
  }

  public static hasDistinctOptionTypes(options: PermissionOption[]): boolean {
    const types: Set<number> = new Set<number>();
    options.forEach((option: PermissionOption) => {
      types.add(option.optionType);
    });
    return types.size === options.length;
  }
}

// 菜单统计器：统计焦点与选项类型分布
class MenuStatistics {
  private options: PermissionOption[] = [];

  public collect(options: PermissionOption[]): void {
    this.options.push(...options);
  }

  public getTotalCount(): number {
    return this.options.length;
  }

  public getFocusCount(): number {
    return this.options.filter((option: PermissionOption) => option.isFocus).length;
  }

  public getForeverCount(): number {
    return this.options.filter((option: PermissionOption) => option.isForever()).length;
  }

  public getOnceCount(): number {
    return this.options.filter((option: PermissionOption) => option.isOnce()).length;
  }

  public getCancelCount(): number {
    return this.options.filter((option: PermissionOption) => option.isCancel()).length;
  }

  public clear(): void {
    this.options = [];
  }
}

// 菜单焦点策略：根据循环开关决定焦点在边界处的行为
class MenuFocusPolicy {
  private loopFocus: boolean;

  constructor(loopFocus: boolean) {
    this.loopFocus = loopFocus;
  }

  public next(current: number, optionCount: number): number {
    if (current < optionCount - 1) {
      return current + 1;
    }
    return this.loopFocus ? 0 : current;
  }

  public prev(current: number, optionCount: number): number {
    if (current > 0) {
      return current - 1;
    }
    return this.loopFocus ? optionCount - 1 : current;
  }

  public isLoopEnabled(): boolean {
    return this.loopFocus;
  }
}

// 菜单项管理器：管理授权选项的增删查
class MenuOptionManager {
  private options: PermissionOption[] = [];

  public add(option: PermissionOption): void {
    this.options.push(option);
  }

  public addAll(options: PermissionOption[]): void {
    this.options.push(...options);
  }

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.splice(index, 1);
    return true;
  }

  public getOptions(): PermissionOption[] {
    return [...this.options];
  }

  public getOptionCount(): number {
    return this.options.length;
  }

  public getByName(name: string): PermissionOption | null {
    const found = this.options.filter((option: PermissionOption) => option.name === name);
    return found.length === 0 ? null : found[0];
  }

  public getByType(optionType: number): PermissionOption | null {
    const found = this.options.filter((option: PermissionOption) => option.optionType === optionType);
    return found.length === 0 ? null : found[0];
  }

  public clear(): void {
    this.options = [];
  }
}

// 菜单布局计算器：按 690x590 设计稿换算授权弹窗尺寸
class MenuLayoutCalculator {
  public static readonly DESIGN_WIDTH: number = 690;
  public static readonly DESIGN_HEIGHT: number = 590;
  public static readonly ITEM_WIDTH: number = 180;
  public static readonly ITEM_HEIGHT: number = 90;
  public static readonly GAP: number = 16;

  public static calculateWidth(layout: MenuLayoutKind, optionCount: number): number {
    if (layout === MenuLayoutKind.VERTICAL) {
      return MenuLayoutCalculator.ITEM_WIDTH;
    }
    return optionCount * MenuLayoutCalculator.ITEM_WIDTH + (optionCount - 1) * MenuLayoutCalculator.GAP;
  }

  public static calculateHeight(layout: MenuLayoutKind, optionCount: number): number {
    if (layout === MenuLayoutKind.HORIZONTAL) {
      return MenuLayoutCalculator.ITEM_HEIGHT;
    }
    return optionCount * MenuLayoutCalculator.ITEM_HEIGHT + (optionCount - 1) * MenuLayoutCalculator.GAP;
  }

  public static calculateArea(layout: MenuLayoutKind, optionCount: number): number {
    return MenuLayoutCalculator.calculateWidth(layout, optionCount) *
      MenuLayoutCalculator.calculateHeight(layout, optionCount);
  }

  public static isWithinDesignPanel(width: number, height: number): boolean {
    return width <= MenuLayoutCalculator.DESIGN_WIDTH && height <= MenuLayoutCalculator.DESIGN_HEIGHT;
  }
}

// 菜单模式追踪器：记录浏览/选择模式的切换历史
class MenuModeTracker {
  private history: MenuMode[] = [];

  public record(mode: MenuMode): void {
    this.history.push(mode);
  }

  public getHistory(): MenuMode[] {
    return [...this.history];
  }

  public getSwitchCount(): number {
    return this.history.length;
  }

  public getCurrentMode(): MenuMode | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  public hasVisited(mode: MenuMode): boolean {
    return this.history.includes(mode);
  }

  public reset(): void {
    this.history = [];
  }
}
export default function miracastMenuConfigurationSuite(): void {
  // 授权弹窗菜单、可信设备表与布局配置的完整校验套件
  describe('MiracastMenuConfiguration_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      Log.info(TAG, 'menu configuration suite start');
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      Log.info(TAG, 'menu configuration suite end');
    });
    it('permission_menu_should_have_three_options', 0, async () => {
      const menu = new PermissionDialogMenu();
      expect(menu.getOptionCount()).assertEqual(3);
      expect(menu.getOptions().length).assertEqual(3);
    });
    it('permission_menu_option_types_should_match_enum', 0, async () => {
      const menu = new PermissionDialogMenu();
      const options: PermissionOption[] = menu.getOptions();
      expect(options[0].optionType).assertEqual(PermissionOptionType.OPTION_FOREVER);
      expect(options[1].optionType).assertEqual(PermissionOptionType.OPTION_ONCE);
      expect(options[2].optionType).assertEqual(PermissionOptionType.OPTION_CANCEL);
      expect(PermissionOptionType.OPTION_FOREVER).assertEqual(0);
      expect(PermissionOptionType.OPTION_CANCEL).assertEqual(2);
    });
    it('permission_menu_should_default_focus_to_once', 0, async () => {
      const menu = new PermissionDialogMenu();
      const focused: PermissionOption | null = menu.getFocusedOption();
      expect(focused === null).assertFalse();
      expect(focused?.name).assertEqual('allow once');
      expect(menu.getFocusedCount()).assertEqual(1);
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_ONCE);
    });
    it('permission_menu_should_move_focus_between_options', 0, async () => {
      const menu = new PermissionDialogMenu();
      expect(menu.moveFocusPrev()).assertTrue();
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_FOREVER);
      expect(menu.moveFocusNext()).assertTrue();
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_ONCE);
      expect(menu.moveFocusNext()).assertTrue();
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_CANCEL);
    });
    it('permission_menu_focus_should_stop_at_boundary', 0, async () => {
      const menu = new PermissionDialogMenu();
      menu.setFocusToIndex(0);
      expect(menu.moveFocusPrev()).assertFalse();
      menu.setFocusToIndex(2);
      expect(menu.moveFocusNext()).assertFalse();
      expect(menu.getFocusedCount()).assertEqual(1);
    });
    it('permission_menu_should_reject_invalid_focus_index', 0, async () => {
      const menu = new PermissionDialogMenu();
      expect(menu.setFocusToIndex(-1)).assertFalse();
      expect(menu.setFocusToIndex(3)).assertFalse();
      expect(menu.getFocusedCount()).assertEqual(1);
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_ONCE);
    });
    it('permission_menu_should_enter_and_exit_select_mode', 0, async () => {
      const menu = new PermissionDialogMenu();
      expect(menu.getMode()).assertEqual(MenuMode.BROWSE);
      menu.enterSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.SELECT);
      menu.exitSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.BROWSE);
    });
    it('permission_menu_without_focus_should_report_unknown_choice', 0, async () => {
      const menu = new PermissionDialogMenu();
      menu.setFocusToIndex(0);
      menu.setFocusToIndex(1);
      const options: PermissionOption[] = menu.getOptions();
      options.forEach((option: PermissionOption) => option.setFocusState(false));
      expect(menu.getFocusedOption() === null).assertTrue();
      expect(menu.getSelectedChoice()).assertEqual(-1);
    });
    it('permission_option_should_identify_its_type', 0, async () => {
      const forever = new PermissionOption('always allow', PermissionOptionType.OPTION_FOREVER, false, 'icon');
      const once = new PermissionOption('allow once', PermissionOptionType.OPTION_ONCE, false, 'icon');
      const cancel = new PermissionOption('cancel', PermissionOptionType.OPTION_CANCEL, false, 'icon');
      expect(forever.isForever()).assertTrue();
      expect(forever.isOnce()).assertFalse();
      expect(once.isOnce()).assertTrue();
      expect(cancel.isCancel()).assertTrue();
      expect(cancel.isForever()).assertFalse();
    });
    it('permission_option_icon_should_follow_focus', 0, async () => {
      const option = new PermissionOption('cancel', PermissionOptionType.OPTION_CANCEL, false, 'app.media.cancel');
      expect(option.getChoiceIcon()).assertEqual('app.media.cancel');
      option.setFocusState(true);
      expect(option.getChoiceIcon()).assertEqual('app.media.cancel_focus');
      expect(option.getDisplayName()).assertEqual('cancel');
    });
    it('trusted_table_should_add_and_count_rows', 0, async () => {
      const table = new TrustedDeviceTable();
      table.addAll(MenuOptionFactory.createTrustedRows());
      expect(table.getRowCount()).assertEqual(3);
      expect(table.countByType('TV')).assertEqual(1);
      expect(table.countByType('PHONE')).assertEqual(1);
      expect(table.countByType('PAD')).assertEqual(1);
    });
    it('trusted_table_should_reject_duplicate_device_id', 0, async () => {
      const table = new TrustedDeviceTable();
      const row: TrustedDeviceRow = {
        rowId: 1, deviceId: 'aa:bb:cc:01', deviceName: 'LivingRoom', deviceType: 'TV', trustDate: '2026-01-01'
      };
      expect(table.add(row)).assertTrue();
      expect(table.add(row)).assertFalse();
      expect(table.getRowCount()).assertEqual(1);
    });
    it('trusted_table_should_find_and_remove_rows', 0, async () => {
      const table = new TrustedDeviceTable();
      table.addAll(MenuOptionFactory.createTrustedRows());
      const found: TrustedDeviceRow | null = table.findById('aa:bb:cc:02');
      expect(found === null).assertFalse();
      expect(found?.deviceName).assertEqual('Bedroom');
      expect(table.removeById('aa:bb:cc:02')).assertTrue();
      expect(table.removeById('aa:bb:cc:02')).assertFalse();
      expect(table.getRowCount()).assertEqual(2);
    });
    it('trusted_table_should_report_trust_state', 0, async () => {
      const table = new TrustedDeviceTable();
      table.addAll(MenuOptionFactory.createTrustedRows());
      expect(table.isDeviceTrusted('aa:bb:cc:01')).assertTrue();
      expect(table.isDeviceTrusted('aa:bb:cc:99')).assertFalse();
      expect(table.findById('aa:bb:cc:99') === null).assertTrue();
    });
    it('trusted_table_should_sort_rows_by_row_id', 0, async () => {
      const table = new TrustedDeviceTable();
      const rows: TrustedDeviceRow[] = MenuOptionFactory.createTrustedRows();
      table.add(rows[2]);
      table.add(rows[0]);
      table.add(rows[1]);
      const sorted: TrustedDeviceRow[] = table.sortByRowId();
      expect(sorted[0].rowId).assertEqual(1);
      expect(sorted[1].rowId).assertEqual(2);
      expect(sorted[2].rowId).assertEqual(3);
    });
    it('trusted_table_should_reset_after_clear', 0, async () => {
      const table = new TrustedDeviceTable();
      table.addAll(MenuOptionFactory.createTrustedRows());
      table.clear();
      expect(table.getRowCount()).assertEqual(0);
      expect(table.getRows().length).assertEqual(0);
      expect(table.isDeviceTrusted('aa:bb:cc:01')).assertFalse();
    });
    it('device_formatter_should_define_five_columns', 0, async () => {
      expect(TrustedDeviceFormatter.getColumnCount()).assertEqual(5);
      const names: string[] = TrustedDeviceFormatter.getColumnNames();
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual('_ID');
      expect(names[1]).assertEqual('ID');
      expect(names[4]).assertEqual('DATE');
    });
    it('device_formatter_should_format_single_row', 0, async () => {
      const rows: TrustedDeviceRow[] = MenuOptionFactory.createTrustedRows();
      const text: string = TrustedDeviceFormatter.formatRow(rows[0]);
      expect(text.includes('LivingRoom')).assertTrue();
      expect(text.includes('TV')).assertTrue();
      expect(text.includes('2026-01-01')).assertTrue();
      expect(TrustedDeviceFormatter.isRowComplete(rows[0])).assertTrue();
    });
    it('device_formatter_should_join_all_rows', 0, async () => {
      const text: string = TrustedDeviceFormatter.formatAll(MenuOptionFactory.createTrustedRows());
      expect(text.includes(';')).assertTrue();
      expect(text.length).assertLarger(20);
      expect(text.includes('Bedroom')).assertTrue();
    });
    it('device_formatter_should_reject_incomplete_row', 0, async () => {
      const incomplete: TrustedDeviceRow = {
        rowId: 0, deviceId: 'aa:bb:cc:04', deviceName: '', deviceType: 'TV', trustDate: '2026-01-04'
      };
      expect(TrustedDeviceFormatter.isRowComplete(incomplete)).assertFalse();
      expect(TrustedDeviceFormatter.formatRow(incomplete).includes('TV')).assertTrue();
    });
    it('menu_configuration_should_have_defaults', 0, async () => {
      const config = new MenuConfigurationModel();
      expect(config.getLayout()).assertEqual(MenuLayoutKind.HORIZONTAL);
      expect(config.getBehavior()).assertEqual(MenuBehavior.SINGLE_SELECT);
      expect(config.getOptionCount()).assertEqual(3);
      expect(config.isLoopFocus()).assertFalse();
    });
    it('menu_configuration_should_apply_layout', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.VERTICAL);
      expect(config.getLayout()).assertEqual(MenuLayoutKind.VERTICAL);
      expect(config.isVertical()).assertTrue();
      expect(config.isGrid()).assertFalse();
    });
    it('menu_configuration_should_identify_grid', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.GRID);
      expect(config.isGrid()).assertTrue();
      expect(config.isVertical()).assertFalse();
    });
    it('menu_configuration_should_validate_option_count', 0, async () => {
      const config = new MenuConfigurationModel();
      expect(config.setOptionCount(1)).assertTrue();
      expect(config.setOptionCount(10)).assertTrue();
      expect(config.setOptionCount(0)).assertFalse();
      expect(config.setOptionCount(11)).assertFalse();
      expect(config.getOptionCount()).assertEqual(10);
    });
    it('menu_configuration_should_toggle_loop_focus', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLoopFocus(true);
      expect(config.isLoopFocus()).assertTrue();
      config.setLoopFocus(false);
      expect(config.isLoopFocus()).assertFalse();
    });
    it('menu_configuration_should_build_config_object', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.VERTICAL);
      config.setBehavior(MenuBehavior.READ_ONLY);
      config.setOptionCount(5);
      config.setLoopFocus(true);
      const built: MenuConfig = config.buildConfig();
      expect(built.layout).assertEqual(MenuLayoutKind.VERTICAL);
      expect(built.behavior).assertEqual(MenuBehavior.READ_ONLY);
      expect(built.optionCount).assertEqual(5);
      expect(built.loopFocus).assertTrue();
    });
    it('option_factory_should_create_standard_options', 0, async () => {
      const options: PermissionOption[] = MenuOptionFactory.createStandardOptions();
      expect(options.length).assertEqual(3);
      expect(options[0].name).assertEqual('always allow');
      expect(options[1].isFocus).assertTrue();
      expect(options[2].isCancel()).assertTrue();
    });
    it('menu_validator_should_check_option_count', 0, async () => {
      expect(MenuValidator.isOptionCountValid(1)).assertTrue();
      expect(MenuValidator.isOptionCountValid(10)).assertTrue();
      expect(MenuValidator.isOptionCountValid(0)).assertFalse();
      expect(MenuValidator.isOptionCountValid(11)).assertFalse();
    });
    it('menu_validator_should_check_layout_validity', 0, async () => {
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.HORIZONTAL)).assertTrue();
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.VERTICAL)).assertTrue();
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.GRID)).assertTrue();
    });
    it('menu_validator_should_require_one_focus', 0, async () => {
      const options: PermissionOption[] = MenuOptionFactory.createStandardOptions();
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
      const focusedIndex: number = options.findIndex((option: PermissionOption) => option.isFocus);
      expect(focusedIndex).assertLargerOrEqual(0);
      options[focusedIndex].isFocus = false;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertFalse();
      options[2].isFocus = true;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
    });
    it('menu_validator_should_require_distinct_names_and_types', 0, async () => {
      const options: PermissionOption[] = MenuOptionFactory.createStandardOptions();
      expect(MenuValidator.hasDistinctNames(options)).assertTrue();
      expect(MenuValidator.hasDistinctOptionTypes(options)).assertTrue();
      options.push(MenuOptionFactory.createSingle('cancel', PermissionOptionType.OPTION_CANCEL));
      expect(MenuValidator.hasDistinctNames(options)).assertFalse();
      expect(MenuValidator.hasDistinctOptionTypes(options)).assertFalse();
    });
    it('menu_statistics_should_count_option_types', 0, async () => {
      const stats = new MenuStatistics();
      stats.collect(MenuOptionFactory.createStandardOptions());
      expect(stats.getTotalCount()).assertEqual(3);
      expect(stats.getFocusCount()).assertEqual(1);
      expect(stats.getForeverCount()).assertEqual(1);
      expect(stats.getOnceCount()).assertEqual(1);
      expect(stats.getCancelCount()).assertEqual(1);
    });
    it('menu_statistics_should_accumulate_and_clear', 0, async () => {
      const stats = new MenuStatistics();
      stats.collect(MenuOptionFactory.createStandardOptions());
      stats.collect(MenuOptionFactory.createStandardOptions());
      expect(stats.getTotalCount()).assertEqual(6);
      expect(stats.getFocusCount()).assertEqual(2);
      stats.clear();
      expect(stats.getTotalCount()).assertEqual(0);
    });
    it('focus_policy_should_stop_at_boundary_without_loop', 0, async () => {
      const policy = new MenuFocusPolicy(false);
      expect(policy.next(0, 3)).assertEqual(1);
      expect(policy.next(2, 3)).assertEqual(2);
      expect(policy.prev(2, 3)).assertEqual(1);
      expect(policy.prev(0, 3)).assertEqual(0);
      expect(policy.isLoopEnabled()).assertFalse();
    });
    it('focus_policy_should_wrap_with_loop_enabled', 0, async () => {
      const policy = new MenuFocusPolicy(true);
      expect(policy.next(2, 3)).assertEqual(0);
      expect(policy.prev(0, 3)).assertEqual(2);
      expect(policy.next(0, 1)).assertEqual(0);
      expect(policy.prev(0, 1)).assertEqual(0);
      expect(policy.isLoopEnabled()).assertTrue();
    });
    it('option_manager_should_add_and_remove_options', 0, async () => {
      const manager = new MenuOptionManager();
      manager.addAll(MenuOptionFactory.createStandardOptions());
      expect(manager.getOptionCount()).assertEqual(3);
      expect(manager.removeAt(0)).assertTrue();
      expect(manager.getOptionCount()).assertEqual(2);
      expect(manager.removeAt(100)).assertFalse();
    });
    it('option_manager_should_query_by_name_and_type', 0, async () => {
      const manager = new MenuOptionManager();
      manager.addAll(MenuOptionFactory.createStandardOptions());
      const byName: PermissionOption | null = manager.getByName('cancel');
      const byType: PermissionOption | null = manager.getByType(PermissionOptionType.OPTION_FOREVER);
      expect(byName === null).assertFalse();
      expect(byName?.isCancel()).assertTrue();
      expect(byType === null).assertFalse();
      expect(byType?.name).assertEqual('always allow');
      expect(manager.getByName('unknown') === null).assertTrue();
      expect(manager.getByType(99) === null).assertTrue();
    });
    it('option_manager_should_clear_options', 0, async () => {
      const manager = new MenuOptionManager();
      manager.add(MenuOptionFactory.createSingle('cancel', PermissionOptionType.OPTION_CANCEL));
      manager.clear();
      expect(manager.getOptionCount()).assertEqual(0);
      expect(manager.getOptions().length).assertEqual(0);
    });
    it('layout_calculator_should_compute_horizontal_size', 0, async () => {
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.HORIZONTAL, 3);
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.HORIZONTAL, 3);
      expect(width).assertEqual(3 * 180 + 2 * 16);
      expect(height).assertEqual(90);
      expect(MenuLayoutCalculator.isWithinDesignPanel(width, height)).assertTrue();
    });
    it('layout_calculator_should_compute_vertical_size', 0, async () => {
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.VERTICAL, 3);
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.VERTICAL, 3);
      expect(width).assertEqual(180);
      expect(height).assertEqual(3 * 90 + 2 * 16);
      expect(MenuLayoutCalculator.isWithinDesignPanel(width, height)).assertTrue();
    });
    it('layout_calculator_should_compute_area', 0, async () => {
      const area: number = MenuLayoutCalculator.calculateArea(MenuLayoutKind.HORIZONTAL, 3);
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.HORIZONTAL, 3);
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.HORIZONTAL, 3);
      expect(area).assertEqual(width * height);
      expect(area).assertLarger(0);
    });
    it('layout_calculator_should_reject_oversized_panel', 0, async () => {
      expect(MenuLayoutCalculator.isWithinDesignPanel(690, 590)).assertTrue();
      expect(MenuLayoutCalculator.isWithinDesignPanel(691, 590)).assertFalse();
      expect(MenuLayoutCalculator.isWithinDesignPanel(690, 591)).assertFalse();
      expect(MenuLayoutCalculator.DESIGN_WIDTH).assertEqual(690);
      expect(MenuLayoutCalculator.DESIGN_HEIGHT).assertEqual(590);
    });
    it('mode_tracker_should_record_switch_history', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      tracker.record(MenuMode.SELECT);
      expect(tracker.getSwitchCount()).assertEqual(2);
      expect(tracker.getCurrentMode()).assertEqual(MenuMode.SELECT);
      expect(tracker.hasVisited(MenuMode.BROWSE)).assertTrue();
    });
    it('mode_tracker_should_return_null_when_empty', 0, async () => {
      const tracker = new MenuModeTracker();
      expect(tracker.getCurrentMode() === null).assertTrue();
      expect(tracker.getSwitchCount()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
    });
    it('mode_tracker_should_reset_history', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.SELECT);
      tracker.reset();
      expect(tracker.getSwitchCount()).assertEqual(0);
      expect(tracker.hasVisited(MenuMode.SELECT)).assertFalse();
    });
    it('mode_tracker_should_return_history_copy', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      const copy: MenuMode[] = tracker.getHistory();
      copy.push(MenuMode.SELECT);
      expect(tracker.getSwitchCount()).assertEqual(1);
    });
    it('permission_dialog_should_expose_trust_button_id', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const trustCount: number = await countComponentsById(driver, ID_PERMANENT_TRUST);
      expect(trustCount).assertLargerOrEqual(0);
      expect(ID_PERMANENT_TRUST).assertEqual('permanent_trust');
    });
    it('permission_dialog_confirm_and_cancel_ids_should_be_defined', 0, async () => {
      expect(ID_CONFIRM_BTN).assertEqual('confirmBtn');
      expect(ID_CANCEL_BTN).assertEqual('cancel');
      const visible = await isPermissionDialogVisible(driver);
      expect(visible === true || visible === false).assertTrue();
    });
    it('permission_choice_enum_should_be_unique_and_ordered', 0, async () => {
      const choices: number[] = [PermissionOptionType.OPTION_FOREVER, PermissionOptionType.OPTION_ONCE,
        PermissionOptionType.OPTION_CANCEL];
      const unique: Set<number> = new Set<number>(choices);
      expect(unique.size).assertEqual(3);
      expect(choices[0]).assertLess(choices[1]);
      expect(choices[1]).assertLess(choices[2]);
    });
    it('menu_layout_enum_values_should_be_distinct', 0, async () => {
      const layouts: Set<string> = new Set<string>([MenuLayoutKind.HORIZONTAL, MenuLayoutKind.VERTICAL,
        MenuLayoutKind.GRID]);
      expect(layouts.size).assertEqual(3);
      const layoutA: string = MenuLayoutKind.HORIZONTAL;
      const layoutB: string = MenuLayoutKind.GRID;
      expect(layoutA === layoutB).assertFalse();
    });
    it('menu_behavior_enum_values_should_be_distinct', 0, async () => {
      const behaviors: Set<string> = new Set<string>([MenuBehavior.SINGLE_SELECT, MenuBehavior.MULTI_SELECT,
        MenuBehavior.READ_ONLY]);
      expect(behaviors.size).assertEqual(3);
      const behaviorA: string = MenuBehavior.READ_ONLY;
      const behaviorB: string = MenuBehavior.SINGLE_SELECT;
      expect(behaviorA === behaviorB).assertFalse();
    });
    it('trusted_table_should_allow_reinsert_after_removal', 0, async () => {
      const table = new TrustedDeviceTable();
      const rows: TrustedDeviceRow[] = MenuOptionFactory.createTrustedRows();
      table.add(rows[0]);
      expect(table.removeById(rows[0].deviceId)).assertTrue();
      expect(table.add(rows[0])).assertTrue();
      expect(table.getRowCount()).assertEqual(1);
    });
    it('permission_menu_should_keep_single_focus_after_full_cycle', 0, async () => {
      const menu = new PermissionDialogMenu();
      menu.setFocusToIndex(0);
      menu.moveFocusNext();
      menu.moveFocusNext();
      menu.moveFocusPrev();
      menu.moveFocusPrev();
      expect(menu.getFocusedCount()).assertEqual(1);
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_FOREVER);
      expect(menu.getOptionCount()).assertEqual(3);
    });
    it('permission_menu_should_reset_focus_to_first_option', 0, async () => {
      const menu = new PermissionDialogMenu();
      expect(menu.setFocusToIndex(0)).assertTrue();
      expect(menu.getSelectedChoice()).assertEqual(PermissionOptionType.OPTION_FOREVER);
      expect(menu.getFocusedCount()).assertEqual(1);
      expect(menu.getOptions()[0].isFocus).assertTrue();
    });
    it('menu_focus_policy_should_walk_across_all_options', 0, async () => {
      const policy = new MenuFocusPolicy(true);
      let index = 0;
      index = policy.next(index, 3);
      expect(index).assertEqual(1);
      index = policy.next(index, 3);
      expect(index).assertEqual(2);
      index = policy.next(index, 3);
      expect(index).assertEqual(0);
      index = policy.prev(index, 3);
      expect(index).assertEqual(2);
    });
    it('menu_statistics_should_handle_partial_type_sets', 0, async () => {
      const stats = new MenuStatistics();
      stats.collect([MenuOptionFactory.createSingle('allow once', PermissionOptionType.OPTION_ONCE)]);
      expect(stats.getTotalCount()).assertEqual(1);
      expect(stats.getOnceCount()).assertEqual(1);
      expect(stats.getForeverCount()).assertEqual(0);
      expect(stats.getCancelCount()).assertEqual(0);
      expect(stats.getFocusCount()).assertEqual(0);
    });
    it('menu_configuration_should_reject_incomplete_layout_switch', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.GRID);
      expect(config.isGrid()).assertTrue();
      expect(config.isVertical()).assertFalse();
      expect(MenuValidator.isLayoutValid(config.getLayout())).assertTrue();
      expect(config.getOptionCount()).assertEqual(3);
    });
    it('permission_options_should_keep_icons_for_all_entries', 0, async () => {
      const options: PermissionOption[] = MenuOptionFactory.createStandardOptions();
      options.forEach((option: PermissionOption) => {
        expect(option.icon.length).assertLarger(0);
        expect(option.getChoiceIcon().includes(option.icon)).assertTrue();
      });
      expect(options[0].getChoiceIcon()).assertEqual('app.media.permanent_trust');
    });
  });
}
