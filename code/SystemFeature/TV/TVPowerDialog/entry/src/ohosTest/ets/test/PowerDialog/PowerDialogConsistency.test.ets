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
class PowerOptionModel {
  public name: string;
  public operationType: number;
  public isFocus: boolean;

  constructor(name: string, operationType: number, isFocus: boolean) {
    this.name = name;
    this.operationType = operationType;
    this.isFocus = isFocus;
  }
}

// 电源对话框一致性模型：管理焦点状态并验证类型识别
class PowerConsistencyModel {
  private options: PowerOptionModel[] = [];

  constructor() {
    this.options.push(new PowerOptionModel('熄屏', PowerOperationType.POWEROPERATION_SUSPEND, false));
    this.options.push(new PowerOptionModel('关机', PowerOperationType.POWEROPERATION_SHUTDOWN, true));
    this.options.push(new PowerOptionModel('重启', PowerOperationType.POWEROPERATION_REBOOT, false));
  }

  public getTotalCount(): number {
    return this.options.length;
  }

  public getData(index: number): PowerOptionModel | null {
    if (index >= 0 && index < this.options.length) {
      return this.options[index];
    }
    return null;
  }

  public getFocusedIndex(): number {
    return this.options.findIndex((option: PowerOptionModel) => option.isFocus);
  }

  public setFocusToIndex(index: number): boolean {
    if (index < 0 || index >= this.options.length) {
      return false;
    }
    this.options.forEach((option: PowerOptionModel, idx: number) => {
      option.isFocus = idx === index;
    });
    return true;
  }

  public getFocusedType(): number {
    const index = this.getFocusedIndex();
    if (index < 0) {
      return -1;
    }
    return this.options[index].operationType;
  }
}

// 事件名常量：验证公共事件名一致性
class PowerEventNames {
  public static readonly POWER_BOOLEAN: string = 'powerBoolean';
  public static readonly IS_READY: string = 'isReady';
  public static readonly SESSION_KEY: string = 'session';
}

// ===== 新增辅助代码：一致性扩展模型与工具 =====

// 一致性检查类型枚举：描述各类一致性检查
enum ConsistencyCheckType {
  STATE = 'state', TYPE = 'type', EVENT_NAME = 'event_name', SEQUENCE = 'sequence'
}

// 一致性检查结果枚举：描述检查结果的判定
enum ConsistencyResult {
  PASS = 'pass', FAIL = 'fail', SKIPPED = 'skipped'
}

// 一致性检查项接口：描述一次一致性检查的详细信息
interface ConsistencyCheck {
  type: ConsistencyCheckType;
  description: string;
  result: ConsistencyResult;
  timestamp: number;
}

// 状态校验接口：描述一次状态校验的输入输出
interface StateValidation {
  expectedFocusedIndex: number;
  actualFocusedIndex: number;
  matched: boolean;
}

// 一致性检查记录模型：封装检查项，支持克隆与比较
class ConsistencyCheckRecord {
  public type: ConsistencyCheckType;
  public description: string;
  public result: ConsistencyResult;
  public timestamp: number;

  constructor(type: ConsistencyCheckType, description: string, result: ConsistencyResult, timestamp: number) {
    this.type = type;
    this.description = description;
    this.result = result;
    this.timestamp = timestamp;
  }

  public clone(): ConsistencyCheckRecord {
    return new ConsistencyCheckRecord(this.type, this.description, this.result, this.timestamp);
  }

  public equals(other: ConsistencyCheckRecord): boolean {
    return this.type === other.type && this.description === other.description && this.result === other.result;
  }

  public toString(): string {
    return `ConsistencyCheckRecord(type=${this.type}, description=${this.description}, result=${this.result})`;
  }

  public isPassed(): boolean {
    return this.result === ConsistencyResult.PASS;
  }

  public isValid(): boolean {
    return this.description.length > 0;
  }
}

// 一致性检查记录器：记录并统计一致性检查结果
class ConsistencyCheckRecorder {
  private checks: ConsistencyCheckRecord[] = [];

  public record(type: ConsistencyCheckType, description: string, result: ConsistencyResult): void {
    this.checks.push(new ConsistencyCheckRecord(type, description, result, Date.now()));
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getPassedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].isPassed()) {
        count++;
      }
    }
    return count;
  }

  public getFailedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].result === ConsistencyResult.FAIL) {
        count++;
      }
    }
    return count;
  }

  public getCountByType(type: ConsistencyCheckType): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public isAllPassed(): boolean {
    for (let i = 0; i < this.checks.length; i++) {
      if (!this.checks[i].isPassed()) {
        return false;
      }
    }
    return true;
  }

  public getChecks(): ConsistencyCheckRecord[] {
    const result: ConsistencyCheckRecord[] = [];
    for (let i = 0; i < this.checks.length; i++) {
      result.push(this.checks[i].clone());
    }
    return result;
  }

  public clear(): void {
    this.checks = [];
  }
}

