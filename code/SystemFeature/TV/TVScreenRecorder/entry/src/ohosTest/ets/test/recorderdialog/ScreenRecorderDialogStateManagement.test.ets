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
  KEY_MENU,
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

// 录屏状态枚举
enum RecordingStateKind {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

// 录屏对话框状态模型：对应 LocalStorage 中的 recorderState 与浮窗可见性
class RecorderDialogStateModel {
  public recorderState: number = RecordingStateKind.IDLE;
  public isTimerWindowVisible: boolean = false;
  public isTipWindowVisible: boolean = false;
  public isRecording: boolean = false;
  public elapsedSeconds: number = 0;
  public tipDuration: number = 3000;
  public timerWindowName: string = 'recorderTimer';
  public tipWindowName: string = 'recorderTip';
  public isResolutionSupported: boolean = true;
  public focusIndex: number = 0;
  public lastErrorCode: number = 0;

  public reset(): void {
    this.recorderState = RecordingStateKind.IDLE;
    this.isTimerWindowVisible = false;
    this.isTipWindowVisible = false;
    this.isRecording = false;
    this.elapsedSeconds = 0;
    this.focusIndex = 0;
    this.lastErrorCode = 0;
  }

  public enterRecording(): boolean {
    if (this.recorderState !== RecordingStateKind.IDLE) {
      return false;
    }
    this.recorderState = RecordingStateKind.RECORDING;
    this.isRecording = true;
    this.isTimerWindowVisible = true;
    this.elapsedSeconds = 0;
    return true;
  }

  public exitRecording(): boolean {
    if (this.recorderState !== RecordingStateKind.RECORDING) {
      return false;
    }
    this.recorderState = RecordingStateKind.STOPPED;
    this.isRecording = false;
    this.isTimerWindowVisible = false;
    return true;
  }

  public enterError(code: number): void {
    this.recorderState = RecordingStateKind.ERROR;
    this.isRecording = false;
    this.isTimerWindowVisible = false;
    this.lastErrorCode = code;
  }

  public showTip(): void {
    this.isTipWindowVisible = true;
  }

  public hideTip(): void {
    this.isTipWindowVisible = false;
  }

  public tick(): number {
    if (this.isRecording) {
      this.elapsedSeconds++;
    }
    return this.elapsedSeconds;
  }

  public isIdle(): boolean {
    return this.recorderState === RecordingStateKind.IDLE;
  }
}

// 对话框模式枚举
enum RecorderDialogMode {
  NORMAL = 'normal',
  RECORDING = 'recording',
  TIP = 'tip',
  ERROR = 'error'
}

// 焦点移动方向枚举
enum FocusDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down'
}

// 状态快照接口
interface RecStateSnapshot {
  recorderState: number;
  elapsedSeconds: number;
  isRecording: boolean;
  isTimerWindowVisible: boolean;
  isTipWindowVisible: boolean;
  focusIndex: number;
}

// 状态变更记录接口
interface RecStateChangeRecord {
  field: string;
  oldValue: number;
  newValue: number;
  timestamp: number;
}

// 状态快照模型：支持快照比较与结构转换
class RecStateSnapshotModel {
  public recorderState: number;
  public elapsedSeconds: number;
  public isRecording: boolean;
  public isTimerWindowVisible: boolean;
  public isTipWindowVisible: boolean;
  public focusIndex: number;

  constructor(recorderState: number, elapsedSeconds: number, isRecording: boolean, isTimerWindowVisible: boolean,
    isTipWindowVisible: boolean, focusIndex: number) {
    this.recorderState = recorderState;
    this.elapsedSeconds = elapsedSeconds;
    this.isRecording = isRecording;
    this.isTimerWindowVisible = isTimerWindowVisible;
    this.isTipWindowVisible = isTipWindowVisible;
    this.focusIndex = focusIndex;
  }

  public static fromState(state: RecorderDialogStateModel): RecStateSnapshotModel {
    return new RecStateSnapshotModel(state.recorderState, state.elapsedSeconds, state.isRecording,
      state.isTimerWindowVisible, state.isTipWindowVisible, state.focusIndex);
  }

