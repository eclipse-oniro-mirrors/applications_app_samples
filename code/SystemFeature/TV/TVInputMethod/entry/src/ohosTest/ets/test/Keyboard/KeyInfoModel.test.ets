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
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  keyboardComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 电源操作类型枚举：与主工程 KeyOperation 保持一致，SUSPEND 为默认值 0
enum KeyOperationType {
  IMEOPERATION_SUSPEND = 0, IMEOPERATION_REBOOT = 1, IMEOPERATION_SHUTDOWN = 2
}

// 电源项信息模型：封装单个电源选项的图标、焦点图标、焦点状态、名称与操作类型
class KeyInfoModel {
  public icon: string;
  public onFocusIcon: string;
  public isFocus: boolean;
  public name: string;
  public operationType: number;

  constructor(icon: string, onFocusIcon: string, isFocus: boolean, name: string, operationType: number) {
    this.icon = icon;
    this.onFocusIcon = onFocusIcon;
    this.isFocus = isFocus;
    this.name = name;
    this.operationType = operationType;
  }

  // 工厂方法：以无参方式创建默认（空）电源项，用于边界场景
  public static createDefault(): KeyInfoModel {
    return new KeyInfoModel('', '', false, '', KeyOperationType.IMEOPERATION_SUSPEND);
  }

  public getDisplayName(): string {
    return this.name;
  }

  // 焦点图标选择：聚焦时返回聚焦图标，否则返回普通图标
  public getCurrentIcon(): string {
    return this.isFocus ? this.onFocusIcon : this.icon;
  }

  public setFocusState(isFocused: boolean): void {
    this.isFocus = isFocused;
  }

  public setIcon(icon: string): void {
    this.icon = icon;
  }

  public isValidOperationType(): boolean {
    return this.operationType >= KeyOperationType.IMEOPERATION_SUSPEND &&
      this.operationType <= KeyOperationType.IMEOPERATION_SHUTDOWN;
  }

  // 类型识别：判断当前电源项是否为休眠/符号/中文操作
  public isSuspend(): boolean {
    return this.operationType === KeyOperationType.IMEOPERATION_SUSPEND;
  }

  public isReboot(): boolean {
    return this.operationType === KeyOperationType.IMEOPERATION_REBOOT;
  }

  public isShutdown(): boolean {
    return this.operationType === KeyOperationType.IMEOPERATION_SHUTDOWN;
  }

  public getOperationTypeDescription(): string {
    switch (this.operationType) {
      case KeyOperationType.IMEOPERATION_SUSPEND:
        return '休眠操作';
      case KeyOperationType.IMEOPERATION_REBOOT:
        return '符号操作';
      case KeyOperationType.IMEOPERATION_SHUTDOWN:
        return '中文操作';
      default:
        return '未知操作';
    }
  }

  public clone(): KeyInfoModel {
    return new KeyInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }

  public equals(other: KeyInfoModel): boolean {
    return this.icon === other.icon && this.onFocusIcon === other.onFocusIcon && this.isFocus === other.isFocus &&
      this.name === other.name && this.operationType === other.operationType;
  }

  public toString(): string {
    return `KeyInfo{name: ${this.name}, operationType: ${this.operationType}, isFocus: ${this.isFocus}}`;
  }
}

// 电源项排序器：按操作类型排序，保证ABC、符号、中文顺序稳定
class KeyInfoSorter {
  public static sortByOperationType(items: KeyInfoModel[]): KeyInfoModel[] {
    const copied: KeyInfoModel[] = [...items];
    copied.sort((a: KeyInfoModel, b: KeyInfoModel) => a.operationType - b.operationType);
    return copied;
  }
}

// 图标主题枚举：描述电源项的图标风格
enum IconTheme {
  LIGHT = 'light', DARK = 'dark', HIGH_CONTRAST = 'high_contrast'
}

// 电源项分类枚举：描述电源项在菜单中的角色分类
enum ItemCategory {
  PRIMARY = 'primary', SECONDARY = 'secondary', DANGER = 'danger'
}

// 电源项描述接口：描述电源项的静态元数据
interface KeyInfoDescriptor {
  name: string;
  operationType: number;
  category: ItemCategory;
  theme: IconTheme;
}

// 排序标准接口：描述电源项排序的键与方向
interface SortCriteria {
  ascending: boolean;
  stable: boolean;
}

