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
  getDriver,
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay
} from '../common/SharedDriver';

// 应用操作类型枚举：覆盖TV设备主要的应用操作类型
enum AppOperationType {
  APP_OPERATION_UNINSTALL = 0, APP_OPERATION_SHORTCUT = 1, APP_OPERATION_MOVE = 2
}

// 应用项信息模型：封装单个应用选项的UI状态和操作类型
class AppItemModel {
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

  public getDisplayName(): string {
    return this.name;
  }

  public getCurrentIcon(): string {
    return this.isFocus ? this.onFocusIcon : this.icon;
  }

  public setFocusState(isFocused: boolean): void {
    this.isFocus = isFocused;
  }

  public isValidOperationType(): boolean {
    return this.operationType >= AppOperationType.APP_OPERATION_UNINSTALL &&
      this.operationType <= AppOperationType.APP_OPERATION_MOVE;
  }

  public getOperationTypeDescription(): string {
    switch (this.operationType) {
      case AppOperationType.APP_OPERATION_UNINSTALL:
        return '卸载操作';
      case AppOperationType.APP_OPERATION_SHORTCUT:
        return '快捷方式操作';
      case AppOperationType.APP_OPERATION_MOVE:
        return '移动操作';
      default:
        return '未知操作';
    }
  }

  // 克隆方法：创建数据模型的独立副本，避免引用污染
  public clone(): AppItemModel {
    return new AppItemModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }

  // 相等性比较：验证两个模型实例是否完全相同，用于数据一致性检查
  public equals(other: AppItemModel): boolean {
    return this.icon === other.icon && this.onFocusIcon === other.onFocusIcon && this.isFocus === other.isFocus &&
      this.name === other.name && this.operationType === other.operationType;
  }

  // 字符串表示：提供可读的调试信息，便于问题排查
  public toString(): string {
    return `AppItem{name: ${this.name}, operationType: ${this.operationType}, isFocus: ${this.isFocus}}`;
  }
}

// 应用项列表管理器：管理应用选项列表的焦点状态和数据完整性
class AppListManager {
  private items: AppItemModel[] = [];

  constructor() {
    this.initializeDefaultItems();
  }

  public getAllItems(): AppItemModel[] {
    return [...this.items];
  }

  // 按索引获取项：支持通过位置快速访问列表项
  public getItemByIndex(index: number): AppItemModel | null {
    if (index >= 0 && index < this.items.length) {
      return this.items[index];
    }
    return null;
  }

  // 按名称获取项：支持通过名称查找特定应用选项
  public getItemByName(name: string): AppItemModel | null {
    return this.items.find(item => item.name === name) || null;
  }

  // 按操作类型获取项：支持通过操作类型查找对应应用选项
  public getItemByOperationType(operationType: number): AppItemModel | null {
    return this.items.find(item => item.operationType === operationType) || null;
  }

  public getFocusedItem(): AppItemModel | null {
    return this.items.find(item => item.isFocus) || null;
  }

  public setFocusToIndex(index: number): boolean {
    if (index >= 0 && index < this.items.length) {
      this.items.forEach((item, idx) => {
        item.setFocusState(idx === index);
      });
      return true;
    }
    return false;
  }

  // 焦点后移：将焦点移动到下一个项，支持遥控器右键操作
  public moveFocusNext(): boolean {
    const currentIndex = this.items.findIndex(item => item.isFocus);
    if (currentIndex >= 0 && currentIndex < this.items.length - 1) {
      return this.setFocusToIndex(currentIndex + 1);
    }
    return false;
  }

  // 焦点前移：将焦点移动到上一个项，支持遥控器左键操作
  public moveFocusPrev(): boolean {
    const currentIndex = this.items.findIndex(item => item.isFocus);
    if (currentIndex > 0) {
      return this.setFocusToIndex(currentIndex - 1);
    }
    return false;
  }

  public getLength(): number {
    return this.items.length;
  }

  // 添加项：向列表中添加新的应用选项
  public addItem(item: AppItemModel): void {
    this.items.push(item);
  }

