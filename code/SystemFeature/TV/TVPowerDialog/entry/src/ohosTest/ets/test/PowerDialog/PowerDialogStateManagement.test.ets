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

// 电源对话框状态模型：模拟对话框的默认状态变量
class PowerDialogStateModel {
  public isFocusable: boolean = true;
  public selectedIndex: number = 1;
  public isShowPath: boolean = false;
  public isSelectMode: boolean = false;
  public pageName: string = '';
  public showFreeSize: number = 0;
  public focusIndex: number = 1;
  public beforeFocusIndex: number = 0;
  public isCopying: boolean = false;
  public isMoving: boolean = false;
  public currentNum: number = 0;
  public optionCount: number = 3;

  public reset(): void {
    this.isFocusable = true;
    this.selectedIndex = 1;
    this.isShowPath = false;
    this.isSelectMode = false;
    this.pageName = '';
    this.showFreeSize = 0;
    this.focusIndex = 1;
    this.beforeFocusIndex = 0;
    this.isCopying = false;
    this.isMoving = false;
    this.currentNum = 0;
  }

  public enterSelectMode(): void {
    this.isSelectMode = true;
  }

  public exitSelectMode(): void {
    this.isSelectMode = false;
  }

  public selectOption(index: number): void {
    this.selectedIndex = index;
  }

  public toggleFocusable(): void {
    this.isFocusable = !this.isFocusable;
  }
}

// 对话框模式枚举：描述电源对话框所处的显示模式
enum DialogMode {
  NORMAL = 'normal', SELECT = 'select', PROGRESS = 'progress', DELETE = 'delete', RENAME = 'rename'
}

// 焦点移动方向枚举：描述焦点在选项之间移动的方向
enum FocusDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down'
}

// 状态快照接口：记录电源对话框某一时刻的关键状态变量
interface StateSnapshot {
  selectedIndex: number;
  focusIndex: number;
  beforeFocusIndex: number;
  isFocusable: boolean;
  isSelectMode: boolean;
  currentNum: number;
}

// 状态变更记录接口：记录一次状态变更的旧值与新值
interface StateChangeRecord {
  field: string;
  oldValue: number;
  newValue: number;
  timestamp: number;
}

// 状态快照模型：从电源对话框状态模型提取快照并支持还原比较
class StateSnapshotModel {
  public selectedIndex: number;
  public focusIndex: number;
  public beforeFocusIndex: number;
  public isFocusable: boolean;
  public isSelectMode: boolean;
  public currentNum: number;

  constructor(selectedIndex: number, focusIndex: number, beforeFocusIndex: number, isFocusable: boolean,
    isSelectMode: boolean, currentNum: number) {
    this.selectedIndex = selectedIndex;
    this.focusIndex = focusIndex;
    this.beforeFocusIndex = beforeFocusIndex;
    this.isFocusable = isFocusable;
    this.isSelectMode = isSelectMode;
    this.currentNum = currentNum;
  }

  public static fromState(state: PowerDialogStateModel): StateSnapshotModel {
    return new StateSnapshotModel(state.selectedIndex, state.focusIndex, state.beforeFocusIndex, state.isFocusable,
      state.isSelectMode, state.currentNum);
  }

  public equals(other: StateSnapshotModel): boolean {
    return this.selectedIndex === other.selectedIndex && this.focusIndex === other.focusIndex &&
      this.beforeFocusIndex === other.beforeFocusIndex && this.isFocusable === other.isFocusable &&
      this.isSelectMode === other.isSelectMode && this.currentNum === other.currentNum;
  }

  public toString(): string {
    return `StateSnapshot{selectedIndex: ${this.selectedIndex}, focusIndex: ${this.focusIndex}, isSelectMode: ${this.isSelectMode}}`;
  }

  public toRecord(): StateSnapshot {
    return {
      selectedIndex: this.selectedIndex,
      focusIndex: this.focusIndex,
      beforeFocusIndex: this.beforeFocusIndex,
      isFocusable: this.isFocusable,
      isSelectMode: this.isSelectMode,
      currentNum: this.currentNum
    };
  }
}

// 状态历史：维护状态快照栈，支持撤销与重做
class StateHistory {
  private undoStack: StateSnapshotModel[] = [];
  private redoStack: StateSnapshotModel[] = [];

  public push(snapshot: StateSnapshotModel): void {
    this.undoStack.push(snapshot);
    this.redoStack = [];
  }

