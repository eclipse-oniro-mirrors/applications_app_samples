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
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  isInputMethodEnabled
} from '../Shared/SharedDriver';

// 电源操作类型枚举：覆盖TV设备主要的电源操作类型
enum KeyOperationType {
  IMEOPERATION_SUSPEND = 0, IMEOPERATION_REBOOT = 1, IMEOPERATION_SHUTDOWN = 2
}

// 电源项信息模型：封装单个电源选项的UI状态和操作类型
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
    return this.operationType >= KeyOperationType.IMEOPERATION_SUSPEND &&
      this.operationType <= KeyOperationType.IMEOPERATION_SHUTDOWN;
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

  // 克隆方法：创建数据模型的独立副本，避免引用污染
  public clone(): KeyInfoModel {
    return new KeyInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }

  // 相等性比较：验证两个模型实例是否完全相同，用于数据一致性检查
  public equals(other: KeyInfoModel): boolean {
    return this.icon === other.icon && this.onFocusIcon === other.onFocusIcon && this.isFocus === other.isFocus &&
      this.name === other.name && this.operationType === other.operationType;
  }

  // 字符串表示：提供可读的调试信息，便于问题排查
  public toString(): string {
    return `KeyInfo{name: ${this.name}, operationType: ${this.operationType}, isFocus: ${this.isFocus}}`;
  }
}

// 电源项列表管理器：管理电源选项列表的焦点状态和数据完整性
class KeyInfoListManager {
  private items: KeyInfoModel[] = [];

  constructor() {
    this.initializeDefaultItems();
  }

  public getAllItems(): KeyInfoModel[] {
    return [...this.items];
  }

  // 按索引获取项：支持通过位置快速访问列表项
  public getItemByIndex(index: number): KeyInfoModel | null {
    if (index >= 0 && index < this.items.length) {
      return this.items[index];
    }
    return null;
  }

  // 按名称获取项：支持通过名称查找特定电源选项
  public getItemByName(name: string): KeyInfoModel | null {
    return this.items.find(item => item.name === name) || null;
  }

  // 按操作类型获取项：支持通过操作类型查找对应电源选项
  public getItemByOperationType(operationType: number): KeyInfoModel | null {
    return this.items.find(item => item.operationType === operationType) || null;
  }

  public getFocusedItem(): KeyInfoModel | null {
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

  // 添加项：向列表中添加新的电源选项
  public addItem(item: KeyInfoModel): void {
    this.items.push(item);
  }

  // 删除项：通过索引移除列表中的电源选项
  public removeItemByIndex(index: number): boolean {
    if (index >= 0 && index < this.items.length) {
      this.items.splice(index, 1);
      return true;
    }
    return false;
  }

  // 清空列表：移除所有电源选项，用于重置状态
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
    const suspendItem = new KeyInfoModel('app.media.screenout', 'app.media.screenout_focus', false, '息屏',
      KeyOperationType.IMEOPERATION_SUSPEND);

    const shutdownItem = new KeyInfoModel('app.media.shutdown', 'app.media.shutdown_focus', true, '中文',
      KeyOperationType.IMEOPERATION_SHUTDOWN);

    const rebootItem = new KeyInfoModel('app.media.reboot', 'app.media.reboot_focus', false, '符号',
      KeyOperationType.IMEOPERATION_REBOOT);

    this.items.push(suspendItem, shutdownItem, rebootItem);
  }
}

// 焦点视觉状态枚举：描述电源项在不同交互阶段的视觉呈现
enum ImeFocusVisualState {
  FOCUS_NORMAL = 'focus_normal', FOCUS_HOVERED = 'focus_hovered', FOCUS_PRESSED = 'focus_pressed', FOCUS_DISABLED = 'focus_disabled'
}

// 电源模型状态类型枚举：描述电源模型所处的生命周期阶段
enum KeyboardModelStateType {
  MODEL_INITIALIZED = 'model_initialized', MODEL_ACTIVE = 'model_active', MODEL_SUSPENDED = 'model_suspended', MODEL_DESTROYED = 'model_destroyed'
}

// 电源项统计快照接口：记录某一时刻的列表聚合统计信息
interface KeyInfoStatSnapshot {
  totalCount: number;
  focusedCount: number;
  suspendCount: number;
  rebootCount: number;
  shutdownCount: number;
  validCount: number;
}

// 电源项统计器：对列表管理器进行聚合统计与快照生成
class KeyInfoStatistics {
  private manager: KeyInfoListManager;

  constructor(manager: KeyInfoListManager) {
    this.manager = manager;
  }

  public getTotalCount(): number {
    return this.manager.getLength();
  }

  public getFocusedCount(): number {
    return this.manager.getAllItems().filter(item => item.isFocus).length;
  }