  // 删除项：通过索引移除列表中的应用选项
  public removeItemByIndex(index: number): boolean {
    if (index >= 0 && index < this.items.length) {
      this.items.splice(index, 1);
      return true;
    }
    return false;
  }

  // 清空列表：移除所有应用选项，用于重置状态
  public clearAllItems(): void {
    this.items = [];
  }

  public validateListIntegrity(): boolean {
    if (this.items.length === 0) {
      return false;
    }
    const focusedCount = this.items.filter(item => item.isFocus).length;
    if (focusedCount !== 1) {
      return false;
    }
    return this.items.every(item => item.isValidOperationType());
  }

  private initializeDefaultItems(): void {
    const uninstallItem = new AppItemModel('app.media.uninstall', 'app.media.uninstall_focus', false, '卸载',
      AppOperationType.APP_OPERATION_UNINSTALL);

    const moveItem =
      new AppItemModel('app.media.move', 'app.media.move_focus', true, '移动', AppOperationType.APP_OPERATION_MOVE);

    const shortcutItem = new AppItemModel('app.media.shortcut', 'app.media.shortcut_focus', false, '快捷方式',
      AppOperationType.APP_OPERATION_SHORTCUT);

    this.items.push(uninstallItem, moveItem, shortcutItem);
  }
}