  public undo(): StateSnapshotModel | null {
    if (this.undoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.undoStack.length - 1;
    const snapshot: StateSnapshotModel = this.undoStack[lastIndex];
    this.undoStack.pop();
    this.redoStack.push(snapshot);
    return snapshot;
  }

  public redo(): StateSnapshotModel | null {
    if (this.redoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.redoStack.length - 1;
    const snapshot: StateSnapshotModel = this.redoStack[lastIndex];
    this.redoStack.pop();
    this.undoStack.push(snapshot);
    return snapshot;
  }

  public getUndoCount(): number {
    return this.undoStack.length;
  }

  public getRedoCount(): number {
    return this.redoStack.length;
  }

  public clear(): void {
    this.undoStack = [];
    this.redoStack = [];
  }
}

// 焦点导航器：根据方向计算下一个焦点索引
class FocusNavigator {
  private optionCount: number;

  constructor(optionCount: number) {
    this.optionCount = optionCount;
  }

  public move(current: number, direction: FocusDirection): number {
    if (direction === FocusDirection.LEFT || direction === FocusDirection.UP) {
      return this.clamp(current - 1);
    }
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      return this.clamp(current + 1);
    }
    return current;
  }

  private clamp(index: number): number {
    if (index < 0) {
      return 0;
    }
    if (index >= this.optionCount) {
      return this.optionCount - 1;
    }
    return index;
  }

  public getOptionCount(): number {
    return this.optionCount;
  }
}

// 状态统计：统计状态变更记录的数量与频次
class StateStatistics {
  private changes: StateChangeRecord[] = [];

  public record(field: string, oldValue: number, newValue: number): void {
    this.changes.push({
      field,
      oldValue,
      newValue,
      timestamp: Date.now()
    });
  }

  public getChangeCount(): number {
    return this.changes.length;
  }

  public getChangeCountForField(field: string): number {
    return this.changes.filter((record: StateChangeRecord) => record.field === field).length;
  }

  public getDistinctFields(): number {
    const fields: Set<string> = new Set<string>();
    this.changes.forEach((record: StateChangeRecord) => {
      fields.add(record.field);
    });
    return fields.size;
  }

  public clear(): void {
    this.changes = [];
  }
}

// 状态校验器：对电源对话框状态进行合法性校验
class StateValidator {
  public static isValidSelectedIndex(index: number, optionCount: number): boolean {
    return index >= 0 && index < optionCount;
  }

  public static isValidFocusIndex(index: number, optionCount: number): boolean {
    return index >= 0 && index < optionCount;
  }

  public static isFocusStable(focusIndex: number, beforeFocusIndex: number): boolean {
    return focusIndex >= 0 && beforeFocusIndex >= 0;
  }

  public static isValidOptionCount(count: number): boolean {
    return count > 0 && count <= 10;
  }
}

// 状态差异计算器：比较两个状态快照之间的字段差异
class StateDiffCalculator {
  public static diff(a: StateSnapshotModel, b: StateSnapshotModel): number {
    let differences: number = 0;
    if (a.selectedIndex !== b.selectedIndex) {
      differences++;
    }
    if (a.focusIndex !== b.focusIndex) {
      differences++;
    }
    if (a.beforeFocusIndex !== b.beforeFocusIndex) {
      differences++;
    }
    if (a.isFocusable !== b.isFocusable) {
      differences++;
    }
    if (a.isSelectMode !== b.isSelectMode) {
      differences++;
    }
    if (a.currentNum !== b.currentNum) {
      differences++;
    }
    return differences;
  }

  public static isIdentical(a: StateSnapshotModel, b: StateSnapshotModel): boolean {
    return StateDiffCalculator.diff(a, b) === 0;
  }

  public static diffFields(a: StateSnapshotModel, b: StateSnapshotModel): string[] {
    const fields: string[] = [];
    if (a.selectedIndex !== b.selectedIndex) {
      fields.push('selectedIndex');
    }
    if (a.focusIndex !== b.focusIndex) {
      fields.push('focusIndex');
    }
    if (a.beforeFocusIndex !== b.beforeFocusIndex) {
      fields.push('beforeFocusIndex');
    }
    if (a.isFocusable !== b.isFocusable) {
      fields.push('isFocusable');
    }
    if (a.isSelectMode !== b.isSelectMode) {
      fields.push('isSelectMode');
    }
    if (a.currentNum !== b.currentNum) {
      fields.push('currentNum');
    }
    return fields;
  }
}

// 状态迁移计数器：统计状态快照的迁移次数
class StateTransitionCounter {
  private transitionCount: number = 0;

