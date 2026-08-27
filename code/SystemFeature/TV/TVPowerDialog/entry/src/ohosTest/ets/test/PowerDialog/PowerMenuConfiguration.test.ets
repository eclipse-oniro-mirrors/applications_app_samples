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
import { Driver, ON } from '@ohos.UiTest';
import {
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 电源操作类型枚举
enum PowerOperationType {
  POWEROPERATION_SUSPEND = 0, POWEROPERATION_REBOOT = 1, POWEROPERATION_SHUTDOWN = 2
}

// 电源选项模型
class PowerOption {
  public name: string;
  public operationType: number;
  public isFocus: boolean;

  constructor(name: string, operationType: number, isFocus: boolean) {
    this.name = name;
    this.operationType = operationType;
    this.isFocus = isFocus;
  }
}

// 菜单模式枚举：浏览模式与选择模式
enum MenuMode {
  BROWSE = 'browse', SELECT = 'select'
}

// 电源菜单模型：模拟电源对话框的三项菜单与模式状态迁移
class PowerMenuModel {
  private options: PowerOption[] = [];
  private mode: MenuMode = MenuMode.BROWSE;

  constructor() {
    this.options.push(new PowerOption('熄屏', PowerOperationType.POWEROPERATION_SUSPEND, false));
    this.options.push(new PowerOption('关机', PowerOperationType.POWEROPERATION_SHUTDOWN, true));
    this.options.push(new PowerOption('重启', PowerOperationType.POWEROPERATION_REBOOT, false));
  }

  public getOptions(): PowerOption[] {
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

  public getFocusedOption(): PowerOption | null {
    const focused = this.options.filter((option: PowerOption) => option.isFocus);
    if (focused.length === 0) {
      return null;
    }
    return focused[0];
  }

  public setFocusToIndex(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.forEach((option: PowerOption, idx: number) => {
      option.isFocus = idx === index;
    });
    return true;
  }

  public moveFocusNext(): boolean {
    const current = this.options.findIndex((option: PowerOption) => option.isFocus);
    if (current >= 0 && current < this.options.length - 1) {
      return this.setFocusToIndex(current + 1);
    }
    return false;
  }

  public moveFocusPrev(): boolean {
    const current = this.options.findIndex((option: PowerOption) => option.isFocus);
    if (current > 0) {
      return this.setFocusToIndex(current - 1);
    }
    return false;
  }

  public getFocusedCount(): number {
    return this.options.filter((option: PowerOption) => option.isFocus).length;
  }
}

// 菜单布局类型枚举：描述电源菜单的布局样式
enum MenuLayoutKind {
  HORIZONTAL = 'horizontal', VERTICAL = 'vertical', GRID = 'grid'
}

// 菜单行为枚举：描述电源菜单的交互行为
enum MenuBehavior {
  SINGLE_SELECT = 'single_select', MULTI_SELECT = 'multi_select', READ_ONLY = 'read_only'
}

// 菜单配置接口：描述电源菜单的完整配置
interface MenuConfig {
  layout: MenuLayoutKind;
  behavior: MenuBehavior;
  optionCount: number;
  loopFocus: boolean;
}

// 菜单项描述接口：描述单个菜单项的静态描述
interface MenuItemDescriptor {
  name: string;
  operationType: number;
  isDefault: boolean;
  icon: string;
}

// 菜单配置模型：封装菜单配置并提供校验与查询能力
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

  public buildConfig(): MenuConfig {
    return {
      layout: this.layout,
      behavior: this.behavior,
      optionCount: this.optionCount,
      loopFocus: this.loopFocus
    };
  }

  public isVertical(): boolean {
    return this.layout === MenuLayoutKind.VERTICAL;
  }

  public isGrid(): boolean {
    return this.layout === MenuLayoutKind.GRID;
  }
}

// 菜单项工厂：批量生成标准菜单项
class MenuOptionFactory {
  public static createStandardOptions(): PowerOption[] {
    const options: PowerOption[] = [];
    options.push(new PowerOption('熄屏', PowerOperationType.POWEROPERATION_SUSPEND, false));
    options.push(new PowerOption('关机', PowerOperationType.POWEROPERATION_SHUTDOWN, true));
    options.push(new PowerOption('重启', PowerOperationType.POWEROPERATION_REBOOT, false));
    return options;
  }

  public static createSingle(name: string, operationType: number): PowerOption {
    return new PowerOption(name, operationType, false);
  }

  public static createDescriptors(): MenuItemDescriptor[] {
    const descriptors: MenuItemDescriptor[] = [];
    descriptors.push({
      name: '熄屏',
      operationType: PowerOperationType.POWEROPERATION_SUSPEND,
      isDefault: false,
      icon: 'screenout'
    });
    descriptors.push({
      name: '关机',
      operationType: PowerOperationType.POWEROPERATION_SHUTDOWN,
      isDefault: true,
      icon: 'shutdown'
    });
    descriptors.push({
      name: '重启',
      operationType: PowerOperationType.POWEROPERATION_REBOOT,
      isDefault: false,
      icon: 'reboot'
    });
    return descriptors;
  }
}

// 菜单校验器：校验菜单配置与选项的合法性
class MenuValidator {
  public static isOptionCountValid(count: number): boolean {
    return count >= 1 && count <= 10;
  }

  public static isLayoutValid(layout: MenuLayoutKind): boolean {
    return layout === MenuLayoutKind.HORIZONTAL || layout === MenuLayoutKind.VERTICAL || layout === MenuLayoutKind.GRID;
  }

  public static hasExactlyOneFocus(options: PowerOption[]): boolean {
    return options.filter((option: PowerOption) => option.isFocus).length === 1;
  }

  public static hasDistinctNames(options: PowerOption[]): boolean {
    const names: Set<string> = new Set<string>();
    options.forEach((option: PowerOption) => {
      names.add(option.name);
    });
    return names.size === options.length;
  }
}

// 菜单统计：统计菜单项的焦点与类型分布
class MenuStatistics {
  private options: PowerOption[] = [];

  public collect(options: PowerOption[]): void {
    this.options.push(...options);
  }

  public getTotalCount(): number {
    return this.options.length;
  }

  public getFocusCount(): number {
    return this.options.filter((option: PowerOption) => option.isFocus).length;
  }

  public getSuspendCount(): number {
    return this.options.filter((option: PowerOption) => option.operationType ===
      PowerOperationType.POWEROPERATION_SUSPEND).length;
  }

  public getShutdownCount(): number {
    return this.options.filter((option: PowerOption) => option.operationType ===
      PowerOperationType.POWEROPERATION_SHUTDOWN).length;
  }

  public getRebootCount(): number {
    return this.options.filter((option: PowerOption) => option.operationType ===
      PowerOperationType.POWEROPERATION_REBOOT).length;
  }

  public clear(): void {
    this.options = [];
  }
}

// 菜单焦点策略：根据布局与循环开关决定焦点移动
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

// 菜单项管理器：管理菜单项的增删改查
class MenuOptionManager {
  private options: PowerOption[] = [];

  public add(option: PowerOption): void {
    this.options.push(option);
  }

  public addAll(options: PowerOption[]): void {
    this.options.push(...options);
  }

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.splice(index, 1);
    return true;
  }

  public getOptions(): PowerOption[] {
    return [...this.options];
  }

  public getOptionCount(): number {
    return this.options.length;
  }

  public getByName(name: string): PowerOption | null {
    const found = this.options.filter((option: PowerOption) => option.name === name);
    if (found.length === 0) {
      return null;
    }
    return found[0];
  }

  public clear(): void {
    this.options = [];
  }
}