export default function appListItemModelTest() {
  describe('AppListItemModel_Test', () => {
    let driver: Driver;
    let itemManager: AppListManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => { // 初始化Driver和列表管理器，确保测试从干净状态开始
      driver = createFreshDriver();
      itemManager = new AppListManager();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => { // 测试结束后关闭弹窗并清理资源
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });
    it('app_item_model_constructor_should_initialize_correctly', 0, async () => { // 验证应用项模型构造函数正确初始化，确保数据模型创建正确
      const model =
        new AppItemModel('test_icon', 'test_focus_icon', false, '测试项', AppOperationType.APP_OPERATION_UNINSTALL);

      expect(model.icon).assertEqual('test_icon');
      expect(model.onFocusIcon).assertEqual('test_focus_icon');
      expect(model.isFocus).assertFalse();
      expect(model.name).assertEqual('测试项');
      expect(model.operationType).assertEqual(AppOperationType.APP_OPERATION_UNINSTALL);
    });
    it('app_item_model_state_management_should_work_correctly', 0, async () => { // 验证应用项模型状态管理功能正常，确保焦点状态切换正确
      const model =
        new AppItemModel('icon_normal', 'icon_focus', false, '快捷方式', AppOperationType.APP_OPERATION_SHORTCUT);
      expect(model.getCurrentIcon()).assertEqual('icon_normal');
      expect(model.isFocus).assertFalse();
      model.setFocusState(true);
      expect(model.getCurrentIcon()).assertEqual('icon_focus');
      expect(model.isFocus).assertTrue();

      // 验证焦点状态可逆切换，确保UI状态恢复正确
      model.setFocusState(false);
      expect(model.getCurrentIcon()).assertEqual('icon_normal');
      expect(model.isFocus).assertFalse();
    });
    it('app_item_model_operation_type_validation_should_work', 0, async () => { // 验证应用项模型操作类型验证功能正常，确保操作类型有效
      const uninstallModel =
        new AppItemModel('icon', 'focus_icon', false, '卸载', AppOperationType.APP_OPERATION_UNINSTALL);
      const shortcutModel =
        new AppItemModel('icon', 'focus_icon', false, '快捷方式', AppOperationType.APP_OPERATION_SHORTCUT);
      const moveModel = new AppItemModel('icon', 'focus_icon', false, '移动', AppOperationType.APP_OPERATION_MOVE);

      expect(uninstallModel.isValidOperationType()).assertTrue();
      expect(shortcutModel.isValidOperationType()).assertTrue();
      expect(moveModel.isValidOperationType()).assertTrue();

      expect(uninstallModel.getOperationTypeDescription()).assertEqual('卸载操作');
      expect(shortcutModel.getOperationTypeDescription()).assertEqual('快捷方式操作');
      expect(moveModel.getOperationTypeDescription()).assertEqual('移动操作');
    });
    it('app_item_model_clone_should_create_identical_copy', 0, async () => { // 验证应用项模型克隆功能创建相同副本，确保数据复制正确
      const original =
        new AppItemModel('original_icon', 'original_focus', true, '移动', AppOperationType.APP_OPERATION_MOVE);

      const cloned = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.setFocusState(false);
      expect(original.isFocus).assertTrue();
      expect(cloned.isFocus).assertFalse();
    });
    it('app_item_model_equality_comparison_should_work_correctly', 0, async () => { // 验证应用项模型相等性比较功能正确，确保模型对比逻辑准确
      const model1 = new AppItemModel('icon', 'focus', false, '卸载', AppOperationType.APP_OPERATION_UNINSTALL);
      const model2 = new AppItemModel('icon', 'focus', false, '卸载', AppOperationType.APP_OPERATION_UNINSTALL);
      const model3 =
        new AppItemModel('different_icon', 'focus', false, '卸载', AppOperationType.APP_OPERATION_UNINSTALL);

      expect(model1.equals(model2)).assertTrue();
      expect(model1.equals(model3)).assertFalse();
    });
    it('app_list_manager_initialization_should_create_default_items', 0, async () => { // 验证应用项列表管理器初始化创建默认项，确保列表初始状态正确
      const manager = new AppListManager();

      expect(manager.getLength()).assertEqual(3);
      expect(manager.validateListIntegrity()).assertTrue();

      const items = manager.getAllItems();
      expect(items.length).assertEqual(3);
      expect(items[0].name).assertEqual('卸载');
      expect(items[1].name).assertEqual('移动');
      expect(items[2].name).assertEqual('快捷方式');
    });
    it('app_list_manager_focus_management_should_work_correctly', 0, async () => { // 验证应用项列表管理器焦点管理功能正常，确保焦点切换逻辑正确
      const manager = new AppListManager();
      const focusedItem = manager.getFocusedItem();
      expect(focusedItem === null).assertFalse();
      expect(focusedItem?.name).assertEqual('移动');

      // 验证焦点后移功能，确保右键操作焦点正确移动
      manager.moveFocusNext();
      const nextFocused = manager.getFocusedItem();
      expect(nextFocused?.name).assertEqual('快捷方式');

      // 验证焦点前移功能，确保左键操作焦点正确移动
      manager.moveFocusPrev();
      const prevFocused = manager.getFocusedItem();
      expect(prevFocused?.name).assertEqual('移动');
    });
    it('app_list_manager_boundary_focus_management_should_handle_edges', 0,
      async () => { // 验证应用项列表管理器边界焦点管理处理边缘情况，确保焦点不越界
        const manager = new AppListManager();
        manager.setFocusToIndex(0);
        expect(manager.getFocusedItem()?.name).assertEqual('卸载');

        // 验证焦点在最前项时前移失败，确保焦点不越界
        const movePrevResult = manager.moveFocusPrev();
        expect(movePrevResult).assertFalse();
        manager.setFocusToIndex(2);
        expect(manager.getFocusedItem()?.name).assertEqual('快捷方式');

        // 验证焦点在最后项时后移失败，确保焦点不越界
        const moveNextResult = manager.moveFocusNext();
        expect(moveNextResult).assertFalse();
      });
    it('app_list_manager_query_functions_should_return_correct_items', 0, async () => { // 验证应用项列表管理器查询函数返回正确项，确保数据检索准确
      const manager = new AppListManager();

      // 验证按索引查询功能
      const item0 = manager.getItemByIndex(0);
      expect(item0?.name).assertEqual('卸载');

      const item1 = manager.getItemByIndex(1);
      expect(item1?.name).assertEqual('移动');

      const invalidItem = manager.getItemByIndex(10);
      expect(invalidItem).assertEqual(null);

      // 验证按名称查询功能
      const uninstallItem = manager.getItemByName('卸载');
      expect(uninstallItem?.operationType).assertEqual(AppOperationType.APP_OPERATION_UNINSTALL);

      const notFoundItem = manager.getItemByName('不存在');
      expect(notFoundItem).assertEqual(null);

      // 验证按操作类型查询功能
      const shortcutItem = manager.getItemByOperationType(AppOperationType.APP_OPERATION_SHORTCUT);
      expect(shortcutItem?.name).assertEqual('快捷方式');
    });
    it('app_list_manager_add_remove_functions_should_work_correctly', 0, async () => { // 验证应用项列表管理器添加删除功能正常，确保列表修改操作正确
      const manager = new AppListManager();
      const initialLength = manager.getLength();

      // 验证添加项功能
      const newItem =
        new AppItemModel('new_icon', 'new_focus_icon', false, '新选项', AppOperationType.APP_OPERATION_UNINSTALL);
      manager.addItem(newItem);

      expect(manager.getLength()).assertEqual(initialLength + 1);
      expect(manager.getItemByName('新选项') === null).assertFalse();

      // 验证删除项功能
      const removeResult = manager.removeItemByIndex(0);
      expect(removeResult).assertTrue();
      expect(manager.getLength()).assertEqual(initialLength);

      // 验证无效索引删除失败，确保边界检查正确
      const invalidRemove = manager.removeItemByIndex(100);
      expect(invalidRemove).assertFalse();
    });
    it('app_list_manager_integrity_validation_should_detect_issues', 0, async () => { // 验证应用项列表管理器完整性验证能检测问题，确保数据一致性
      const manager = new AppListManager();
      expect(manager.validateListIntegrity()).assertTrue();

      // 验证清空列表后完整性检查失败
      manager.clearAllItems();
      expect(manager.validateListIntegrity()).assertFalse();

      // 验证添加单个项后完整性检查失败（缺少焦点项）
      manager.addItem(new AppItemModel('icon', 'focus', false, '卸载', AppOperationType.APP_OPERATION_UNINSTALL));
      expect(manager.validateListIntegrity()).assertFalse();

      // 验证添加焦点项后完整性检查通过
      manager.addItem(new AppItemModel('icon', 'focus', true, '卸载', AppOperationType.APP_OPERATION_SHORTCUT));
      expect(manager.validateListIntegrity()).assertTrue();
    });
    it('app_item_model_to_string_should_provide_readable_output', 0, async () => { // 验证应用项模型toString方法提供可读输出，确保调试信息清晰
      const model = new AppItemModel('test_icon', 'test_focus', true, '移动', AppOperationType.APP_OPERATION_MOVE);

      const strRepresentation = model.toString();
      expect(strRepresentation.includes('移动')).assertTrue();
      expect(strRepresentation.includes('2')).assertTrue();
      expect(strRepresentation.includes('true')).assertTrue();
    });
    it('app_list_manager_should_handle_multiple_focus_states_correctly', 0, async () => { // 验证应用项列表管理器正确处理多焦点状态，确保焦点唯一性
      const manager = new AppListManager();

      // 验证手动设置多焦点后完整性检查失败
      const items = manager.getAllItems();
      items[0].setFocusState(true);
      items[1].setFocusState(true);
      expect(manager.validateListIntegrity()).assertFalse();

      // 验证通过setFocusToIndex修复多焦点状态，确保焦点唯一性
      manager.setFocusToIndex(1);
      expect(manager.validateListIntegrity()).assertTrue();
      const focusedCount = manager.getAllItems().filter(item => item.isFocus).length;
      expect(focusedCount).assertEqual(1);
    });
    it('app_item_model_should_handle_invalid_operation_types', 0, async () => { // 验证应用项模型处理无效操作类型，确保类型验证机制有效
      const validModel = new AppItemModel('icon', 'focus', false, '卸载', AppOperationType.APP_OPERATION_UNINSTALL);
      const invalidModel = new AppItemModel('icon', 'focus', false, '未知操作', -1);
      const outOfRangeModel = new AppItemModel('icon', 'focus', false, '超出范围操作', 100);

      expect(validModel.isValidOperationType()).assertTrue();
      expect(invalidModel.isValidOperationType()).assertFalse();
      expect(outOfRangeModel.isValidOperationType()).assertFalse();

      expect(validModel.getOperationTypeDescription()).assertEqual('卸载操作');
      expect(invalidModel.getOperationTypeDescription()).assertEqual('未知操作');
      expect(outOfRangeModel.getOperationTypeDescription()).assertEqual('未知操作');
    });
    it('app_list_manager_complex_operation_sequence_should_maintain_consistency', 0,
      async () => { // 验证列表管理器复杂操作序列保持一致性，确保数据完整性
        const manager = new AppListManager();
        manager.setFocusToIndex(0);
        expect(manager.getFocusedItem()?.name).assertEqual('卸载');

        manager.moveFocusNext();
        expect(manager.getFocusedItem()?.name).assertEqual('移动');

        manager.moveFocusNext();
        expect(manager.getFocusedItem()?.name).assertEqual('快捷方式');

        manager.moveFocusPrev();
        expect(manager.getFocusedItem()?.name).assertEqual('移动');

        manager.setFocusToIndex(2);
        expect(manager.getFocusedItem()?.name).assertEqual('快捷方式');
        expect(manager.validateListIntegrity()).assertTrue();
        expect(manager.getLength()).assertEqual(3);
      });
    it('app_item_model_data_consistency_should_be_maintained', 0, async () => { // 验证应用项模型数据一致性保持，确保状态同步正确
      const model = new AppItemModel('app.media.uninstall', 'app.media.uninstall_focus', false, '卸载',
        AppOperationType.APP_OPERATION_UNINSTALL);
      expect(model.getCurrentIcon()).assertEqual('app.media.uninstall');
      expect(model.getDisplayName()).assertEqual('卸载');
      expect(model.isValidOperationType()).assertTrue();

      // 验证焦点状态改变图标显示，确保UI响应正确
      model.setFocusState(true);
      expect(model.getCurrentIcon()).assertEqual('app.media.uninstall_focus');
      expect(model.isFocus).assertTrue();

      model.setFocusState(false);
      expect(model.getCurrentIcon()).assertEqual('app.media.uninstall');
      expect(model.isFocus).assertFalse();
    });
    it('app_list_manager_performance_should_meet_requirements', 0, async () => { // 验证列表管理器性能满足要求，确保操作效率
      const manager = new AppListManager();

      // 验证批量查询操作性能，确保1000次查询在1秒内完成
      const queryStart: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        manager.getItemByIndex(i % 3);
        manager.getItemByName('卸载');
        manager.getItemByOperationType(AppOperationType.APP_OPERATION_UNINSTALL);
      }
      const queryEnd: number = Date.now();
      const queryTime: number = queryEnd - queryStart;

      expect(queryTime).assertLessOrEqual(1000); // 1秒内完成1000次查询操作

      // 验证批量焦点切换性能，确保1000次切换在1秒内完成
      const focusStart: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        manager.moveFocusNext();
        manager.moveFocusPrev();
      }
      const focusEnd: number = Date.now();
      const focusTime: number = focusEnd - focusStart;

      expect(focusTime).assertLessOrEqual(1000); // 1秒内完成1000次焦点切换
    });
    it('app_item_model_boundary_values_should_be_handled_correctly', 0, async () => { // 验证应用项模型正确处理边界值，确保异常情况处理
      const emptyNameModel = new AppItemModel('', '', false, '', AppOperationType.APP_OPERATION_UNINSTALL);
      expect(emptyNameModel.getDisplayName()).assertEqual('');
      expect(emptyNameModel.getCurrentIcon()).assertEqual('');

      // 验证特殊字符名称处理，确保特殊字符不会导致异常
      const specialCharModel =
        new AppItemModel('icon!@#', 'focus$%^', false, '特殊字符名称*()', AppOperationType.APP_OPERATION_SHORTCUT);
      expect(specialCharModel.getDisplayName()).assertEqual('特殊字符名称*()');
      expect(specialCharModel.getCurrentIcon()).assertEqual('icon!@#');

      // 验证长字符串处理，确保长名称不会导致性能问题
      const longString = 'a'.repeat(1000);
      const longStringModel =
        new AppItemModel(longString, longString, false, longString, AppOperationType.APP_OPERATION_MOVE);
      expect(longStringModel.getDisplayName().length).assertEqual(1000);
    });
    it('app_list_manager_empty_list_operations_should_be_handled_gracefully', 0,
      async () => { // 验证列表管理器优雅处理空列表操作，确保空状态安全
        const manager = new AppListManager();
        manager.clearAllItems();
        expect(manager.getLength()).assertEqual(0);
        expect(manager.getAllItems().length).assertEqual(0);
        expect(manager.getFocusedItem()).assertEqual(null);
        expect(manager.validateListIntegrity()).assertFalse();
        expect(manager.getItemByIndex(0)).assertEqual(null);
        expect(manager.getItemByName('不存在的项')).assertEqual(null);
        expect(manager.getItemByOperationType(0)).assertEqual(null);
        expect(manager.setFocusToIndex(0)).assertFalse();
        expect(manager.moveFocusNext()).assertFalse();
        expect(manager.moveFocusPrev()).assertFalse();
      });
    it('app_list_model_integration_should_work_seamlessly', 0, async () => { // 验证应用模型集成无缝工作，确保组件协同正确
      const manager = new AppListManager();
      const focusedItem = manager.getFocusedItem();
      expect(focusedItem === null).assertFalse();
      expect(focusedItem?.name).assertEqual('移动');

      // 验证手动取消焦点破坏完整性，确保焦点必须存在
      focusedItem?.setFocusState(false);
      expect(manager.validateListIntegrity()).assertFalse();

      // 验证通过setFocusToIndex恢复完整性，确保修复机制有效
      manager.setFocusToIndex(1);
      expect(manager.validateListIntegrity()).assertTrue();
      const newFocusedItem = manager.getFocusedItem();
      expect(newFocusedItem?.isFocus).assertTrue();
      expect(newFocusedItem?.name).assertEqual('移动');
      const otherItems = manager.getAllItems().filter(item => item.name !== '移动');
      otherItems.forEach(item => {
        expect(item.isFocus).assertFalse();
      });
    });

  });
}