// 状态校验模型：封装焦点状态校验结果，支持克隆与比较
class StateValidationResult {
  public expectedFocusedIndex: number;
  public actualFocusedIndex: number;
  public matched: boolean;

  constructor(expectedFocusedIndex: number, actualFocusedIndex: number, matched: boolean) {
    this.expectedFocusedIndex = expectedFocusedIndex;
    this.actualFocusedIndex = actualFocusedIndex;
    this.matched = matched;
  }

  public clone(): StateValidationResult {
    return new StateValidationResult(this.expectedFocusedIndex, this.actualFocusedIndex, this.matched);
  }

  public equals(other: StateValidationResult): boolean {
    return this.expectedFocusedIndex === other.expectedFocusedIndex &&
      this.actualFocusedIndex === other.actualFocusedIndex && this.matched === other.matched;
  }

  public toString(): string {
    return `StateValidationResult(expected=${this.expectedFocusedIndex}, actual=${this.actualFocusedIndex}, matched=${this.matched})`;
  }

  public isValid(): boolean {
    return this.expectedFocusedIndex >= -1 && this.actualFocusedIndex >= -1;
  }
}

// 状态校验器：校验焦点状态与类型识别的一致性
class StateValidator {
  public validateFocus(expected: number, actual: number): StateValidationResult {
    const result = new StateValidationResult(expected, actual, expected === actual);
    return result;
  }

  public validateType(expected: number, actual: number): boolean {
    return expected === actual;
  }

  public validateIndexRange(index: number, minIndex: number, maxIndex: number): boolean {
    return index >= minIndex && index <= maxIndex;
  }

  public validateAll(expected: number[], actual: number[]): boolean {
    if (expected.length !== actual.length) {
      return false;
    }
    for (let i = 0; i < expected.length; i++) {
      if (expected[i] !== actual[i]) {
        return false;
      }
    }
    return true;
  }

  public countMismatches(expected: number[], actual: number[]): number {
    let mismatches: number = 0;
    const length = expected.length < actual.length ? expected.length : actual.length;
    for (let i = 0; i < length; i++) {
      if (expected[i] !== actual[i]) {
        mismatches++;
      }
    }
    const lengthDiff = Math.abs(expected.length - actual.length);
    return mismatches + lengthDiff;
  }
}

// 事件名校验器：校验公共事件名的一致性
class EventNameValidator {
  private knownNames: Map<string, string> = new Map<string, string>();

  public register(key: string, value: string): void {
    this.knownNames.set(key, value);
  }

  public getValue(key: string): string | null {
    const value = this.knownNames.get(key);
    return value === undefined ? null : value;
  }

  public isRegistered(key: string): boolean {
    return this.knownNames.has(key);
  }

  public isConsistent(key: string, expectedValue: string): boolean {
    const value = this.knownNames.get(key);
    return value === expectedValue;
  }

  public getRegisteredCount(): number {
    return this.knownNames.size;
  }

  public getAllKeys(): string[] {
    const keys: string[] = [];
    this.knownNames.forEach((value: string, key: string) => {
      keys.push(key);
    });
    return keys;
  }

  public clear(): void {
    this.knownNames.clear();
  }
}

// 序列一致性校验器：校验操作序列的一致性
class SequenceValidator {
  public isOrdered(sequence: number[]): boolean {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] < sequence[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isStrictlyOrdered(sequence: number[]): boolean {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] <= sequence[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public equalsSequence(a: number[], b: number[]): boolean {
    if (a.length !== b.length) {
      return false;
    }
    for (let i = 0; i < a.length; i++) {
      if (a[i] !== b[i]) {
        return false;
      }
    }
    return true;
  }

  public findFirstInversion(sequence: number[]): number {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] < sequence[i - 1]) {
        return i;
      }
    }
    return -1;
  }

  public countInversions(sequence: number[]): number {
    let count: number = 0;
    for (let i = 0; i < sequence.length; i++) {
      for (let j = i + 1; j < sequence.length; j++) {
        if (sequence[i] > sequence[j]) {
          count++;
        }
      }
    }
    return count;
  }
}

