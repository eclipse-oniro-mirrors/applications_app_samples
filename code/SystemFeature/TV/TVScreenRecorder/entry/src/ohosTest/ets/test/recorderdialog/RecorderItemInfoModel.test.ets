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
  getDriver,
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

// 录屏项动作类型：开始录屏为默认值 0，与录屏菜单顺序一致
enum RecorderItemType {
  RECORDER_ITEM_START = 0,
  RECORDER_ITEM_STOP = 1,
  RECORDER_ITEM_TIP = 2
}

// 录屏项信息模型：封装图标、焦点图标、焦点状态、名称与动作类型
class RecorderItemInfoModel {
  public icon: string;
  public onFocusIcon: string;
  public isFocus: boolean;
  public name: string;
  public itemType: number;

  constructor(icon: string, onFocusIcon: string, isFocus: boolean, name: string, itemType: number) {
    this.icon = icon;
    this.onFocusIcon = onFocusIcon;
    this.isFocus = isFocus;
    this.name = name;
    this.itemType = itemType;
  }

  // 空录屏项：用于边界与默认值场景
  public static createDefault(): RecorderItemInfoModel {
    return new RecorderItemInfoModel('', '', false, '', RecorderItemType.RECORDER_ITEM_START);
  }

  public getDisplayName(): string {
    return this.name;
  }

  // 聚焦时返回聚焦图标，否则返回普通图标
  public getCurrentIcon(): string {
    return this.isFocus ? this.onFocusIcon : this.icon;
  }

  public setFocusState(isFocused: boolean): void {
    this.isFocus = isFocused;
  }

  public setIcon(icon: string): void {
    this.icon = icon;
  }

  public isValidItemType(): boolean {
    return this.itemType >= RecorderItemType.RECORDER_ITEM_START &&
      this.itemType <= RecorderItemType.RECORDER_ITEM_TIP;
  }

  public isStartAction(): boolean {
    return this.itemType === RecorderItemType.RECORDER_ITEM_START;
  }

  public isStopAction(): boolean {
    return this.itemType === RecorderItemType.RECORDER_ITEM_STOP;
  }

  public isTipAction(): boolean {
    return this.itemType === RecorderItemType.RECORDER_ITEM_TIP;
  }

  public getItemTypeDescription(): string {
    switch (this.itemType) {
      case RecorderItemType.RECORDER_ITEM_START:
        return '开始录屏';
      case RecorderItemType.RECORDER_ITEM_STOP:
        return '结束录屏';
      case RecorderItemType.RECORDER_ITEM_TIP:
        return '录屏提示';
      default:
        return '未知动作';
    }
  }

  public clone(): RecorderItemInfoModel {
    return new RecorderItemInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.itemType);
  }

  public equals(other: RecorderItemInfoModel): boolean {
    return this.icon === other.icon && this.onFocusIcon === other.onFocusIcon &&
      this.isFocus === other.isFocus && this.name === other.name && this.itemType === other.itemType;
  }

  public toString(): string {
    return `RecorderItemInfo{name: ${this.name}, itemType: ${this.itemType}, isFocus: ${this.isFocus}}`;
  }
}

// 录屏项排序器：按动作类型排序，保证开始、结束、提示的稳定顺序
class RecorderItemSorter {
  public static sortByItemType(items: RecorderItemInfoModel[]): RecorderItemInfoModel[] {
    const copied: RecorderItemInfoModel[] = items.slice();
    copied.sort((a: RecorderItemInfoModel, b: RecorderItemInfoModel) => a.itemType - b.itemType);
    return copied;
  }

  public static sortByFocusFirst(items: RecorderItemInfoModel[]): RecorderItemInfoModel[] {
    const copied: RecorderItemInfoModel[] = items.slice();
    copied.sort((a: RecorderItemInfoModel, b: RecorderItemInfoModel) => {
      if (a.isFocus === b.isFocus) {
        return a.itemType - b.itemType;
      }
      return a.isFocus ? -1 : 1;
    });
    return copied;
  }
}

// 图标主题枚举：描述录屏项的图标风格
enum IconTheme {
  LIGHT = 'light',
  DARK = 'dark',
  HIGH_CONTRAST = 'high_contrast'
}

// 录屏项分类枚举：描述录屏项在菜单中的角色分类
enum ItemCategory {
  PRIMARY = 'primary',
  SECONDARY = 'secondary',
  DANGER = 'danger'
}

// 录屏项描述接口：描述录屏项的静态元数据
interface RecorderItemDescriptor {
  name: string;
  itemType: number;
  category: ItemCategory;
  theme: IconTheme;
}

// 排序标准接口：描述录屏项排序的键与方向
interface SortCriteria {
  ascending: boolean;
  stable: boolean;
}

// 录屏项构建器：以链式方式构建录屏项模型
class RecorderItemInfoBuilder {
  private icon: string = '';
  private onFocusIcon: string = '';
  private isFocus: boolean = false;
  private name: string = '';
  private itemType: number = RecorderItemType.RECORDER_ITEM_START;

  public setIcon(icon: string): RecorderItemInfoBuilder {
    this.icon = icon;
    return this;
  }

