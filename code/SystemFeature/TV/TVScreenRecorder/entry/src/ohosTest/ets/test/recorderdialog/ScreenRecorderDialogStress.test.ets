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

import { describe, it, expect } from '@ohos/hypium';

// 录屏状态枚举：与 SRManager 的 RecordingState 保持一致
enum StressRecState {
  Idle = 0,
  Recording = 1,
  Stopped = 2,
  Error = 3
}

// 录屏状态机：只允许 Idle→Recording→Stopped 及失败回到 Error
class StressStateMachine {
  private state: StressRecState = StressRecState.Idle;
  private transitionCount: number = 0;
  private rejectedCount: number = 0;

  public getState(): StressRecState {
    return this.state;
  }

  public start(): boolean {
    if (this.state !== StressRecState.Idle) {
      this.rejectedCount++;
      return false;
    }
    this.state = StressRecState.Recording;
    this.transitionCount++;
    return true;
  }

  public stop(): boolean {
    if (this.state !== StressRecState.Recording) {
      this.rejectedCount++;
      return false;
    }
    this.state = StressRecState.Stopped;
    this.transitionCount++;
    return true;
  }

  public fail(): boolean {
    if (this.state === StressRecState.Error) {
      this.rejectedCount++;
      return false;
    }
    this.state = StressRecState.Error;
    this.transitionCount++;
    return true;
  }

  public reset(): void {
    this.state = StressRecState.Idle;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }
}

// 计时标签生成器：把累计秒数格式化为 HH:mm:ss
class StressTimerFormatter {
  public static format(totalSeconds: number): string {
    const safeSeconds: number = totalSeconds < 0 ? 0 : totalSeconds;
    const hours: number = Math.floor(safeSeconds / 3600);
    const minutes: number = Math.floor((safeSeconds % 3600) / 60);
    const seconds: number = safeSeconds % 60;
    return StressTimerFormatter.pad(hours) + ':' + StressTimerFormatter.pad(minutes) + ':' +
      StressTimerFormatter.pad(seconds);
  }

  private static pad(value: number): string {
    return value.toString().padStart(2, '0');
  }
}

// 窗口矩形模型：计时窗与提示窗的固定位置
interface StressWindowRect {
  name: string;
  x: number;
  y: number;
  width: number;
  height: number;
}

// 录屏压测工具：批量执行状态切换与文件名生成
class StressHarness {
  public static readonly FILE_PREFIX: string = 'REC';
  public static readonly VIDEO_TYPE: string = '.mp4';

  public static buildFileName(seed: number): string {
    const day: number = seed % 28 + 1;
    const hour: number = seed % 24;
    const minute: number = seed % 60;
    const second: number = (seed * 7) % 60;
    return `${StressHarness.FILE_PREFIX}_202601${StressHarness.pad(day)}_${StressHarness.pad(hour)}` +
      `${StressHarness.pad(minute)}${StressHarness.pad(second)}${StressHarness.VIDEO_TYPE}`;
  }

  private static pad(value: number): string {
    return value.toString().padStart(2, '0');
  }

  public static buildRects(): StressWindowRect[] {
    const rects: StressWindowRect[] = [];
    const timer: StressWindowRect = { name: 'recorderTimer', x: 96, y: 48, width: 624, height: 56 };
    const tip: StressWindowRect = { name: 'recorderTip', x: 615, y: 46, width: 686, height: 100 };
    rects.push(timer);
    rects.push(tip);
    return rects;
  }
}