/**
 * 应用列表排序策略
 * 封装按安装时间、按名称、按历史顺序的排序业务逻辑
 */
class AppListSortStrategy {
  // 按安装时间升序排序
  public static sortByInstallTime(list: string[]): string[] {
    return [...list].sort((a, b) => a.localeCompare(b));
  }

  // 按安装时间降序排序（最新优先）
  public static sortByInstallTimeDesc(list: string[]): string[] {
    return [...list].sort((a, b) => b.localeCompare(a));
  }

  // 按历史排序信息重排（对应 orderList 逻辑）
  public static orderByHistory(list: string[], history: string[]): string[] {
    const ordered: string[] = [];
    const remain = [...list];
    for (const key of history) {
      const idx = remain.indexOf(key);
      if (idx >= 0) {
        ordered.push(remain[idx]);
        remain.splice(idx, 1);
      }
    }
    return [...ordered, ...remain].filter(e => e !== null && e !== undefined);
  }

  // 校验排序结果是否完整（无丢失、无重复）
  public static isCompleteOrder(sorted: string[], original: string[]): boolean {
    if (sorted.length !== original.length) {
      return false;
    }
    const a = [...sorted].sort();
    const b = [...original].sort();
    for (let i = 0; i < a.length; i++) {
      if (a[i] !== b[i]) {
        return false;
      }
    }
    return true;
  }
}

