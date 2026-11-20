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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  powerDialogComponentCount,
  isPowerDialogVisible,
  waitForDialogStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// 集成类型枚举：描述电源对话框与系统服务的集成类别
enum IntegrationType {
  INTEGRATION_POWER = 'power', INTEGRATION_WINDOW = 'window', INTEGRATION_FOCUS = 'focus', INTEGRATION_EVENT = 'event', INTEGRATION_UI = 'ui'
}

// 集成记录接口：描述一次集成交互的结果
interface IntegrationRecord {
  integrationType: IntegrationType;
  operationName: string;
  success: boolean;
  timestamp: number;
}

// 集成追踪器：记录对话框与系统服务的集成交互
class IntegrationTracker {
  private static instance: IntegrationTracker;
  private records: IntegrationRecord[] = [];

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): IntegrationTracker {
    if (!IntegrationTracker.instance) {
      IntegrationTracker.instance = new IntegrationTracker();
    }
    return IntegrationTracker.instance;
  }

  // 记录一次集成交互
  public record(type: IntegrationType, operationName: string, success: boolean): void {
    this.records.push({
      integrationType: type,
      operationName,
      success,
      timestamp: Date.now()
    });
  }

  // 获取全部集成记录
  public getRecords(): IntegrationRecord[] {
    return [...this.records];
  }

  // 获取集成记录总数
  public getRecordCount(): number {
    return this.records.length;
  }

  // 按集成类型统计记录数量
  public countByType(type: IntegrationType): number {
    return this.records.filter((record: IntegrationRecord) => record.integrationType === type).length;
  }

  // 统计成功集成次数
  public getSuccessCount(): number {
    return this.records.filter((record: IntegrationRecord) => record.success).length;
  }

  // 统计失败集成次数
  public getFailureCount(): number {
    return this.records.filter((record: IntegrationRecord) => !record.success).length;
  }

  // 判断是否与指定类型发生过集成
  public hasIntegrationWith(type: IntegrationType): boolean {
    return this.records.some((record: IntegrationRecord) => record.integrationType === type);
  }

  // 清空全部集成记录
  public clear(): void {
    this.records = [];
  }
}

// 集成会话状态枚举：描述集成交互会话的生命周期状态
enum IntegrationSessionState {
  SESSION_IDLE = 'idle', SESSION_ACTIVE = 'active', SESSION_COMPLETED = 'completed', SESSION_FAILED = 'failed'
}

// 集成会话：管理一次集成交互会话的状态流转
class IntegrationSession {
  private state: IntegrationSessionState = IntegrationSessionState.SESSION_IDLE;
  private activeType: IntegrationType | null = null;

  // 开启会话并绑定集成类型：重复开启被拒绝
  public start(type: IntegrationType): boolean {
    if (this.state === IntegrationSessionState.SESSION_ACTIVE) {
      return false;
    }
    this.state = IntegrationSessionState.SESSION_ACTIVE;
    this.activeType = type;
    return true;
  }

  // 判断会话是否处于活跃状态
  public isActive(): boolean {
    return this.state === IntegrationSessionState.SESSION_ACTIVE;
  }

  // 获取会话当前状态
  public getState(): IntegrationSessionState {
    return this.state;
  }

  // 获取会话绑定的集成类型
  public getActiveType(): IntegrationType | null {
    return this.activeType;
  }

  // 正常完成会话
  public complete(): void {
    if (this.state === IntegrationSessionState.SESSION_ACTIVE) {
      this.state = IntegrationSessionState.SESSION_COMPLETED;
    }
  }

  // 标记会话失败
  public fail(): void {
    if (this.state === IntegrationSessionState.SESSION_ACTIVE) {
      this.state = IntegrationSessionState.SESSION_FAILED;
    }
  }

  // 重置会话为初始状态
  public reset(): void {
    this.state = IntegrationSessionState.SESSION_IDLE;
    this.activeType = null;
  }
}

