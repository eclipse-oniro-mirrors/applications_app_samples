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
  pageComponentCount,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/CustomViewTestDriver';

// 页签操作类型枚举：与主工程 CustomViewOperation 保持一致，SUSPEND 为默认值 0
enum CustomViewOperationType {
  CUSTOM_VIEWOPERATION_SUSPEND = 0, CUSTOM_VIEWOPERATION_REBOOT = 1, CUSTOM_VIEWOPERATION_SHUTDOWN = 2
}

// 页签项信息模型：封装单个页签选项的图标、焦点图标、焦点状态、名称与操作类型
class CustomViewItemInfoModel {
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

  // 工厂方法：以无参方式创建默认（空）页签项，用于边界场景
  public static createDefault(): CustomViewItemInfoModel {
    return new CustomViewItemInfoModel('', '', false, '', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
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
    return this.operationType >= CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND &&
      this.operationType <= CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN;
  }

  // 类型识别：判断当前页签项是否为休眠/余票挖掘/在线换座操作
  public isSuspend(): boolean {
    return this.operationType === CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND;
  }

  public isReboot(): boolean {
    return this.operationType === CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT;
  }

  public isShutdown(): boolean {
    return this.operationType === CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN;
  }

  public getOperationTypeDescription(): string {
    switch (this.operationType) {
      case CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND:
        return '休眠操作';
      case CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT:
        return '余票挖掘操作';
      case CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN:
        return '在线换座操作';
      default:
        return '未知操作';
    }
  }

  public clone(): CustomViewItemInfoModel {
    return new CustomViewItemInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }

  public equals(other: CustomViewItemInfoModel): boolean {
    return this.icon === other.icon && this.onFocusIcon === other.onFocusIcon && this.isFocus === other.isFocus &&
      this.name === other.name && this.operationType === other.operationType;
  }

  public toString(): string {
    return `CustomViewItemInfo{name: ${this.name}, operationType: ${this.operationType}, isFocus: ${this.isFocus}}`;
  }
}

// 页签项排序器：按操作类型排序，保证候补预测、余票挖掘、在线换座顺序稳定
class CustomViewItemSorter {
  public static sortByOperationType(items: CustomViewItemInfoModel[]): CustomViewItemInfoModel[] {
    const copied: CustomViewItemInfoModel[] = [...items];
    copied.sort((a: CustomViewItemInfoModel, b: CustomViewItemInfoModel) => a.operationType - b.operationType);
    return copied;
  }
}

// 图标主题枚举：描述页签项的图标风格
enum IconTheme {
  LIGHT = 'light', DARK = 'dark', HIGH_CONTRAST = 'high_contrast'
}

// 页签项分类枚举：描述页签项在菜单中的角色分类
enum ItemCategory {
  PRIMARY = 'primary', SECONDARY = 'secondary', DANGER = 'danger'
}

// 页签项描述接口：描述页签项的静态元数据
interface CustomViewItemDescriptor {
  name: string;
  operationType: number;
  category: ItemCategory;
  theme: IconTheme;
}

// 排序标准接口：描述页签项排序的键与方向
interface SortCriteria {
  ascending: boolean;
  stable: boolean;
}

// 页签项构建器：以链式方式构建页签项模型
class CustomViewItemInfoBuilder {
  private icon: string = '';
  private onFocusIcon: string = '';
  private isFocus: boolean = false;
  private name: string = '';
  private operationType: number = CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND;

  public setIcon(icon: string): CustomViewItemInfoBuilder {
    this.icon = icon;
    return this;
  }

  public setOnFocusIcon(onFocusIcon: string): CustomViewItemInfoBuilder {
    this.onFocusIcon = onFocusIcon;
    return this;
  }

  public setFocus(isFocus: boolean): CustomViewItemInfoBuilder {
    this.isFocus = isFocus;
    return this;
  }

  public setName(name: string): CustomViewItemInfoBuilder {
    this.name = name;
    return this;
  }

  public setOperationType(operationType: number): CustomViewItemInfoBuilder {
    this.operationType = operationType;
    return this;
  }

  public build(): CustomViewItemInfoModel {
    return new CustomViewItemInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }
}

// 页签项校验器：校验页签项字段的合法性
class CustomViewItemValidator {
  public static hasValidIcon(item: CustomViewItemInfoModel): boolean {
    return item.icon.length > 0;
  }