export default function screenRecorderDialogStressTest(): void {
  describe('ScreenRecorderDialogStress_Test', () => {
    // 高频启停：100 轮启停后状态机应回到 Stopped 且无拒绝
    it('rapid_start_stop_cycle_should_be_stable', 0, async () => {
      const machine: StressStateMachine = new StressStateMachine();
      for (let i = 0; i < 100; i++) {
        expect(machine.start()).assertTrue();
        expect(machine.stop()).assertTrue();
        machine.reset();
      }
      expect(machine.getState()).assertEqual(StressRecState.Idle);
      expect(machine.getTransitionCount()).assertEqual(200);
      expect(machine.getRejectedCount()).assertEqual(0);
    });

    // 重复启动请求应被拒绝，状态不得越过 Recording
    it('repeated_start_request_should_be_rejected', 0, async () => {
      const machine: StressStateMachine = new StressStateMachine();
      for (let i = 0; i < 50; i++) {
        machine.start();
      }
      expect(machine.getState()).assertEqual(StressRecState.Recording);
      expect(machine.getTransitionCount()).assertEqual(1);
      expect(machine.getRejectedCount()).assertEqual(49);
    });

    // 重复停止请求应被拒绝，状态不得回到 Idle
    it('repeated_stop_request_should_be_rejected', 0, async () => {
      const machine: StressStateMachine = new StressStateMachine();
      machine.start();
      for (let i = 0; i < 30; i++) {
        machine.stop();
      }
      expect(machine.getState()).assertEqual(StressRecState.Stopped);
      expect(machine.getTransitionCount()).assertEqual(2);
      expect(machine.getRejectedCount()).assertEqual(29);
    });

    // 连续生成文件名应保持 REC_ 前缀与 mp4 后缀
    it('repeated_file_name_generation_should_stay_valid', 0, async () => {
      for (let i = 0; i < 200; i++) {
        const name: string = StressHarness.buildFileName(i);
        expect(name.startsWith('REC_')).assertTrue();
        expect(name.endsWith('.mp4')).assertTrue();
        expect(name.length).assertEqual(23);
      }
    });

    // 计时文本在长时间运行后应保持单调递增
    it('long_run_timer_should_stay_monotonic', 0, async () => {
      let previousTotal: number = 0;
      for (let i = 1; i <= 3600; i++) {
        const current: string = StressTimerFormatter.format(i);
        expect(current.length).assertEqual(8);
        const fields: string[] = current.split(':');
        const total: number = Number(fields[0]) * 3600 + Number(fields[1]) * 60 + Number(fields[2]);
        expect(total).assertEqual(i);
        expect(total).assertLarger(previousTotal);
        previousTotal = total;
      }
      expect(previousTotal).assertEqual(3600);
      expect(StressTimerFormatter.format(3600)).assertEqual('01:00:00');
    });

    // 极端秒数不应产生越界或负值文本
    it('extreme_timer_value_should_be_clamped', 0, async () => {
      expect(StressTimerFormatter.format(-1)).assertEqual('00:00:00');
      expect(StressTimerFormatter.format(0)).assertEqual('00:00:00');
      expect(StressTimerFormatter.format(86399)).assertEqual('23:59:59');
      expect(StressTimerFormatter.format(360000)).assertEqual('100:00:00');
    });

    // 浮窗矩形在反复读取后应保持一致
    it('window_rect_should_stay_constant', 0, async () => {
      const rects: StressWindowRect[] = StressHarness.buildRects();
      expect(rects.length).assertEqual(2);
      for (let i = 0; i < 100; i++) {
        const timer: StressWindowRect = rects[0];
        expect(timer.x).assertEqual(96);
        expect(timer.y).assertEqual(48);
        expect(timer.width).assertEqual(624);
        expect(timer.height).assertEqual(56);
      }
      expect(rects[1].name).assertEqual('recorderTip');
    });

    // 错误状态应可恢复到 Idle 且不残留计数
    it('error_state_should_recover_without_leak', 0, async () => {
      const machine: StressStateMachine = new StressStateMachine();
      for (let i = 0; i < 20; i++) {
        expect(machine.fail()).assertTrue();
        machine.reset();
        expect(machine.getState()).assertEqual(StressRecState.Idle);
      }
      expect(machine.getTransitionCount()).assertEqual(20);
      expect(machine.getRejectedCount()).assertEqual(0);
    });
  });
}