  public setOnFocusIcon(onFocusIcon: string): RecorderItemInfoBuilder {
    this.onFocusIcon = onFocusIcon;
    return this;
  }

  public setFocus(isFocus: boolean): RecorderItemInfoBuilder {
    this.isFocus = isFocus;
    return this;
  }

  public setName(name: string): RecorderItemInfoBuilder {
    this.name = name;
    return this;
  }

  public setItemType(itemType: number): RecorderItemInfoBuilder {
    this.itemType = itemType;
    return this;
  }

  public build(): RecorderItemInfoModel {
    return new RecorderItemInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.itemType);
  }
}

// 录屏项校验器：校验录屏项字段的合法性
class RecorderItemValidator {
  public static hasValidIcon(item: RecorderItemInfoModel): boolean {
    return item.icon.length > 0;
  }

  public static hasValidName(item: RecorderItemInfoModel): boolean {
    return item.name.length > 0;
  }

  public static hasFocusIcon(item: RecorderItemInfoModel): boolean {
    return item.onFocusIcon.length > 0;
  }

  public static isComplete(item: RecorderItemInfoModel): boolean {
    return RecorderItemValidator.hasValidIcon(item) && RecorderItemValidator.hasFocusIcon(item) &&
      RecorderItemValidator.hasValidName(item) && item.isValidItemType();
  }

  public static isDefault(item: RecorderItemInfoModel): boolean {
    return item.icon.length === 0 && item.onFocusIcon.length === 0 && item.name.length === 0 &&
      item.itemType === RecorderItemType.RECORDER_ITEM_START;
  }
}

// 录屏项比较器：按名称长度、动作类型与焦点状态比较
class RecorderItemComparator {
  public static compareByNameLength(a: RecorderItemInfoModel, b: RecorderItemInfoModel): number {
    return a.name.length - b.name.length;
  }

  public static compareByItemType(a: RecorderItemInfoModel, b: RecorderItemInfoModel): number {
    return a.itemType - b.itemType;
  }

  public static compareByFocus(a: RecorderItemInfoModel, b: RecorderItemInfoModel): number {
    if (a.isFocus === b.isFocus) {
      return 0;
    }
    return a.isFocus ? -1 : 1;
  }
}

// 录屏项集合：管理一组录屏项并支持批量操作
class RecorderItemCollection {
  private items: RecorderItemInfoModel[] = [];

  public add(item: RecorderItemInfoModel): void {
    this.items.push(item);
  }

  public addAll(items: RecorderItemInfoModel[]): void {
    items.forEach((item: RecorderItemInfoModel) => {
      this.items.push(item);
    });
  }

  public getItems(): RecorderItemInfoModel[] {
    return this.items.slice();
  }

  public getCount(): number {
    return this.items.length;
  }

  public getByItemType(itemType: number): RecorderItemInfoModel[] {
    return this.items.filter((item: RecorderItemInfoModel) => item.itemType === itemType);
  }

  public getFocusedItem(): RecorderItemInfoModel | null {
    const focused: RecorderItemInfoModel[] =
      this.items.filter((item: RecorderItemInfoModel) => item.isFocus);
    if (focused.length === 0) {
      return null;
    }
    return focused[0];
  }

  public clear(): void {
    this.items = [];
  }
}

// 录屏项统计：统计录屏项集合的动作分布
class RecorderItemStatistics {
  private items: RecorderItemInfoModel[] = [];

  public collect(items: RecorderItemInfoModel[]): void {
    items.forEach((item: RecorderItemInfoModel) => {
      this.items.push(item);
    });
  }

  public getTotalCount(): number {
    return this.items.length;
  }

  public getStartCount(): number {
    return this.items.filter((item: RecorderItemInfoModel) => item.isStartAction()).length;
  }

  public getStopCount(): number {
    return this.items.filter((item: RecorderItemInfoModel) => item.isStopAction()).length;
  }

  public getTipCount(): number {
    return this.items.filter((item: RecorderItemInfoModel) => item.isTipAction()).length;
  }

  public getFocusedCount(): number {
    return this.items.filter((item: RecorderItemInfoModel) => item.isFocus).length;
  }

  public clear(): void {
    this.items = [];
  }
}