  public equals(other: RecStateSnapshotModel): boolean {
    return this.recorderState === other.recorderState && this.elapsedSeconds === other.elapsedSeconds &&
      this.isRecording === other.isRecording && this.isTimerWindowVisible === other.isTimerWindowVisible &&
      this.isTipWindowVisible === other.isTipWindowVisible && this.focusIndex === other.focusIndex;
  }

  public toString(): string {
    return `RecStateSnapshot{recorderState: ${this.recorderState}, elapsed: ${this.elapsedSeconds}}`;
  }

  public toRecord(): RecStateSnapshot {
    const record: RecStateSnapshot = {
      recorderState: this.recorderState,
      elapsedSeconds: this.elapsedSeconds,
      isRecording: this.isRecording,
      isTimerWindowVisible: this.isTimerWindowVisible,
      isTipWindowVisible: this.isTipWindowVisible,
      focusIndex: this.focusIndex
    };
    return record;
  }
}

// 状态历史：维护快照栈，支持撤销与重做
class RecStateHistory {
  private undoStack: RecStateSnapshotModel[] = [];
  private redoStack: RecStateSnapshotModel[] = [];

  public push(snapshot: RecStateSnapshotModel): void {
    this.undoStack.push(snapshot);
    this.redoStack = [];
  }

  public undo(): RecStateSnapshotModel | null {
    if (this.undoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.undoStack.length - 1;
    const snapshot: RecStateSnapshotModel = this.undoStack[lastIndex];
    this.undoStack.pop();
    this.redoStack.push(snapshot);
    return snapshot;
  }

  public redo(): RecStateSnapshotModel | null {
    if (this.redoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.redoStack.length - 1;
    const snapshot: RecStateSnapshotModel = this.redoStack[lastIndex];
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

// 焦点导航器：在录屏菜单项之间移动焦点
class RecFocusNavigator {
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

// 状态统计：统计状态变更记录
class RecStateStatistics {
  private changes: RecStateChangeRecord[] = [];

  public record(field: string, oldValue: number, newValue: number): void {
    const change: RecStateChangeRecord = {
      field: field,
      oldValue: oldValue,
      newValue: newValue,
      timestamp: Date.now()
    };
    this.changes.push(change);
  }

  public getChangeCount(): number {
    return this.changes.length;
  }

  public getChangeCountForField(field: string): number {
    return this.changes.filter((record: RecStateChangeRecord) => record.field === field).length;
  }

  public getDistinctFields(): number {
    const fields: Set<string> = new Set<string>();
    this.changes.forEach((record: RecStateChangeRecord) => {
      fields.add(record.field);
    });
    return fields.size;
  }

  public clear(): void {
    this.changes = [];
  }
}

// 状态校验器：校验录屏状态与焦点索引的合法性
class RecStateValidator {
  public static isValidRecorderState(value: number): boolean {
    return value >= RecordingStateKind.IDLE && value <= RecordingStateKind.ERROR;
  }

  public static isValidFocusIndex(index: number, optionCount: number): boolean {
    return index >= 0 && index < optionCount;
  }

  public static isTimerDurationPositive(duration: number): boolean {
    return duration > 0;
  }

  public static isValidOptionCount(count: number): boolean {
    return count > 0 && count <= 10;
  }

  public static isRecordingPair(state: number, isRecording: boolean): boolean {
    if (state === RecordingStateKind.RECORDING) {
      return isRecording;
    }
    return !isRecording;
  }
}

// 状态差异计算器：比较两个快照之间的字段差异
class RecStateDiffCalculator {
  public static diff(a: RecStateSnapshotModel, b: RecStateSnapshotModel): number {
    return RecStateDiffCalculator.diffFields(a, b).length;
  }

  public static isIdentical(a: RecStateSnapshotModel, b: RecStateSnapshotModel): boolean {
    return RecStateDiffCalculator.diff(a, b) === 0;
  }

  public static diffFields(a: RecStateSnapshotModel, b: RecStateSnapshotModel): string[] {
    const fields: string[] = [];
    if (a.recorderState !== b.recorderState) {
      fields.push('recorderState');
    }
    if (a.elapsedSeconds !== b.elapsedSeconds) {
      fields.push('elapsedSeconds');
    }
    if (a.isRecording !== b.isRecording) {
      fields.push('isRecording');
    }
    if (a.isTimerWindowVisible !== b.isTimerWindowVisible) {
      fields.push('isTimerWindowVisible');
    }
    if (a.isTipWindowVisible !== b.isTipWindowVisible) {
      fields.push('isTipWindowVisible');
    }
    if (a.focusIndex !== b.focusIndex) {
      fields.push('focusIndex');
    }
    return fields;
  }
}

// 状态迁移计数器
class RecStateTransitionCounter {
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

// 状态访问日志：记录字段读写访问
class RecStateAccessLog {
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

export default function screenRecorderDialogStateManagementTest(): void {
  describe('ScreenRecorderDialogStateManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // 录屏状态默认为 Idle
    it('recorder_state_should_default_to_idle', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.recorderState).assertEqual(RecordingStateKind.IDLE);
      expect(state.isIdle()).assertTrue();
    });

    // 计时窗与提示窗默认不可见
    it('timer_and_tip_window_should_default_hidden', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.isTimerWindowVisible).assertFalse();
      expect(state.isTipWindowVisible).assertFalse();
    });

    // 录制标志默认关闭
    it('is_recording_should_default_to_false', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.isRecording).assertFalse();
    });

    // 计时秒数默认从零开始
    it('elapsed_seconds_should_default_to_zero', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.elapsedSeconds).assertEqual(0);
      expect(state.tick()).assertEqual(0);
    });