  public getCountByOperationType(operationType: number): number {
    return this.manager.getAllItems().filter(item => item.operationType === operationType).length;
  }

  public getValidCount(): number {
    return this.manager.getAllItems().filter(item => item.isValidOperationType()).length;
  }

  public getInvalidCount(): number {
    return this.getTotalCount() - this.getValidCount();
  }

  public getFocusedRatio(): number {
    const total = this.getTotalCount();
    if (total === 0) {
      return 0;
    }
    return this.getFocusedCount() / total;
  }

  public generateSnapshot(): KeyInfoStatSnapshot {
    return {
      totalCount: this.getTotalCount(),
      focusedCount: this.getFocusedCount(),
      suspendCount: this.getCountByOperationType(KeyOperationType.IMEOPERATION_SUSPEND),
      rebootCount: this.getCountByOperationType(KeyOperationType.IMEOPERATION_REBOOT),
      shutdownCount: this.getCountByOperationType(KeyOperationType.IMEOPERATION_SHUTDOWN),
      validCount: this.getValidCount()
    };
  }

  public describeSnapshot(): string {
    const snapshot = this.generateSnapshot();
    return `KeyInfoStatistics{total: ${snapshot.totalCount}, focused: ${snapshot.focusedCount}, valid: ${snapshot.validCount}}`;
  }
}

// 电源项构建器：以流式接口方式构建 KeyInfoModel 实例，提升测试数据构造可读性
class KeyInfoBuilder {
  private icon: string;
  private onFocusIcon: string;
  private isFocus: boolean;
  private name: string;
  private operationType: number;

  constructor() {
    this.icon = '';
    this.onFocusIcon = '';
    this.isFocus = false;
    this.name = '';
    this.operationType = KeyOperationType.IMEOPERATION_SUSPEND;
  }

  public withIcon(icon: string): KeyInfoBuilder {
    this.icon = icon;
    return this;
  }

  public withOnFocusIcon(onFocusIcon: string): KeyInfoBuilder {
    this.onFocusIcon = onFocusIcon;
    return this;
  }

  public withFocusState(isFocus: boolean): KeyInfoBuilder {
    this.isFocus = isFocus;
    return this;
  }

  public withName(name: string): KeyInfoBuilder {
    this.name = name;
    return this;
  }

  public withOperationType(operationType: number): KeyInfoBuilder {
    this.operationType = operationType;
    return this;
  }

  public build(): KeyInfoModel {
    return new KeyInfoModel(this.icon, this.onFocusIcon, this.isFocus, this.name, this.operationType);
  }
}

// 电源模型状态机：管理模型生命周期状态的迁移与合法性校验
class KeyboardModelStateMachine {
  private currentState: KeyboardModelStateType = KeyboardModelStateType.MODEL_INITIALIZED;
  private transitionCount: number = 0;

  public getState(): KeyboardModelStateType {
    return this.currentState;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public activate(): boolean {
    if (this.currentState === KeyboardModelStateType.MODEL_INITIALIZED) {
      this.currentState = KeyboardModelStateType.MODEL_ACTIVE;
      this.transitionCount++;
      return true;
    }
    return false;
  }

  public suspend(): boolean {
    if (this.currentState === KeyboardModelStateType.MODEL_ACTIVE) {
      this.currentState = KeyboardModelStateType.MODEL_SUSPENDED;
      this.transitionCount++;
      return true;
    }
    return false;
  }

  public resume(): boolean {
    if (this.currentState === KeyboardModelStateType.MODEL_SUSPENDED) {
      this.currentState = KeyboardModelStateType.MODEL_ACTIVE;
      this.transitionCount++;
      return true;
    }
    return false;
  }

  public destroy(): boolean {
    if (this.currentState !== KeyboardModelStateType.MODEL_DESTROYED) {
      this.currentState = KeyboardModelStateType.MODEL_DESTROYED;
      this.transitionCount++;
      return true;
    }
    return false;
  }

  public isActive(): boolean {
    return this.currentState === KeyboardModelStateType.MODEL_ACTIVE;
  }

  public isDestroyed(): boolean {
    return this.currentState === KeyboardModelStateType.MODEL_DESTROYED;
  }
}

// 电源模型深度校验器：对模型数据进行多维度合法性校验，返回结构化校验报告
class KeyboardModelDeepValidator {
  private model: KeyInfoModel;

  constructor(model: KeyInfoModel) {
    this.model = model;
  }

  public hasNonEmptyName(): boolean {
    return this.model.name.length > 0;
  }

  public hasNonEmptyIcon(): boolean {
    return this.model.icon.length > 0;
  }

  public hasNonEmptyFocusIcon(): boolean {
    return this.model.onFocusIcon.length > 0;
  }