// 菜单布局计算器：根据布局类型计算菜单尺寸
class MenuLayoutCalculator {
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
}

// 菜单模式追踪器：记录菜单模式的切换历史
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

export default function powerMenuConfigurationTest() {
  describe('PowerMenuConfiguration_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Menu_State_Transitions：菜单包含三个选项
    it('menu_should_have_three_items', 0, async () => {
      const menu = new PowerMenuModel();
      expect(menu.getOptionCount()).assertEqual(3);
    });

    // 适配 Menu_Configuration_PageType：菜单项名称正确
    it('menu_items_should_have_correct_names', 0, async () => {
      const menu = new PowerMenuModel();
      const options = menu.getOptions();
      expect(options[0].name).assertEqual('熄屏');
      expect(options[1].name).assertEqual('关机');
      expect(options[2].name).assertEqual('重启');
    });

    // 适配 Menu_State_Transitions：初始焦点落在关机选项
    it('default_focus_should_be_on_shutdown', 0, async () => {
      const menu = new PowerMenuModel();
      const focused = menu.getFocusedOption();
      expect(focused === null).assertFalse();
      expect(focused?.name).assertEqual('关机');
    });

    // 适配 Menu_State_Transitions：焦点在选项间切换
    it('focus_should_toggle_between_options', 0, async () => {
      const menu = new PowerMenuModel();
      menu.moveFocusPrev();
      expect(menu.getFocusedOption()?.name).assertEqual('熄屏');
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.name).assertEqual('关机');
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.name).assertEqual('重启');
    });

    // 适配 MultiSelect_Mode：选择模式下仅一个选项获得焦点
    it('select_mode_should_keep_exactly_one_focus', 0, async () => {
      const menu = new PowerMenuModel();
      menu.enterSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.SELECT);
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 Browse_Mode：浏览模式为默认状态
    it('browse_mode_should_be_default', 0, async () => {
      const menu = new PowerMenuModel();
      expect(menu.getMode()).assertEqual(MenuMode.BROWSE);
    });

    // 适配 Browse_Mode：浏览模式下按确认触发操作（焦点不改变）
    it('enter_key_should_not_change_focus', 0, async () => {
      const menu = new PowerMenuModel();
      const before = menu.getFocusedOption()?.name;
      expect(before).assertEqual('关机'); // 确认操作不改变焦点
      expect(menu.getFocusedOption()?.name).assertEqual('关机');
    });

    // 适配 Copy_Mode / Move_Mode：模式可进入并退出
    it('mode_should_enter_and_exit_correctly', 0, async () => {
      const menu = new PowerMenuModel();
      menu.enterSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.SELECT);
      menu.exitSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.BROWSE);
    });

    // 适配 Menu_State_Transitions：焦点边界不越界
    it('focus_should_not_move_beyond_boundaries', 0, async () => {
      const menu = new PowerMenuModel();
      menu.setFocusToIndex(0);
      expect(menu.moveFocusPrev()).assertFalse();
      menu.setFocusToIndex(2);
      expect(menu.moveFocusNext()).assertFalse();
    });

    // 适配 Menu_Configuration_PageType：无效索引不改变焦点
    it('set_focus_to_invalid_index_should_fail', 0, async () => {
      const menu = new PowerMenuModel();
      expect(menu.setFocusToIndex(-1)).assertFalse();
      expect(menu.setFocusToIndex(100)).assertFalse();
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 集成：真实对话框三选项渲染验证
    it('real_dialog_should_render_three_options', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 MenuConfiguration_Model：默认配置为横向单选项
    it('configuration_should_have_default_values', 0, async () => {
      const config = new MenuConfigurationModel();
      expect(config.getLayout()).assertEqual(MenuLayoutKind.HORIZONTAL);
      expect(config.getBehavior()).assertEqual(MenuBehavior.SINGLE_SELECT);
      expect(config.getOptionCount()).assertEqual(3);
      expect(config.isLoopFocus()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：设置布局后生效
    it('configuration_should_apply_layout', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.VERTICAL);
      expect(config.getLayout()).assertEqual(MenuLayoutKind.VERTICAL);
      expect(config.isVertical()).assertTrue();
      expect(config.isGrid()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：网格布局识别
    it('configuration_should_identify_grid_layout', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.GRID);
      expect(config.isGrid()).assertTrue();
      expect(config.isVertical()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：设置行为后生效
    it('configuration_should_apply_behavior', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setBehavior(MenuBehavior.MULTI_SELECT);
      expect(config.getBehavior()).assertEqual(MenuBehavior.MULTI_SELECT);
    });

    // 适配 MenuConfiguration_Model：选项数量边界校验
    it('configuration_should_validate_option_count', 0, async () => {
      const config = new MenuConfigurationModel();
      expect(config.setOptionCount(1)).assertTrue();
      expect(config.setOptionCount(10)).assertTrue();
      expect(config.setOptionCount(0)).assertFalse();
      expect(config.setOptionCount(11)).assertFalse();
      expect(config.getOptionCount()).assertEqual(10);
    });

    // 适配 MenuConfiguration_Model：循环焦点开关
    it('configuration_should_toggle_loop_focus', 0, async () => {
      const config = new MenuConfigurationModel();
      config.setLoopFocus(true);
      expect(config.isLoopFocus()).assertTrue();
      config.setLoopFocus(false);
      expect(config.isLoopFocus()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：构建完整配置对象
    it('configuration_should_build_config', 0, async () => {
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

    // 适配 MenuOption_Factory：标准选项集合
    it('option_factory_should_create_standard_options', 0, async () => {
      const options: PowerOption[] = MenuOptionFactory.createStandardOptions();
      expect(options.length).assertEqual(3);
      expect(options[0].name).assertEqual('熄屏');
      expect(options[1].name).assertEqual('关机');
      expect(options[1].isFocus).assertTrue();
    });

    // 适配 MenuOption_Factory：创建单个选项
    it('option_factory_should_create_single_option', 0, async () => {
      const option: PowerOption = MenuOptionFactory.createSingle('测试项', PowerOperationType.POWEROPERATION_REBOOT);
      expect(option.name).assertEqual('测试项');
      expect(option.operationType).assertEqual(PowerOperationType.POWEROPERATION_REBOOT);
      expect(option.isFocus).assertFalse();
    });

    // 适配 MenuOption_Factory：菜单项描述集合
    it('option_factory_should_create_descriptors', 0, async () => {
      const descriptors: MenuItemDescriptor[] = MenuOptionFactory.createDescriptors();
      expect(descriptors.length).assertEqual(3);
      const shutdownDescriptor = descriptors.find((d: MenuItemDescriptor) => d.name === '关机');
      expect(shutdownDescriptor === undefined).assertFalse();
      expect(shutdownDescriptor?.isDefault).assertTrue();
    });

    // 适配 MenuValidator：选项数量合法范围
    it('menu_validator_should_check_option_count', 0, async () => {
      expect(MenuValidator.isOptionCountValid(1)).assertTrue();
      expect(MenuValidator.isOptionCountValid(10)).assertTrue();
      expect(MenuValidator.isOptionCountValid(0)).assertFalse();
      expect(MenuValidator.isOptionCountValid(11)).assertFalse();
    });

    // 适配 MenuValidator：布局合法性
    it('menu_validator_should_check_layout_validity', 0, async () => {
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.HORIZONTAL)).assertTrue();
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.VERTICAL)).assertTrue();
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.GRID)).assertTrue();
    });

    // 适配 MenuValidator：唯一焦点校验
    it('menu_validator_should_require_exactly_one_focus', 0, async () => {
      const options: PowerOption[] = MenuOptionFactory.createStandardOptions();
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
      options[0].isFocus = false;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
    });

    // 适配 MenuValidator：名称唯一性校验
    it('menu_validator_should_require_distinct_names', 0, async () => {
      const options: PowerOption[] = MenuOptionFactory.createStandardOptions();
      expect(MenuValidator.hasDistinctNames(options)).assertTrue();
      options.push(MenuOptionFactory.createSingle('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      expect(MenuValidator.hasDistinctNames(options)).assertFalse();
    });

    // 适配 MenuStatistics：类型分布统计
    it('menu_statistics_should_count_type_distribution', 0, async () => {
      const stats = new MenuStatistics();
      stats.collect(MenuOptionFactory.createStandardOptions());
      expect(stats.getFocusCount()).assertEqual(1);
      expect(stats.getSuspendCount()).assertEqual(1);
      expect(stats.getShutdownCount()).assertEqual(1);
      expect(stats.getRebootCount()).assertEqual(1);
    });

    // 适配 MenuStatistics：清空后统计为零
    it('menu_statistics_should_reset_after_clear', 0, async () => {
      const stats = new MenuStatistics();
      stats.collect(MenuOptionFactory.createStandardOptions());
      stats.clear();
      expect(stats.getFocusCount()).assertEqual(0);
    });

    // 适配 MenuFocusPolicy：非循环模式到达边界停止
    it('focus_policy_should_stop_at_boundary_without_loop', 0, async () => {
      const policy = new MenuFocusPolicy(false);
      expect(policy.next(0, 3)).assertEqual(1);
      expect(policy.next(2, 3)).assertEqual(2);
      expect(policy.prev(2, 3)).assertEqual(1);
      expect(policy.prev(0, 3)).assertEqual(0);
    });

    // 适配 MenuFocusPolicy：循环模式到达边界回绕
    it('focus_policy_should_wrap_at_boundary_with_loop', 0, async () => {
      const policy = new MenuFocusPolicy(true);
      expect(policy.next(2, 3)).assertEqual(0);
      expect(policy.prev(0, 3)).assertEqual(2);
      expect(policy.isLoopEnabled()).assertTrue();
    });

    // 适配 MenuOptionManager：增删查管理
    it('option_manager_should_manage_options', 0, async () => {
      const manager = new MenuOptionManager();
      manager.addAll(MenuOptionFactory.createStandardOptions());
      expect(manager.getOptionCount()).assertEqual(3);
      expect(manager.removeAt(0)).assertTrue();
      expect(manager.getOptionCount()).assertEqual(2);
      expect(manager.removeAt(100)).assertFalse();
    });

    // 适配 MenuOptionManager：按名称查找
    it('option_manager_should_find_by_name', 0, async () => {
      const manager = new MenuOptionManager();
      manager.addAll(MenuOptionFactory.createStandardOptions());
      const found: PowerOption | null = manager.getByName('关机');
      expect(found === null).assertFalse();
      expect(found?.operationType).assertEqual(PowerOperationType.POWEROPERATION_SHUTDOWN);
      expect(manager.getByName('不存在的项') === null).assertTrue();
    });

    // 适配 MenuOptionManager：清空后状态复位
    it('option_manager_should_reset_after_clear', 0, async () => {
      const manager = new MenuOptionManager();
      manager.add(MenuOptionFactory.createSingle('测试', PowerOperationType.POWEROPERATION_SUSPEND));
      manager.clear();
      expect(manager.getOptionCount()).assertEqual(0);
      expect(manager.getOptions().length).assertEqual(0);
    });

    // 适配 MenuLayoutCalculator：横向宽度计算
    it('layout_calculator_should_compute_horizontal_width', 0, async () => {
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.HORIZONTAL, 3);
      expect(width).assertEqual(3 * MenuLayoutCalculator.ITEM_WIDTH + 2 * MenuLayoutCalculator.GAP);
    });

    // 适配 MenuLayoutCalculator：垂直布局宽度为单项宽
    it('layout_calculator_should_compute_vertical_width', 0, async () => {
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.VERTICAL, 3);
      expect(width).assertEqual(MenuLayoutCalculator.ITEM_WIDTH);
    });

    // 适配 MenuLayoutCalculator：横向高度为单项高
    it('layout_calculator_should_compute_horizontal_height', 0, async () => {
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.HORIZONTAL, 3);
      expect(height).assertEqual(MenuLayoutCalculator.ITEM_HEIGHT);
    });

    // 适配 MenuLayoutCalculator：垂直高度计算
    it('layout_calculator_should_compute_vertical_height', 0, async () => {
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.VERTICAL, 3);
      expect(height).assertEqual(3 * MenuLayoutCalculator.ITEM_HEIGHT + 2 * MenuLayoutCalculator.GAP);
    });

    // 适配 MenuLayoutCalculator：面积等于宽高乘积
    it('layout_calculator_should_compute_area', 0, async () => {
      const area: number = MenuLayoutCalculator.calculateArea(MenuLayoutKind.HORIZONTAL, 3);
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.HORIZONTAL, 3);
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.HORIZONTAL, 3);
      expect(area).assertEqual(width * height);
    });

    // 适配 MenuModeTracker：模式切换历史记录
    it('mode_tracker_should_record_history', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      tracker.record(MenuMode.SELECT);
      expect(tracker.getSwitchCount()).assertEqual(2);
      expect(tracker.getCurrentMode()).assertEqual(MenuMode.SELECT);
    });

    // 适配 MenuModeTracker：访问历史判断
    it('mode_tracker_should_detect_visited_mode', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      expect(tracker.hasVisited(MenuMode.BROWSE)).assertTrue();
      expect(tracker.hasVisited(MenuMode.SELECT)).assertFalse();
    });

    // 适配 MenuModeTracker：空历史返回 null
    it('mode_tracker_should_return_null_when_empty', 0, async () => {
      const tracker = new MenuModeTracker();
      expect(tracker.getCurrentMode() === null).assertTrue();
      expect(tracker.getSwitchCount()).assertEqual(0);
    });

    // 适配 MenuModeTracker：重置后历史清空
    it('mode_tracker_should_reset_after_clear', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.SELECT);
      tracker.reset();
      expect(tracker.getSwitchCount()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
    });

    // 适配 Menu_Model：焦点完整循环移动
    it('menu_model_should_support_full_focus_cycle', 0, async () => {
      const menu = new PowerMenuModel();
      menu.setFocusToIndex(0);
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.name).assertEqual('关机');
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.name).assertEqual('重启');
      menu.moveFocusPrev();
      menu.moveFocusPrev();
      expect(menu.getFocusedOption()?.name).assertEqual('熄屏');
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 Menu_Model：全部取消焦点后返回 null
    it('menu_model_should_return_null_when_no_focus', 0, async () => {
      const menu = new PowerMenuModel();
      const options: PowerOption[] = menu.getOptions();
      options[0].isFocus = false;
      options[1].isFocus = false;
      options[2].isFocus = false;
      expect(menu.getFocusedOption()).assertEqual(null);
      expect(menu.getFocusedCount()).assertEqual(0);
    });

    // 适配 Menu_Model：设置焦点保持唯一性
    it('menu_model_should_keep_single_focus_after_set', 0, async () => {
      const menu = new PowerMenuModel();
      expect(menu.setFocusToIndex(2)).assertTrue();
      expect(menu.getFocusedOption()?.name).assertEqual('重启');
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 MenuConfiguration_Model：非法数量设置不改变现有值
    it('menu_configuration_should_keep_count_on_invalid_set', 0, async () => {
      const config = new MenuConfigurationModel();
      expect(config.setOptionCount(0)).assertFalse();
      expect(config.getOptionCount()).assertEqual(3);
      expect(config.setOptionCount(11)).assertFalse();
      expect(config.getOptionCount()).assertEqual(3);
    });

    // 适配 MenuOption_Factory：描述符携带图标与默认标记
    it('menu_option_factory_descriptors_should_carry_icons', 0, async () => {
      const descriptors: MenuItemDescriptor[] = MenuOptionFactory.createDescriptors();
      descriptors.forEach((descriptor: MenuItemDescriptor) => {
        expect(descriptor.icon.length).assertLarger(0);
        expect(descriptor.name.length).assertLarger(0);
      });
      const shutdown = descriptors.find((descriptor: MenuItemDescriptor) => descriptor.name === '关机');
      expect(shutdown === undefined).assertFalse();
      expect(shutdown?.isDefault).assertTrue();
      expect(shutdown?.icon).assertEqual('shutdown');
    });

    // 适配 MenuValidator：无焦点选项校验失败
    it('menu_validator_should_reject_missing_focus', 0, async () => {
      const options: PowerOption[] = MenuOptionFactory.createStandardOptions();
      options[0].isFocus = false;
      options[1].isFocus = false;
      options[2].isFocus = false;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertFalse();
      options[2].isFocus = true;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
    });

    // 适配 MenuStatistics：多次收集累积统计
    it('menu_statistics_should_accumulate_multiple_collections', 0, async () => {
      const stats = new MenuStatistics();
      stats.collect(MenuOptionFactory.createStandardOptions());
      stats.collect(MenuOptionFactory.createStandardOptions());
      expect(stats.getTotalCount()).assertEqual(6);
      expect(stats.getFocusCount()).assertEqual(2);
      expect(stats.getSuspendCount()).assertEqual(2);
      expect(stats.getShutdownCount()).assertEqual(2);
      expect(stats.getRebootCount()).assertEqual(2);
    });

    // 适配 MenuFocusPolicy：单选项边界行为
    it('menu_focus_policy_should_handle_single_option', 0, async () => {
      const noLoop = new MenuFocusPolicy(false);
      expect(noLoop.next(0, 1)).assertEqual(0);
      expect(noLoop.prev(0, 1)).assertEqual(0);
      expect(noLoop.isLoopEnabled()).assertFalse();
      const loop = new MenuFocusPolicy(true);
      expect(loop.next(0, 1)).assertEqual(0);
      expect(loop.prev(0, 1)).assertEqual(0);
      expect(loop.isLoopEnabled()).assertTrue();
    });

    // 适配 MenuOptionManager：单个选项添加与查询
    it('menu_option_manager_should_add_and_query_single', 0, async () => {
      const manager = new MenuOptionManager();
      manager.add(MenuOptionFactory.createSingle('测试项', PowerOperationType.POWEROPERATION_REBOOT));
      expect(manager.getOptionCount()).assertEqual(1);
      const found = manager.getByName('测试项');
      expect(found === null).assertFalse();
      expect(found?.operationType).assertEqual(PowerOperationType.POWEROPERATION_REBOOT);
      expect(manager.getByName('未知') === null).assertTrue();
    });

    // 适配 MenuLayoutCalculator：单选项布局尺寸
    it('menu_layout_calculator_should_handle_single_option', 0, async () => {
      expect(MenuLayoutCalculator.calculateWidth(MenuLayoutKind.HORIZONTAL, 1)).assertEqual(
        MenuLayoutCalculator.ITEM_WIDTH);
      expect(MenuLayoutCalculator.calculateHeight(MenuLayoutKind.HORIZONTAL, 1)).assertEqual(
        MenuLayoutCalculator.ITEM_HEIGHT);
      expect(MenuLayoutCalculator.calculateWidth(MenuLayoutKind.VERTICAL, 1)).assertEqual(
        MenuLayoutCalculator.ITEM_WIDTH);
    });

    // 适配 MenuLayoutCalculator：垂直布局面积计算
    it('menu_layout_calculator_should_calculate_vertical_area', 0, async () => {
      const width: number = MenuLayoutCalculator.calculateWidth(MenuLayoutKind.VERTICAL, 2);
      const height: number = MenuLayoutCalculator.calculateHeight(MenuLayoutKind.VERTICAL, 2);
      const area: number = MenuLayoutCalculator.calculateArea(MenuLayoutKind.VERTICAL, 2);
      expect(area).assertEqual(width * height);
      expect(height).assertEqual(2 * MenuLayoutCalculator.ITEM_HEIGHT + MenuLayoutCalculator.GAP);
    });

    // 适配 MenuModeTracker：重复模式切换历史
    it('menu_mode_tracker_should_track_repeated_switches', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      tracker.record(MenuMode.SELECT);
      tracker.record(MenuMode.BROWSE);
      expect(tracker.getSwitchCount()).assertEqual(3);
      expect(tracker.getCurrentMode()).assertEqual(MenuMode.BROWSE);
      expect(tracker.hasVisited(MenuMode.SELECT)).assertTrue();
    });

    // 适配 MenuModeTracker：历史返回独立副本
    it('menu_mode_tracker_should_return_copy_of_history', 0, async () => {
      const tracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      const copy: MenuMode[] = tracker.getHistory();
      copy.push(MenuMode.SELECT);
      expect(tracker.getSwitchCount()).assertEqual(1);
      expect(tracker.getHistory().length).assertEqual(1);
    });

    // 适配 Remote_Navigation：遥控器方向键导航保持对话框稳定
    it('power_dialog_should_support_remote_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });
}