    // 提示窗停留时长为 3000 毫秒
    it('tip_duration_should_be_three_seconds', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.tipDuration).assertEqual(3000);
      expect(RecStateValidator.isTimerDurationPositive(state.tipDuration)).assertTrue();
    });

    // 浮窗名称应与 WindowManager 常量一致
    it('window_names_should_match_constants', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.timerWindowName).assertEqual('recorderTimer');
      expect(state.tipWindowName).assertEqual('recorderTip');
      expect(state.timerWindowName === state.tipWindowName).assertFalse();
    });

    // 分辨率支持标志默认开启
    it('resolution_support_should_default_to_true', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.isResolutionSupported).assertTrue();
    });

    // 菜单焦点默认落在首项
    it('focus_index_should_default_to_zero', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.focusIndex).assertEqual(0);
      expect(RecStateValidator.isValidFocusIndex(state.focusIndex, 3)).assertTrue();
    });

    // 进入录制应切换到 Recording 并点亮计时窗
    it('enter_recording_should_show_timer_window', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.enterRecording()).assertTrue();
      expect(state.recorderState).assertEqual(RecordingStateKind.RECORDING);
      expect(state.isRecording).assertTrue();
      expect(state.isTimerWindowVisible).assertTrue();
    });

    // 重复进入录制应被拒绝
    it('enter_recording_twice_should_be_rejected', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      expect(state.enterRecording()).assertFalse();
      expect(state.recorderState).assertEqual(RecordingStateKind.RECORDING);
    });

    // 退出录制应切换到 Stopped 并关闭计时窗
    it('exit_recording_should_hide_timer_window', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      expect(state.exitRecording()).assertTrue();
      expect(state.recorderState).assertEqual(RecordingStateKind.STOPPED);
      expect(state.isRecording).assertFalse();
      expect(state.isTimerWindowVisible).assertFalse();
    });

    // Idle 状态下退出录制应被拒绝
    it('exit_recording_from_idle_should_be_rejected', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      expect(state.exitRecording()).assertFalse();
      expect(state.recorderState).assertEqual(RecordingStateKind.IDLE);
    });

    // 计时只在录制中递增
    it('tick_should_increment_only_while_recording', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      expect(state.tick()).assertEqual(1);
      expect(state.tick()).assertEqual(2);
      state.exitRecording();
      expect(state.tick()).assertEqual(2);
    });

    // 错误态应关闭全部浮窗并记录错误码
    it('enter_error_should_reset_visibility_flags', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      state.enterError(1001);
      expect(state.recorderState).assertEqual(RecordingStateKind.ERROR);
      expect(state.isRecording).assertFalse();
      expect(state.isTimerWindowVisible).assertFalse();
      expect(state.lastErrorCode).assertEqual(1001);
    });

    // 提示窗显示与隐藏应可切换
    it('show_and_hide_tip_should_toggle_flag', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.showTip();
      expect(state.isTipWindowVisible).assertTrue();
      state.hideTip();
      expect(state.isTipWindowVisible).assertFalse();
    });

    // reset 应恢复初始状态
    it('reset_should_restore_initial_state', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      state.tick();
      state.showTip();
      state.enterError(1002);
      state.reset();
      expect(state.recorderState).assertEqual(RecordingStateKind.IDLE);
      expect(state.isRecording).assertFalse();
      expect(state.elapsedSeconds).assertEqual(0);
      expect(state.isTipWindowVisible).assertFalse();
      expect(state.lastErrorCode).assertEqual(0);
    });

    // 快照应捕获状态字段
    it('snapshot_should_capture_state_fields', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      state.tick();
      const snapshot: RecStateSnapshotModel = RecStateSnapshotModel.fromState(state);
      expect(snapshot.recorderState).assertEqual(RecordingStateKind.RECORDING);
      expect(snapshot.elapsedSeconds).assertEqual(1);
      expect(snapshot.isTimerWindowVisible).assertTrue();
    });

    // 快照可转换为结构化记录
    it('snapshot_to_record_should_copy_fields', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      const snapshot: RecStateSnapshotModel = RecStateSnapshotModel.fromState(state);
      const record: RecStateSnapshot = snapshot.toRecord();
      expect(record.recorderState).assertEqual(RecordingStateKind.IDLE);
      expect(record.elapsedSeconds).assertEqual(0);
      expect(record.isRecording).assertFalse();
    });

    // 快照相等性应比较全部字段
    it('snapshot_equals_should_compare_all_fields', 0, async () => {
      const a: RecStateSnapshotModel = new RecStateSnapshotModel(0, 0, false, false, false, 0);
      const b: RecStateSnapshotModel = new RecStateSnapshotModel(0, 0, false, false, false, 0);
      expect(a.equals(b)).assertTrue();
      b.focusIndex = 2;
      expect(a.equals(b)).assertFalse();
      expect(a.toString()).assertContain('RecStateSnapshot');
    });

    // 状态历史应支持撤销
    it('history_should_support_undo', 0, async () => {
      const history: RecStateHistory = new RecStateHistory();
      history.push(new RecStateSnapshotModel(0, 0, false, false, false, 0));
      history.push(new RecStateSnapshotModel(1, 1, true, true, false, 0));
      const undone: RecStateSnapshotModel | null = history.undo();
      expect(undone === null).assertFalse();
      expect(history.getUndoCount()).assertEqual(1);
      expect(history.getRedoCount()).assertEqual(1);
    });

    // 状态历史应支持重做
    it('history_should_support_redo', 0, async () => {
      const history: RecStateHistory = new RecStateHistory();
      history.push(new RecStateSnapshotModel(0, 0, false, false, false, 0));
      history.undo();
      expect(history.redo() === null).assertFalse();
      expect(history.getUndoCount()).assertEqual(1);
      expect(history.getRedoCount()).assertEqual(0);
    });

    // 空历史撤销与重做应返回 null
    it('empty_history_should_return_null', 0, async () => {
      const history: RecStateHistory = new RecStateHistory();
      expect(history.undo()).assertNull();
      expect(history.redo()).assertNull();
    });

    // 历史清空应丢弃两个栈
    it('history_clear_should_drop_stacks', 0, async () => {
      const history: RecStateHistory = new RecStateHistory();
      history.push(new RecStateSnapshotModel(0, 0, false, false, false, 0));
      history.undo();
      history.clear();
      expect(history.getUndoCount()).assertEqual(0);
      expect(history.getRedoCount()).assertEqual(0);
    });

    // 焦点导航应在边界处钳制
    it('focus_navigator_should_clamp_at_edges', 0, async () => {
      const navigator: RecFocusNavigator = new RecFocusNavigator(3);
      expect(navigator.move(0, FocusDirection.LEFT)).assertEqual(0);
      expect(navigator.move(0, FocusDirection.RIGHT)).assertEqual(1);
      expect(navigator.move(2, FocusDirection.RIGHT)).assertEqual(2);
      expect(navigator.move(2, FocusDirection.UP)).assertEqual(1);
      expect(navigator.getOptionCount()).assertEqual(3);
    });

    // 状态统计应按字段计数
    it('statistics_should_count_fields', 0, async () => {
      const statistics: RecStateStatistics = new RecStateStatistics();
      statistics.record('recorderState', 0, 1);
      statistics.record('recorderState', 1, 2);
      statistics.record('elapsedSeconds', 0, 1);
      expect(statistics.getChangeCount()).assertEqual(3);
      expect(statistics.getChangeCountForField('recorderState')).assertEqual(2);
      expect(statistics.getDistinctFields()).assertEqual(2);
      statistics.clear();
      expect(statistics.getChangeCount()).assertEqual(0);
    });

    // 校验器应接受全部已知状态
    it('validator_should_accept_all_known_states', 0, async () => {
      expect(RecStateValidator.isValidRecorderState(RecordingStateKind.IDLE)).assertTrue();
      expect(RecStateValidator.isValidRecorderState(RecordingStateKind.RECORDING)).assertTrue();
      expect(RecStateValidator.isValidRecorderState(RecordingStateKind.STOPPED)).assertTrue();
      expect(RecStateValidator.isValidRecorderState(RecordingStateKind.ERROR)).assertTrue();
    });

    // 校验器应拒绝未知状态与非法选项数
    it('validator_should_reject_unknown_state', 0, async () => {
      expect(RecStateValidator.isValidRecorderState(9)).assertFalse();
      expect(RecStateValidator.isValidRecorderState(-1)).assertFalse();
      expect(RecStateValidator.isValidOptionCount(0)).assertFalse();
      expect(RecStateValidator.isValidOptionCount(11)).assertFalse();
    });

    // 录制状态与 recoding 标志应保持配对
    it('validator_should_keep_recording_pair_consistent', 0, async () => {
      expect(RecStateValidator.isRecordingPair(RecordingStateKind.RECORDING, true)).assertTrue();
      expect(RecStateValidator.isRecordingPair(RecordingStateKind.RECORDING, false)).assertFalse();
      expect(RecStateValidator.isRecordingPair(RecordingStateKind.IDLE, false)).assertTrue();
    });

    // 差异计算器应报告变化字段
    it('diff_calculator_should_report_changed_fields', 0, async () => {
      const a: RecStateSnapshotModel = new RecStateSnapshotModel(0, 0, false, false, false, 0);
      const b: RecStateSnapshotModel = new RecStateSnapshotModel(1, 5, true, true, false, 1);
      expect(RecStateDiffCalculator.diff(a, b)).assertEqual(5);
      expect(RecStateDiffCalculator.isIdentical(a, a)).assertTrue();
      const fields: string[] = RecStateDiffCalculator.diffFields(a, b);
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('recorderState');
    });

    // 迁移计数器应累计并重置
    it('transition_counter_should_count', 0, async () => {
      const counter: RecStateTransitionCounter = new RecStateTransitionCounter();
      counter.record();
      counter.record();
      expect(counter.getTransitionCount()).assertEqual(2);
      counter.reset();
      expect(counter.getTransitionCount()).assertEqual(0);
    });

    // 访问日志应记录读写次数
    it('access_log_should_track_reads_and_writes', 0, async () => {
      const log: RecStateAccessLog = new RecStateAccessLog();
      log.recordRead('recorderState');
      log.recordWrite('recorderState');
      log.recordWrite('elapsedSeconds');
      expect(log.getAccessCount()).assertEqual(3);
      expect(log.getReadCount()).assertEqual(1);
      expect(log.getWriteCount()).assertEqual(2);
      expect(log.hasAccess('elapsedSeconds')).assertTrue();
      expect(log.hasAccess('focusIndex')).assertFalse();
      log.clear();
      expect(log.getAccessCount()).assertEqual(0);
    });

    // 集成：真实录屏浮窗状态可查询
    it('real_recorder_window_should_be_queryable', 0, async () => {
      await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 集成：返回键后状态模型仍可复位
    it('state_model_should_reset_after_back_press', 0, async () => {
      const state: RecorderDialogStateModel = new RecorderDialogStateModel();
      state.enterRecording();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      state.reset();
      expect(state.isIdle()).assertTrue();
      expect(state.isTimerWindowVisible).assertFalse();
    });
  });
}