// 集成校验器：校验集成记录与集成类型的合法性
class IntegrationValidator {
  // 判断集成类型是否属于已知集合
  public isValidType(type: IntegrationType): boolean {
    return type === IntegrationType.INTEGRATION_POWER ||
      type === IntegrationType.INTEGRATION_WINDOW ||
      type === IntegrationType.INTEGRATION_FOCUS ||
      type === IntegrationType.INTEGRATION_EVENT ||
      type === IntegrationType.INTEGRATION_UI;
  }

  // 判断操作名称是否非空
  public isValidOperationName(operationName: string): boolean {
    return operationName.length > 0;
  }

  // 校验一条集成记录是否完整合法
  public isRecordValid(record: IntegrationRecord): boolean {
    return this.isValidType(record.integrationType) && this.isValidOperationName(record.operationName);
  }
}

// 集成报告生成器：汇总集成记录并生成统计摘要
class IntegrationReportGenerator {
  // 生成集成摘要文本
  public generateSummary(records: IntegrationRecord[]): string {
    return `IntegrationReport{total: ${records.length}, success: ${records.filter((record: IntegrationRecord) => record.success).length}, failure: ${records.filter((record: IntegrationRecord) => !record.success).length}}`;
  }

  // 统计指定类型的集成数量
  public countByType(records: IntegrationRecord[], type: IntegrationType): number {
    return records.filter((record: IntegrationRecord) => record.integrationType === type).length;
  }
}

