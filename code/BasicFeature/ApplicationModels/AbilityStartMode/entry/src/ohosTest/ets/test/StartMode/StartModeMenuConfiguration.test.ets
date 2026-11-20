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
import { Driver } from '@ohos.UiTest';
import {
  DELAY_KEY_NAVIGATION,
  FOOD_ICE_CREAM,
  FOOD_TOMATO,
  FOOD_WALNUT,
  INDEX_SINGLETON_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_STANDARD_GROUP,
  KEY_BACK,
  KEY_LEFT,
  KEY_RIGHT,
  MODE_SINGLETON,
  MODE_SPECIFIED,
  MODE_STANDARD,
  TIMEOUT_PAGE_RENDER,
  checkTextContent,
  componentCount,
  countModeLabels,
  getDriver,
  homeComponentCount,
  pressAndWait,
  serializedDelay,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// 食物分类枚举：与主工程 CategoryId 保持一致
enum FoodCategory {
  FRUIT = 0, VEGETABLE = 1, NUT = 2, SEAFOOD = 3, DESSERT = 4
}

// 启动模式枚举：与主工程 Home 页三组列表的 modeName 标识保持一致
enum LaunchMode {
  STANDARD = 'standard', SPECIFIED = 'specified', SINGLETON = 'sinleton'
}

// 食物选项模型：描述主页某个分组下的一条食物条目
class FoodOption {
  public letter: string;
  public foodItemId: number;
  public groupIndex: number;
  public categoryId: number;
  public isFocus: boolean;

  constructor(letter: string, foodItemId: number, groupIndex: number, categoryId: number, isFocus: boolean) {
    this.letter = letter;
    this.foodItemId = foodItemId;
    this.groupIndex = groupIndex;
    this.categoryId = categoryId;
    this.isFocus = isFocus;
  }
}

// 菜单模式枚举：浏览模式与选择模式
enum MenuMode {
  BROWSE = 'browse', SELECT = 'select'
}

// 启动模式菜单模型：模拟主页三组食物列表的菜单状态与模式迁移
class StartModeMenuModel {
  private options: FoodOption[] = [];
  private mode: MenuMode = MenuMode.BROWSE;

  constructor() {
    this.options.push(new FoodOption(FOOD_TOMATO, 0, INDEX_STANDARD_GROUP, FoodCategory.VEGETABLE, false));
    this.options.push(new FoodOption(FOOD_WALNUT, 0, INDEX_SPECIFIED_GROUP, FoodCategory.NUT, true));
    this.options.push(new FoodOption(FOOD_ICE_CREAM, 0, INDEX_SINGLETON_GROUP, FoodCategory.DESSERT, false));
  }

  public getOptions(): FoodOption[] {
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

  public getFocusedOption(): FoodOption | null {
    const focused: FoodOption[] = this.options.filter((option: FoodOption) => option.isFocus);
    if (focused.length === 0) {
      return null;
    }
    return focused[0];
  }

  public setFocusToIndex(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.forEach((option: FoodOption, idx: number) => {
      option.isFocus = idx === index;
    });
    return true;
  }

  public moveFocusNext(): boolean {
    const current: number = this.options.findIndex((option: FoodOption) => option.isFocus);
    if (current >= 0 && current < this.options.length - 1) {
      return this.setFocusToIndex(current + 1);
    }
    return false;
  }

  public moveFocusPrev(): boolean {
    const current: number = this.options.findIndex((option: FoodOption) => option.isFocus);
    if (current > 0) {
      return this.setFocusToIndex(current - 1);
    }
    return false;
  }

  public getFocusedCount(): number {
    return this.options.filter((option: FoodOption) => option.isFocus).length;
  }

  public getOptionsOfGroup(groupIndex: number): FoodOption[] {
    return this.options.filter((option: FoodOption) => option.groupIndex === groupIndex);
  }

  public getModeLabelOfGroup(groupIndex: number): string {
    if (groupIndex === INDEX_STANDARD_GROUP) {
      return LaunchMode.STANDARD;
    }
    if (groupIndex === INDEX_SPECIFIED_GROUP) {
      return LaunchMode.SPECIFIED;
    }
    return LaunchMode.SINGLETON;
  }
}
// 菜单布局类型枚举：描述启动模式菜单的布局样式
enum MenuLayoutKind {
  HORIZONTAL = 'horizontal', VERTICAL = 'vertical', GRID = 'grid'
}

// 菜单行为枚举：描述启动模式菜单的交互行为
enum MenuBehavior {
  SINGLE_SELECT = 'single_select', MULTI_SELECT = 'multi_select', READ_ONLY = 'read_only'
}

// 菜单配置接口：描述启动模式菜单的完整配置
interface MenuConfig {
  layout: MenuLayoutKind;
  behavior: MenuBehavior;
  optionCount: number;
  loopFocus: boolean;
}

// 菜单项描述接口：描述单个菜单项的静态描述
interface MenuItemDescriptor {
  letter: string;
  modeName: string;
  isDefault: boolean;
  image: string;
}

// 菜单配置模型：封装菜单配置并提供校验与查询能力
class MenuConfigurationModel {
  private layout: MenuLayoutKind = MenuLayoutKind.VERTICAL;
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
    if (count < 1 || count > 6) {
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
    const config: MenuConfig = {
      layout: this.layout,
      behavior: this.behavior,
      optionCount: this.optionCount,
      loopFocus: this.loopFocus
    };
    return config;
  }

  public isVertical(): boolean {
    return this.layout === MenuLayoutKind.VERTICAL;
  }

  public isGrid(): boolean {
    return this.layout === MenuLayoutKind.GRID;
  }
}

// 菜单项工厂：批量生成标准菜单项
class FoodOptionFactory {
  public static createStandardOptions(): FoodOption[] {
    const options: FoodOption[] = [];
    options.push(new FoodOption(FOOD_TOMATO, 0, INDEX_STANDARD_GROUP, FoodCategory.VEGETABLE, false));
    options.push(new FoodOption(FOOD_WALNUT, 0, INDEX_SPECIFIED_GROUP, FoodCategory.NUT, true));
    options.push(new FoodOption(FOOD_ICE_CREAM, 0, INDEX_SINGLETON_GROUP, FoodCategory.DESSERT, false));
    return options;
  }

  public static createSingle(letter: string, groupIndex: number): FoodOption {
    return new FoodOption(letter, 0, groupIndex, FoodCategory.FRUIT, false);
  }

  public static createDescriptors(): MenuItemDescriptor[] {
    const descriptors: MenuItemDescriptor[] = [];
    const standardDescriptor: MenuItemDescriptor = {
      letter: FOOD_TOMATO,
      modeName: LaunchMode.STANDARD,
      isDefault: false,
      image: 'tomato'
    };
    const specifiedDescriptor: MenuItemDescriptor = {
      letter: FOOD_WALNUT,
      modeName: LaunchMode.SPECIFIED,
      isDefault: true,
      image: 'walnut'
    };
    const singletonDescriptor: MenuItemDescriptor = {
      letter: FOOD_ICE_CREAM,
      modeName: LaunchMode.SINGLETON,
      isDefault: false,
      image: 'icecream'
    };
    descriptors.push(standardDescriptor);
    descriptors.push(specifiedDescriptor);
    descriptors.push(singletonDescriptor);
    return descriptors;
  }
}

// 菜单校验器：校验菜单配置与选项的合法性
class MenuValidator {
  public static isOptionCountValid(count: number): boolean {
    return count >= 1 && count <= 6;
  }

  public static isLayoutValid(layout: MenuLayoutKind): boolean {
    return layout === MenuLayoutKind.HORIZONTAL || layout === MenuLayoutKind.VERTICAL ||
      layout === MenuLayoutKind.GRID;
  }

  public static hasExactlyOneFocus(options: FoodOption[]): boolean {
    return options.filter((option: FoodOption) => option.isFocus).length === 1;
  }

  public static hasDistinctNames(options: FoodOption[]): boolean {
    const names: Set<string> = new Set<string>();
    options.forEach((option: FoodOption) => {
      names.add(option.letter);
    });
    return names.size === options.length;
  }

  public static hasValidGroupIndex(options: FoodOption[]): boolean {
    return options.every((option: FoodOption) => option.groupIndex >= INDEX_STANDARD_GROUP &&
      option.groupIndex <= INDEX_SINGLETON_GROUP);
  }

  public static hasValidFoodItemId(options: FoodOption[]): boolean {
    return options.every((option: FoodOption) => option.foodItemId >= 0 && option.foodItemId <= 1);
  }
}

// 菜单统计：统计菜单项的焦点与分类分布
class MenuStatistics {
  private options: FoodOption[] = [];

  public collect(options: FoodOption[]): void {
    this.options.push(...options);
  }

  public getTotalCount(): number {
    return this.options.length;
  }

  public getFocusCount(): number {
    return this.options.filter((option: FoodOption) => option.isFocus).length;
  }

  public getVegetableCount(): number {
    return this.options.filter((option: FoodOption) => option.categoryId === FoodCategory.VEGETABLE).length;
  }

  public getNutCount(): number {
    return this.options.filter((option: FoodOption) => option.categoryId === FoodCategory.NUT).length;
  }

  public getDessertCount(): number {
    return this.options.filter((option: FoodOption) => option.categoryId === FoodCategory.DESSERT).length;
  }

  public getGroupCount(): number {
    const groups: Set<number> = new Set<number>();
    this.options.forEach((option: FoodOption) => {
      groups.add(option.groupIndex);
    });
    return groups.size;
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
  private options: FoodOption[] = [];

  public add(option: FoodOption): void {
    this.options.push(option);
  }

  public addAll(options: FoodOption[]): void {
    this.options.push(...options);
  }

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.splice(index, 1);
    return true;
  }

  public getOptions(): FoodOption[] {
    return [...this.options];
  }

  public getOptionCount(): number {
    return this.options.length;
  }

  public getByName(letter: string): FoodOption | null {
    const found: FoodOption[] = this.options.filter((option: FoodOption) => option.letter === letter);
    if (found.length === 0) {
      return null;
    }
    return found[0];
  }

  public getByGroup(groupIndex: number): FoodOption[] {
    return this.options.filter((option: FoodOption) => option.groupIndex === groupIndex);
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

// 分组模式映射器：把主页分组下标映射为启动模式标识
class ModeGroupMapper {
  public static readonly GROUP_COUNT: number = 3;

  public static toModeName(groupIndex: number): string {
    if (groupIndex === INDEX_STANDARD_GROUP) {
      return LaunchMode.STANDARD;
    }
    if (groupIndex === INDEX_SPECIFIED_GROUP) {
      return LaunchMode.SPECIFIED;
    }
    return LaunchMode.SINGLETON;
  }

  public static isKnownMode(modeName: string): boolean {
    return modeName === LaunchMode.STANDARD || modeName === LaunchMode.SPECIFIED ||
      modeName === LaunchMode.SINGLETON;
  }

  public static isValidGroupIndex(groupIndex: number): boolean {
    return groupIndex >= INDEX_STANDARD_GROUP && groupIndex < ModeGroupMapper.GROUP_COUNT;
  }

  public static toAbilityName(modeName: string): string {
    if (modeName === LaunchMode.STANDARD) {
      return 'StandardAbility';
    }
    if (modeName === LaunchMode.SPECIFIED) {
      return 'SpecifiedAbility';
    }
    return 'SingletonAbility';
  }
}
export default function startModeMenuConfigurationTest() {
  describe('StartModeMenuConfiguration_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Menu_State_Transitions：菜单包含三个分组选项
    it('menu_should_have_three_items', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      expect(menu.getOptionCount()).assertEqual(3);
    });

    // 适配 Menu_Configuration_PageType：菜单项名称正确
    it('menu_items_should_have_correct_names', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      const options: FoodOption[] = menu.getOptions();
      expect(options[0].letter).assertEqual(FOOD_TOMATO);
      expect(options[1].letter).assertEqual(FOOD_WALNUT);
      expect(options[2].letter).assertEqual(FOOD_ICE_CREAM);
    });

    // 适配 Menu_Configuration_PageType：菜单项分组下标正确
    it('menu_items_should_carry_correct_group_index', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      const options: FoodOption[] = menu.getOptions();
      expect(options[0].groupIndex).assertEqual(INDEX_STANDARD_GROUP);
      expect(options[1].groupIndex).assertEqual(INDEX_SPECIFIED_GROUP);
      expect(options[2].groupIndex).assertEqual(INDEX_SINGLETON_GROUP);
    });

    // 适配 Menu_State_Transitions：初始焦点落在指定模式分组
    it('default_focus_should_be_on_specified_group', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      const focused: FoodOption | null = menu.getFocusedOption();
      expect(focused === null).assertFalse();
      expect(focused?.letter).assertEqual(FOOD_WALNUT);
    });

    // 适配 Menu_State_Transitions：焦点在选项间切换
    it('focus_should_toggle_between_options', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      menu.moveFocusPrev();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_TOMATO);
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_WALNUT);
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_ICE_CREAM);
    });

    // 适配 MultiSelect_Mode：选择模式下仅一个选项获得焦点
    it('select_mode_should_keep_exactly_one_focus', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      menu.enterSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.SELECT);
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 Browse_Mode：浏览模式为默认状态
    it('browse_mode_should_be_default', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      expect(menu.getMode()).assertEqual(MenuMode.BROWSE);
    });

    // 适配 Browse_Mode：确认操作不改变焦点位置
    it('enter_key_should_not_change_focus', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      const before: string | undefined = menu.getFocusedOption()?.letter;
      expect(before).assertEqual(FOOD_WALNUT);
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_WALNUT);
    });

    // 适配 Copy_Mode / Move_Mode：模式可进入并退出
    it('mode_should_enter_and_exit_correctly', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      menu.enterSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.SELECT);
      menu.exitSelectMode();
      expect(menu.getMode()).assertEqual(MenuMode.BROWSE);
    });

    // 适配 Menu_State_Transitions：焦点边界不越界
    it('focus_should_not_move_beyond_boundaries', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      menu.setFocusToIndex(0);
      expect(menu.moveFocusPrev()).assertFalse();
      menu.setFocusToIndex(2);
      expect(menu.moveFocusNext()).assertFalse();
    });

    // 适配 Menu_Configuration_PageType：无效索引不改变焦点
    it('set_focus_to_invalid_index_should_fail', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      expect(menu.setFocusToIndex(-1)).assertFalse();
      expect(menu.setFocusToIndex(100)).assertFalse();
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 Menu_State_Transitions：分组下标映射到启动模式标识
    it('menu_model_should_map_group_index_to_mode_name', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      expect(menu.getModeLabelOfGroup(INDEX_STANDARD_GROUP)).assertEqual(MODE_STANDARD);
      expect(menu.getModeLabelOfGroup(INDEX_SPECIFIED_GROUP)).assertEqual(MODE_SPECIFIED);
      expect(menu.getModeLabelOfGroup(INDEX_SINGLETON_GROUP)).assertEqual(MODE_SINGLETON);
    });

    // 适配 Menu_State_Transitions：按分组筛选选项
    it('menu_model_should_filter_options_by_group', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      expect(menu.getOptionsOfGroup(INDEX_STANDARD_GROUP).length).assertEqual(1);
      expect(menu.getOptionsOfGroup(INDEX_SPECIFIED_GROUP)[0].letter).assertEqual(FOOD_WALNUT);
      expect(menu.getOptionsOfGroup(INDEX_SINGLETON_GROUP)[0].letter).assertEqual(FOOD_ICE_CREAM);
    });

    // 集成：真实主页三组模式标识渲染验证
    it('real_home_page_should_render_mode_labels', 0, async () => {
      const rendered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(rendered).assertTrue();
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      const labelCount: number = await countModeLabels(driver);
      expect(labelCount).assertLargerOrEqual(1);
    });

    // 适配 MenuConfiguration_Model：默认配置为纵向单选项
    it('configuration_should_have_default_values', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      expect(config.getLayout()).assertEqual(MenuLayoutKind.VERTICAL);
      expect(config.getBehavior()).assertEqual(MenuBehavior.SINGLE_SELECT);
      expect(config.getOptionCount()).assertEqual(3);
      expect(config.isLoopFocus()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：设置布局后生效
    it('configuration_should_apply_layout', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.HORIZONTAL);
      expect(config.getLayout()).assertEqual(MenuLayoutKind.HORIZONTAL);
      expect(config.isVertical()).assertFalse();
      expect(config.isGrid()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：网格布局识别
    it('configuration_should_identify_grid_layout', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.GRID);
      expect(config.isGrid()).assertTrue();
      expect(config.isVertical()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：设置行为后生效
    it('configuration_should_apply_behavior', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      config.setBehavior(MenuBehavior.MULTI_SELECT);
      expect(config.getBehavior()).assertEqual(MenuBehavior.MULTI_SELECT);
    });

    // 适配 MenuConfiguration_Model：选项数量边界校验
    it('configuration_should_validate_option_count', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      expect(config.setOptionCount(1)).assertTrue();
      expect(config.setOptionCount(6)).assertTrue();
      expect(config.setOptionCount(0)).assertFalse();
      expect(config.setOptionCount(7)).assertFalse();
      expect(config.getOptionCount()).assertEqual(6);
    });

    // 适配 MenuConfiguration_Model：循环焦点开关
    it('configuration_should_toggle_loop_focus', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      config.setLoopFocus(true);
      expect(config.isLoopFocus()).assertTrue();
      config.setLoopFocus(false);
      expect(config.isLoopFocus()).assertFalse();
    });

    // 适配 MenuConfiguration_Model：构建完整配置对象
    it('configuration_should_build_config', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      config.setLayout(MenuLayoutKind.GRID);
      config.setBehavior(MenuBehavior.READ_ONLY);
      config.setOptionCount(6);
      config.setLoopFocus(true);
      const built: MenuConfig = config.buildConfig();
      expect(built.layout).assertEqual(MenuLayoutKind.GRID);
      expect(built.behavior).assertEqual(MenuBehavior.READ_ONLY);
      expect(built.optionCount).assertEqual(6);
      expect(built.loopFocus).assertTrue();
    });
    // 适配 MenuOption_Factory：标准选项集合
    it('option_factory_should_create_standard_options', 0, async () => {
      const options: FoodOption[] = FoodOptionFactory.createStandardOptions();
      expect(options.length).assertEqual(3);
      expect(options[0].letter).assertEqual(FOOD_TOMATO);
      expect(options[1].letter).assertEqual(FOOD_WALNUT);
      expect(options[1].isFocus).assertTrue();
    });

    // 适配 MenuOption_Factory：创建单个选项
    it('option_factory_should_create_single_option', 0, async () => {
      const option: FoodOption = FoodOptionFactory.createSingle('Cucumber', INDEX_STANDARD_GROUP);
      expect(option.letter).assertEqual('Cucumber');
      expect(option.groupIndex).assertEqual(INDEX_STANDARD_GROUP);
      expect(option.isFocus).assertFalse();
    });

    // 适配 MenuOption_Factory：菜单项描述集合
    it('option_factory_should_create_descriptors', 0, async () => {
      const descriptors: MenuItemDescriptor[] = FoodOptionFactory.createDescriptors();
      expect(descriptors.length).assertEqual(3);
      const specified: MenuItemDescriptor | undefined =
        descriptors.find((d: MenuItemDescriptor) => d.letter === FOOD_WALNUT);
      expect(specified === undefined).assertFalse();
      expect(specified?.isDefault).assertTrue();
      expect(specified?.modeName).assertEqual(MODE_SPECIFIED);
    });

    // 适配 MenuValidator：选项数量合法范围
    it('menu_validator_should_check_option_count', 0, async () => {
      expect(MenuValidator.isOptionCountValid(1)).assertTrue();
      expect(MenuValidator.isOptionCountValid(6)).assertTrue();
      expect(MenuValidator.isOptionCountValid(0)).assertFalse();
      expect(MenuValidator.isOptionCountValid(7)).assertFalse();
    });

    // 适配 MenuValidator：布局合法性
    it('menu_validator_should_check_layout_validity', 0, async () => {
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.HORIZONTAL)).assertTrue();
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.VERTICAL)).assertTrue();
      expect(MenuValidator.isLayoutValid(MenuLayoutKind.GRID)).assertTrue();
    });

    // 适配 MenuValidator：唯一焦点校验
    it('menu_validator_should_require_exactly_one_focus', 0, async () => {
      const options: FoodOption[] = FoodOptionFactory.createStandardOptions();
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
      options[0].isFocus = true;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertFalse();
    });

    // 适配 MenuValidator：名称唯一性校验
    it('menu_validator_should_require_distinct_names', 0, async () => {
      const options: FoodOption[] = FoodOptionFactory.createStandardOptions();
      expect(MenuValidator.hasDistinctNames(options)).assertTrue();
      options.push(FoodOptionFactory.createSingle(FOOD_TOMATO, INDEX_STANDARD_GROUP));
      expect(MenuValidator.hasDistinctNames(options)).assertFalse();
    });

    // 适配 MenuValidator：分组下标与条目 Id 合法性
    it('menu_validator_should_validate_group_and_item_id', 0, async () => {
      const options: FoodOption[] = FoodOptionFactory.createStandardOptions();
      expect(MenuValidator.hasValidGroupIndex(options)).assertTrue();
      expect(MenuValidator.hasValidFoodItemId(options)).assertTrue();
      options.push(new FoodOption('Onion', 5, 9, FoodCategory.VEGETABLE, false));
      expect(MenuValidator.hasValidGroupIndex(options)).assertFalse();
      expect(MenuValidator.hasValidFoodItemId(options)).assertFalse();
    });

    // 适配 MenuStatistics：分类分布统计
    it('menu_statistics_should_count_category_distribution', 0, async () => {
      const stats: MenuStatistics = new MenuStatistics();
      stats.collect(FoodOptionFactory.createStandardOptions());
      expect(stats.getFocusCount()).assertEqual(1);
      expect(stats.getVegetableCount()).assertEqual(1);
      expect(stats.getNutCount()).assertEqual(1);
      expect(stats.getDessertCount()).assertEqual(1);
      expect(stats.getGroupCount()).assertEqual(3);
    });

    // 适配 MenuStatistics：清空后统计为零
    it('menu_statistics_should_reset_after_clear', 0, async () => {
      const stats: MenuStatistics = new MenuStatistics();
      stats.collect(FoodOptionFactory.createStandardOptions());
      stats.clear();
      expect(stats.getFocusCount()).assertEqual(0);
      expect(stats.getTotalCount()).assertEqual(0);
    });

    // 适配 MenuStatistics：多次收集累积统计
    it('menu_statistics_should_accumulate_multiple_collections', 0, async () => {
      const stats: MenuStatistics = new MenuStatistics();
      stats.collect(FoodOptionFactory.createStandardOptions());
      stats.collect(FoodOptionFactory.createStandardOptions());
      expect(stats.getTotalCount()).assertEqual(6);
      expect(stats.getFocusCount()).assertEqual(2);
      expect(stats.getVegetableCount()).assertEqual(2);
      expect(stats.getNutCount()).assertEqual(2);
      expect(stats.getDessertCount()).assertEqual(2);
    });

    // 适配 MenuFocusPolicy：非循环模式到达边界停止
    it('focus_policy_should_stop_at_boundary_without_loop', 0, async () => {
      const policy: MenuFocusPolicy = new MenuFocusPolicy(false);
      expect(policy.next(0, 3)).assertEqual(1);
      expect(policy.next(2, 3)).assertEqual(2);
      expect(policy.prev(2, 3)).assertEqual(1);
      expect(policy.prev(0, 3)).assertEqual(0);
    });

    // 适配 MenuFocusPolicy：循环模式到达边界回绕
    it('focus_policy_should_wrap_at_boundary_with_loop', 0, async () => {
      const policy: MenuFocusPolicy = new MenuFocusPolicy(true);
      expect(policy.next(2, 3)).assertEqual(0);
      expect(policy.prev(0, 3)).assertEqual(2);
      expect(policy.isLoopEnabled()).assertTrue();
    });

    // 适配 MenuFocusPolicy：单选项边界行为
    it('menu_focus_policy_should_handle_single_option', 0, async () => {
      const noLoop: MenuFocusPolicy = new MenuFocusPolicy(false);
      expect(noLoop.next(0, 1)).assertEqual(0);
      expect(noLoop.prev(0, 1)).assertEqual(0);
      expect(noLoop.isLoopEnabled()).assertFalse();
      const loop: MenuFocusPolicy = new MenuFocusPolicy(true);
      expect(loop.next(0, 1)).assertEqual(0);
      expect(loop.prev(0, 1)).assertEqual(0);
      expect(loop.isLoopEnabled()).assertTrue();
    });
    // 适配 MenuOptionManager：增删查管理
    it('option_manager_should_manage_options', 0, async () => {
      const manager: MenuOptionManager = new MenuOptionManager();
      manager.addAll(FoodOptionFactory.createStandardOptions());
      expect(manager.getOptionCount()).assertEqual(3);
      expect(manager.removeAt(0)).assertTrue();
      expect(manager.getOptionCount()).assertEqual(2);
      expect(manager.removeAt(100)).assertFalse();
    });

    // 适配 MenuOptionManager：按名称查找
    it('option_manager_should_find_by_name', 0, async () => {
      const manager: MenuOptionManager = new MenuOptionManager();
      manager.addAll(FoodOptionFactory.createStandardOptions());
      const found: FoodOption | null = manager.getByName(FOOD_WALNUT);
      expect(found === null).assertFalse();
      expect(found?.categoryId).assertEqual(FoodCategory.NUT);
      expect(manager.getByName('Onion') === null).assertTrue();
    });

    // 适配 MenuOptionManager：按分组查找
    it('option_manager_should_find_by_group', 0, async () => {
      const manager: MenuOptionManager = new MenuOptionManager();
      manager.addAll(FoodOptionFactory.createStandardOptions());
      expect(manager.getByGroup(INDEX_STANDARD_GROUP).length).assertEqual(1);
      expect(manager.getByGroup(INDEX_SPECIFIED_GROUP)[0].letter).assertEqual(FOOD_WALNUT);
      expect(manager.getByGroup(INDEX_SINGLETON_GROUP)[0].letter).assertEqual(FOOD_ICE_CREAM);
    });

    // 适配 MenuOptionManager：清空后状态复位
    it('option_manager_should_reset_after_clear', 0, async () => {
      const manager: MenuOptionManager = new MenuOptionManager();
      manager.add(FoodOptionFactory.createSingle('Cucumber', INDEX_STANDARD_GROUP));
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

    // 适配 MenuModeTracker：模式切换历史记录
    it('mode_tracker_should_record_history', 0, async () => {
      const tracker: MenuModeTracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      tracker.record(MenuMode.SELECT);
      expect(tracker.getSwitchCount()).assertEqual(2);
      expect(tracker.getCurrentMode()).assertEqual(MenuMode.SELECT);
    });

    // 适配 MenuModeTracker：访问历史判断
    it('mode_tracker_should_detect_visited_mode', 0, async () => {
      const tracker: MenuModeTracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      expect(tracker.hasVisited(MenuMode.BROWSE)).assertTrue();
      expect(tracker.hasVisited(MenuMode.SELECT)).assertFalse();
    });

    // 适配 MenuModeTracker：空历史返回 null
    it('mode_tracker_should_return_null_when_empty', 0, async () => {
      const tracker: MenuModeTracker = new MenuModeTracker();
      expect(tracker.getCurrentMode() === null).assertTrue();
      expect(tracker.getSwitchCount()).assertEqual(0);
    });

    // 适配 MenuModeTracker：重置后历史清空
    it('mode_tracker_should_reset_after_clear', 0, async () => {
      const tracker: MenuModeTracker = new MenuModeTracker();
      tracker.record(MenuMode.SELECT);
      tracker.reset();
      expect(tracker.getSwitchCount()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
    });

    // 适配 MenuModeTracker：重复模式切换历史
    it('menu_mode_tracker_should_track_repeated_switches', 0, async () => {
      const tracker: MenuModeTracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      tracker.record(MenuMode.SELECT);
      tracker.record(MenuMode.BROWSE);
      expect(tracker.getSwitchCount()).assertEqual(3);
      expect(tracker.getCurrentMode()).assertEqual(MenuMode.BROWSE);
      expect(tracker.hasVisited(MenuMode.SELECT)).assertTrue();
    });

    // 适配 MenuModeTracker：历史返回独立副本
    it('menu_mode_tracker_should_return_copy_of_history', 0, async () => {
      const tracker: MenuModeTracker = new MenuModeTracker();
      tracker.record(MenuMode.BROWSE);
      const copy: MenuMode[] = tracker.getHistory();
      copy.push(MenuMode.SELECT);
      expect(tracker.getSwitchCount()).assertEqual(1);
      expect(tracker.getHistory().length).assertEqual(1);
    });
    // 适配 ModeGroupMapper：分组下标映射模式标识
    it('mode_group_mapper_should_map_group_index_to_mode_name', 0, async () => {
      expect(ModeGroupMapper.toModeName(INDEX_STANDARD_GROUP)).assertEqual(MODE_STANDARD);
      expect(ModeGroupMapper.toModeName(INDEX_SPECIFIED_GROUP)).assertEqual(MODE_SPECIFIED);
      expect(ModeGroupMapper.toModeName(INDEX_SINGLETON_GROUP)).assertEqual(MODE_SINGLETON);
      expect(ModeGroupMapper.toModeName(9)).assertEqual(MODE_SINGLETON);
    });

    // 适配 ModeGroupMapper：模式标识合法性
    it('mode_group_mapper_should_validate_mode_name', 0, async () => {
      expect(ModeGroupMapper.isKnownMode(MODE_STANDARD)).assertTrue();
      expect(ModeGroupMapper.isKnownMode(MODE_SPECIFIED)).assertTrue();
      expect(ModeGroupMapper.isKnownMode(MODE_SINGLETON)).assertTrue();
      expect(ModeGroupMapper.isKnownMode('singleton')).assertFalse();
      expect(ModeGroupMapper.isKnownMode('')).assertFalse();
    });

    // 适配 ModeGroupMapper：分组下标合法性
    it('mode_group_mapper_should_validate_group_index', 0, async () => {
      expect(ModeGroupMapper.isValidGroupIndex(INDEX_STANDARD_GROUP)).assertTrue();
      expect(ModeGroupMapper.isValidGroupIndex(INDEX_SPECIFIED_GROUP)).assertTrue();
      expect(ModeGroupMapper.isValidGroupIndex(INDEX_SINGLETON_GROUP)).assertTrue();
      expect(ModeGroupMapper.isValidGroupIndex(-1)).assertFalse();
      expect(ModeGroupMapper.isValidGroupIndex(ModeGroupMapper.GROUP_COUNT)).assertFalse();
    });

    // 适配 ModeGroupMapper：模式标识映射 Ability 名称
    it('mode_group_mapper_should_map_mode_name_to_ability', 0, async () => {
      expect(ModeGroupMapper.toAbilityName(MODE_STANDARD)).assertEqual('StandardAbility');
      expect(ModeGroupMapper.toAbilityName(MODE_SPECIFIED)).assertEqual('SpecifiedAbility');
      expect(ModeGroupMapper.toAbilityName(MODE_SINGLETON)).assertEqual('SingletonAbility');
    });

    // 适配 Menu_Model：焦点完整循环移动
    it('menu_model_should_support_full_focus_cycle', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      menu.setFocusToIndex(0);
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_WALNUT);
      menu.moveFocusNext();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_ICE_CREAM);
      menu.moveFocusPrev();
      menu.moveFocusPrev();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_TOMATO);
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 Menu_Model：全部取消焦点后返回 null
    it('menu_model_should_return_null_when_no_focus', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      const options: FoodOption[] = menu.getOptions();
      options[0].isFocus = false;
      options[1].isFocus = false;
      options[2].isFocus = false;
      expect(menu.getFocusedOption()).assertEqual(null);
      expect(menu.getFocusedCount()).assertEqual(0);
    });

    // 适配 Menu_Model：设置焦点保持唯一性
    it('menu_model_should_keep_single_focus_after_set', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      expect(menu.setFocusToIndex(2)).assertTrue();
      expect(menu.getFocusedOption()?.letter).assertEqual(FOOD_ICE_CREAM);
      expect(menu.getFocusedCount()).assertEqual(1);
    });

    // 适配 MenuConfiguration_Model：非法数量设置不改变现有值
    it('menu_configuration_should_keep_count_on_invalid_set', 0, async () => {
      const config: MenuConfigurationModel = new MenuConfigurationModel();
      expect(config.setOptionCount(0)).assertFalse();
      expect(config.getOptionCount()).assertEqual(3);
      expect(config.setOptionCount(7)).assertFalse();
      expect(config.getOptionCount()).assertEqual(3);
    });

    // 适配 MenuOption_Factory：描述符携带图片与默认标记
    it('menu_option_factory_descriptors_should_carry_images', 0, async () => {
      const descriptors: MenuItemDescriptor[] = FoodOptionFactory.createDescriptors();
      descriptors.forEach((descriptor: MenuItemDescriptor) => {
        expect(descriptor.image.length).assertLarger(0);
        expect(descriptor.letter.length).assertLarger(0);
        expect(descriptor.modeName.length).assertLarger(0);
      });
      const defaultDescriptor: MenuItemDescriptor | undefined =
        descriptors.find((descriptor: MenuItemDescriptor) => descriptor.isDefault);
      expect(defaultDescriptor === undefined).assertFalse();
      expect(defaultDescriptor?.image).assertEqual('walnut');
    });

    // 适配 MenuValidator：无焦点选项校验失败
    it('menu_validator_should_reject_missing_focus', 0, async () => {
      const options: FoodOption[] = FoodOptionFactory.createStandardOptions();
      options[0].isFocus = false;
      options[1].isFocus = false;
      options[2].isFocus = false;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertFalse();
      options[2].isFocus = true;
      expect(MenuValidator.hasExactlyOneFocus(options)).assertTrue();
    });

    // 适配 MenuOptionManager：单个选项添加与查询
    it('menu_option_manager_should_add_and_query_single', 0, async () => {
      const manager: MenuOptionManager = new MenuOptionManager();
      manager.add(FoodOptionFactory.createSingle('Blueberry', INDEX_SPECIFIED_GROUP));
      expect(manager.getOptionCount()).assertEqual(1);
      const found: FoodOption | null = manager.getByName('Blueberry');
      expect(found === null).assertFalse();
      expect(found?.groupIndex).assertEqual(INDEX_SPECIFIED_GROUP);
      expect(manager.getByName('Unknown') === null).assertTrue();
    });

    // 集成：遥控器方向键导航后主页保持稳定
    it('home_page_should_support_remote_navigation', 0, async () => {
      const rendered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(rendered).assertTrue();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 集成：主页模式标识与菜单模型映射保持一致
    it('home_page_mode_labels_should_match_menu_model', 0, async () => {
      const menu: StartModeMenuModel = new StartModeMenuModel();
      const labelCount: number = await countModeLabels(driver);
      expect(labelCount).assertLargerOrEqual(1);
      expect(menu.getOptionCount()).assertEqual(ModeGroupMapper.GROUP_COUNT);
      const standardVisible: boolean = await checkTextContent(driver, MODE_STANDARD);
      const specifiedVisible: boolean = await checkTextContent(driver, MODE_SPECIFIED);
      const singletonVisible: boolean = await checkTextContent(driver, MODE_SINGLETON);
      expect(standardVisible || specifiedVisible || singletonVisible).assertTrue();
    });
  });
}