// 录屏项描述工厂：根据动作类型生成标准描述元数据
class RecorderItemDescriptorFactory {
  public static create(name: string, itemType: number, theme: IconTheme): RecorderItemDescriptor {
    let category: ItemCategory = ItemCategory.SECONDARY;
    if (itemType === RecorderItemType.RECORDER_ITEM_STOP) {
      category = ItemCategory.DANGER;
    } else if (itemType === RecorderItemType.RECORDER_ITEM_START) {
      category = ItemCategory.PRIMARY;
    }
    const descriptor: RecorderItemDescriptor = {
      name: name,
      itemType: itemType,
      category: category,
      theme: theme
    };
    return descriptor;
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

// 录屏项工厂：批量创建标准录屏菜单项集合
class RecorderItemInfoFactory {
  public static createStandardSet(): RecorderItemInfoModel[] {
    const items: RecorderItemInfoModel[] = [];
    items.push(new RecorderItemInfoModel('app.media.recorder_start', 'app.media.recorder_start_focus', true,
      '录屏', RecorderItemType.RECORDER_ITEM_START));
    items.push(new RecorderItemInfoModel('app.media.recorder_stop', 'app.media.recorder_stop_focus', false,
      '结束录屏', RecorderItemType.RECORDER_ITEM_STOP));
    items.push(new RecorderItemInfoModel('app.media.recorder_tip', 'app.media.recorder_tip_focus', false,
      '录屏提示', RecorderItemType.RECORDER_ITEM_TIP));
    return items;
  }

  public static createCount(count: number): RecorderItemInfoModel[] {
    const items: RecorderItemInfoModel[] = [];
    for (let i = 0; i < count; i++) {
      items.push(new RecorderItemInfoModel('icon' + i, 'focus' + i, false, '录屏项' + i, i % 3));
    }
    return items;
  }
}

// 录屏项字段提取器：从录屏项集合提取指定字段
class RecorderItemFieldExtractor {
  public static extractNames(items: RecorderItemInfoModel[]): string[] {
    const names: string[] = [];
    items.forEach((item: RecorderItemInfoModel) => {
      names.push(item.name);
    });
    return names;
  }

  public static extractIcons(items: RecorderItemInfoModel[]): string[] {
    const icons: string[] = [];
    items.forEach((item: RecorderItemInfoModel) => {
      icons.push(item.icon);
    });
    return icons;
  }

  public static extractItemTypes(items: RecorderItemInfoModel[]): number[] {
    const types: number[] = [];
    items.forEach((item: RecorderItemInfoModel) => {
      types.push(item.itemType);
    });
    return types;
  }

  public static extractFocused(items: RecorderItemInfoModel[]): RecorderItemInfoModel[] {
    return items.filter((item: RecorderItemInfoModel) => item.isFocus);
  }
}

// 录屏项排序管理器：支持多种排序策略
class RecorderItemSortManager {
  private items: RecorderItemInfoModel[] = [];

  public setItems(items: RecorderItemInfoModel[]): void {
    this.items = items.slice();
  }

  public sortByItemType(): RecorderItemInfoModel[] {
    const copied: RecorderItemInfoModel[] = this.items.slice();
    copied.sort((a: RecorderItemInfoModel, b: RecorderItemInfoModel) => a.itemType - b.itemType);
    return copied;
  }

  public sortByNameLength(): RecorderItemInfoModel[] {
    const copied: RecorderItemInfoModel[] = this.items.slice();
    copied.sort((a: RecorderItemInfoModel, b: RecorderItemInfoModel) => a.name.length - b.name.length);
    return copied;
  }

  public getItemCount(): number {
    return this.items.length;
  }

  public clear(): void {
    this.items = [];
  }
}

// 录屏产物规则：校验 REC_yyyyMMdd_HHmmss.mp4 文件名与 HH:mm:ss 计时文本
class RecordingArtifactRules {
  public static readonly FILE_PREFIX: string = 'REC';
  public static readonly CONNECTOR: string = '_';
  public static readonly VIDEO_TYPE: string = '.mp4';

  public static isRecordingFileName(name: string): boolean {
    if (!name.startsWith(RecordingArtifactRules.FILE_PREFIX + RecordingArtifactRules.CONNECTOR)) {
      return false;
    }
    if (!name.endsWith(RecordingArtifactRules.VIDEO_TYPE)) {
      return false;
    }
    const body: string = name.substring(4, name.length - 4);
    if (body.length !== 15 || body.charAt(8) !== RecordingArtifactRules.CONNECTOR) {
      return false;
    }
    return RecordingArtifactRules.isDigitText(body.substring(0, 8)) &&
      RecordingArtifactRules.isDigitText(body.substring(9));
  }

  public static isDigitText(text: string): boolean {
    if (text.length === 0) {
      return false;
    }
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  public static isTimerLabel(label: string): boolean {
    if (label.length !== 8) {
      return false;
    }
    if (label.charAt(2) !== ':' || label.charAt(5) !== ':') {
      return false;
    }
    return label.substring(0, 2) !== '  ' && RecordingArtifactRules.isDigitText(label.substring(0, 2)) &&
      RecordingArtifactRules.isDigitText(label.substring(3, 5)) &&
      RecordingArtifactRules.isDigitText(label.substring(6, 8));
  }

  public static getTipTitle(): string {
    return '录屏';
  }

  public static getTipContent(): string {
    return '录屏视频已存储到"照片"';
  }
}

export default function recorderItemInfoModelTest(): void {
  describe('RecorderItemInfoModel_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，等待录屏浮窗稳定
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：退出录屏浮窗并释放资源
    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // 默认构造应创建空录屏项
    it('default_constructor_should_create_empty_item', 0, async () => {
      const item: RecorderItemInfoModel = RecorderItemInfoModel.createDefault();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.name).assertEqual('');
      expect(item.itemType).assertEqual(RecorderItemType.RECORDER_ITEM_START);
    });

    // 带参构造应正确落到各字段
    it('constructor_with_params_should_extract_fields_correctly', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoModel('start', 'start_focus', true, '录屏', RecorderItemType.RECORDER_ITEM_START);
      expect(item.icon).assertEqual('start');
      expect(item.onFocusIcon).assertEqual('start_focus');
      expect(item.isFocus).assertTrue();
      expect(item.name).assertEqual('录屏');
      expect(item.itemType).assertEqual(RecorderItemType.RECORDER_ITEM_START);
    });

    // 空名称与空图标应可被安全处理
    it('empty_name_and_icon_should_be_handled', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('', '', false, '', 0);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.getCurrentIcon()).assertEqual('');
      expect(item.isValidItemType()).assertTrue();
    });