// 电源项构建器：以链式方式构建电源项模型
class KeyInfoBuilder {
  private icon: string = '';
  private onFocusIcon: string = '';
  private isFocus: boolean = false;
  private name: string = '';
  private operationType: number = KeyOperationType.IMEOPERATION_SUSPEND;

  public setIcon(icon: string): KeyInfoBuilder {
    this.icon = icon;
    return this;
  }

  public setOnFocusIcon(onFocusIcon: string): KeyInfoBuilder {
    this.onFocusIcon = onFocusIcon;
    return this;
  }

  public setFocus(isFocus: boolean): KeyInfoBuilder {
    this.isFocus = isFocus;
    return this;
  }

  public setName(name: string): KeyInfoBuilder {
    this.name = name;
    return this;
  }

  public setOperationType(operationType: number): KeyInfoBuilder {
    this.operationType = operationType;
    return this;
  }

  public build(): KeyInfoModel {
    return new KeyInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }
}

// 电源项校验器：校验电源项字段的合法性
class KeyInfoValidator {
  public static hasValidIcon(item: KeyInfoModel): boolean {
    return item.icon.length > 0;
  }

  public static hasValidName(item: KeyInfoModel): boolean {
    return item.name.length > 0;
  }

  public static hasFocusIcon(item: KeyInfoModel): boolean {
    return item.onFocusIcon.length > 0;
  }

  public static isComplete(item: KeyInfoModel): boolean {
    return KeyInfoValidator.hasValidIcon(item) && KeyInfoValidator.hasFocusIcon(item) &&
      KeyInfoValidator.hasValidName(item) && item.isValidOperationType();
  }

  public static isDefault(item: KeyInfoModel): boolean {
    return item.icon.length === 0 && item.onFocusIcon.length === 0 && item.name.length === 0 &&
      item.operationType === KeyOperationType.IMEOPERATION_SUSPEND;
  }
}

// 电源项比较器：按名称长度与操作类型比较电源项
class KeyInfoComparator {
  public static compareByNameLength(a: KeyInfoModel, b: KeyInfoModel): number {
    return a.name.length - b.name.length;
  }

  public static compareByOperationType(a: KeyInfoModel, b: KeyInfoModel): number {
    return a.operationType - b.operationType;
  }

  public static compareByFocus(a: KeyInfoModel, b: KeyInfoModel): number {
    if (a.isFocus === b.isFocus) {
      return 0;
    }
    return a.isFocus ? -1 : 1;
  }
}

// 电源项集合：管理一组电源项并支持批量操作
class KeyInfoCollection {
  private items: KeyInfoModel[] = [];

  public add(item: KeyInfoModel): void {
    this.items.push(item);
  }

  public addAll(items: KeyInfoModel[]): void {
    this.items.push(...items);
  }

  public getItems(): KeyInfoModel[] {
    return [...this.items];
  }

  public getCount(): number {
    return this.items.length;
  }

  public getByOperationType(operationType: number): KeyInfoModel[] {
    return this.items.filter((item: KeyInfoModel) => item.operationType === operationType);
  }

  public getFocusedItem(): KeyInfoModel | null {
    const focused = this.items.filter((item: KeyInfoModel) => item.isFocus);
    if (focused.length === 0) {
      return null;
    }
    return focused[0];
  }

  public clear(): void {
    this.items = [];
  }
}

// 电源项统计：统计电源项集合的类型分布
class KeyInfoStatistics {
  private items: KeyInfoModel[] = [];

  public collect(items: KeyInfoModel[]): void {
    this.items.push(...items);
  }

  public getTotalCount(): number {
    return this.items.length;
  }

  public getSuspendCount(): number {
    return this.items.filter((item: KeyInfoModel) => item.isSuspend()).length;
  }

  public getRebootCount(): number {
    return this.items.filter((item: KeyInfoModel) => item.isReboot()).length;
  }

  public getShutdownCount(): number {
    return this.items.filter((item: KeyInfoModel) => item.isShutdown()).length;
  }

  public getFocusedCount(): number {
    return this.items.filter((item: KeyInfoModel) => item.isFocus).length;
  }

  public clear(): void {
    this.items = [];
  }
}

// 电源项描述工厂：根据操作类型生成标准描述元数据
class KeyInfoDescriptorFactory {
  public static create(name: string, operationType: number, theme: IconTheme): KeyInfoDescriptor {
    let category: ItemCategory = ItemCategory.SECONDARY;
    if (operationType === KeyOperationType.IMEOPERATION_SHUTDOWN) {
      category = ItemCategory.DANGER;
    } else if (operationType === KeyOperationType.IMEOPERATION_SUSPEND) {
      category = ItemCategory.PRIMARY;
    }
    return {
      name,
      operationType,
      category,
      theme
    };
  }