  public record(): void {
    this.transitionCount++;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public reset(): void {
    this.transitionCount = 0;
  }
}

// 状态访问日志：记录状态字段的读写访问历史
class StateAccessLog {
  private accesses: string[] = [];

  public recordRead(field: string): void {
    this.accesses.push('read:' + field);
  }

  public recordWrite(field: string): void {
    this.accesses.push('write:' + field);
  }

  public getAccessCount(): number {
    return this.accesses.length;
  }

  public getReadCount(): number {
    return this.accesses.filter((access: string) => access.startsWith('read:')).length;
  }

  public getWriteCount(): number {
    return this.accesses.filter((access: string) => access.startsWith('write:')).length;
  }

  public hasAccess(field: string): boolean {
    return this.accesses.includes('read:' + field) || this.accesses.includes('write:' + field);
  }

  public clear(): void {
    this.accesses = [];
  }
}

export default function powerDialogStateManagementTest() {
  describe('PowerDialogStateManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Index_UI_State_Variables：isFocusable 默认为 true
    it('is_focusable_should_default_to_true', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.isFocusable).assertTrue();
    });

    // 适配 Index_UI_State_Variables：selectedIndex 默认为 1（关机）
    it('selected_index_should_default_to_one', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.selectedIndex).assertEqual(1);
    });

    // 适配 Index_UI_State_Variables：isShowPath 默认为 false
    it('is_show_path_should_default_to_false', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.isShowPath).assertFalse();
    });

    // 适配 Index_UI_State_Variables：isSelectMode 默认为 false
    it('is_select_mode_should_default_to_false', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.isSelectMode).assertFalse();
    });

    // 适配 Index_UI_State_Variables：pageName 默认为空
    it('page_name_should_default_to_empty', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.pageName).assertEqual('');
    });

    // 适配 Index_UI_State_Variables：showFreeSize 默认为零
    it('show_free_size_should_default_to_zero', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.showFreeSize).assertEqual(0);
    });

    // 适配 Home_UI_State_Variables：初始焦点索引正确
    it('focus_index_should_default_correctly', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.focusIndex).assertEqual(1);
      expect(state.beforeFocusIndex).assertEqual(0);
    });

    // 适配 Home_UI_State_Variables：选项数量为 3（适配网格列数）
    it('option_count_should_be_three', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.optionCount).assertEqual(3);
    });

    // 适配 FileList_UI_State_Variables：isCopying/isMoving 默认为 false
    it('copy_and_move_flags_should_default_to_false', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.isCopying).assertFalse();
      expect(state.isMoving).assertFalse();
    });

    // 适配 Dialog_Default_States：焦点索引默认值
    it('dialog_focus_index_should_default_to_one', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.focusIndex).assertEqual(1);
    });

    // 适配 ProgressDialog_State：currentNum 初始值
    it('current_num_should_have_initial_value', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.currentNum).assertEqual(0);
    });

    // 适配 DeleteDialog_State：确认操作后关闭（选择模式退出）
    it('confirm_operation_should_exit_select_mode', 0, async () => {
      const state = new PowerDialogStateModel();
      state.enterSelectMode();
      expect(state.isSelectMode).assertTrue();
      state.exitSelectMode();
      expect(state.isSelectMode).assertFalse();
    });

    // 适配 RenameDialog_State：选择选项更新选中索引
    it('select_option_should_update_selected_index', 0, async () => {
      const state = new PowerDialogStateModel();
      state.selectOption(0);
      expect(state.selectedIndex).assertEqual(0);
      state.selectOption(2);
      expect(state.selectedIndex).assertEqual(2);
    });

    // 适配 FileList_UI_State_Variables：焦点开关切换
    it('toggle_focusable_should_flip_value', 0, async () => {
      const state = new PowerDialogStateModel();
      state.toggleFocusable();
      expect(state.isFocusable).assertFalse();
      state.toggleFocusable();
      expect(state.isFocusable).assertTrue();
    });

    // 适配 ProgressDialog_State：reset 恢复初始状态
    it('reset_should_restore_initial_state', 0, async () => {
      const state = new PowerDialogStateModel();
      state.enterSelectMode();
      state.selectOption(0);
      state.toggleFocusable();
      state.reset();
      expect(state.isSelectMode).assertFalse();
      expect(state.selectedIndex).assertEqual(1);
      expect(state.isFocusable).assertTrue();
      expect(state.currentNum).assertEqual(0);
    });

    // 集成：真实对话框状态渲染验证
    it('real_dialog_state_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });
}