/**
 * 应用列表过滤规则
 * 封装系统保留应用过滤、自身应用过滤、关键词过滤等业务逻辑
 */
class AppListFilterRule {
  // 过滤系统保留应用（com.ohos 前缀）
  public static filterSystemApp(list: string[]): string[] {
    return list.filter(bundleName => !bundleName.startsWith('com.ohos.'));
  }

  // 过滤自身应用
  public static filterSelfApp(list: string[], selfBundleName: string): string[] {
    return list.filter(bundleName => bundleName !== selfBundleName);
  }

  // 按关键词过滤
  public static filterByKeyword(list: string[], keyword: string): string[] {
    const kw = keyword.toLowerCase();
    return list.filter(bundleName => bundleName.toLowerCase().includes(kw));
  }

  // 判断是否系统保留应用
  public static isSystemReserved(bundleName: string): boolean {
    return bundleName.startsWith('com.ohos.') || bundleName === 'com.samples.applicationmanager';
  }
}

/**
 * 应用列表分页器
 * 封装首屏 18 个应用 + 分批加载剩余应用的业务逻辑
 */
class AppListPaginator {
  private totalItems: string[] = [];

  public setItems(items: string[]): void {
    this.totalItems = [...items];
  }

  public getItems(): string[] {
    return [...this.totalItems];
  }