  public static hasValidName(item: CustomViewItemInfoModel): boolean {
    return item.name.length > 0;
  }

  public static hasFocusIcon(item: CustomViewItemInfoModel): boolean {
    return item.onFocusIcon.length > 0;
  }

  public static isComplete(item: CustomViewItemInfoModel): boolean {
    return CustomViewItemValidator.hasValidIcon(item) && CustomViewItemValidator.hasFocusIcon(item) &&
      CustomViewItemValidator.hasValidName(item) && item.isValidOperationType();
  }

  public static isDefault(item: CustomViewItemInfoModel): boolean {
    return item.icon.length === 0 && item.onFocusIcon.length === 0 && item.name.length === 0 &&
      item.operationType === CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND;
  }
}

// 页签项比较器：按名称长度与操作类型比较页签项
class CustomViewItemComparator {
  public static compareByNameLength(a: CustomViewItemInfoModel, b: CustomViewItemInfoModel): number {
    return a.name.length - b.name.length;
  }

  public static compareByOperationType(a: CustomViewItemInfoModel, b: CustomViewItemInfoModel): number {
    return a.operationType - b.operationType;
  }

  public static compareByFocus(a: CustomViewItemInfoModel, b: CustomViewItemInfoModel): number {
    if (a.isFocus === b.isFocus) {
      return 0;
    }
    return a.isFocus ? -1 : 1;
  }
}

// 页签项集合：管理一组页签项并支持批量操作
class CustomViewItemCollection {
  private items: CustomViewItemInfoModel[] = [];

  public add(item: CustomViewItemInfoModel): void {
    this.items.push(item);
  }

  public addAll(items: CustomViewItemInfoModel[]): void {
    this.items.push(...items);
  }

  public getItems(): CustomViewItemInfoModel[] {
    return [...this.items];
  }

  public getCount(): number {
    return this.items.length;
  }

  public getByOperationType(operationType: number): CustomViewItemInfoModel[] {
    return this.items.filter((item: CustomViewItemInfoModel) => item.operationType === operationType);
  }

  public getFocusedItem(): CustomViewItemInfoModel | null {
    const focused = this.items.filter((item: CustomViewItemInfoModel) => item.isFocus);
    if (focused.length === 0) {
      return null;
    }
    return focused[0];
  }

  public clear(): void {
    this.items = [];
  }
}

// 页签项统计：统计页签项集合的类型分布
class CustomViewItemStatistics {
  private items: CustomViewItemInfoModel[] = [];

  public collect(items: CustomViewItemInfoModel[]): void {
    this.items.push(...items);
  }

  public getTotalCount(): number {
    return this.items.length;
  }

  public getSuspendCount(): number {
    return this.items.filter((item: CustomViewItemInfoModel) => item.isSuspend()).length;
  }

  public getRebootCount(): number {
    return this.items.filter((item: CustomViewItemInfoModel) => item.isReboot()).length;
  }

  public getShutdownCount(): number {
    return this.items.filter((item: CustomViewItemInfoModel) => item.isShutdown()).length;
  }

  public getFocusedCount(): number {
    return this.items.filter((item: CustomViewItemInfoModel) => item.isFocus).length;
  }