  public isNameLengthWithinLimit(maxLength: number): boolean {
    return this.model.name.length <= maxLength;
  }

  public isIconLengthWithinLimit(maxLength: number): boolean {
    return this.model.icon.length <= maxLength;
  }

  public validateAll(): boolean {
    return this.hasNonEmptyName() && this.hasNonEmptyIcon() && this.hasNonEmptyFocusIcon() &&
      this.model.isValidOperationType();
  }

  public collectViolations(): string[] {
    const violations: string[] = [];
    if (!this.hasNonEmptyName()) {
      violations.push('名称为空');
    }
    if (!this.hasNonEmptyIcon()) {
      violations.push('图标为空');
    }
    if (!this.hasNonEmptyFocusIcon()) {
      violations.push('焦点图标为空');
    }
    if (!this.model.isValidOperationType()) {
      violations.push('操作类型非法');
    }
    return violations;
  }
}

// 电源项快照仓库：保存与恢复列表的焦点与数据快照，支持回归对比
class KeyInfoSnapshotStore {
  private snapshots: KeyInfoStatSnapshot[] = [];

  public capture(manager: KeyInfoListManager): void {
    const stats = new KeyInfoStatistics(manager);
    this.snapshots.push(stats.generateSnapshot());
  }

  public getSnapshotCount(): number {
    return this.snapshots.length;
  }

  public getLatestSnapshot(): KeyInfoStatSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  public areSnapshotsIdentical(): boolean {
    if (this.snapshots.length < 2) {
      return false;
    }
    const first = this.snapshots[0];
    const last = this.snapshots[this.snapshots.length - 1];
    return first.totalCount === last.totalCount && first.focusedCount === last.focusedCount &&
      first.suspendCount === last.suspendCount && first.rebootCount === last.rebootCount &&
      first.shutdownCount === last.shutdownCount && first.validCount === last.validCount;
  }

  public clear(): void {
    this.snapshots = [];
  }
}

// 焦点迁移方向枚举：描述焦点移动的方向
enum ImeFocusTransitionDirection {
  DIRECTION_NEXT = 'next', DIRECTION_PREV = 'prev', DIRECTION_JUMP = 'jump'
}

// 电源模型格式化器：将模型数据格式化为多种可读文本
class KeyboardModelFormatter {
  public formatItem(model: KeyInfoModel): string {
    return `${model.name}[${model.getOperationTypeDescription()}]`;
  }

  public formatItemList(manager: KeyInfoListManager): string {
    const parts: string[] = manager.getAllItems().map((item: KeyInfoModel) => this.formatItem(item));
    return parts.join(', ');
  }

  public formatFocusState(model: KeyInfoModel): string {
    return model.isFocus ? '获得焦点' : '未获得焦点';
  }

  public formatCountSummary(manager: KeyInfoListManager): string {
    const stats = new KeyInfoStatistics(manager);
    const snapshot = stats.generateSnapshot();
    return `总数=${snapshot.totalCount}, 焦点=${snapshot.focusedCount}, 有效=${snapshot.validCount}`;
  }

  public formatDirection(direction: ImeFocusTransitionDirection): string {
    if (direction === ImeFocusTransitionDirection.DIRECTION_NEXT) {
      return '后移';
    }
    if (direction === ImeFocusTransitionDirection.DIRECTION_PREV) {
      return '前移';
    }
    return '跳转';
  }
}

// 焦点迁移记录器：记录并统计焦点迁移的方向与次数
class ImeFocusTransitionRecorder {
  private directions: ImeFocusTransitionDirection[] = [];

  public record(direction: ImeFocusTransitionDirection): void {
    this.directions.push(direction);
  }

  public getTransitionCount(): number {
    return this.directions.length;
  }

  public countByDirection(direction: ImeFocusTransitionDirection): number {
    return this.directions.filter((item: ImeFocusTransitionDirection) => item === direction).length;
  }

  public getDirectionSequence(): ImeFocusTransitionDirection[] {
    return [...this.directions];
  }