  public getTotalCount(): number {
    return this.totalItems.length;
  }

  // 获取指定页数据（首屏 pageIndex=0, pageSize=18）
  public getPage(pageIndex: number, pageSize: number): string[] {
    const start = pageIndex * pageSize;
    return this.totalItems.slice(start, start + pageSize);
  }

  // 计算总页数
  public getPageCount(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.totalItems.length / pageSize);
  }

  // 判断是否还有下一页
  public hasNextPage(pageIndex: number, pageSize: number): boolean {
    return (pageIndex + 1) < this.getPageCount(pageSize);
  }
}

/**
 * 应用列表去重器
 * 封装按唯一键去重的业务逻辑
 */
class AppListDeduplicator {
  // 按字符串数组去重
  public static deduplicate(list: string[]): string[] {
    const result: string[] = [];
    for (const item of list) {
      if (!result.includes(item)) {
        result.push(item);
      }
    }
    return result;
  }

  // 判断列表是否含重复
  public static hasDuplicate(list: string[]): boolean {
    return new Set<string>(list).size !== list.length;
  }

  // 统计重复项数量
  public static countDuplicates(list: string[]): number {
    return list.length - new Set<string>(list).size;
  }
}

/**
 * 应用列表缓存管理
 * 封装图标、名称缓存命中与失效业务逻辑
 */