  public static getCategoryName(category: ItemCategory): string {
    switch (category) {
      case ItemCategory.PRIMARY:
        return '主选项';
      case ItemCategory.SECONDARY:
        return '次选项';
      case ItemCategory.DANGER:
        return '危险选项';
      default:
        return '未知分类';
    }
  }

  public static getThemeName(theme: IconTheme): string {
    switch (theme) {
      case IconTheme.LIGHT:
        return '浅色主题';
      case IconTheme.DARK:
        return '深色主题';
      case IconTheme.HIGH_CONTRAST:
        return '高对比主题';
      default:
        return '未知主题';
    }
  }
}

// 电源项工厂：批量创建标准电源项集合
class KeyInfoFactory {
  public static createStandardSet(): KeyInfoModel[] {
    const items: KeyInfoModel[] = [];
    items.push(new KeyInfoModel('app.media.screenout', 'app.media.screenout_focus', false, 'ABC',
      KeyOperationType.IMEOPERATION_SUSPEND));
    items.push(new KeyInfoModel('app.media.reboot', 'app.media.reboot_focus', false, '符号',
      KeyOperationType.IMEOPERATION_REBOOT));
    items.push(new KeyInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '中文',
      KeyOperationType.IMEOPERATION_SHUTDOWN));
    return items;
  }

  public static createCount(count: number): KeyInfoModel[] {
    const items: KeyInfoModel[] = [];
    for (let i = 0; i < count; i++) {
      items.push(new KeyInfoModel('icon' + i, 'focus' + i, false, '选项' + i, i % 3));
    }
    return items;
  }
}

// 电源项字段提取器：从电源项集合提取指定字段
class KeyInfoFieldExtractor {
  public static extractNames(items: KeyInfoModel[]): string[] {
    const names: string[] = [];
    items.forEach((item: KeyInfoModel) => {
      names.push(item.name);
    });
    return names;
  }

  public static extractIcons(items: KeyInfoModel[]): string[] {
    const icons: string[] = [];
    items.forEach((item: KeyInfoModel) => {
      icons.push(item.icon);
    });
    return icons;
  }

  public static extractOperationTypes(items: KeyInfoModel[]): number[] {
    const types: number[] = [];
    items.forEach((item: KeyInfoModel) => {
      types.push(item.operationType);
    });
    return types;
  }

  public static extractFocused(items: KeyInfoModel[]): KeyInfoModel[] {
    return items.filter((item: KeyInfoModel) => item.isFocus);
  }
}

// 电源项排序管理器：支持多种排序策略
class KeyInfoSortManager {
  private items: KeyInfoModel[] = [];

  public setItems(items: KeyInfoModel[]): void {
    this.items = [...items];
  }

  public sortByOperationType(): KeyInfoModel[] {
    const copied: KeyInfoModel[] = [...this.items];
    copied.sort((a: KeyInfoModel, b: KeyInfoModel) => a.operationType - b.operationType);
    return copied;
  }

  public sortByNameLength(): KeyInfoModel[] {
    const copied: KeyInfoModel[] = [...this.items];
    copied.sort((a: KeyInfoModel, b: KeyInfoModel) => a.name.length - b.name.length);
    return copied;
  }

  public getItemCount(): number {
    return this.items.length;
  }

  public clear(): void {
    this.items = [];
  }
}