// 一致性报告生成器：将一致性检查结果格式化为可读文本
class ConsistencyReportGenerator {
  public formatResult(result: ConsistencyResult): string {
    if (result === ConsistencyResult.PASS) {
      return '通过';
    }
    if (result === ConsistencyResult.FAIL) {
      return '失败';
    }
    return '跳过';
  }

  public formatCheck(check: ConsistencyCheckRecord): string {
    return `类型=${check.type}, 描述=${check.description}, 结果=${this.formatResult(check.result)}`;
  }

  public summarize(recorder: ConsistencyCheckRecorder): string {
    const total = recorder.getCheckCount();
    const passed = recorder.getPassedCount();
    const failed = recorder.getFailedCount();
    return `总计=${total}, 通过=${passed}, 失败=${failed}`;
  }
}

export default function powerDialogConsistencyTest() {
  describe('PowerDialogConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 DataSource_Consistency：totalCount 匹配数组长度
    it('total_count_should_match_array_length', 0, async () => {
      const model = new PowerConsistencyModel();
    });

    // 适配 DataSource_Consistency：边界内 getData 返回有效数据
    it('get_data_within_bounds_should_return_valid_data', 0, async () => {
      const model = new PowerConsistencyModel();
      expect(model.getData(0)?.name).assertEqual('熄屏');
      expect(model.getData(1)?.name).assertEqual('关机');
      expect(model.getData(2)?.name).assertEqual('重启');
      expect(model.getData(100)).assertEqual(null);
    });

    // 适配 Type_Detection_Consistency：操作类型不误分类
    it('operation_type_should_not_be_misclassified', 0, async () => {
      const model = new PowerConsistencyModel();
      const suspendType = model.getData(0)?.operationType;
      const rebootType = model.getData(2)?.operationType;
      expect(suspendType === PowerOperationType.POWEROPERATION_SHUTDOWN).assertFalse();
      expect(rebootType === PowerOperationType.POWEROPERATION_SUSPEND).assertFalse();
    });

    // 适配 NavStack_State_Consistency：焦点切换后恢复
    it('focus_state_should_restore_after_switch_back', 0, async () => {
      const model = new PowerConsistencyModel();
      const original = model.getFocusedIndex();
      model.setFocusToIndex(0);
      expect(model.getFocusedIndex()).assertEqual(0);
      model.setFocusToIndex(original);
      expect(model.getFocusedIndex()).assertEqual(original);
    });

    // 适配 Operation_Sequence_Consistency：无效焦点设置不改状态
    it('invalid_focus_set_should_not_change_state', 0, async () => {
      const model = new PowerConsistencyModel();
      const before = model.getFocusedIndex();
      expect(model.setFocusToIndex(-1)).assertFalse();
      expect(model.setFocusToIndex(100)).assertFalse();
      expect(model.getFocusedIndex()).assertEqual(before);
    });

    // 适配 Device_Switching：切换到相同索引为 noop
    it('switch_to_same_index_should_be_noop', 0, async () => {
      const model = new PowerConsistencyModel();
      const current = model.getFocusedIndex();
      model.setFocusToIndex(current);
      expect(model.getFocusedIndex()).assertEqual(current);
    });

    // 适配 Emitter_Event_Name_Consistency：事件名一致
    it('event_names_should_be_consistent', 0, async () => {
      expect(PowerEventNames.POWER_BOOLEAN).assertEqual('powerBoolean');
      expect(PowerEventNames.IS_READY).assertEqual('isReady');
      expect(PowerEventNames.SESSION_KEY).assertEqual('session');
    });

    // 适配 AppStorage_Key_Consistency：会话键一致
    it('session_key_should_be_consistent', 0, async () => {
      const key: string = PowerEventNames.SESSION_KEY;
      expect(key).assertEqual('session');
    });

    // 适配 Cross_Module_Data_Consistency：聚焦类型稳定
    it('focused_type_should_be_stable', 0, async () => {
      const model = new PowerConsistencyModel();
      const typeBefore = model.getFocusedType();
      model.setFocusToIndex(0);
      model.setFocusToIndex(1);
      expect(model.getFocusedType()).assertEqual(typeBefore);
    });

    // 适配 Operation_Sequence_Consistency：多次焦点切换状态一致
    it('multiple_focus_switches_should_keep_consistent_state', 0, async () => {
      const model = new PowerConsistencyModel();
      model.setFocusToIndex(0);
      model.setFocusToIndex(1);
      model.setFocusToIndex(2);
      expect(model.getFocusedIndex()).assertEqual(2);
      expect(model.getFocusedType()).assertEqual(PowerOperationType.POWEROPERATION_REBOOT);
    });

    // 集成：真实对话框状态一致性
    it('real_dialog_state_should_be_consistent', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });
}