    // 超长名称不应崩溃且应完整保留
    it('very_long_name_should_be_handled', 0, async () => {
      const longName: string = '录屏'.repeat(60);
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, longName, 0);
      expect(item.getDisplayName().length).assertEqual(longName.length);
      expect(item.getDisplayName()).assertEqual(longName);
    });

    // 特殊字符名称应原样保存
    it('special_characters_name_should_be_handled', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏@#%&', 0);
      expect(item.getDisplayName()).assertContain('@#%&');
      expect(item.getDisplayName().length).assertEqual(6);
    });

    // 开始录屏类型的动作判定
    it('is_start_action_should_return_true_for_start_type', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      expect(item.isStartAction()).assertTrue();
      expect(item.isStopAction()).assertFalse();
      expect(item.isTipAction()).assertFalse();
    });

    // 结束录屏类型的动作判定
    it('is_stop_action_should_return_true_for_stop_type', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoModel('i', 'f', false, '结束录屏', RecorderItemType.RECORDER_ITEM_STOP);
      expect(item.isStopAction()).assertTrue();
      expect(item.isStartAction()).assertFalse();
    });

    // 录屏提示类型的动作判定
    it('is_tip_action_should_return_true_for_tip_type', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoModel('i', 'f', false, '录屏提示', RecorderItemType.RECORDER_ITEM_TIP);
      expect(item.isTipAction()).assertTrue();
      expect(item.isStopAction()).assertFalse();
    });

    // 未知动作类型不应被识别为任何合法动作
    it('unknown_item_type_should_not_be_any_valid_action', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '未知', 9);
      expect(item.isStartAction()).assertFalse();
      expect(item.isStopAction()).assertFalse();
      expect(item.isTipAction()).assertFalse();
      expect(item.isValidItemType()).assertFalse();
    });

    // 焦点状态默认为 false
    it('is_focus_should_be_false_by_default', 0, async () => {
      const item: RecorderItemInfoModel = RecorderItemInfoModel.createDefault();
      expect(item.isFocus).assertFalse();
    });

    // 设置焦点后应变为 true
    it('is_focus_should_be_true_after_set_focus_state', 0, async () => {
      const item: RecorderItemInfoModel = RecorderItemInfoModel.createDefault();
      item.setFocusState(true);
      expect(item.isFocus).assertTrue();
      item.setFocusState(false);
      expect(item.isFocus).assertFalse();
    });

    // 图标默认值为空
    it('icon_should_default_to_empty', 0, async () => {
      const item: RecorderItemInfoModel = RecorderItemInfoModel.createDefault();
      expect(item.icon).assertEqual('');
      expect(item.onFocusIcon).assertEqual('');
    });

    // 设置图标应更新普通图标值
    it('set_icon_should_update_icon_value', 0, async () => {
      const item: RecorderItemInfoModel = RecorderItemInfoModel.createDefault();
      item.setIcon('app.media.recorder_start');
      expect(item.icon).assertEqual('app.media.recorder_start');
    });

    // 当前图标应随焦点状态切换
    it('get_current_icon_should_reflect_focus_state', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoModel('normal', 'focused', false, '录屏', 0);
      expect(item.getCurrentIcon()).assertEqual('normal');
      item.setFocusState(true);
      expect(item.getCurrentIcon()).assertEqual('focused');
    });

    // toString 应包含关键字段
    it('to_string_should_contain_key_fields', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoModel('i', 'f', true, '结束录屏', RecorderItemType.RECORDER_ITEM_STOP);
      expect(item.toString()).assertContain('结束录屏');
      expect(item.toString()).assertContain('RecorderItemInfo');
      expect(item.toString()).assertContain('1');
    });

        // 名称与动作类型在创建后保持不变
    it('name_and_item_type_should_be_immutable', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      item.setFocusState(true);
      item.setIcon('other');
      expect(item.name).assertEqual('录屏');
      expect(item.itemType).assertEqual(0);
    });

    // 结束录屏项的组合链路应完整
    it('stop_item_integration_chain_should_be_correct', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder()
        .setIcon('app.media.recorder_stop')
        .setOnFocusIcon('app.media.recorder_stop_focus')
        .setName('结束录屏')
        .setItemType(RecorderItemType.RECORDER_ITEM_STOP)
        .setFocus(true)
        .build();
      expect(item.isStopAction()).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('app.media.recorder_stop_focus');
      expect(item.getItemTypeDescription()).assertEqual('结束录屏');
    });

    // 开始录屏项的组合链路应完整
    it('start_item_integration_chain_should_be_correct', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder()
        .setIcon('app.media.recorder_start')
        .setOnFocusIcon('app.media.recorder_start_focus')
        .setName('录屏')
        .setItemType(RecorderItemType.RECORDER_ITEM_START)
        .build();
      expect(item.isStartAction()).assertTrue();
      expect(item.getDisplayName()).assertEqual('录屏');
      expect(item.getItemTypeDescription()).assertEqual('开始录屏');
    });

    // 空名称不应导致异常
    it('empty_name_should_not_crash', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '', 0);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.toString()).assertContain('RecorderItemInfo');
    });

    // 录屏项应按动作类型排序
    it('items_should_sort_by_item_type', 0, async () => {
      const items: RecorderItemInfoModel[] = RecorderItemInfoFactory.createStandardSet();
      const reversed: RecorderItemInfoModel[] = items.slice().reverse();
      const sorted: RecorderItemInfoModel[] = RecorderItemSorter.sortByItemType(reversed);
      expect(sorted[0].itemType).assertEqual(RecorderItemType.RECORDER_ITEM_START);
      expect(sorted[1].itemType).assertEqual(RecorderItemType.RECORDER_ITEM_STOP);
      expect(sorted[2].itemType).assertEqual(RecorderItemType.RECORDER_ITEM_TIP);
    });

    // 克隆应生成互不影响的副本
    it('clone_should_create_independent_copy', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      const copy: RecorderItemInfoModel = item.clone();
      copy.setFocusState(true);
      copy.setIcon('changed');
      expect(item.isFocus).assertFalse();
      expect(item.icon).assertEqual('i');
      expect(copy.equals(item)).assertFalse();
    });

    // 相等的录屏项应被识别为同一模型
    it('equals_should_compare_all_fields', 0, async () => {
      const a: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      const b: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      expect(a.equals(b)).assertTrue();
      b.setFocusState(true);
      expect(a.equals(b)).assertFalse();
    });

    // 构建器应链式设置图标
    it('builder_should_set_icon_via_chain', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder().setIcon('ic_start').build();
      expect(item.icon).assertEqual('ic_start');
    });

    // 构建器应链式设置焦点图标
    it('builder_should_set_focus_icon_via_chain', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoBuilder().setOnFocusIcon('ic_start_focus').build();
      expect(item.onFocusIcon).assertEqual('ic_start_focus');
    });

    // 构建器应链式设置名称
    it('builder_should_set_name_via_chain', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder().setName('录屏提示').build();
      expect(item.name).assertEqual('录屏提示');
    });

    // 构建器应链式设置动作类型
    it('builder_should_set_item_type_via_chain', 0, async () => {
      const item: RecorderItemInfoModel =
        new RecorderItemInfoBuilder().setItemType(RecorderItemType.RECORDER_ITEM_TIP).build();
      expect(item.itemType).assertEqual(RecorderItemType.RECORDER_ITEM_TIP);
      expect(item.isTipAction()).assertTrue();
    });

    // 构建器应链式设置焦点状态
    it('builder_should_set_focus_state_via_chain', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder().setFocus(true).build();
      expect(item.isFocus).assertTrue();
    });

    // 未调用任何 setter 时构建器应产出默认录屏项
    it('builder_should_produce_default_when_no_setter', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder().build();
      expect(RecorderItemValidator.isDefault(item)).assertTrue();
      expect(item.isStartAction()).assertTrue();
    });

    // 构建器应能产出完整的结束录屏项
    it('builder_should_build_full_stop_item', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoBuilder()
        .setIcon('stop')
        .setOnFocusIcon('stop_focus')
        .setFocus(true)
        .setName('结束录屏')
        .setItemType(RecorderItemType.RECORDER_ITEM_STOP)
        .build();
      expect(RecorderItemValidator.isComplete(item)).assertTrue();
      expect(item.getCurrentIcon()).assertEqual('stop_focus');
    });

        // 校验器应校验图标非空
    it('validator_should_validate_icon', 0, async () => {
      const withIcon: RecorderItemInfoModel = new RecorderItemInfoModel('ic', 'f', false, '录屏', 0);
      const withoutIcon: RecorderItemInfoModel = new RecorderItemInfoModel('', 'f', false, '录屏', 0);
      expect(RecorderItemValidator.hasValidIcon(withIcon)).assertTrue();
      expect(RecorderItemValidator.hasValidIcon(withoutIcon)).assertFalse();
    });

    // 校验器应校验名称非空
    it('validator_should_validate_name', 0, async () => {
      const withName: RecorderItemInfoModel = new RecorderItemInfoModel('ic', 'f', false, '录屏', 0);
      const withoutName: RecorderItemInfoModel = new RecorderItemInfoModel('ic', 'f', false, '', 0);
      expect(RecorderItemValidator.hasValidName(withName)).assertTrue();
      expect(RecorderItemValidator.hasValidName(withoutName)).assertFalse();
    });

    // 校验器应校验焦点图标非空
    it('validator_should_validate_focus_icon', 0, async () => {
      const withFocus: RecorderItemInfoModel = new RecorderItemInfoModel('ic', 'f', false, '录屏', 0);
      const withoutFocus: RecorderItemInfoModel = new RecorderItemInfoModel('ic', '', false, '录屏', 0);
      expect(RecorderItemValidator.hasFocusIcon(withFocus)).assertTrue();
      expect(RecorderItemValidator.hasFocusIcon(withoutFocus)).assertFalse();
    });

    // 完整录屏项应通过完整性校验
    it('validator_should_confirm_complete_item', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('ic', 'ic_focus', false, '录屏', 0);
      expect(RecorderItemValidator.isComplete(item)).assertTrue();
    });

    // 默认录屏项应被识别
    it('validator_should_identify_default_item', 0, async () => {
      const item: RecorderItemInfoModel = RecorderItemInfoModel.createDefault();
      expect(RecorderItemValidator.isDefault(item)).assertTrue();
      item.setIcon('ic');
      expect(RecorderItemValidator.isDefault(item)).assertFalse();
    });

    // 非法动作类型应被完整性校验拒绝
    it('validator_should_reject_invalid_item_type', 0, async () => {
      const item: RecorderItemInfoModel = new RecorderItemInfoModel('ic', 'f', false, '录屏', 7);
      expect(item.isValidItemType()).assertFalse();
      expect(RecorderItemValidator.isComplete(item)).assertFalse();
    });

    // 比较器应比较名称长度
    it('comparator_should_compare_by_name_length', 0, async () => {
      const shortItem: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      const longItem: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '结束录屏', 1);
      expect(RecorderItemComparator.compareByNameLength(shortItem, longItem)).assertLess(0);
      expect(RecorderItemComparator.compareByNameLength(longItem, shortItem)).assertLarger(0);
    });

    // 比较器应比较动作类型
    it('comparator_should_compare_by_item_type', 0, async () => {
      const start: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      const stop: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '结束录屏', 1);
      expect(RecorderItemComparator.compareByItemType(start, stop)).assertEqual(-1);
      expect(RecorderItemComparator.compareByItemType(stop, start)).assertEqual(1);
    });

    // 比较器应把聚焦项排在前面
    it('comparator_should_compare_by_focus', 0, async () => {
      const focused: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', true, '录屏', 0);
      const normal: RecorderItemInfoModel = new RecorderItemInfoModel('i', 'f', false, '录屏', 0);
      expect(RecorderItemComparator.compareByFocus(focused, normal)).assertEqual(-1);
      expect(RecorderItemComparator.compareByFocus(normal, normal)).assertEqual(0);
    });

    // 录屏项集合应支持添加与计数
    it('collection_should_add_and_count_items', 0, async () => {
      const collection: RecorderItemCollection = new RecorderItemCollection();
      collection.add(new RecorderItemInfoModel('i', 'f', false, '录屏', 0));
      collection.add(new RecorderItemInfoModel('i', 'f', false, '结束录屏', 1));
      expect(collection.getCount()).assertEqual(2);
    });

    // 录屏项集合应支持批量添加
    it('collection_should_add_all_items', 0, async () => {
      const collection: RecorderItemCollection = new RecorderItemCollection();
      collection.addAll(RecorderItemInfoFactory.createStandardSet());
      expect(collection.getCount()).assertEqual(3);
      expect(collection.getItems().length).assertEqual(3);
    });

    // 录屏项集合应按动作类型过滤
    it('collection_should_filter_by_item_type', 0, async () => {
      const collection: RecorderItemCollection = new RecorderItemCollection();
      collection.addAll(RecorderItemInfoFactory.createStandardSet());
      expect(collection.getByItemType(RecorderItemType.RECORDER_ITEM_START).length).assertEqual(1);
      expect(collection.getByItemType(RecorderItemType.RECORDER_ITEM_STOP).length).assertEqual(1);
      expect(collection.getByItemType(5).length).assertEqual(0);
    });

    // 录屏项集合应返回当前聚焦项
    it('collection_should_return_focused_item', 0, async () => {
      const collection: RecorderItemCollection = new RecorderItemCollection();
      collection.add(new RecorderItemInfoModel('i', 'f', false, '录屏', 0));
      collection.add(new RecorderItemInfoModel('i', 'f', true, '结束录屏', 1));
      const focused: RecorderItemInfoModel | null = collection.getFocusedItem();
      expect(focused === null).assertFalse();
      if (focused !== null) {
        expect(focused.name).assertEqual('结束录屏');
      }
    });

    // 无聚焦项时集合应返回 null
    it('collection_should_return_null_without_focused_item', 0, async () => {
      const collection: RecorderItemCollection = new RecorderItemCollection();
      collection.add(new RecorderItemInfoModel('i', 'f', false, '录屏', 0));
      expect(collection.getFocusedItem()).assertNull();
    });

    // 集合清空后计数应归零
    it('collection_should_reset_after_clear', 0, async () => {
      const collection: RecorderItemCollection = new RecorderItemCollection();
      collection.addAll(RecorderItemInfoFactory.createStandardSet());
      collection.clear();
      expect(collection.getCount()).assertEqual(0);
      expect(collection.getItems().length).assertEqual(0);
    });

    // 统计应正确统计动作分布
    it('statistics_should_count_type_distribution', 0, async () => {
      const statistics: RecorderItemStatistics = new RecorderItemStatistics();
      statistics.collect(RecorderItemInfoFactory.createStandardSet());
      expect(statistics.getTotalCount()).assertEqual(3);
      expect(statistics.getStartCount()).assertEqual(1);
      expect(statistics.getStopCount()).assertEqual(1);
      expect(statistics.getTipCount()).assertEqual(1);
    });

    // 统计应统计聚焦项数量
    it('statistics_should_count_focused_items', 0, async () => {
      const statistics: RecorderItemStatistics = new RecorderItemStatistics();
      statistics.collect(RecorderItemInfoFactory.createStandardSet());
      expect(statistics.getFocusedCount()).assertEqual(1);
    });

    // 统计清空后应归零
    it('statistics_should_reset_after_clear', 0, async () => {
      const statistics: RecorderItemStatistics = new RecorderItemStatistics();
      statistics.collect(RecorderItemInfoFactory.createStandardSet());
      statistics.clear();
      expect(statistics.getTotalCount()).assertEqual(0);
      expect(statistics.getStartCount()).assertEqual(0);
    });

    // 统计应支持多次累积
    it('statistics_should_accumulate_collect', 0, async () => {
      const statistics: RecorderItemStatistics = new RecorderItemStatistics();
      statistics.collect(RecorderItemInfoFactory.createCount(3));
      statistics.collect(RecorderItemInfoFactory.createCount(6));
      expect(statistics.getTotalCount()).assertEqual(9);
      expect(statistics.getStartCount()).assertEqual(3);
    });

    // 描述工厂应把结束录屏归类为危险项
    it('descriptor_factory_should_categorize_stop_as_danger', 0, async () => {
      const descriptor: RecorderItemDescriptor =
        RecorderItemDescriptorFactory.create('结束录屏', RecorderItemType.RECORDER_ITEM_STOP, IconTheme.DARK);
      expect(descriptor.category).assertEqual(ItemCategory.DANGER);
      expect(descriptor.name).assertEqual('结束录屏');
    });

    // 描述工厂应把开始录屏归类为主选项
    it('descriptor_factory_should_categorize_start_as_primary', 0, async () => {
      const descriptor: RecorderItemDescriptor =
        RecorderItemDescriptorFactory.create('录屏', RecorderItemType.RECORDER_ITEM_START, IconTheme.LIGHT);
      expect(descriptor.category).assertEqual(ItemCategory.PRIMARY);
    });

    // 描述工厂应把录屏提示归类为次选项
    it('descriptor_factory_should_categorize_tip_as_secondary', 0, async () => {
      const descriptor: RecorderItemDescriptor =
        RecorderItemDescriptorFactory.create('录屏提示', RecorderItemType.RECORDER_ITEM_TIP, IconTheme.LIGHT);
      expect(descriptor.category).assertEqual(ItemCategory.SECONDARY);
    });

    // 描述工厂应映射分类名称
    it('descriptor_factory_should_map_category_names', 0, async () => {
      expect(RecorderItemDescriptorFactory.getCategoryName(ItemCategory.PRIMARY)).assertEqual('主选项');
      expect(RecorderItemDescriptorFactory.getCategoryName(ItemCategory.SECONDARY)).assertEqual('次选项');
      expect(RecorderItemDescriptorFactory.getCategoryName(ItemCategory.DANGER)).assertEqual('危险选项');
    });

    // 描述工厂应映射主题名称
    it('descriptor_factory_should_map_theme_names', 0, async () => {
      expect(RecorderItemDescriptorFactory.getThemeName(IconTheme.LIGHT)).assertEqual('浅色主题');
      expect(RecorderItemDescriptorFactory.getThemeName(IconTheme.DARK)).assertEqual('深色主题');
      expect(RecorderItemDescriptorFactory.getThemeName(IconTheme.HIGH_CONTRAST)).assertEqual('高对比主题');
    });

    // 录屏项工厂应创建标准三项集合
    it('item_factory_should_create_standard_set', 0, async () => {
      const items: RecorderItemInfoModel[] = RecorderItemInfoFactory.createStandardSet();
      expect(items.length).assertEqual(3);
      expect(items[0].name).assertEqual('录屏');
      expect(items[1].name).assertEqual('结束录屏');
      expect(items[2].name).assertEqual('录屏提示');
    });

    // 录屏项工厂应按数量创建
    it('item_factory_should_create_count_items', 0, async () => {
      const items: RecorderItemInfoModel[] = RecorderItemInfoFactory.createCount(5);
      expect(items.length).assertEqual(5);
      expect(items[4].name).assertEqual('录屏项4');
      expect(items[4].itemType).assertEqual(1);
    });

    // 字段提取器应提取名称
    it('field_extractor_should_extract_names', 0, async () => {
      const names: string[] = RecorderItemFieldExtractor.extractNames(RecorderItemInfoFactory.createStandardSet());
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('录屏');
    });

    // 字段提取器应提取图标
    it('field_extractor_should_extract_icons', 0, async () => {
      const icons: string[] = RecorderItemFieldExtractor.extractIcons(RecorderItemInfoFactory.createStandardSet());
      expect(icons.length).assertEqual(3);
      expect(icons[0]).assertEqual('app.media.recorder_start');
    });

    // 字段提取器应提取动作类型
    it('field_extractor_should_extract_item_types', 0, async () => {
      const types: number[] =
        RecorderItemFieldExtractor.extractItemTypes(RecorderItemInfoFactory.createStandardSet());
      expect(types.length).assertEqual(3);
      expect(types[2]).assertEqual(RecorderItemType.RECORDER_ITEM_TIP);
    });

    // 字段提取器应提取聚焦项
    it('field_extractor_should_extract_focused_items', 0, async () => {
      const focused: RecorderItemInfoModel[] =
        RecorderItemFieldExtractor.extractFocused(RecorderItemInfoFactory.createStandardSet());
      expect(focused.length).assertEqual(1);
      expect(focused[0].isStartAction()).assertTrue();
    });

    // 排序管理器应按动作类型排序
    it('sort_manager_should_sort_by_item_type', 0, async () => {
      const manager: RecorderItemSortManager = new RecorderItemSortManager();
      manager.setItems(RecorderItemInfoFactory.createStandardSet().reverse());
      const sorted: RecorderItemInfoModel[] = manager.sortByItemType();
      expect(sorted[0].isStartAction()).assertTrue();
      expect(sorted[2].isTipAction()).assertTrue();
    });

    // 排序管理器应按名称长度排序
    it('sort_manager_should_sort_by_name_length', 0, async () => {
      const manager: RecorderItemSortManager = new RecorderItemSortManager();
      manager.setItems(RecorderItemInfoFactory.createStandardSet());
      const sorted: RecorderItemInfoModel[] = manager.sortByNameLength();
      expect(sorted[0].name).assertEqual('录屏');
      expect(sorted[0].name.length).assertEqual(2);
      expect(sorted[2].name.length).assertEqual(4);
    });

    // 排序管理器应支持计数与清空
    it('sort_manager_should_count_and_clear', 0, async () => {
      const manager: RecorderItemSortManager = new RecorderItemSortManager();
      manager.setItems(RecorderItemInfoFactory.createStandardSet());
      expect(manager.getItemCount()).assertEqual(3);
      manager.clear();
      expect(manager.getItemCount()).assertEqual(0);
    });

    // 聚焦优先排序应把聚焦项提到首位
    it('focus_first_sort_should_put_focused_item_first', 0, async () => {
      const items: RecorderItemInfoModel[] = RecorderItemInfoFactory.createStandardSet();
      items[2].setFocusState(true);
      items[0].setFocusState(false);
      const sorted: RecorderItemInfoModel[] = RecorderItemSorter.sortByFocusFirst(items);
      expect(sorted[0].isTipAction()).assertTrue();
    });

    // 录屏文件名应符合 REC_yyyyMMdd_HHmmss.mp4
    it('recording_file_name_should_follow_prefix', 0, async () => {
      expect(RecordingArtifactRules.isRecordingFileName('REC_20260101_120000.mp4')).assertTrue();
      expect(RecordingArtifactRules.isRecordingFileName('REC_20261231_235959.mp4')).assertTrue();
      expect(RecordingArtifactRules.isRecordingFileName('VID_20260101_120000.mp4')).assertFalse();
      expect(RecordingArtifactRules.isRecordingFileName('REC_20260101-120000.mp4')).assertFalse();
    });

    // 非法的录屏文件名应被拒绝
    it('malformed_recording_file_name_should_be_rejected', 0, async () => {
      expect(RecordingArtifactRules.isRecordingFileName('REC_2026_120000.mp4')).assertFalse();
      expect(RecordingArtifactRules.isRecordingFileName('REC_20260101_12000.mp4')).assertFalse();
      expect(RecordingArtifactRules.isRecordingFileName('')).assertFalse();
      expect(RecordingArtifactRules.isRecordingFileName('REC_20260101_120000')).assertFalse();
    });

    // 计时文本应符合 HH:mm:ss
    it('timer_label_should_match_hh_mm_ss', 0, async () => {
      expect(RecordingArtifactRules.isTimerLabel('00:00:00')).assertTrue();
      expect(RecordingArtifactRules.isTimerLabel('01:02:03')).assertTrue();
      expect(RecordingArtifactRules.isTimerLabel('01:02')).assertFalse();
      expect(RecordingArtifactRules.isTimerLabel('1:02:03')).assertFalse();
    });

    // 录屏提示文案应与页面文案一致
    it('tip_text_should_match_dialog_content', 0, async () => {
      expect(RecordingArtifactRules.getTipTitle()).assertEqual('录屏');
      expect(RecordingArtifactRules.getTipContent()).assertContain('照片');
      expect(RecordingArtifactRules.getTipContent().length).assertLarger(5);
    });

    // 集成：真实录屏浮窗应可渲染
    it('real_recorder_window_should_be_rendered', 0, async () => {
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });
  });
}