  public isAlternating(): boolean {
    for (let i = 2; i < this.directions.length; i++) {
      if (this.directions[i] === this.directions[i - 1] && this.directions[i - 1] === this.directions[i - 2]) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.directions = [];
  }
}

export default function keyboardModelDeepTest() {
  describe('KeyboardModelDeep_Test', () => {
    let driver: Driver;
    let itemManager: KeyInfoListManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => { // 初始化Driver和列表管理器，确保测试从干净状态开始
      driver = getDriver();
      itemManager = new KeyInfoListManager();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => { // 测试结束后关闭对话框并清理资源
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });
    it('ime_item_info_model_constructor_should_initialize_correctly', 0, async () => { // 验证电源项模型构造函数正确初始化，确保数据模型创建正确
      const model = new KeyInfoModel('test_icon', 'test_focus_icon', false, '测试项',
        KeyOperationType.IMEOPERATION_SUSPEND);

      expect(model.icon).assertEqual('test_icon');
      expect(model.onFocusIcon).assertEqual('test_focus_icon');
      expect(model.isFocus).assertFalse();
      expect(model.name).assertEqual('测试项');
      expect(model.operationType).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);
    });
    it('ime_item_info_model_state_management_should_work_correctly', 0, async () => { // 验证电源项模型状态管理功能正常，确保焦点状态切换正确
      const model =
        new KeyInfoModel('icon_normal', 'icon_focus', false, '符号', KeyOperationType.IMEOPERATION_REBOOT);
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
    it('ime_item_info_model_operation_type_validation_should_work', 0, async () => { // 验证电源项模型操作类型验证功能正常，确保操作类型有效
      const suspendModel =
        new KeyInfoModel('icon', 'focus_icon', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
      const rebootModel =
        new KeyInfoModel('icon', 'focus_icon', false, '符号', KeyOperationType.IMEOPERATION_REBOOT);
      const shutdownModel =
        new KeyInfoModel('icon', 'focus_icon', false, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);

      expect(suspendModel.isValidOperationType()).assertTrue();
      expect(rebootModel.isValidOperationType()).assertTrue();
      expect(shutdownModel.isValidOperationType()).assertTrue();

      expect(suspendModel.getOperationTypeDescription()).assertEqual('休眠操作');
      expect(rebootModel.getOperationTypeDescription()).assertEqual('符号操作');
      expect(shutdownModel.getOperationTypeDescription()).assertEqual('中文操作');
    });
    it('ime_item_info_model_clone_should_create_identical_copy', 0, async () => { // 验证电源项模型克隆功能创建相同副本，确保数据复制正确
      const original = new KeyInfoModel('original_icon', 'original_focus', true, '中文',
        KeyOperationType.IMEOPERATION_SHUTDOWN);

      const cloned = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.setFocusState(false);
      expect(original.isFocus).assertTrue();
      expect(cloned.isFocus).assertFalse();
    });
    it('ime_item_info_model_equality_comparison_should_work_correctly', 0,
      async () => { // 验证电源项模型相等性比较功能正确，确保模型对比逻辑准确
        const model1 =
          new KeyInfoModel('icon', 'focus', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
        const model2 =
          new KeyInfoModel('icon', 'focus', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);
        const model3 =
          new KeyInfoModel('different_icon', 'focus', false, '息屏', KeyOperationType.IMEOPERATION_SUSPEND);

        expect(model1.equals(model2)).assertTrue();
        expect(model1.equals(model3)).assertFalse();
      });
    it('ime_item_list_manager_initialization_should_create_default_items', 0,
      async () => { // 验证电源项列表管理器初始化创建默认项，确保列表初始状态正确
        const manager = new KeyInfoListManager();

        expect(manager.getLength()).assertEqual(3);
        expect(manager.validateListIntegrity()).assertTrue();

        const items = manager.getAllItems();
        expect(items.length).assertEqual(3);
        expect(items[0].name).assertEqual('息屏');
        expect(items[1].name).assertEqual('中文');
        expect(items[2].name).assertEqual('符号');
      });
    it('ime_item_list_manager_focus_management_should_work_correctly', 0,
      async () => { // 验证电源项列表管理器焦点管理功能正常，确保焦点切换逻辑正确
        const manager = new KeyInfoListManager();
        const focusedItem = manager.getFocusedItem();
        expect(focusedItem === null).assertFalse();
        expect(focusedItem?.name).assertEqual('中文');

        // 验证焦点后移功能，确保右键操作焦点正确移动
        manager.moveFocusNext();
        const nextFocused = manager.getFocusedItem();
        expect(nextFocused?.name).assertEqual('符号');

        // 验证焦点前移功能，确保左键操作焦点正确移动
        manager.moveFocusPrev();
        const prevFocused = manager.getFocusedItem();
        expect(prevFocused?.name).assertEqual('中文');
      });
    it('ime_item_list_manager_boundary_focus_management_should_handle_edges', 0,
      async () => { // 验证电源项列表管理器边界焦点管理处理边缘情况，确保焦点不越界
        const manager = new KeyInfoListManager();
        manager.setFocusToIndex(0);
        expect(manager.getFocusedItem()?.name).assertEqual('息屏');

        // 验证焦点在最前项时前移失败，确保焦点不越界
        const movePrevResult = manager.moveFocusPrev();
        expect(movePrevResult).assertFalse();
        manager.setFocusToIndex(2);
        expect(manager.getFocusedItem()?.name).assertEqual('符号');

        // 验证焦点在最后项时后移失败，确保焦点不越界
        const moveNextResult = manager.moveFocusNext();
        expect(moveNextResult).assertFalse();
      });
    it('ime_item_list_manager_query_functions_should_return_correct_items', 0,
      async () => { // 验证电源项列表管理器查询函数返回正确项，确保数据检索准确
        const manager = new KeyInfoListManager();

        // 验证按索引查询功能
        const item0 = manager.getItemByIndex(0);
        expect(item0?.name).assertEqual('息屏');

        const item1 = manager.getItemByIndex(1);
        expect(item1?.name).assertEqual('中文');

        const invalidItem = manager.getItemByIndex(10);
        expect(invalidItem).assertEqual(null);

        // 验证按名称查询功能
        const suspendItem = manager.getItemByName('息屏');
        expect(suspendItem?.operationType).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);

        const notFoundItem = manager.getItemByName('不存在');
        expect(notFoundItem).assertEqual(null);

        // 验证按操作类型查询功能
        const rebootItem = manager.getItemByOperationType(KeyOperationType.IMEOPERATION_REBOOT);
        expect(rebootItem?.name).assertEqual('符号');
      });
    it('ime_item_list_manager_add_remove_functions_should_work_correctly', 0,
      async () => { // 验证电源项列表管理器添加删除功能正常，确保列表修改操作正确
        const manager = new KeyInfoListManager();
        const initialLength = manager.getLength();

        // 验证添加项功能
        const newItem = new KeyInfoModel('new_icon', 'new_focus_icon', false, '新选项',
          KeyOperationType.IMEOPERATION_SUSPEND);
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
    it('ime_item_list_manager_integrity_validation_should_detect_issues', 0,
      async () => { // 验证电源项列表管理器完整性验证能检测问题，确保数据一致性
        const manager = new KeyInfoListManager();
        expect(manager.validateListIntegrity()).assertTrue();

        // 验证清空列表后完整性检查失败
        manager.clearAllItems();
        expect(manager.validateListIntegrity()).assertFalse();

        // 验证添加单个项后完整性检查失败（缺少焦点项）
        manager.addItem(new KeyInfoModel('icon', 'focus', false, '息屏',
          KeyOperationType.IMEOPERATION_SUSPEND));
        expect(manager.validateListIntegrity()).assertFalse();

        // 验证添加焦点项后完整性检查通过
        manager.addItem(new KeyInfoModel('icon', 'focus', true, '息屏',
          KeyOperationType.IMEOPERATION_REBOOT));
        expect(manager.validateListIntegrity()).assertTrue();
      });
    it('ime_item_info_model_to_string_should_provide_readable_output', 0,
      async () => { // 验证电源项模型toString方法提供可读输出，确保调试信息清晰
        const model =
          new KeyInfoModel('test_icon', 'test_focus', true, '中文', KeyOperationType.IMEOPERATION_SHUTDOWN);

        const strRepresentation = model.toString();
        expect(strRepresentation.includes('中文')).assertTrue();
        expect(strRepresentation.includes('2')).assertTrue();
        expect(strRepresentation.includes('true')).assertTrue();
      });
    it('ime_item_list_manager_should_handle_multiple_focus_states_correctly', 0,
      async () => { // 验证电源项列表管理器正确处理多焦点状态，确保焦点唯一性
        const manager = new KeyInfoListManager();

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
    it('ime_item_info_model_should_handle_invalid_operation_types', 0, async () => { // 验证电源项模型处理无效操作类型，确保类型验证机制有效
      const validModel =
        new KeyInfoModel('icon', 'focus', false, '休眠', KeyOperationType.IMEOPERATION_SUSPEND);
      const invalidModel = new KeyInfoModel('icon', 'focus', false, '未知操作', -1);
      const outOfRangeModel = new KeyInfoModel('icon', 'focus', false, '超出范围操作', 100);

      expect(validModel.isValidOperationType()).assertTrue();
      expect(invalidModel.isValidOperationType()).assertFalse();
      expect(outOfRangeModel.isValidOperationType()).assertFalse();

      expect(validModel.getOperationTypeDescription()).assertEqual('休眠操作');
      expect(invalidModel.getOperationTypeDescription()).assertEqual('未知操作');
      expect(outOfRangeModel.getOperationTypeDescription()).assertEqual('未知操作');
    });
    it('ime_item_list_manager_complex_operation_sequence_should_maintain_consistency', 0,
      async () => { // 验证列表管理器复杂操作序列保持一致性，确保数据完整性
        const manager = new KeyInfoListManager();
        manager.setFocusToIndex(0);
        expect(manager.getFocusedItem()?.name).assertEqual('息屏');

        manager.moveFocusNext();
        expect(manager.getFocusedItem()?.name).assertEqual('中文');

        manager.moveFocusNext();
        expect(manager.getFocusedItem()?.name).assertEqual('符号');

        manager.moveFocusPrev();
        expect(manager.getFocusedItem()?.name).assertEqual('中文');

        manager.setFocusToIndex(2);
        expect(manager.getFocusedItem()?.name).assertEqual('符号');
        expect(manager.validateListIntegrity()).assertTrue();
        expect(manager.getLength()).assertEqual(3);
      });
    it('ime_item_info_model_data_consistency_should_be_maintained', 0, async () => { // 验证电源项模型数据一致性保持，确保状态同步正确
      const model = new KeyInfoModel('app.media.screenout', 'app.media.screenout_focus', false, '息屏',
        KeyOperationType.IMEOPERATION_SUSPEND);
      expect(model.getCurrentIcon()).assertEqual('app.media.screenout');
      expect(model.getDisplayName()).assertEqual('息屏');
      expect(model.isValidOperationType()).assertTrue();

      // 验证焦点状态改变图标显示，确保UI响应正确
      model.setFocusState(true);
      expect(model.getCurrentIcon()).assertEqual('app.media.screenout_focus');
      expect(model.isFocus).assertTrue();

      model.setFocusState(false);
      expect(model.getCurrentIcon()).assertEqual('app.media.screenout');
      expect(model.isFocus).assertFalse();
    });
    it('ime_item_list_manager_performance_should_meet_requirements', 0, async () => { // 验证列表管理器性能满足要求，确保操作效率
      const manager = new KeyInfoListManager();

      // 验证批量查询操作性能，确保1000次查询在1秒内完成
      const queryStart: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        manager.getItemByIndex(i % 3);
        manager.getItemByName('息屏');
        manager.getItemByOperationType(KeyOperationType.IMEOPERATION_SUSPEND);
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
    it('ime_item_info_model_boundary_values_should_be_handled_correctly', 0, async () => { // 验证电源项模型正确处理边界值，确保异常情况处理
      const emptyNameModel = new KeyInfoModel('', '', false, '', KeyOperationType.IMEOPERATION_SUSPEND);
      expect(emptyNameModel.getDisplayName()).assertEqual('');
      expect(emptyNameModel.getCurrentIcon()).assertEqual('');

      // 验证特殊字符名称处理，确保特殊字符不会导致异常
      const specialCharModel = new KeyInfoModel('icon!@#', 'focus$%^', false, '特殊字符名称*()',
        KeyOperationType.IMEOPERATION_REBOOT);
      expect(specialCharModel.getDisplayName()).assertEqual('特殊字符名称*()');
      expect(specialCharModel.getCurrentIcon()).assertEqual('icon!@#');

      // 验证长字符串处理，确保长名称不会导致性能问题
      const longString = 'a'.repeat(1000);
      const longStringModel =
        new KeyInfoModel(longString, longString, false, longString, KeyOperationType.IMEOPERATION_SHUTDOWN);
      expect(longStringModel.getDisplayName().length).assertEqual(1000);
    });
    it('ime_item_list_manager_empty_list_operations_should_be_handled_gracefully', 0,
      async () => { // 验证列表管理器优雅处理空列表操作，确保空状态安全
        const manager = new KeyInfoListManager();
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
    it('ime_model_integration_should_work_seamlessly', 0, async () => { // 验证电源模型集成无缝工作，确保组件协同正确
      const manager = new KeyInfoListManager();
      const focusedItem = manager.getFocusedItem();
      expect(focusedItem === null).assertFalse();
      expect(focusedItem?.name).assertEqual('中文');

      // 验证手动取消焦点破坏完整性，确保焦点必须存在
      focusedItem?.setFocusState(false);
      expect(manager.validateListIntegrity()).assertFalse();

      // 验证通过setFocusToIndex恢复完整性，确保修复机制有效
      manager.setFocusToIndex(1);
      expect(manager.validateListIntegrity()).assertTrue();
      const newFocusedItem = manager.getFocusedItem();
      expect(newFocusedItem?.isFocus).assertTrue();
      expect(newFocusedItem?.name).assertEqual('中文');
      const otherItems = manager.getAllItems().filter(item => item.name !== '中文');
      otherItems.forEach(item => {
        expect(item.isFocus).assertFalse();
      });
    });

    // 适配 KeyInfo_Statistics：聚合统计正确
    it('ime_item_statistics_should_report_aggregate_counts', 0, async () => {
      const manager = new KeyInfoListManager();
      const stats = new KeyInfoStatistics(manager);
      expect(stats.getTotalCount()).assertEqual(3);
      expect(stats.getFocusedCount()).assertEqual(1);
      expect(stats.getCountByOperationType(KeyOperationType.IMEOPERATION_SUSPEND)).assertEqual(1);
      expect(stats.getCountByOperationType(KeyOperationType.IMEOPERATION_REBOOT)).assertEqual(1);
      expect(stats.getCountByOperationType(KeyOperationType.IMEOPERATION_SHUTDOWN)).assertEqual(1);
      expect(stats.getValidCount()).assertEqual(3);
      expect(stats.getInvalidCount()).assertEqual(0);
      expect(stats.getFocusedRatio()).assertEqual(1 / 3);
    });

    // 适配 KeyInfo_Statistics：快照生成与描述
    it('ime_item_statistics_should_generate_snapshot', 0, async () => {
      const manager = new KeyInfoListManager();
      const stats = new KeyInfoStatistics(manager);
      const snapshot = stats.generateSnapshot();
      expect(snapshot.totalCount).assertEqual(3);
      expect(snapshot.focusedCount).assertEqual(1);
      expect(snapshot.suspendCount).assertEqual(1);
      expect(snapshot.rebootCount).assertEqual(1);
      expect(snapshot.shutdownCount).assertEqual(1);
      expect(snapshot.validCount).assertEqual(3);
      expect(stats.describeSnapshot().includes('total: 3')).assertTrue();
    });

    // 适配 KeyInfo_Builder：流式构建自定义项
    it('ime_item_builder_should_build_custom_item', 0, async () => {
      const built = new KeyInfoBuilder().withIcon('icon_a').withOnFocusIcon('icon_a_focus').withFocusState(true)
        .withName('自定义项').withOperationType(KeyOperationType.IMEOPERATION_REBOOT).build();
      expect(built.name).assertEqual('自定义项');
      expect(built.icon).assertEqual('icon_a');
      expect(built.isFocus).assertTrue();
      expect(built.operationType).assertEqual(KeyOperationType.IMEOPERATION_REBOOT);
      expect(built.getCurrentIcon()).assertEqual('icon_a_focus');
    });

    // 适配 KeyInfo_Builder：默认值构建
    it('ime_item_builder_should_apply_defaults', 0, async () => {
      const built = new KeyInfoBuilder().build();
      expect(built.icon).assertEqual('');
      expect(built.onFocusIcon).assertEqual('');
      expect(built.isFocus).assertFalse();
      expect(built.name).assertEqual('');
      expect(built.operationType).assertEqual(KeyOperationType.IMEOPERATION_SUSPEND);
    });

    // 适配 KeyboardModel_StateMachine：生命周期状态迁移
    it('ime_model_state_machine_should_follow_lifecycle_transitions', 0, async () => {
      const machine = new KeyboardModelStateMachine();
      expect(machine.activate()).assertTrue();
      expect(machine.isActive()).assertTrue();
      expect(machine.suspend()).assertTrue();
      expect(machine.getState()).assertEqual(KeyboardModelStateType.MODEL_SUSPENDED);
      expect(machine.resume()).assertTrue();
      expect(machine.isActive()).assertTrue();
      expect(machine.destroy()).assertTrue();
      expect(machine.isDestroyed()).assertTrue();
      expect(machine.getTransitionCount()).assertEqual(4);
    });

    // 适配 KeyboardModel_StateMachine：非法状态迁移被拒绝
    it('ime_model_state_machine_should_reject_illegal_transitions', 0, async () => {
      const machine = new KeyboardModelStateMachine();
      expect(machine.suspend()).assertFalse();
      expect(machine.activate()).assertTrue();
      expect(machine.activate()).assertFalse();
      expect(machine.destroy()).assertTrue();
      expect(machine.destroy()).assertFalse();
      expect(machine.resume()).assertFalse();
      expect(machine.getTransitionCount()).assertEqual(2);
    });

    // 适配 KeyboardModel_Deep_Validator：完整模型校验通过
    it('ime_model_deep_validator_should_validate_complete_model', 0, async () => {
      const model = new KeyInfoModel('app.media.screenout', 'app.media.screenout_focus', false, '息屏',
        KeyOperationType.IMEOPERATION_SUSPEND);
      const validator = new KeyboardModelDeepValidator(model);
      expect(validator.hasNonEmptyName()).assertTrue();
      expect(validator.hasNonEmptyIcon()).assertTrue();
      expect(validator.hasNonEmptyFocusIcon()).assertTrue();
      expect(validator.isNameLengthWithinLimit(20)).assertTrue();
      expect(validator.isIconLengthWithinLimit(30)).assertTrue();
      expect(validator.validateAll()).assertTrue();
    });

    // 适配 KeyboardModel_Deep_Validator：违规项收集
    it('ime_model_deep_validator_should_collect_violations', 0, async () => {
      const model = new KeyInfoModel('', '', false, '', -1);
      const validator = new KeyboardModelDeepValidator(model);
      expect(validator.validateAll()).assertFalse();
      const violations = validator.collectViolations();
      expect(violations.length).assertEqual(4);
      expect(violations.includes('名称为空')).assertTrue();
      expect(violations.includes('图标为空')).assertTrue();
      expect(violations.includes('操作类型非法')).assertTrue();
    });

    // 适配 KeyInfo_Snapshot_Store：快照对比检测变化
    it('ime_item_snapshot_store_should_capture_and_detect_changes', 0, async () => {
      const store = new KeyInfoSnapshotStore();
      const manager = new KeyInfoListManager();
      store.capture(manager);
      store.capture(manager);
      expect(store.getSnapshotCount()).assertEqual(2);
      expect(store.areSnapshotsIdentical()).assertTrue();
      manager.addItem(new KeyInfoModel('icon', 'focus', false, '新增项', 0));
      store.capture(manager);
      expect(store.areSnapshotsIdentical()).assertFalse();
    });

    // 适配 KeyInfo_Snapshot_Store：最新快照查询
    it('ime_item_snapshot_store_should_return_latest_snapshot', 0, async () => {
      const store = new KeyInfoSnapshotStore();
      expect(store.getLatestSnapshot() === null).assertTrue();
      const manager = new KeyInfoListManager();
      store.capture(manager);
      const latest = store.getLatestSnapshot();
      expect(latest === null).assertFalse();
      expect(latest?.totalCount).assertEqual(3);
      expect(store.areSnapshotsIdentical()).assertFalse();
      store.clear();
      expect(store.getSnapshotCount()).assertEqual(0);
    });

    // 适配 KeyboardModel_Formatter：模型格式化输出
    it('ime_model_formatter_should_format_model_outputs', 0, async () => {
      const formatter = new KeyboardModelFormatter();
      const manager = new KeyInfoListManager();
      const focused = manager.getFocusedItem();
      expect(focused === null).assertFalse();
      const itemText = formatter.formatItem(manager.getItemByIndex(0) as KeyInfoModel);
      expect(itemText.includes('息屏')).assertTrue();
      expect(formatter.formatItemList(manager).includes('中文')).assertTrue();
      expect(formatter.formatFocusState(focused as KeyInfoModel)).assertEqual('获得焦点');
      expect(formatter.formatCountSummary(manager).includes('总数=3')).assertTrue();
      expect(formatter.formatDirection(ImeFocusTransitionDirection.DIRECTION_NEXT)).assertEqual('后移');
      expect(formatter.formatDirection(ImeFocusTransitionDirection.DIRECTION_JUMP)).assertEqual('跳转');
    });

    // 适配 ImeFocus_Transition_Recorder：方向记录与统计
    it('ime_focus_transition_recorder_should_count_directions', 0, async () => {
      const recorder = new ImeFocusTransitionRecorder();
      recorder.record(ImeFocusTransitionDirection.DIRECTION_NEXT);
      recorder.record(ImeFocusTransitionDirection.DIRECTION_NEXT);
      recorder.record(ImeFocusTransitionDirection.DIRECTION_PREV);
      expect(recorder.getTransitionCount()).assertEqual(3);
      expect(recorder.countByDirection(ImeFocusTransitionDirection.DIRECTION_NEXT)).assertEqual(2);
      expect(recorder.countByDirection(ImeFocusTransitionDirection.DIRECTION_PREV)).assertEqual(1);
      expect(recorder.getDirectionSequence().length).assertEqual(3);
    });

    // 适配 ImeFocus_Transition_Recorder：交替模式检测
    it('ime_focus_transition_recorder_should_detect_alternation', 0, async () => {
      const recorder = new ImeFocusTransitionRecorder();
      recorder.record(ImeFocusTransitionDirection.DIRECTION_NEXT);
      recorder.record(ImeFocusTransitionDirection.DIRECTION_PREV);
      recorder.record(ImeFocusTransitionDirection.DIRECTION_NEXT);
      expect(recorder.isAlternating()).assertTrue();
      recorder.record(ImeFocusTransitionDirection.DIRECTION_NEXT);
      recorder.record(ImeFocusTransitionDirection.DIRECTION_NEXT);
      expect(recorder.isAlternating()).assertFalse();
    });

    // 适配 Ime_Dialog_Render：模型操作后对话框保持渲染
    it('ime_dialog_should_stay_rendered_after_model_use', 0, async () => {
      if (!isInputMethodEnabled()) {
        console.info('ime_dialog_should_stay_rendered_after_model_use skipped: input method is not enabled on this device');
        return;
      }
      const manager = new KeyInfoListManager();
      manager.moveFocusNext();
      expect(manager.getFocusedItem()?.name).assertEqual('符号');
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await keyboardComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}
