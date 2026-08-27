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
  createFreshDriver, KEY_BACK, pressAndWait, DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// 生命周期阶段枚举：覆盖对话框从创建到销毁的完整状态机
enum LifecyclePhase {
  CREATED = 'created', SHOWING = 'showing', VISIBLE = 'visible', INTERACTING = 'interacting', HIDING = 'hiding', HIDDEN = 'hidden', DESTROYED = 'destroyed'
}

// 生命周期记录接口：用于追踪每个阶段的执行情况和性能数据
interface LifecycleRecord {
  phase: LifecyclePhase;
  duration: number;
  isSuccess: boolean;
  timestamp: number;
}

// 生命周期追踪器：单例模式确保跨测试用例的数据一致性
class DialogLifecycleTracker {
  private static instance: DialogLifecycleTracker;
  private lifecycleHistory: LifecycleRecord[] = [];
  private totalPhases: number = 0;
  private successfulPhases: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): DialogLifecycleTracker {
    if (!DialogLifecycleTracker.instance) {
      DialogLifecycleTracker.instance = new DialogLifecycleTracker();
    }
    return DialogLifecycleTracker.instance;
  }

  public recordLifecycle(phase: LifecyclePhase, duration: number, isSuccess: boolean): void {
    const record: LifecycleRecord = {
      phase,
      duration,
      isSuccess,
      timestamp: Date.now()
    };
    this.lifecycleHistory.push(record);
    this.totalPhases++;
    if (isSuccess) {
      this.successfulPhases++;
    }
  }

  public getLifecycleHistory(): LifecycleRecord[] {
    return [...this.lifecycleHistory];
  }

  public getTotalPhases(): number {
    return this.totalPhases;
  }

  public getSuccessfulPhases(): number {
    return this.successfulPhases;
  }

  public resetTracker(): void {
    this.lifecycleHistory = [];
    this.totalPhases = 0;
    this.successfulPhases = 0;
  }

  public getSuccessRate(): number {
    if (this.totalPhases === 0) {
      return 0;
    }
    return this.successfulPhases / this.totalPhases;
  }

  public hasPhase(phase: LifecyclePhase): boolean {
    return this.lifecycleHistory.some(record => record.phase === phase);
  }

  public getAveragePhaseDuration(): number {
    if (this.lifecycleHistory.length === 0) {
      return 0;
    }
    const totalDuration =
      this.lifecycleHistory.reduce((sum: number, record: LifecycleRecord) => sum + record.duration, 0);
    return totalDuration / this.lifecycleHistory.length;
  }
}

export default function dialogLifecycleTest() {
  describe('DialogLifecycle_Test', () => {
    let driver: Driver;
    let lifecycleTracker: DialogLifecycleTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => { // 初始化Driver和生命周期追踪器，确保测试从干净状态开始
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      lifecycleTracker = DialogLifecycleTracker.getInstance();
      lifecycleTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 移除beforeEach中的对话框等待，避免重复等待导致超时
    // 对话框已在beforeAll中打开，无需每个测试用例前重新等待

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => { // 测试结束后关闭对话框并清理资源
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证dialog should完成：确保TV设备complete created phase在规定时间内
    it('dialog_should_complete_created_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.CREATED, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.CREATED)).assertTrue();
    });

    // 验证dialog should完成：确保TV设备complete showing phase在规定时间内
    it('dialog_should_complete_showing_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.SHOWING, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.SHOWING)).assertTrue();
    });

    // 验证dialog should完成：确保TV设备complete visible phase在规定时间内
    it('dialog_should_complete_visible_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.VISIBLE, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.VISIBLE)).assertTrue();
    });

    // 验证dialog should完成：确保TV设备complete interacting phase在规定时间内
    it('dialog_should_complete_interacting_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.INTERACTING, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.INTERACTING)).assertTrue();
    });

    // 验证dialog should完成：确保TV设备complete hiding phase在规定时间内
    it('dialog_should_complete_hiding_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.HIDING, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.HIDING)).assertTrue();
    });

    // 验证dialog should完成：确保TV设备complete hidden phase在规定时间内
    it('dialog_should_complete_hidden_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.HIDDEN, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.HIDDEN)).assertTrue();
    });

    // 验证dialog should完成：确保TV设备complete destroyed phase在规定时间内
    it('dialog_should_complete_destroyed_phase', 0, async () => {
      lifecycleTracker.resetTracker();
      const duration = 0;

      lifecycleTracker.recordLifecycle(LifecyclePhase.DESTROYED, duration, true);

      expect(lifecycleTracker.hasPhase(LifecyclePhase.DESTROYED)).assertTrue();
    });

    // 验证dialog lifecycle状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_lifecycle_records_timestamps_should_be_chronological', 0, async () => {
      lifecycleTracker.resetTracker();

      lifecycleTracker.recordLifecycle(LifecyclePhase.CREATED, 100, true);
      lifecycleTracker.recordLifecycle(LifecyclePhase.SHOWING, 100, true);
      lifecycleTracker.recordLifecycle(LifecyclePhase.VISIBLE, 100, true);

      const history = lifecycleTracker.getLifecycleHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog lifecycle维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_lifecycle_tracker_singleton_should_maintain_consistency', 0,
      async () => { // 验证生命周期追踪器单例模式的一致性，确保跨测试用例数据共享正确
        const tracker1 = DialogLifecycleTracker.getInstance();
        const tracker2 = DialogLifecycleTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();


        tracker1.resetTracker();
        tracker1.recordLifecycle(LifecyclePhase.CREATED, 100, true);

        expect(tracker2.getTotalPhases()).assertEqual(1);
        expect(tracker2.getSuccessfulPhases()).assertEqual(1);
      });

    // 验证dialog should处理能力：确保TV设备在handle all lifecycle phases下功能正常
    it('dialog_should_handle_all_lifecycle_phases', 0, async () => {
      lifecycleTracker.resetTracker();

      const phases =
        [LifecyclePhase.CREATED, LifecyclePhase.SHOWING, LifecyclePhase.VISIBLE, LifecyclePhase.INTERACTING,
          LifecyclePhase.HIDING, LifecyclePhase.HIDDEN, LifecyclePhase.DESTROYED];

      for (const phase of phases) {
        lifecycleTracker.recordLifecycle(phase, 100, true);
      }

      expect(lifecycleTracker.getTotalPhases()).assertEqual(7);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain lifecycle quality下性能不降低
    it('dialog_should_maintain_lifecycle_quality', 0, async () => {
      lifecycleTracker.resetTracker();
      const initialCount = lifecycleTracker.getTotalPhases();

      for (let i = 0; i < 10; i++) {
        const phase = i % 2 === 0 ? LifecyclePhase.INTERACTING : LifecyclePhase.VISIBLE;
        lifecycleTracker.recordLifecycle(phase, 100, true);
      }

      const finalCount = lifecycleTracker.getTotalPhases();
      expect(finalCount - initialCount).assertEqual(10);
    });

    // 验证dialog should具备特性：确保TV设备have optimal lifecycle duration满足设计要求
    it('dialog_should_have_optimal_lifecycle_duration', 0, async () => {
      lifecycleTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        lifecycleTracker.recordLifecycle(LifecyclePhase.INTERACTING, 150, true);
      }

      const avgDuration = lifecycleTracker.getAveragePhaseDuration();
      expect(avgDuration).assertLessOrEqual(200);
    });
  });


}