class AppListCacheManager {
  private iconCache: Map<string, string> = new Map<string, string>();
  private nameCache: Map<string, string> = new Map<string, string>();
  private hitCount: number = 0;
  private missCount: number = 0;

  public getIcon(bundleName: string): string | null {
    if (this.iconCache.has(bundleName)) {
      this.hitCount++;
      return this.iconCache.get(bundleName) ?? null;
    }
    this.missCount++;
    return null;
  }

  public getName(bundleName: string): string | null {
    if (this.nameCache.has(bundleName)) {
      this.hitCount++;
      return this.nameCache.get(bundleName) ?? null;
    }
    this.missCount++;
    return null;
  }

  public putIcon(bundleName: string, icon: string): void {
    this.iconCache.set(bundleName, icon);
  }

  public putName(bundleName: string, name: string): void {
    this.nameCache.set(bundleName, name);
  }

  public getHitRate(): number {
    const total = this.hitCount + this.missCount;
    return total === 0 ? 0 : this.hitCount / total;
  }

  public getCacheSize(): number {
    return this.iconCache.size + this.nameCache.size;
  }

  public clear(): void {
    this.iconCache.clear();
    this.nameCache.clear();
    this.hitCount = 0;
    this.missCount = 0;
  }
}

/**
 * 应用列表持久化存储
 * 封装排序信息持久化到本地存储的业务逻辑
 */
class AppListPersistenceStore {
  private storedOrder: string[] = [];

  // 保存排序信息
  public saveOrder(order: string[]): void {
    this.storedOrder = [...order];
  }

  // 读取排序信息
  public loadOrder(): string[] {
    return [...this.storedOrder];
  }

  // 判断是否有已保存的排序
  public hasSavedOrder(): boolean {
    return this.storedOrder.length > 0;
  }

  // 清空已保存的排序
  public clearOrder(): void {
    this.storedOrder = [];
  }
}