export default function integrationTestingTest() {
  describe('IntegrationTesting_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Integration_Tracker：记录与统计集成
    it('integration_tracker_should_record_and_count', 0, async () => {
      const tracker = IntegrationTracker.getInstance();
      tracker.clear();
      tracker.record(IntegrationType.INTEGRATION_POWER, 'suspend_op', true);
      tracker.record(IntegrationType.INTEGRATION_WINDOW, 'window_op', true);
      tracker.record(IntegrationType.INTEGRATION_FOCUS, 'focus_op', false);
      expect(tracker.getRecordCount()).assertEqual(3);
      expect(tracker.countByType(IntegrationType.INTEGRATION_POWER)).assertEqual(1);
      expect(tracker.getSuccessCount()).assertEqual(2);
      expect(tracker.getFailureCount()).assertEqual(1);
    });

    // 适配 Integration_Tracker：识别是否与指定类型集成过
    it('integration_tracker_should_detect_integration_type', 0, async () => {
      const tracker = IntegrationTracker.getInstance();
      tracker.clear();
      tracker.record(IntegrationType.INTEGRATION_EVENT, 'key_event', true);
      expect(tracker.hasIntegrationWith(IntegrationType.INTEGRATION_EVENT)).assertTrue();
      expect(tracker.hasIntegrationWith(IntegrationType.INTEGRATION_UI)).assertFalse();
    });

    // 适配 Integration_Tracker：清空后计数归零
    it('integration_tracker_should_clear_records', 0, async () => {
      const tracker = IntegrationTracker.getInstance();
      tracker.clear();
      tracker.record(IntegrationType.INTEGRATION_POWER, 'op', true);
      tracker.clear();
      expect(tracker.getRecordCount()).assertEqual(0);
      expect(tracker.getRecords().length).assertEqual(0);
    });

    // 适配 Integration_Tracker：单例保持一致
    it('integration_tracker_singleton_should_be_consistent', 0, async () => {
      const tracker1 = IntegrationTracker.getInstance();
      const tracker2 = IntegrationTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();
    });

    // 适配 Integration_Session：会话开启与完成
    it('integration_session_should_start_and_complete', 0, async () => {
      const session = new IntegrationSession();
      expect(session.start(IntegrationType.INTEGRATION_UI)).assertTrue();
      expect(session.isActive()).assertTrue();
      session.complete();
      expect(session.getState()).assertEqual(IntegrationSessionState.SESSION_COMPLETED);
      expect(session.isActive()).assertFalse();
    });

    // 适配 Integration_Session：重复开启被拒绝
    it('integration_session_should_reject_duplicate_start', 0, async () => {
      const session = new IntegrationSession();
      session.start(IntegrationType.INTEGRATION_POWER);
      expect(session.start(IntegrationType.INTEGRATION_WINDOW)).assertFalse();
      expect(session.getActiveType()).assertEqual(IntegrationType.INTEGRATION_POWER);
    });

    // 适配 Integration_Session：失败状态流转
    it('integration_session_should_handle_failure', 0, async () => {
      const session = new IntegrationSession();
      session.start(IntegrationType.INTEGRATION_EVENT);
      session.fail();
      expect(session.getState()).assertEqual(IntegrationSessionState.SESSION_FAILED);
      session.reset();
      expect(session.getState()).assertEqual(IntegrationSessionState.SESSION_IDLE);
      expect(session.getActiveType() === null).assertTrue();
    });

    // 适配 Integration_Validator：类型合法性校验
    it('integration_validator_should_validate_type', 0, async () => {
      const validator = new IntegrationValidator();
      expect(validator.isValidType(IntegrationType.INTEGRATION_POWER)).assertTrue();
      expect(validator.isValidType(IntegrationType.INTEGRATION_UI)).assertTrue();
    });

    // 适配 Integration_Validator：记录完整性校验
    it('integration_validator_should_validate_record', 0, async () => {
      const validator = new IntegrationValidator();
      const valid: IntegrationRecord = {
        integrationType: IntegrationType.INTEGRATION_FOCUS,
        operationName: 'nav',
        success: true,
        timestamp: Date.now()
      };
      expect(validator.isRecordValid(valid)).assertTrue();
      const invalid: IntegrationRecord = {
        integrationType: IntegrationType.INTEGRATION_FOCUS,
        operationName: '',
        success: true,
        timestamp: Date.now()
      };
      expect(validator.isRecordValid(invalid)).assertFalse();
    });

    // 适配 Integration_Report：摘要生成与类型统计
    it('integration_report_should_generate_summary', 0, async () => {
      const generator = new IntegrationReportGenerator();
      const records: IntegrationRecord[] = [
        { integrationType: IntegrationType.INTEGRATION_POWER, operationName: 'a', success: true, timestamp: 1 },
        { integrationType: IntegrationType.INTEGRATION_POWER, operationName: 'b', success: false, timestamp: 2 },
        { integrationType: IntegrationType.INTEGRATION_UI, operationName: 'c', success: true, timestamp: 3 }
      ];
      const summary: string = generator.generateSummary(records);
      expect(summary.includes('total: 3')).assertTrue();
      expect(summary.includes('success: 2')).assertTrue();
      expect(summary.includes('failure: 1')).assertTrue();
      expect(generator.countByType(records, IntegrationType.INTEGRATION_POWER)).assertEqual(2);
    });

    // 适配 Dialog_Power_Integration：对话框集成电源服务
    it('dialog_should_integrate_with_power_manager', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const visible = await isPowerDialogVisible(driver);
      expect(visible).assertTrue();
      const tracker = IntegrationTracker.getInstance();
      tracker.record(IntegrationType.INTEGRATION_POWER, 'power_integration', visible);
      expect(tracker.hasIntegrationWith(IntegrationType.INTEGRATION_POWER)).assertTrue();
    });

    // 适配 Dialog_Focus_Integration：对话框支持焦点导航
    it('dialog_should_integrate_with_focus_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });

    // 适配 Dialog_Integration_Stability：集成操作后对话框保持稳定
    it('dialog_should_remain_stable_after_integration_ops', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);
      for (let i = 0; i < 6; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 30);
      }
      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(5);
      expect(await isPowerDialogVisible(driver)).assertTrue();
    });
  });
}