  public clear(): void {
    this.items = [];
  }
}

// 页签项描述工厂：根据操作类型生成标准描述元数据
class CustomViewItemDescriptorFactory {
  public static create(name: string, operationType: number, theme: IconTheme): CustomViewItemDescriptor {
    let category: ItemCategory = ItemCategory.SECONDARY;
    if (operationType === CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN) {
      category = ItemCategory.DANGER;
    } else if (operationType === CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND) {
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

// 页签项工厂：批量创建标准页签项集合
class CustomViewItemInfoFactory {
  public static createStandardSet(): CustomViewItemInfoModel[] {
    const items: CustomViewItemInfoModel[] = [];
    items.push(new CustomViewItemInfoModel('app.media.screenout', 'app.media.screenout_focus', false, '候补预测',
      CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND));
    items.push(new CustomViewItemInfoModel('app.media.reboot', 'app.media.reboot_focus', false, '余票挖掘',
      CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT));
    items.push(new CustomViewItemInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '在线换座',
      CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN));
    return items;
  }

  public static createCount(count: number): CustomViewItemInfoModel[] {
    const items: CustomViewItemInfoModel[] = [];
    for (let i = 0; i < count; i++) {
      items.push(new CustomViewItemInfoModel('icon' + i, 'focus' + i, false, '选项' + i, i % 3));
    }
    return items;
  }
}

// 页签项字段提取器：从页签项集合提取指定字段
class CustomViewItemFieldExtractor {
  public static extractNames(items: CustomViewItemInfoModel[]): string[] {
    const names: string[] = [];
    items.forEach((item: CustomViewItemInfoModel) => {
      names.push(item.name);
    });
    return names;
  }

  public static extractIcons(items: CustomViewItemInfoModel[]): string[] {
    const icons: string[] = [];
    items.forEach((item: CustomViewItemInfoModel) => {
      icons.push(item.icon);
    });
    return icons;
  }

  public static extractOperationTypes(items: CustomViewItemInfoModel[]): number[] {
    const types: number[] = [];
    items.forEach((item: CustomViewItemInfoModel) => {
      types.push(item.operationType);
    });
    return types;
  }

  public static extractFocused(items: CustomViewItemInfoModel[]): CustomViewItemInfoModel[] {
    return items.filter((item: CustomViewItemInfoModel) => item.isFocus);
  }
}

// 页签项排序管理器：支持多种排序策略
class CustomViewItemSortManager {
  private items: CustomViewItemInfoModel[] = [];

  public setItems(items: CustomViewItemInfoModel[]): void {
    this.items = [...items];
  }

  public sortByOperationType(): CustomViewItemInfoModel[] {
    const copied: CustomViewItemInfoModel[] = [...this.items];
    copied.sort((a: CustomViewItemInfoModel, b: CustomViewItemInfoModel) => a.operationType - b.operationType);
    return copied;
  }

  public sortByNameLength(): CustomViewItemInfoModel[] {
    const copied: CustomViewItemInfoModel[] = [...this.items];
    copied.sort((a: CustomViewItemInfoModel, b: CustomViewItemInfoModel) => a.name.length - b.name.length);
    return copied;
  }

  public getItemCount(): number {
    return this.items.length;
  }

  public clear(): void {
    this.items = [];
  }
}

export default function customViewItemInfoModelTest() {
  describe('CustomViewItemInfoModel_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭页签页并释放资源
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 FileBean_Construction：默认构造创建空页签项
    it('default_constructor_should_create_empty_item', 0, async () => {
      const item = CustomViewItemInfoModel.createDefault();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.name).assertEqual('');
      expect(item.operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
    });

    // 适配 FileBean_Construction：带参构造正确提取字段
    it('constructor_with_params_should_extract_fields_correctly', 0, async () => {
      const item = new CustomViewItemInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '在线换座',
        CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(item.icon).assertEqual('app.media.shutdown');
      expect(item.onFocusIcon).assertEqual('app.media.shutdown_focus');
      expect(item.isFocus).assertTrue();
      expect(item.name).assertEqual('在线换座');
      expect(item.operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
    });

    // 适配 FileBean_Construction_Boundary：空名称与空图标
    it('empty_name_and_icon_should_be_handled', 0, async () => {
      const item = new CustomViewItemInfoModel('', '', false, '', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.getCurrentIcon()).assertEqual('');
      expect(item.isValidOperationType()).assertTrue();
    });

    // 适配 FileBean_Construction_Boundary：超长名称
    it('very_long_name_should_be_handled', 0, async () => {
      const longName: string = 'a'.repeat(1000);
      const item =
        new CustomViewItemInfoModel('icon', 'focus_icon', false, longName, CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT);
      expect(item.getDisplayName().length).assertEqual(1000);
    });

    // 适配 FileBean_Construction_Boundary：特殊字符名称
    it('special_characters_name_should_be_handled', 0, async () => {
      const item =
        new CustomViewItemInfoModel('icon!@#', 'focus$%^', false, '特殊字符*()', CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT);
      expect(item.getDisplayName()).assertEqual('特殊字符*()');
      expect(item.getCurrentIcon()).assertEqual('icon!@#');
    });

    // 适配 FileBean_Type_Detection：isSuspend 识别
    it('is_suspend_should_return_true_for_suspend_type', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '息屏', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(item.isSuspend()).assertTrue();
      expect(item.isReboot()).assertFalse();
      expect(item.isShutdown()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：isReboot 识别
    it('is_reboot_should_return_true_for_reboot_type', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '余票挖掘', CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT);
      expect(item.isReboot()).assertTrue();
      expect(item.isSuspend()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：isShutdown 识别
    it('is_shutdown_should_return_true_for_shutdown_type', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(item.isShutdown()).assertTrue();
      expect(item.isReboot()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：默认项不属于任何有效操作类型
    it('default_item_should_not_be_any_valid_operation_type', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '未知', -1);
      expect(item.isSuspend()).assertFalse();
      expect(item.isReboot()).assertFalse();
      expect(item.isShutdown()).assertFalse();
      expect(item.isValidOperationType()).assertFalse();
    });

    // 适配 FileBean_Type_Detection：默认 isFocus 为 false
    it('is_focus_should_be_false_by_default', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '息屏', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(item.isFocus).assertFalse();
    });

    // 适配 FileBean_Type_Detection：setFocusState 后 isFocus 为 true
    it('is_focus_should_be_true_after_set_focus_state', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '息屏', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      item.setFocusState(true);
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('b');
    });

    // 适配 FileBean_Image_Dimensions：图标默认值
    it('icon_should_default_to_empty', 0, async () => {
      const item = CustomViewItemInfoModel.createDefault();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
    });

    // 适配 FileBean_Image_Dimensions：setIcon 更新图标
    it('set_icon_should_update_icon_value', 0, async () => {
      const item = new CustomViewItemInfoModel('old', 'focus', false, '息屏', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      item.setIcon('new_icon');
      expect(item.icon).assertEqual('new_icon');
      expect(item.getCurrentIcon()).assertEqual('new_icon');
    });

    // 适配 FileBean_Path_Operations：getCurrentIcon 反映焦点切换
    it('get_current_icon_should_reflect_focus_state', 0, async () => {
      const item = new CustomViewItemInfoModel('normal', 'focus', false, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(item.getCurrentIcon()).assertEqual('normal');
      item.setFocusState(true);
      expect(item.getCurrentIcon()).assertEqual('focus');
    });

    // 适配 FileBean_toString：toString 包含关键字段
    it('to_string_should_contain_key_fields', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', true, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      const str: string = item.toString();
      expect(str.includes('在线换座')).assertTrue();
      expect(str.includes('2')).assertTrue();
      expect(str.includes('true')).assertTrue();
    });

    // 适配 FileBean_Immutability / Data_Consistency：名称与操作类型不可变
    it('name_and_operation_type_should_be_immutable', 0, async () => {
      const item = new CustomViewItemInfoModel('a', 'b', false, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      const nameBefore: string = item.name;
      const typeBefore: number = item.operationType;
      item.setFocusState(true);
      item.setIcon('changed');
      expect(item.name).assertEqual(nameBefore);
      expect(item.operationType).assertEqual(typeBefore);
    });

    // 适配 FileBean_Integration_Scenarios：在线换座项链路正确
    it('shutdown_item_integration_chain_should_be_correct', 0, async () => {
      const item = new CustomViewItemInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '在线换座',
        CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(item.isShutdown()).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.shutdown_focus');
      expect(item.getOperationTypeDescription()).assertEqual('在线换座操作');
    });

    // 适配 FileBean_Integration_Scenarios：息屏项链路正确
    it('suspend_item_integration_chain_should_be_correct', 0, async () => {
      const item = new CustomViewItemInfoModel('app.media.screenout', 'app.media.screenout_focus', false, '候补预测',
        CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(item.isSuspend()).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.screenout');
      expect(item.getOperationTypeDescription()).assertEqual('休眠操作');
    });

    // 适配 FileBean_Edge_Regression：空字符串名称
    it('empty_name_should_not_crash', 0, async () => {
      const item = new CustomViewItemInfoModel('', '', false, '', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.toString().includes('name')).assertTrue();
    });

    // 适配 FileBean_Sorting：按操作类型排序
    it('items_should_sort_by_operation_type', 0, async () => {
      const reboot = new CustomViewItemInfoModel('r', 'rf', false, '余票挖掘', CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT);
      const shutdown = new CustomViewItemInfoModel('s', 'sf', false, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      const suspend = new CustomViewItemInfoModel('p', 'pf', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      const sorted = CustomViewItemSorter.sortByOperationType([shutdown, reboot, suspend]);
      expect(sorted[0].operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(sorted[1].operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT);
      expect(sorted[2].operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
    });

    // 适配 FileBean_Edge_Regression：克隆独立副本
    it('clone_should_create_independent_copy', 0, async () => {
      const original = new CustomViewItemInfoModel('a', 'b', true, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      const cloned = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.setFocusState(false);
      expect(original.isFocus).assertTrue();
      expect(cloned.isFocus).assertFalse();
    });

    // 适配 ItemBuilder_Chain：构建器链式设置图标
    it('builder_should_set_icon_via_chain', 0, async () => {
      const item: CustomViewItemInfoModel = new CustomViewItemInfoBuilder().setIcon('app.media.screenout').build();
      expect(item.icon).assertEqual('app.media.screenout');
      expect(item.getDisplayName()).assertEqual('');
    });

    // 适配 ItemBuilder_Chain：构建器链式设置焦点图标
    it('builder_should_set_focus_icon_via_chain', 0, async () => {
      const item: CustomViewItemInfoModel = new CustomViewItemInfoBuilder().setOnFocusIcon('app.media.screenout_focus').build();
      expect(item.onFocusIcon).assertEqual('app.media.screenout_focus');
    });

    // 适配 ItemBuilder_Chain：构建器链式设置名称
    it('builder_should_set_name_via_chain', 0, async () => {
      const item: CustomViewItemInfoModel = new CustomViewItemInfoBuilder().setName('在线换座').build();
      expect(item.name).assertEqual('在线换座');
      expect(item.getDisplayName()).assertEqual('在线换座');
    });

    // 适配 ItemBuilder_Chain：构建器链式设置操作类型
    it('builder_should_set_operation_type_via_chain', 0, async () => {
      const item: CustomViewItemInfoModel =
        new CustomViewItemInfoBuilder().setOperationType(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN).build();
      expect(item.operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(item.isShutdown()).assertTrue();
    });

    // 适配 ItemBuilder_Chain：构建器链式设置焦点状态
    it('builder_should_set_focus_state_via_chain', 0, async () => {
      const item: CustomViewItemInfoModel = new CustomViewItemInfoBuilder().setFocus(true).build();
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('');
    });

    // 适配 ItemBuilder_Default：构建器默认值为空字段
    it('builder_should_produce_default_when_no_setter', 0, async () => {
      const item: CustomViewItemInfoModel = new CustomViewItemInfoBuilder().build();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.name).assertEqual('');
      expect(item.operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
    });

    // 适配 ItemBuilder_Full：完整构建在线换座项
    it('builder_should_build_full_shutdown_item', 0, async () => {
      const item: CustomViewItemInfoModel = new CustomViewItemInfoBuilder().setIcon('app.media.shutdown')
        .setOnFocusIcon('app.media.shutdown_focus')
        .setFocus(true)
        .setName('在线换座')
        .setOperationType(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN)
        .build();
      expect(item.isShutdown()).assertTrue();
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.shutdown_focus');
    });

    // 适配 ItemValidator：图标有效性校验
    it('validator_should_validate_icon', 0, async () => {
      const valid = new CustomViewItemInfoModel('icon', 'focus', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      const invalid = CustomViewItemInfoModel.createDefault();
      expect(CustomViewItemValidator.hasValidIcon(valid)).assertTrue();
      expect(CustomViewItemValidator.hasValidIcon(invalid)).assertFalse();
    });

    // 适配 ItemValidator：名称有效性校验
    it('validator_should_validate_name', 0, async () => {
      const valid = new CustomViewItemInfoModel('icon', 'focus', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(CustomViewItemValidator.hasValidName(valid)).assertTrue();
      expect(CustomViewItemValidator.hasValidName(CustomViewItemInfoModel.createDefault())).assertFalse();
    });

    // 适配 ItemValidator：焦点图标有效性校验
    it('validator_should_validate_focus_icon', 0, async () => {
      const valid = new CustomViewItemInfoModel('icon', 'focus', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(CustomViewItemValidator.hasFocusIcon(valid)).assertTrue();
      expect(CustomViewItemValidator.hasFocusIcon(CustomViewItemInfoModel.createDefault())).assertFalse();
    });

    // 适配 ItemValidator：完整定义校验
    it('validator_should_confirm_complete_item', 0, async () => {
      const valid = new CustomViewItemInfoModel('icon', 'focus', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(CustomViewItemValidator.isComplete(valid)).assertTrue();
      expect(CustomViewItemValidator.isComplete(CustomViewItemInfoModel.createDefault())).assertFalse();
    });

    // 适配 ItemValidator：默认项识别
    it('validator_should_identify_default_item', 0, async () => {
      const defaultItem = CustomViewItemInfoModel.createDefault();
      const normal = new CustomViewItemInfoModel('icon', 'focus', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(CustomViewItemValidator.isDefault(defaultItem)).assertTrue();
      expect(CustomViewItemValidator.isDefault(normal)).assertFalse();
    });

    // 适配 ItemValidator：非法操作类型导致不完整
    it('validator_should_reject_invalid_operation_type', 0, async () => {
      const invalid = new CustomViewItemInfoModel('icon', 'focus', false, '未知', -1);
      expect(CustomViewItemValidator.isComplete(invalid)).assertFalse();
    });

    // 适配 ItemComparator：按名称长度比较
    it('comparator_should_compare_by_name_length', 0, async () => {
      const short = new CustomViewItemInfoModel('a', 'b', false, '短', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      const long = new CustomViewItemInfoModel('a', 'b', false, '比较长的名称', CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT);
      expect(CustomViewItemComparator.compareByNameLength(short, long)).assertLessOrEqual(-1);
      expect(CustomViewItemComparator.compareByNameLength(long, short)).assertLargerOrEqual(1);
    });

    // 适配 ItemComparator：按操作类型比较
    it('comparator_should_compare_by_operation_type', 0, async () => {
      const suspend = new CustomViewItemInfoModel('a', 'b', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      const shutdown = new CustomViewItemInfoModel('a', 'b', false, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(CustomViewItemComparator.compareByOperationType(suspend, shutdown)).assertLessOrEqual(-1);
      expect(CustomViewItemComparator.compareByOperationType(shutdown, suspend)).assertLargerOrEqual(1);
    });

    // 适配 ItemComparator：按焦点状态比较
    it('comparator_should_compare_by_focus', 0, async () => {
      const focused = new CustomViewItemInfoModel('a', 'b', true, '在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      const unfocused = new CustomViewItemInfoModel('a', 'b', false, '候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(CustomViewItemComparator.compareByFocus(focused, unfocused)).assertEqual(-1);
      expect(CustomViewItemComparator.compareByFocus(unfocused, focused)).assertEqual(1);
      expect(CustomViewItemComparator.compareByFocus(focused, focused)).assertEqual(0);
    });

    // 适配 ItemCollection：添加与数量统计
    it('collection_should_add_and_count_items', 0, async () => {
      const collection = new CustomViewItemCollection();
      collection.add(CustomViewItemInfoFactory.createStandardSet()[0]);
      collection.add(CustomViewItemInfoFactory.createStandardSet()[1]);
      expect(collection.getCount()).assertEqual(2);
    });

    // 适配 ItemCollection：批量添加
    it('collection_should_add_all_items', 0, async () => {
      const collection = new CustomViewItemCollection();
      collection.addAll(CustomViewItemInfoFactory.createStandardSet());
      expect(collection.getCount()).assertEqual(3);
    });

    // 适配 ItemCollection：按操作类型筛选
    it('collection_should_filter_by_operation_type', 0, async () => {
      const collection = new CustomViewItemCollection();
      collection.addAll(CustomViewItemInfoFactory.createStandardSet());
      const shutdownItems: CustomViewItemInfoModel[] =
        collection.getByOperationType(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
      expect(shutdownItems.length).assertEqual(1);
      expect(shutdownItems[0].isShutdown()).assertTrue();
    });

    // 适配 ItemCollection：获取焦点项
    it('collection_should_return_focused_item', 0, async () => {
      const collection = new CustomViewItemCollection();
      collection.addAll(CustomViewItemInfoFactory.createStandardSet());
      const focused: CustomViewItemInfoModel | null = collection.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(focused?.isFocus).assertTrue();
      expect(focused?.name).assertEqual('在线换座');
    });

    // 适配 ItemCollection：无焦点项返回 null
    it('collection_should_return_null_without_focused_item', 0, async () => {
      const collection = new CustomViewItemCollection();
      collection.add(CustomViewItemInfoFactory.createStandardSet()[0]);
      collection.add(CustomViewItemInfoFactory.createStandardSet()[1]);
      expect(collection.getFocusedItem() === null).assertTrue();
    });

    // 适配 ItemCollection：清空后计数为零
    it('collection_should_reset_after_clear', 0, async () => {
      const collection = new CustomViewItemCollection();
      collection.addAll(CustomViewItemInfoFactory.createStandardSet());
      collection.clear();
      expect(collection.getCount()).assertEqual(0);
      expect(collection.getItems().length).assertEqual(0);
    });

    // 适配 ItemStatistics：类型分布统计
    it('statistics_should_count_type_distribution', 0, async () => {
      const stats = new CustomViewItemStatistics();
      stats.collect(CustomViewItemInfoFactory.createStandardSet());
      expect(stats.getSuspendCount()).assertEqual(1);
      expect(stats.getRebootCount()).assertEqual(1);
      expect(stats.getShutdownCount()).assertEqual(1);
    });

    // 适配 ItemStatistics：焦点项统计
    it('statistics_should_count_focused_items', 0, async () => {
      const stats = new CustomViewItemStatistics();
      stats.collect(CustomViewItemInfoFactory.createStandardSet());
      expect(stats.getFocusedCount()).assertEqual(1);
    });

    // 适配 ItemStatistics：清空后统计为零
    it('statistics_should_reset_after_clear', 0, async () => {
      const stats = new CustomViewItemStatistics();
      stats.collect(CustomViewItemInfoFactory.createStandardSet());
      stats.clear();
      expect(stats.getSuspendCount()).assertEqual(0);
    });

    // 适配 ItemStatistics：批量收集累积统计
    it('statistics_should_accumulate_collect', 0, async () => {
      const stats = new CustomViewItemStatistics();
      stats.collect(CustomViewItemInfoFactory.createStandardSet());
      stats.collect(CustomViewItemInfoFactory.createStandardSet());
      expect(stats.getShutdownCount()).assertEqual(2);
    });

    // 适配 DescriptorFactory：在线换座项分类为危险
    it('descriptor_factory_should_categorize_shutdown_as_danger', 0, async () => {
      const descriptor: CustomViewItemDescriptor =
        CustomViewItemDescriptorFactory.create('在线换座', CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN, IconTheme.DARK);
      expect(descriptor.category).assertEqual(ItemCategory.DANGER);
      expect(descriptor.operationType).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
    });

    // 适配 DescriptorFactory：候补预测项分类为主选项
    it('descriptor_factory_should_categorize_suspend_as_primary', 0, async () => {
      const descriptor: CustomViewItemDescriptor =
        CustomViewItemDescriptorFactory.create('候补预测', CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND, IconTheme.LIGHT);
      expect(descriptor.category).assertEqual(ItemCategory.PRIMARY);
      expect(descriptor.theme).assertEqual(IconTheme.LIGHT);
    });

    // 适配 DescriptorFactory：余票挖掘项分类为次选项
    it('descriptor_factory_should_categorize_reboot_as_secondary', 0, async () => {
      const descriptor: CustomViewItemDescriptor =
        CustomViewItemDescriptorFactory.create('余票挖掘', CustomViewOperationType.CUSTOM_VIEWOPERATION_REBOOT, IconTheme.HIGH_CONTRAST);
      expect(descriptor.category).assertEqual(ItemCategory.SECONDARY);
      expect(descriptor.theme).assertEqual(IconTheme.HIGH_CONTRAST);
    });

    // 适配 DescriptorFactory：分类名称映射
    it('descriptor_factory_should_map_category_names', 0, async () => {
      expect(CustomViewItemDescriptorFactory.getCategoryName(ItemCategory.PRIMARY)).assertEqual('主选项');
      expect(CustomViewItemDescriptorFactory.getCategoryName(ItemCategory.SECONDARY)).assertEqual('次选项');
      expect(CustomViewItemDescriptorFactory.getCategoryName(ItemCategory.DANGER)).assertEqual('危险选项');
    });

    // 适配 DescriptorFactory：主题名称映射
    it('descriptor_factory_should_map_theme_names', 0, async () => {
      expect(CustomViewItemDescriptorFactory.getThemeName(IconTheme.LIGHT)).assertEqual('浅色主题');
      expect(CustomViewItemDescriptorFactory.getThemeName(IconTheme.DARK)).assertEqual('深色主题');
      expect(CustomViewItemDescriptorFactory.getThemeName(IconTheme.HIGH_CONTRAST)).assertEqual('高对比主题');
    });

    // 适配 ItemInfoFactory：标准集包含三个操作
    it('item_factory_should_create_standard_set', 0, async () => {
      const items: CustomViewItemInfoModel[] = CustomViewItemInfoFactory.createStandardSet();
      expect(items.length).assertEqual(3);
      expect(items[0].isSuspend()).assertTrue();
      expect(items[1].isReboot()).assertTrue();
      expect(items[2].isShutdown()).assertTrue();
    });

    // 适配 ItemInfoFactory：按数量创建集合
    it('item_factory_should_create_count_items', 0, async () => {
      const items: CustomViewItemInfoModel[] = CustomViewItemInfoFactory.createCount(5);
      expect(items.length).assertEqual(5);
      expect(items[0].getDisplayName()).assertEqual('选项0');
      expect(items[4].getDisplayName()).assertEqual('选项4');
    });

    // 适配 FieldExtractor：提取名称列表
    it('field_extractor_should_extract_names', 0, async () => {
      const names: string[] = CustomViewItemFieldExtractor.extractNames(CustomViewItemInfoFactory.createStandardSet());
      expect(names.length).assertEqual(3);
      expect(names.includes('候补预测')).assertTrue();
      expect(names.includes('余票挖掘')).assertTrue();
      expect(names.includes('在线换座')).assertTrue();
    });

    // 适配 FieldExtractor：提取图标列表
    it('field_extractor_should_extract_icons', 0, async () => {
      const icons: string[] = CustomViewItemFieldExtractor.extractIcons(CustomViewItemInfoFactory.createStandardSet());
      expect(icons.length).assertEqual(3);
      expect(icons[0]).assertEqual('app.media.screenout');
    });

    // 适配 FieldExtractor：提取操作类型列表
    it('field_extractor_should_extract_operation_types', 0, async () => {
      const types: number[] = CustomViewItemFieldExtractor.extractOperationTypes(CustomViewItemInfoFactory.createStandardSet());
      expect(types.length).assertEqual(3);
      expect(types[0]).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SUSPEND);
      expect(types[2]).assertEqual(CustomViewOperationType.CUSTOM_VIEWOPERATION_SHUTDOWN);
    });

    // 适配 FieldExtractor：提取焦点项列表
    it('field_extractor_should_extract_focused_items', 0, async () => {
      const focused: CustomViewItemInfoModel[] =
        CustomViewItemFieldExtractor.extractFocused(CustomViewItemInfoFactory.createStandardSet());
      expect(focused.length).assertEqual(1);
      expect(focused[0].name).assertEqual('在线换座');
    });

    // 适配 SortManager：按操作类型排序
    it('sort_manager_should_sort_by_operation_type', 0, async () => {
      const manager = new CustomViewItemSortManager();
      manager.setItems(CustomViewItemInfoFactory.createStandardSet());
      const sorted: CustomViewItemInfoModel[] = manager.sortByOperationType();
      expect(sorted[0].isSuspend()).assertTrue();
      expect(sorted[1].isReboot()).assertTrue();
      expect(sorted[2].isShutdown()).assertTrue();
    });

    // 适配 SortManager：按名称长度排序
    it('sort_manager_should_sort_by_name_length', 0, async () => {
      const manager = new CustomViewItemSortManager();
      manager.setItems(CustomViewItemInfoFactory.createStandardSet());
      const sorted: CustomViewItemInfoModel[] = manager.sortByNameLength();
      expect(sorted.length).assertEqual(3);
    });

    // 适配 SortManager：条目计数与清空
    it('sort_manager_should_count_and_clear', 0, async () => {
      const manager = new CustomViewItemSortManager();
      manager.setItems(CustomViewItemInfoFactory.createStandardSet());
      expect(manager.getItemCount()).assertEqual(3);
      manager.clear();
      expect(manager.getItemCount()).assertEqual(0);
    });
  });

}
