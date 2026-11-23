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
import { vibrator } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorBuilderState';

function failureCode(action: () => void): number {
  try {
    action();
    return 0;
  } catch (error) {
    return Number((error as BusinessError).code);
  }
}

export default function vibratorBuilderStateGuard(): void {
  describe('VibratorBuilderStateGuard', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0001
     * @tc.name testVibratorBuilderState0001
     * @tc.desc 空构造器拒绝build，添加首个短事件后可正常生成且时长为48毫秒。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0001', 0, (): void => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const code: number = failureCode((): void => {
        builder.build();
      });
      hilog.info(DOMAIN, TAG, 'Empty build code=%{public}d', code);
      expect(code).assertEqual(401);
      builder.addTransientEvent(15);
      const result: vibrator.VibratorPattern = builder.build();
      hilog.info(DOMAIN, TAG, 'Recovered event count=%{public}d', result.events.length);
      expect(result.events.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Recovered event time=%{public}d', result.events[0].time);
      expect(result.events[0].time).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'Recovered duration=%{public}s', String(result.events[0].duration));
      expect(result.events[0].duration).assertEqual(48);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0002
     * @tc.name testVibratorBuilderState0002
     * @tc.desc 128个短事件可生成，加入第129个事件后build拒绝超限，不播放振动。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0002', 0, async (): Promise<void> => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      for (let i: number = 0; i < 128; i++) {
        builder.addTransientEvent(i * 25);
        if (i === 63) {
          await paceTurn();
        }
      }
      const result: vibrator.VibratorPattern = builder.build();
      hilog.info(DOMAIN, TAG, 'Maximum event count=%{public}d', result.events.length);
      expect(result.events.length).assertEqual(128);
      const times: number[] = result.events.map((event: vibrator.VibratorEvent): number => event.time);
      hilog.info(DOMAIN, TAG, 'Maximum sequence start=%{public}d', Math.min(...times));
      expect(Math.min(...times)).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'Maximum sequence last start=%{public}d', Math.max(...times));
      expect(Math.max(...times)).assertEqual(3175);
      const duration: number = result.events.reduce((sum: number, event: vibrator.VibratorEvent): number => {
        return sum + (event.duration ?? 0);
      }, 0);
      hilog.info(DOMAIN, TAG, 'Maximum sequence total duration=%{public}d', duration);
      expect(duration).assertEqual(6144);
      builder.addTransientEvent(3200);
      const code: number = failureCode((): void => {
        builder.build();
      });
      hilog.info(DOMAIN, TAG, 'Over-limit build code=%{public}d', code);
      expect(code).assertEqual(401);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0003
     * @tc.name testVibratorBuilderState0003
     * @tc.desc 已有长事件后拒绝负时间，非法追加不改变原事件数量及其选项。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0003', 0, (): void => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const options: vibrator.ContinuousParam = { intensity: 97, frequency: 34, index: 1 };
      builder.addContinuousEvent(25, 15, options);
      const code: number = failureCode((): void => {
        builder.addTransientEvent(-1);
      });
      hilog.info(DOMAIN, TAG, 'Negative time code=%{public}d', code);
      expect(code).assertEqual(401);
      const result: vibrator.VibratorPattern = builder.build();
      hilog.info(DOMAIN, TAG, 'Retained events=%{public}d', result.events.length);
      expect(result.events.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Retained type=%{public}d', result.events[0].eventType);
      expect(result.events[0].eventType).assertEqual(vibrator.VibratorEventType.CONTINUOUS);
      hilog.info(DOMAIN, TAG, 'Retained intensity=%{public}s', String(result.events[0].intensity));
      expect(result.events[0].intensity).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'Retained duration=%{public}s', String(result.events[0].duration));
      expect(result.events[0].duration).assertEqual(15);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0004
     * @tc.name testVibratorBuilderState0004
     * @tc.desc 曲线点不能位于事件开始前或结束后，拒绝后仍可追加有效长事件。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0004', 0, (): void => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const early: vibrator.ContinuousParam = {
        points: [
          { time: -1, intensity: 0, frequency: 0 },
          { time: 100, intensity: 0.5, frequency: 0 },
          { time: 200, intensity: 0.5, frequency: 0 },
          { time: 300, intensity: 0, frequency: 0 }
        ]
      };
      const late: vibrator.ContinuousParam = {
        points: [
          { time: 0, intensity: 0, frequency: 0 },
          { time: 100, intensity: 0.5, frequency: 0 },
          { time: 200, intensity: 0.5, frequency: 0 },
          { time: 301, intensity: 0, frequency: 0 }
        ]
      };
      const earlyCode: number = failureCode((): void => {
        builder.addContinuousEvent(25, 300, early);
      });
      hilog.info(DOMAIN, TAG, 'Early point code=%{public}d', earlyCode);
      expect(earlyCode).assertEqual(401);
      const lateCode: number = failureCode((): void => {
        builder.addContinuousEvent(25, 300, late);
      });
      hilog.info(DOMAIN, TAG, 'Late point code=%{public}d', lateCode);
      expect(lateCode).assertEqual(401);
      builder.addContinuousEvent(0, 1);
      const result: vibrator.VibratorPattern = builder.build();
      hilog.info(DOMAIN, TAG, 'Recovered points event count=%{public}d', result.events.length);
      expect(result.events.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Recovered point-free duration=%{public}s', String(result.events[0].duration));
      expect(result.events[0].duration).assertEqual(1);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0005
     * @tc.name testVibratorBuilderState0005
     * @tc.desc 三个和十七个曲线点分别越界，四个有效点可在同一构造器生成。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0005', 0, (): void => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const three: vibrator.ContinuousParam = {
        points: [
          { time: 0, intensity: 0, frequency: 0 },
          { time: 100, intensity: 1, frequency: 0 },
          { time: 200, intensity: 0, frequency: 0 }
        ]
      };
      const threeCode: number = failureCode((): void => {
        builder.addContinuousEvent(25, 200, three);
      });
      hilog.info(DOMAIN, TAG, 'Three points code=%{public}d', threeCode);
      expect(threeCode).assertEqual(401);
      const excessive: vibrator.VibratorCurvePoint[] = [];
      for (let i: number = 0; i < 17; i++) {
        excessive.push({ time: i * 10, intensity: 0, frequency: 0 });
      }
      const seventeen: vibrator.ContinuousParam = { points: excessive };
      const seventeenCode: number = failureCode((): void => {
        builder.addContinuousEvent(25, 160, seventeen);
      });
      hilog.info(DOMAIN, TAG, 'Seventeen points code=%{public}d', seventeenCode);
      expect(seventeenCode).assertEqual(401);
      const four: vibrator.ContinuousParam = {
        points: [
          { time: 0, intensity: 0, frequency: -100 },
          { time: 10, intensity: 0.25, frequency: -50 },
          { time: 20, intensity: 0.75, frequency: 50 },
          { time: 30, intensity: 0, frequency: 100 }
        ]
      };
      builder.addContinuousEvent(25, 30, four);
      const event: vibrator.VibratorEvent = builder.build().events[0];
      if (event.points === undefined) {
        throw new Error('Valid four-point event lost its curve');
      }
      hilog.info(DOMAIN, TAG, 'Recovered curve count=%{public}d', event.points.length);
      expect(event.points.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'Recovered gain=%{public}s', String(event.points[1].intensity));
      expect(event.points[1].intensity).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Recovered endpoint shift=%{public}s', String(event.points[3].frequency));
      expect(event.points[3].frequency).assertEqual(100);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0006
     * @tc.name testVibratorBuilderState0006
     * @tc.desc 不同构造器交错追加，长短事件及三通道参数不会串入另一构造器。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0006', 0, (): void => {
      const first: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const second: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const transient: vibrator.TransientParam = { index: 2, intensity: 80, frequency: 70 };
      const continuous: vibrator.ContinuousParam = { index: 1, intensity: 97, frequency: 34 };
      first.addTransientEvent(0, transient);
      second.addContinuousEvent(25, 15, continuous);
      first.addTransientEvent(50);
      const one: vibrator.VibratorPattern = first.build();
      const two: vibrator.VibratorPattern = second.build();
      hilog.info(DOMAIN, TAG, 'First independent count=%{public}d', one.events.length);
      expect(one.events.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'Second independent count=%{public}d', two.events.length);
      expect(two.events.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Second independent duration=%{public}s', String(two.events[0].duration));
      expect(two.events[0].duration).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'Second independent channel=%{public}s', String(two.events[0].index));
      expect(two.events[0].index).assertEqual(1);
      const total: number = one.events.reduce((sum: number, event: vibrator.VibratorEvent): number => {
        return sum + (event.duration ?? 0);
      }, 0);
      hilog.info(DOMAIN, TAG, 'First independent duration sum=%{public}d', total);
      expect(total).assertEqual(96);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0007
     * @tc.name testVibratorBuilderState0007
     * @tc.desc build结果修改不会改动构造器保存的原始时间、强度和曲线点。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0007', 0, (): void => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const options: vibrator.ContinuousParam = {
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          { time: 0, intensity: 0, frequency: -100 },
          { time: 10, intensity: 0.25, frequency: -50 },
          { time: 20, intensity: 0.75, frequency: 50 },
          { time: 30, intensity: 0, frequency: 100 }
        ]
      };
      builder.addContinuousEvent(25, 30, options);
      const changed: vibrator.VibratorPattern = builder.build();
      changed.events[0].time = 100;
      changed.events[0].intensity = 1;
      if (changed.events[0].points === undefined) {
        throw new Error('First build lost its curve');
      }
      changed.events[0].points[1].frequency = 99;
      const event: vibrator.VibratorEvent = builder.build().events[0];
      hilog.info(DOMAIN, TAG, 'Snapshot original time=%{public}d', event.time);
      expect(event.time).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Snapshot original intensity=%{public}s', String(event.intensity));
      expect(event.intensity).assertEqual(97);
      if (event.points === undefined) {
        throw new Error('Subsequent build lost its curve');
      }
      hilog.info(DOMAIN, TAG, 'Snapshot original point shift=%{public}s', String(event.points[1].frequency));
      expect(event.points[1].frequency).assertEqual(-50);
      hilog.info(DOMAIN, TAG, 'Snapshot original point count=%{public}d', event.points.length);
      expect(event.points.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_VIBRATOR_STATE_0008
     * @tc.name testVibratorBuilderState0008
     * @tc.desc 添加后再修改输入选项，不改变已存储的短事件及其默认固定时长。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilderState0008', 0, (): void => {
      const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
      const options: vibrator.TransientParam = { intensity: 80, frequency: 70, index: 2 };
      builder.addTransientEvent(25, options);
      options.intensity = 1;
      options.frequency = 2;
      options.index = 0;
      const event: vibrator.VibratorEvent = builder.build().events[0];
      hilog.info(DOMAIN, TAG, 'Stored input intensity=%{public}s', String(event.intensity));
      expect(event.intensity).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'Stored input frequency=%{public}s', String(event.frequency));
      expect(event.frequency).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'Stored input channel=%{public}s', String(event.index));
      expect(event.index).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'Stored fixed duration=%{public}s', String(event.duration));
      expect(event.duration).assertEqual(48);
    });
  });
}