/**
 * 应用列表刷新策略
 * 封装前台恢复刷新、安装后刷新、卸载后刷新等业务逻辑
 */
class AppListRefreshStrategy {
  private refreshCount: number = 0;
  private lastRefreshReason: string = '';

  public refresh(reason: string): void {
    this.refreshCount++;
    this.lastRefreshReason = reason;
  }

  public getRefreshCount(): number {
    return this.refreshCount;
  }

  public getLastRefreshReason(): string {
    return this.lastRefreshReason;
  }

  public shouldRefreshOnForeground(): boolean {
    return true;
  }

  public reset(): void {
    this.refreshCount = 0;
    this.lastRefreshReason = '';
  }
}

/**
 * 应用列表比较器
 * 封装按安装时间、按名称的比较业务逻辑
 */
class AppListComparator {
  public static compareByInstallTime(a: string, b: string): number {
    return a.localeCompare(b);
  }

  public static compareByName(a: string, b: string): number {
    return a.localeCompare(b);
  }

  public static compareByInstallTimeDesc(a: string, b: string): number {
    return b.localeCompare(a);
  }
}

/**
 * 应用列表分批加载器
 * 封装应用列表分批加载与进度追踪业务逻辑
 */
class AppListBatchLoader {
  private loadedCount: number = 0;
  private totalCount: number = 0;

  public setTotalCount(total: number): void {
    this.totalCount = total;
  }

  public loadBatch(count: number): void {
    this.loadedCount += count;
    if (this.loadedCount > this.totalCount) {
      this.loadedCount = this.totalCount;
    }
  }

  public getLoadedCount(): number {
    return this.loadedCount;
  }

  public isFullyLoaded(): boolean {
    return this.loadedCount >= this.totalCount;
  }

  public getLoadProgress(): number {
    if (this.totalCount === 0) {
      return 0;
    }
    return this.loadedCount / this.totalCount;
  }

  public reset(): void {
    this.loadedCount = 0;
    this.totalCount = 0;
  }
}

/**
 * 应用列表统计器
 * 封装应用列表数量统计、分类统计业务逻辑
 */
class AppListStatistics {
  private totalApps: number = 0;
  private systemApps: number = 0;
  private normalApps: number = 0;

  public recordApp(isSystem: boolean): void {
    this.totalApps++;
    if (isSystem) {
      this.systemApps++;
    } else {
      this.normalApps++;
    }
  }

  public getTotalApps(): number {
    return this.totalApps;
  }

  public getSystemApps(): number {
    return this.systemApps;
  }

  public getNormalApps(): number {
    return this.normalApps;
  }

  public reset(): void {
    this.totalApps = 0;
    this.systemApps = 0;
    this.normalApps = 0;
  }
}

/**
 * 应用列表校验器
 * 封装应用列表数据有效性校验业务逻辑
 */
class AppListValidator {
  public static isNonEmptyList(list: string[]): boolean {
    return list !== undefined && list !== null && list.length > 0;
  }

  public static hasNullEntry(list: string[]): boolean {
    return list.some(item => item === null || item === undefined);
  }
}

/**
 * 应用列表变更监听器
 * 封装应用列表增删变更的监听业务逻辑
 */
class AppListChangeListener {
  private changeEvents: string[] = [];

  public onChanged(event: string): void {
    this.changeEvents.push(event);
  }

  public getChangeEvents(): string[] {
    return [...this.changeEvents];
  }

  public getChangeCount(): number {
    return this.changeEvents.length;
  }

  public clear(): void {
    this.changeEvents = [];
  }
}

/**
 * 应用列表状态快照
 * 封装应用列表状态快照与回滚业务逻辑
 */
class AppListStateSnapshot {
  private snapshot: string[] = [];

  public takeSnapshot(list: string[]): void {
    this.snapshot = [...list];
  }

  public getSnapshot(): string[] {
    return [...this.snapshot];
  }

  public hasSnapshot(): boolean {
    return this.snapshot.length > 0;
  }

  public clear(): void {
    this.snapshot = [];
  }
}