export default function keyInfoModelTest() {
  describe('KeyInfoModel_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 FileBean_Construction：默认构造创建空电源项
    it('default_constructor_should_create_empty_item', 0, async () => {
      const item = KeyInfoModel.createDefault();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.name).assertEqual('');
      expect(item.operationType).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);
    });

    // 适配 FileBean_Construction：带参构造正确提取字段
    it('constructor_with_params_should_extract_fields_correctly', 0, async () => {
      const item = new KeyInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '中文',
        KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(item.icon).assertEqual('app.media.shutdown');
      expect(item.onFocusIcon).assertEqual('app.media.shutdown_focus');
      expect(item.isFocus).assertTrue();
      expect(item.name).assertEqual('中文');
      expect(item.operationType).assertEqual(KeyOperationType.IMEOPERATION_SHUTDOWN);
    });

    // 适配 FileBean_Construction_Boundary：空名称与空图标
    it('empty_name_and_icon_should_be_handled', 0, async () => {
      const item = new KeyInfoModel('', '', false, '', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.getCurrentIcon()).assertEqual('');
      expect(item.isValidOperationType()).assertTrue();
    });

    // 适配 FileBean_Construction_Boundary：超长名称
    it('very_long_name_should_be_handled', 0, async () => {
      const longName: string = 'a'.repeat(1000);
      const item =
        new KeyInfoModel('icon', 'focus_icon', false, longName, KeyOperationType.IMEOPERATION_REBOOT);
      expect(item.getDisplayName().length).assertEqual(1000);
    });

    // 适配 FileBean_Construction_Boundary：特殊字符名称
    it('special_characters_name_should_be_handled', 0, async () => {
      const item =
        new KeyInfoModel('icon!@#', 'focus$%^', false, '特殊字符*()', KeyOperationType.IMEOPERATION_REBOOT);
      expect(item.getDisplayName()).assertEqual('特殊字符*()');
      expect(item.getCurrentIcon()).assertEqual('icon!@#');
    });

    // 适配 FileBean_Type_Detection：isSuspend 识别
    it('is_suspend_should_return_true_for_suspend_type', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(item.isSuspend()).assertTrue();
      expect(item.isReboot()).assertFalse();
      expect(item.isShutdown()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：isReboot 识别
    it('is_reboot_should_return_true_for_reboot_type', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '符号', KeyOperationType.IMEOPERATION_REBOOT);
      expect(item.isReboot()).assertTrue();
      expect(item.isSuspend()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：isShutdown 识别
    it('is_shutdown_should_return_true_for_shutdown_type', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(item.isShutdown()).assertTrue();
      expect(item.isReboot()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：默认项不属于任何有效操作类型
    it('default_item_should_not_be_any_valid_operation_type', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '未知', -1);
      expect(item.isSuspend()).assertFalse();
      expect(item.isReboot()).assertFalse();
      expect(item.isShutdown()).assertFalse();
      expect(item.isValidOperationType()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：默认 isFocus 为 false
    it('is_focus_should_be_false_by_default', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(item.isFocus).assertFalse();
    });

    // 适配 FileBean_Type_Detection：setFocusState 后 isFocus 为 true
    it('is_focus_should_be_true_after_set_focus_state', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
      item.setFocusState(true);
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('b');
    });

    // 适配 FileBean_Image_Dimensions：图标默认值
    it('icon_should_default_to_empty', 0, async () => {
      const item = KeyInfoModel.createDefault();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
    });

    // 适配 FileBean_Image_Dimensions：setIcon 更新图标
    it('set_icon_should_update_icon_value', 0, async () => {
      const item = new KeyInfoModel('old', 'focus', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
      item.setIcon('new_icon');
      expect(item.icon).assertEqual('new_icon');
      expect(item.getCurrentIcon()).assertEqual('new_icon');
    });

    // 适配 FileBean_Path_Operations：getCurrentIcon 反映焦点切换
    it('get_current_icon_should_reflect_focus_state', 0, async () => {
      const item = new KeyInfoModel('normal', 'focus', false, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(item.getCurrentIcon()).assertEqual('normal');
      item.setFocusState(true);
      expect(item.getCurrentIcon()).assertEqual('focus');
    });

    // 适配 FileBean_toString：toString 包含关键字段
    it('to_string_should_contain_key_fields', 0, async () => {
      const item = new KeyInfoModel('a', 'b', true, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      const str: string = item.toString();
      expect(str.includes('中文')).assertTrue();
      expect(str.includes('2')).assertTrue();
      expect(str.includes('true')).assertTrue();
    });

    // 适配 FileBean_Immutability / Data_Consistency：名称与操作类型不可变
    it('name_and_operation_type_should_be_immutable', 0, async () => {
      const item = new KeyInfoModel('a', 'b', false, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      const nameBefore: string = item.name;
      const typeBefore: number = item.operationType;
      item.setFocusState(true);
      item.setIcon('changed');
      expect(item.name).assertEqual(nameBefore);
      expect(item.operationType).assertEqual(typeBefore);
    });

    // 适配 FileBean_Integration_Scenarios：中文项链路正确
    it('shutdown_item_integration_chain_should_be_correct', 0, async () => {
      const item = new KeyInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '中文',
        KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(item.isShutdown()).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.shutdown_focus');
      expect(item.getOperationTypeDescription()).assertEqual('中文操作');
    });

    // 适配 FileBean_Integration_Scenarios：息屏项链路正确
    it('suspend_item_integration_chain_should_be_correct', 0, async () => {
      const item = new KeyInfoModel('app.media.screenout', 'app.media.screenout_focus', false, 'ABC',
        KeyOperationType.IMEOPERATION_SUSPEND);
      expect(item.isSuspend()).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.screenout');
      expect(item.getOperationTypeDescription()).assertEqual('休眠操作');
    });

    // 适配 FileBean_Edge_Regression：空字符串名称
    it('empty_name_should_not_crash', 0, async () => {
      const item = new KeyInfoModel('', '', false, '', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.toString().includes('name')).assertTrue();
    });

    // 适配 FileBean_Sorting：按操作类型排序
    it('items_should_sort_by_operation_type', 0, async () => {
      const reboot = new KeyInfoModel('r', 'rf', false, '符号', KeyOperationType.IMEOPERATION_REBOOT);
      const shutdown = new KeyInfoModel('s', 'sf', false, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      const suspend = new KeyInfoModel('p', 'pf', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      const sorted = KeyInfoSorter.sortByOperationType([shutdown, reboot, suspend]);
      expect(sorted[0].operationType).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);
      expect(sorted[1].operationType).assertEqual(KeyOperationType.IMEOPERATION_REBOOT);
      expect(sorted[2].operationType).assertEqual(KeyOperationType.IMEOPERATION_SHUTDOWN);
    });

    // 适配 FileBean_Edge_Regression：克隆独立副本
    it('clone_should_create_independent_copy', 0, async () => {
      const original = new KeyInfoModel('a', 'b', true, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      const cloned = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.setFocusState(false);
      expect(original.isFocus).assertTrue();
      expect(cloned.isFocus).assertFalse();
    });

    // 适配 ItemBuilder_Chain：构建器链式设置图标
    it('builder_should_set_icon_via_chain', 0, async () => {
      const item: KeyInfoModel = new KeyInfoBuilder().setIcon('app.media.screenout').build();
      expect(item.icon).assertEqual('app.media.screenout');
      expect(item.getDisplayName()).assertEqual('');
    });

    // 适配 ItemBuilder_Chain：构建器链式设置焦点图标
    it('builder_should_set_focus_icon_via_chain', 0, async () => {
      const item: KeyInfoModel = new KeyInfoBuilder().setOnFocusIcon('app.media.screenout_focus').build();
      expect(item.onFocusIcon).assertEqual('app.media.screenout_focus');
    });

    // 适配 ItemBuilder_Chain：构建器链式设置名称
    it('builder_should_set_name_via_chain', 0, async () => {
      const item: KeyInfoModel = new KeyInfoBuilder().setName('中文').build();
      expect(item.name).assertEqual('中文');
      expect(item.getDisplayName()).assertEqual('中文');
    });

    // 适配 ItemBuilder_Chain：构建器链式设置操作类型
    it('builder_should_set_operation_type_via_chain', 0, async () => {
      const item: KeyInfoModel =
        new KeyInfoBuilder().setOperationType(KeyOperationType.IMEOPERATION_SHUTDOWN).build();
      expect(item.operationType).assertEqual(KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(item.isShutdown()).assertTrue();
    });

    // 适配 ItemBuilder_Chain：构建器链式设置焦点状态
    it('builder_should_set_focus_state_via_chain', 0, async () => {
      const item: KeyInfoModel = new KeyInfoBuilder().setFocus(true).build();
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('');
    });

    // 适配 ItemBuilder_Default：构建器默认值为空字段
    it('builder_should_produce_default_when_no_setter', 0, async () => {
      const item: KeyInfoModel = new KeyInfoBuilder().build();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.name).assertEqual('');
      expect(item.operationType).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);
    });

    // 适配 ItemBuilder_Full：完整构建中文项
    it('builder_should_build_full_shutdown_item', 0, async () => {
      const item: KeyInfoModel = new KeyInfoBuilder().setIcon('app.media.shutdown')
        .setOnFocusIcon('app.media.shutdown_focus')
        .setFocus(true)
        .setName('中文')
        .setOperationType(KeyOperationType.IMEOPERATION_SHUTDOWN)
        .build();
      expect(item.isShutdown()).assertTrue();
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.shutdown_focus');
    });

    // 适配 ItemValidator：图标有效性校验
    it('validator_should_validate_icon', 0, async () => {
      const valid = new KeyInfoModel('icon', 'focus', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      const invalid = KeyInfoModel.createDefault();
      expect(KeyInfoValidator.hasValidIcon(valid)).assertTrue();
      expect(KeyInfoValidator.hasValidIcon(invalid)).assertFalse();
    });

    // 适配 ItemValidator：名称有效性校验
    it('validator_should_validate_name', 0, async () => {
      const valid = new KeyInfoModel('icon', 'focus', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(KeyInfoValidator.hasValidName(valid)).assertTrue();
      expect(KeyInfoValidator.hasValidName(KeyInfoModel.createDefault())).assertFalse();
    });

    // 适配 ItemValidator：焦点图标有效性校验
    it('validator_should_validate_focus_icon', 0, async () => {
      const valid = new KeyInfoModel('icon', 'focus', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(KeyInfoValidator.hasFocusIcon(valid)).assertTrue();
      expect(KeyInfoValidator.hasFocusIcon(KeyInfoModel.createDefault())).assertFalse();
    });

    // 适配 ItemValidator：完整定义校验
    it('validator_should_confirm_complete_item', 0, async () => {
      const valid = new KeyInfoModel('icon', 'focus', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(KeyInfoValidator.isComplete(valid)).assertTrue();
      expect(KeyInfoValidator.isComplete(KeyInfoModel.createDefault())).assertFalse();
    });

    // 适配 ItemValidator：默认项识别
    it('validator_should_identify_default_item', 0, async () => {
      const defaultItem = KeyInfoModel.createDefault();
      const normal = new KeyInfoModel('icon', 'focus', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(KeyInfoValidator.isDefault(defaultItem)).assertTrue();
      expect(KeyInfoValidator.isDefault(normal)).assertFalse();
    });

    // 适配 ItemValidator：非法操作类型导致不完整
    it('validator_should_reject_invalid_operation_type', 0, async () => {
      const invalid = new KeyInfoModel('icon', 'focus', false, '未知', -1);
      expect(KeyInfoValidator.isComplete(invalid)).assertFalse();
    });

    // 适配 ItemComparator：按名称长度比较
    it('comparator_should_compare_by_name_length', 0, async () => {
      const short = new KeyInfoModel('a', 'b', false, '短', KeyOperationType.IMEOPERATION_SUSPEND);
      const long = new KeyInfoModel('a', 'b', false, '比较长的名称', KeyOperationType.IMEOPERATION_REBOOT);
      expect(KeyInfoComparator.compareByNameLength(short, long)).assertLessOrEqual(-1);
      expect(KeyInfoComparator.compareByNameLength(long, short)).assertLargerOrEqual(1);
    });

    // 适配 ItemComparator：按操作类型比较
    it('comparator_should_compare_by_operation_type', 0, async () => {
      const suspend = new KeyInfoModel('a', 'b', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      const shutdown = new KeyInfoModel('a', 'b', false, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(KeyInfoComparator.compareByOperationType(suspend, shutdown)).assertLessOrEqual(-1);
      expect(KeyInfoComparator.compareByOperationType(shutdown, suspend)).assertLargerOrEqual(1);
    });

    // 适配 ItemComparator：按焦点状态比较
    it('comparator_should_compare_by_focus', 0, async () => {
      const focused = new KeyInfoModel('a', 'b', true, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);
      const unfocused = new KeyInfoModel('a', 'b', false, 'ABC', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(KeyInfoComparator.compareByFocus(focused, unfocused)).assertEqual(-1);
      expect(KeyInfoComparator.compareByFocus(unfocused, focused)).assertEqual(1);
      expect(KeyInfoComparator.compareByFocus(focused, focused)).assertEqual(0);
    });

    // 适配 ItemCollection：添加与数量统计
    it('collection_should_add_and_count_items', 0, async () => {
      const collection = new KeyInfoCollection();
      collection.add(KeyInfoFactory.createStandardSet()[0]);
      collection.add(KeyInfoFactory.createStandardSet()[1]);
      expect(collection.getCount()).assertEqual(2);
    });

    // 适配 ItemCollection：批量添加
    it('collection_should_add_all_items', 0, async () => {
      const collection = new KeyInfoCollection();
      collection.addAll(KeyInfoFactory.createStandardSet());
      expect(collection.getCount()).assertEqual(3);
    });

    // 适配 ItemCollection：按操作类型筛选
    it('collection_should_filter_by_operation_type', 0, async () => {
      const collection = new KeyInfoCollection();
      collection.addAll(KeyInfoFactory.createStandardSet());
      const shutdownItems: KeyInfoModel[] =
        collection.getByOperationType(KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(shutdownItems.length).assertEqual(1);
      expect(shutdownItems[0].isShutdown()).assertTrue();
    });

    // 适配 ItemCollection：获取焦点项
    it('collection_should_return_focused_item', 0, async () => {
      const collection = new KeyInfoCollection();
      collection.addAll(KeyInfoFactory.createStandardSet());
      const focused: KeyInfoModel | null = collection.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(focused?.isFocus).assertTrue();
      expect(focused?.name).assertEqual('中文');
    });

    // 适配 ItemCollection：无焦点项返回 null
    it('collection_should_return_null_without_focused_item', 0, async () => {
      const collection = new KeyInfoCollection();
      collection.add(KeyInfoFactory.createStandardSet()[0]);
      collection.add(KeyInfoFactory.createStandardSet()[1]);
      expect(collection.getFocusedItem() === null).assertTrue();
    });

    // 适配 ItemCollection：清空后计数为零
    it('collection_should_reset_after_clear', 0, async () => {
      const collection = new KeyInfoCollection();
      collection.addAll(KeyInfoFactory.createStandardSet());
      collection.clear();
      expect(collection.getCount()).assertEqual(0);
      expect(collection.getItems().length).assertEqual(0);
    });

    // 适配 ItemStatistics：类型分布统计
    it('statistics_should_count_type_distribution', 0, async () => {
      const stats = new KeyInfoStatistics();
      stats.collect(KeyInfoFactory.createStandardSet());
      expect(stats.getSuspendCount()).assertEqual(1);
      expect(stats.getRebootCount()).assertEqual(1);
      expect(stats.getShutdownCount()).assertEqual(1);
    });

    // 适配 ItemStatistics：焦点项统计
    it('statistics_should_count_focused_items', 0, async () => {
      const stats = new KeyInfoStatistics();
      stats.collect(KeyInfoFactory.createStandardSet());
      expect(stats.getFocusedCount()).assertEqual(1);
    });

    // 适配 ItemStatistics：清空后统计为零
    it('statistics_should_reset_after_clear', 0, async () => {
      const stats = new KeyInfoStatistics();
      stats.collect(KeyInfoFactory.createStandardSet());
      stats.clear();
      expect(stats.getSuspendCount()).assertEqual(0);
    });

    // 适配 ItemStatistics：批量收集累积统计
    it('statistics_should_accumulate_collect', 0, async () => {
      const stats = new KeyInfoStatistics();
      stats.collect(KeyInfoFactory.createStandardSet());
      stats.collect(KeyInfoFactory.createStandardSet());
      expect(stats.getShutdownCount()).assertEqual(2);
    });

    // 适配 DescriptorFactory：中文项分类为危险
    it('descriptor_factory_should_categorize_shutdown_as_danger', 0, async () => {
      const descriptor: KeyInfoDescriptor =
        KeyInfoDescriptorFactory.create('中文', KeyOperationType.IMEOPERATION_SHUTDOWN, IconTheme.DARK);
      expect(descriptor.category).assertEqual(ItemCategory.DANGER);
      expect(descriptor.operationType).assertEqual(KeyOperationType.IMEOPERATION_SHUTDOWN);
    });

    // 适配 DescriptorFactory：ABC项分类为主选项
    it('descriptor_factory_should_categorize_suspend_as_primary', 0, async () => {
      const descriptor: KeyInfoDescriptor =
        KeyInfoDescriptorFactory.create('ABC', KeyOperationType.IMEOPERATION_SUSPEND, IconTheme.LIGHT);
      expect(descriptor.category).assertEqual(ItemCategory.PRIMARY);
      expect(descriptor.theme).assertEqual(IconTheme.LIGHT);
    });

    // 适配 DescriptorFactory：符号项分类为次选项
    it('descriptor_factory_should_categorize_reboot_as_secondary', 0, async () => {
      const descriptor: KeyInfoDescriptor =
        KeyInfoDescriptorFactory.create('符号', KeyOperationType.IMEOPERATION_REBOOT, IconTheme.HIGH_CONTRAST);
      expect(descriptor.category).assertEqual(ItemCategory.SECONDARY);
      expect(descriptor.theme).assertEqual(IconTheme.HIGH_CONTRAST);
    });

    // 适配 DescriptorFactory：分类名称映射
    it('descriptor_factory_should_map_category_names', 0, async () => {
      expect(KeyInfoDescriptorFactory.getCategoryName(ItemCategory.PRIMARY)).assertEqual('主选项');
      expect(KeyInfoDescriptorFactory.getCategoryName(ItemCategory.SECONDARY)).assertEqual('次选项');
      expect(KeyInfoDescriptorFactory.getCategoryName(ItemCategory.DANGER)).assertEqual('危险选项');
    });

    // 适配 DescriptorFactory：主题名称映射
    it('descriptor_factory_should_map_theme_names', 0, async () => {
      expect(KeyInfoDescriptorFactory.getThemeName(IconTheme.LIGHT)).assertEqual('浅色主题');
      expect(KeyInfoDescriptorFactory.getThemeName(IconTheme.DARK)).assertEqual('深色主题');
      expect(KeyInfoDescriptorFactory.getThemeName(IconTheme.HIGH_CONTRAST)).assertEqual('高对比主题');
    });

    // 适配 ItemInfoFactory：标准集包含三个操作
    it('item_factory_should_create_standard_set', 0, async () => {
      const items: KeyInfoModel[] = KeyInfoFactory.createStandardSet();
      expect(items.length).assertEqual(3);
      expect(items[0].isSuspend()).assertTrue();
      expect(items[1].isReboot()).assertTrue();
      expect(items[2].isShutdown()).assertTrue();
    });

    // 适配 ItemInfoFactory：按数量创建集合
    it('item_factory_should_create_count_items', 0, async () => {
      const items: KeyInfoModel[] = KeyInfoFactory.createCount(5);
      expect(items.length).assertEqual(5);
      expect(items[0].getDisplayName()).assertEqual('选项0');
      expect(items[4].getDisplayName()).assertEqual('选项4');
    });

    // 适配 FieldExtractor：提取名称列表
    it('field_extractor_should_extract_names', 0, async () => {
      const names: string[] = KeyInfoFieldExtractor.extractNames(KeyInfoFactory.createStandardSet());
      expect(names.length).assertEqual(3);
      expect(names.includes('ABC')).assertTrue();
      expect(names.includes('符号')).assertTrue();
      expect(names.includes('中文')).assertTrue();
    });

    // 适配 FieldExtractor：提取图标列表
    it('field_extractor_should_extract_icons', 0, async () => {
      const icons: string[] = KeyInfoFieldExtractor.extractIcons(KeyInfoFactory.createStandardSet());
      expect(icons.length).assertEqual(3);
      expect(icons[0]).assertEqual('app.media.screenout');
    });

    // 适配 FieldExtractor：提取操作类型列表
    it('field_extractor_should_extract_operation_types', 0, async () => {
      const types: number[] = KeyInfoFieldExtractor.extractOperationTypes(KeyInfoFactory.createStandardSet());
      expect(types.length).assertEqual(3);
      expect(types[0]).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);
      expect(types[2]).assertEqual(KeyOperationType.IMEOPERATION_SHUTDOWN);
    });

    // 适配 FieldExtractor：提取焦点项列表
    it('field_extractor_should_extract_focused_items', 0, async () => {
      const focused: KeyInfoModel[] =
        KeyInfoFieldExtractor.extractFocused(KeyInfoFactory.createStandardSet());
      expect(focused.length).assertEqual(1);
      expect(focused[0].name).assertEqual('中文');
    });

    // 适配 SortManager：按操作类型排序
    it('sort_manager_should_sort_by_operation_type', 0, async () => {
      const manager = new KeyInfoSortManager();
      manager.setItems(KeyInfoFactory.createStandardSet());
      const sorted: KeyInfoModel[] = manager.sortByOperationType();
      expect(sorted[0].isSuspend()).assertTrue();
      expect(sorted[1].isReboot()).assertTrue();
      expect(sorted[2].isShutdown()).assertTrue();
    });

    // 适配 SortManager：按名称长度排序
    it('sort_manager_should_sort_by_name_length', 0, async () => {
      const manager = new KeyInfoSortManager();
      manager.setItems(KeyInfoFactory.createStandardSet());
      const sorted: KeyInfoModel[] = manager.sortByNameLength();
      expect(sorted.length).assertEqual(3);
    });

    // 适配 SortManager：条目计数与清空
    it('sort_manager_should_count_and_clear', 0, async () => {
      const manager = new KeyInfoSortManager();
      manager.setItems(KeyInfoFactory.createStandardSet());
      expect(manager.getItemCount()).assertEqual(3);
      manager.clear();
      expect(manager.getItemCount()).assertEqual(0);
    });
  });
}
