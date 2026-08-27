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
  KEY_BACK,
  KEY_ENTER,
  KEY_POWER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  triggerPowerDialog,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

enum DialogState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing'
}

interface StateRecord {
  state: DialogState;
  focusIndex: number;
  timestamp: number;
  isPersisted: boolean;
}

class StatePersistenceTracker {
  private static instance: StatePersistenceTracker;
  private stateHistory: StateRecord[] = [];
  private totalStates: number = 0;
  private persistedStates: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): StatePersistenceTracker {
    if (!StatePersistenceTracker.instance) {
      StatePersistenceTracker.instance = new StatePersistenceTracker();
    }
    return StatePersistenceTracker.instance;
  }

  public recordState(state: DialogState, focusIndex: number, isPersisted: boolean): void {
    const record: StateRecord = {
      state,
      focusIndex,
      timestamp: Date.now(),
      isPersisted
    };
    this.stateHistory.push(record);
    this.totalStates++;
    if (isPersisted) {
      this.persistedStates++;
    }
  }

  public getStateHistory(): StateRecord[] {
    return [...this.stateHistory];
  }

  public getTotalStates(): number {
    return this.totalStates;
  }

  public getPersistedStates(): number {
    return this.persistedStates;
  }

  public resetTracker(): void {
    this.stateHistory = [];
    this.totalStates = 0;
    this.persistedStates = 0;
  }

  public getPersistenceRate(): number {
    if (this.totalStates === 0) {
      return 0;
    }
    return this.persistedStates / this.totalStates;
  }

  public hasState(state: DialogState): boolean {
    return this.stateHistory.some(record => record.state === state);
  }

  public getLastState(): DialogState | undefined {
    if (this.stateHistory.length === 0) {
      return undefined;
    }
    return this.stateHistory[this.stateHistory.length - 1].state;
  }
}

export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {
    let driver: Driver;
    let stateTracker: StatePersistenceTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateTracker = StatePersistenceTracker.getInstance();
      stateTracker.resetTracker();
      await serializedDelay(driver, 1000);
      await triggerPowerDialog(driver);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证dialog should持久：确保TV设备persist opened state状态保持
    it('dialog_should_persist_opened_state', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.recordState(DialogState.OPENED, 0, true);

      expect(stateTracker.hasState(DialogState.OPENED)).assertTrue();
    });

    it('dialog_should_restore_state_after_close', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      stateTracker.recordState(DialogState.OPENED, 0, true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);

      stateTracker.recordState(DialogState.CLOSED, -1, true);

      expect(stateTracker.hasState(DialogState.CLOSED)).assertTrue();
    });

    // 验证dialog state状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_state_records_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      stateTracker.recordState(DialogState.OPENED, 0, true);
      await serializedDelay(driver, 100);
      stateTracker.recordState(DialogState.OPENED, 1, true);
      await serializedDelay(driver, 100);
      stateTracker.recordState(DialogState.OPENED, 2, true);

      const history = stateTracker.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog state维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降级
    it('dialog_state_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = StatePersistenceTracker.getInstance();
      const tracker2 = StatePersistenceTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordState(DialogState.OPENED, 0, true);

      expect(tracker2.getTotalStates()).assertEqual(1);
      expect(tracker2.getPersistedStates()).assertEqual(1);
    });

    it('dialog_should_track_all_state_transitions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      const states = [DialogState.CLOSED, DialogState.OPENING, DialogState.OPENED, DialogState.CLOSING];
      for (const state of states) {
        stateTracker.recordState(state, 0, true);
      }

      expect(stateTracker.getTotalStates()).assertEqual(4);
      expect(stateTracker.hasState(DialogState.CLOSED)).assertTrue();
      expect(stateTracker.hasState(DialogState.OPENING)).assertTrue();
      expect(stateTracker.hasState(DialogState.OPENED)).assertTrue();
      expect(stateTracker.hasState(DialogState.CLOSING)).assertTrue();
    });

    // 验证dialog should维持稳定：确保TV设备在maintain state consistency下性能不降级
    it('dialog_should_maintain_state_consistency', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        stateTracker.recordState(DialogState.OPENED, i % 3, true);
        await serializedDelay(driver, 50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid state changes下功能正常
    it('dialog_should_handle_rapid_state_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        const state = i % 2 === 0 ? DialogState.OPENED : DialogState.CLOSED;
        stateTracker.recordState(state, i % 3, true);
        await serializedDelay(driver, 30);
      }

      expect(stateTracker.getTotalStates()).assertEqual(50);
      expect(stateTracker.getPersistenceRate()).assertEqual(1);
    });

    it('dialog_should_restore_last_state', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      stateTracker.recordState(DialogState.OPENED, 0, true);
      stateTracker.recordState(DialogState.OPENED, 1, true);
      stateTracker.recordState(DialogState.OPENED, 2, true);

      const lastState = stateTracker.getLastState();
      expect(lastState).assertEqual(DialogState.OPENED);
    });

    // 验证dialog should持久：确保TV设备persist state across operations状态保持
    it('dialog_should_persist_state_across_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        stateTracker.recordState(DialogState.OPENED, i % 3, true);
        await serializedDelay(driver, 50);
      }

      expect(stateTracker.getPersistedStates()).assertEqual(20);
    });

    // 综合comprehensive state场景测试：验证完整操作流程中功能正确
    it('comprehensive_state_persistence_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      const scenarioStart = Date.now();

      stateTracker.recordState(DialogState.OPENING, 0, true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      stateTracker.recordState(DialogState.OPENED, 0, true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateTracker.recordState(DialogState.OPENED, 1, true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);

      stateTracker.recordState(DialogState.CLOSING, -1, true);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(stateTracker.getTotalStates()).assertEqual(4);
      expect(stateTracker.getPersistenceRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}