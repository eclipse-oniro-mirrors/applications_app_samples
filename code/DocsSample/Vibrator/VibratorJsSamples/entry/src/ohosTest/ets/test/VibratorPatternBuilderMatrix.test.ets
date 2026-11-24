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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorBuilderMatrix';

// The SDK does not guarantee event ordering.
function eventAt(pattern: vibrator.VibratorPattern, time: number): vibrator.VibratorEvent {
  for (const event of pattern.events) {
    if (event.time === time) {
      return event;
    }
  }
  throw new Error(`Missing SDK event at ${time}`);
}

function curvePoints(event: vibrator.VibratorEvent): vibrator.VibratorCurvePoint[] {
  if (event.points === undefined) {
    throw new Error('SDK continuous event has no curve points');
  }
  return event.points;
}

export default function vibratorPatternBuilderMatrix(): void {
  describe('VibratorPatternBuilderMatrix', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0001
     * @tc.name testVibratorBuilder0001
     * @tc.desc SDK短事件省略选项与空选项均填充声明的默认值。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testVibratorBuilder0001', 0, (): void => {
      const omitted: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder().addTransientEvent(0).build();
      const empty: vibrator.TransientParam = {};
      const explicit: vibrator.VibratorPattern =
        new vibrator.VibratorPatternBuilder().addTransientEvent(25, empty).build();
      const patterns: vibrator.VibratorPattern[] = [omitted, explicit];
      for (const pattern of patterns) {
        hilog.info(DOMAIN, TAG, 'Default transient count=%{public}d', pattern.events.length);
        expect(pattern.events.length).assertEqual(1);
        const event: vibrator.VibratorEvent = pattern.events[0];
        hilog.info(DOMAIN, TAG, 'Default transient type=%{public}d', event.eventType);
        expect(event.eventType).assertEqual(vibrator.VibratorEventType.TRANSIENT);
        hilog.info(DOMAIN, TAG, 'Default transient duration=%{public}s', String(event.duration));
        expect(event.duration).assertEqual(48);
        hilog.info(DOMAIN, TAG, 'Default transient intensity=%{public}s', String(event.intensity));
        expect(event.intensity).assertEqual(100);
        hilog.info(DOMAIN, TAG, 'Default transient frequency=%{public}s', String(event.frequency));
        expect(event.frequency).assertEqual(50);
        hilog.info(DOMAIN, TAG, 'Default transient index=%{public}s', String(event.index));
        expect(event.index).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0002
     * @tc.name testVibratorBuilder0002
     * @tc.desc SDK长事件省略或留空选项保留必填时长并填充默认强度频率通道。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testVibratorBuilder0002', 0, (): void => {
      const omitted: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder().addContinuousEvent(0, 15).build();
      const empty: vibrator.ContinuousParam = {};
      const explicit: vibrator.VibratorPattern =
        new vibrator.VibratorPatternBuilder().addContinuousEvent(25, 15, empty).build();
      for (const pattern of [omitted, explicit]) {
        hilog.info(DOMAIN, TAG, 'Default continuous count=%{public}d', pattern.events.length);
        expect(pattern.events.length).assertEqual(1);
        const event: vibrator.VibratorEvent = pattern.events[0];
        hilog.info(DOMAIN, TAG, 'Default continuous type=%{public}d', event.eventType);
        expect(event.eventType).assertEqual(vibrator.VibratorEventType.CONTINUOUS);
        hilog.info(DOMAIN, TAG, 'Continuous duration=%{public}s', String(event.duration));
        expect(event.duration).assertEqual(15);
        hilog.info(DOMAIN, TAG, 'Default continuous intensity=%{public}s', String(event.intensity));
        expect(event.intensity).assertEqual(100);
        hilog.info(DOMAIN, TAG, 'Default continuous frequency=%{public}s', String(event.frequency));
        expect(event.frequency).assertEqual(50);
        hilog.info(DOMAIN, TAG, 'Default continuous index=%{public}s', String(event.index));
        expect(event.index).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0003
     * @tc.name testVibratorBuilder0003
     * @tc.desc SDK短事件接受时间强度频率通道的显式边界而非回退默认值。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0003', 0, (): void => {
      const times: number[] = [0, 1, 1800000];
      const options: vibrator.TransientParam[] = [
        { intensity: 0, frequency: 0, index: 0 },
        { intensity: 80, frequency: 70, index: 1 },
        { intensity: 100, frequency: 100, index: 2 }
      ];
      for (let i: number = 0; i < times.length; i++) {
        const pattern: vibrator.VibratorPattern =
          new vibrator.VibratorPatternBuilder().addTransientEvent(times[i], options[i]).build();
        hilog.info(DOMAIN, TAG, 'Transient boundary time=%{public}d count=%{public}d', times[i], pattern.events.length);
        expect(pattern.events.length).assertEqual(1);
        const event: vibrator.VibratorEvent = pattern.events[0];
        hilog.info(DOMAIN, TAG, 'Transient output time=%{public}d', event.time);
        expect(event.time).assertEqual(times[i]);
        hilog.info(DOMAIN, TAG, 'Transient output intensity=%{public}s', String(event.intensity));
        expect(event.intensity).assertEqual(options[i].intensity);
        hilog.info(DOMAIN, TAG, 'Transient output frequency=%{public}s', String(event.frequency));
        expect(event.frequency).assertEqual(options[i].frequency);
        hilog.info(DOMAIN, TAG, 'Transient output index=%{public}s', String(event.index));
        expect(event.index).assertEqual(i);
        hilog.info(DOMAIN, TAG, 'Transient fixed duration=%{public}s', String(event.duration));
        expect(event.duration).assertEqual(48);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0004
     * @tc.name testVibratorBuilder0004
     * @tc.desc SDK长事件接受最小时长和5000毫秒上界及显式选项边界。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0004', 0, (): void => {
      const times: number[] = [0, 1800000];
      const durations: number[] = [1, 5000];
      const options: vibrator.ContinuousParam[] = [
        { intensity: 0, frequency: 0, index: 0 },
        { intensity: 100, frequency: 100, index: 2 }
      ];
      for (let i: number = 0; i < times.length; i++) {
        const pattern: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder()
          .addContinuousEvent(times[i], durations[i], options[i]).build();
        hilog.info(DOMAIN, TAG, 'Continuous boundary count=%{public}d', pattern.events.length);
        expect(pattern.events.length).assertEqual(1);
        const event: vibrator.VibratorEvent = pattern.events[0];
        hilog.info(DOMAIN, TAG, 'Continuous boundary type=%{public}d', event.eventType);
        expect(event.eventType).assertEqual(vibrator.VibratorEventType.CONTINUOUS);
        hilog.info(DOMAIN, TAG, 'Continuous boundary time=%{public}d', event.time);
        expect(event.time).assertEqual(times[i]);
        hilog.info(DOMAIN, TAG, 'Continuous boundary duration=%{public}s', String(event.duration));
        expect(event.duration).assertEqual(durations[i]);
        hilog.info(DOMAIN, TAG, 'Continuous boundary intensity=%{public}s', String(event.intensity));
        expect(event.intensity).assertEqual(options[i].intensity);
        hilog.info(DOMAIN, TAG, 'Continuous boundary frequency=%{public}s', String(event.frequency));
        expect(event.frequency).assertEqual(options[i].frequency);
        hilog.info(DOMAIN, TAG, 'Continuous boundary index=%{public}s', String(event.index));
        expect(event.index).assertEqual(options[i].index);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0005
     * @tc.name testVibratorBuilder0005
     * @tc.desc SDK同类短事件链式添加不丢事件，按时间查找不假定排序。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0005', 0, (): void => {
      const options: vibrator.TransientParam = { intensity: 80, frequency: 70, index: 1 };
      const pattern: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder()
        .addTransientEvent(50).addTransientEvent(0, options).addTransientEvent(25).build();
      hilog.info(DOMAIN, TAG, 'Transient chain count=%{public}d', pattern.events.length);
      expect(pattern.events.length).assertEqual(3);
      const first: vibrator.VibratorEvent = eventAt(pattern, 0);
      hilog.info(DOMAIN, TAG, 'Transient chain customized intensity=%{public}s', String(first.intensity));
      expect(first.intensity).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'Transient chain middle duration=%{public}s', String(eventAt(pattern, 25).duration));
      expect(eventAt(pattern, 25).duration).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'Transient chain late default frequency=%{public}s',
        String(eventAt(pattern, 50).frequency));
      expect(eventAt(pattern, 50).frequency).assertEqual(50);
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0006
     * @tc.name testVibratorBuilder0006
     * @tc.desc SDK混合链保留长短事件类型、各自时长和局部选项。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0006', 0, (): void => {
      const options: vibrator.ContinuousParam = { intensity: 97, frequency: 34, index: 2 };
      const pattern: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder()
        .addContinuousEvent(100, 150, options).addTransientEvent(0).addContinuousEvent(50, 15).build();
      hilog.info(DOMAIN, TAG, 'Mixed chain count=%{public}d', pattern.events.length);
      expect(pattern.events.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'Mixed transient type=%{public}d', eventAt(pattern, 0).eventType);
      expect(eventAt(pattern, 0).eventType).assertEqual(vibrator.VibratorEventType.TRANSIENT);
      hilog.info(DOMAIN, TAG, 'Mixed short continuous duration=%{public}s', String(eventAt(pattern, 50).duration));
      expect(eventAt(pattern, 50).duration).assertEqual(15);
      const last: vibrator.VibratorEvent = eventAt(pattern, 100);
      hilog.info(DOMAIN, TAG, 'Mixed long type=%{public}d', last.eventType);
      expect(last.eventType).assertEqual(vibrator.VibratorEventType.CONTINUOUS);
      hilog.info(DOMAIN, TAG, 'Mixed long duration=%{public}s', String(last.duration));
      expect(last.duration).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'Mixed long index=%{public}s', String(last.index));
      expect(last.index).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'Mixed long frequency=%{public}s', String(last.frequency));
      expect(last.frequency).assertEqual(34);
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0007
     * @tc.name testVibratorBuilder0007
     * @tc.desc SDK构造四点和十六点曲线保留相对频率及零强度端点；不播放。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0007', 0, (): void => {
      // 4..16 is documented by Index.ets:373, not a count guarantee in the SDK declaration.
      const counts: number[] = [4, 16];
      for (const count of counts) {
        const points: vibrator.VibratorCurvePoint[] = [];
        for (let i: number = 0; i < count; i++) {
          points.push({ time: i * 100, intensity: i === 0 || i === count - 1 ? 0 : 1,
            frequency: Math.floor(200 * i / (count - 1)) - 100 });
        }
        const duration: number = (count - 1) * 100;
        const options: vibrator.ContinuousParam = { points: points, intensity: 97, frequency: 34, index: 0 };
        const pattern: vibrator.VibratorPattern =
          new vibrator.VibratorPatternBuilder().addContinuousEvent(0, duration, options).build();
        hilog.info(DOMAIN, TAG, 'Curve event count=%{public}d', pattern.events.length);
        expect(pattern.events.length).assertEqual(1);
        const output: vibrator.VibratorCurvePoint[] = curvePoints(pattern.events[0]);
        hilog.info(DOMAIN, TAG, 'Curve points input=%{public}d output=%{public}d', count, output.length);
        expect(output.length).assertEqual(count);
        hilog.info(DOMAIN, TAG, 'Curve first frequency=%{public}s', String(output[0].frequency));
        expect(output[0].frequency).assertEqual(-100);
        hilog.info(DOMAIN, TAG, 'Curve last frequency=%{public}s', String(output[count - 1].frequency));
        expect(output[count - 1].frequency).assertEqual(100);
        hilog.info(DOMAIN, TAG, 'Curve last time=%{public}d', output[count - 1].time);
        expect(output[count - 1].time).assertEqual(duration);
        hilog.info(DOMAIN, TAG, 'Curve endpoint intensity=%{public}s', String(output[count - 1].intensity));
        expect(output[count - 1].intensity).assertEqual(0);
        hilog.info(DOMAIN, TAG, 'Curve middle intensity=%{public}s', String(output[1].intensity));
        expect(output[1].intensity).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0008
     * @tc.name testVibratorBuilder0008
     * @tc.desc SDK曲线中间点省略可选字段后默认增益1和频移0，端点显式0不被覆盖。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0008', 0, (): void => {
      const points: vibrator.VibratorCurvePoint[] = [
        { time: 0, intensity: 0, frequency: 0 }, { time: 100 }, { time: 200 },
        { time: 300, intensity: 0, frequency: 0 }
      ];
      const options: vibrator.ContinuousParam = { points: points };
      const pattern: vibrator.VibratorPattern =
        new vibrator.VibratorPatternBuilder().addContinuousEvent(25, 300, options).build();
      const output: vibrator.VibratorCurvePoint[] = curvePoints(pattern.events[0]);
      hilog.info(DOMAIN, TAG, 'Default curve length=%{public}d', output.length);
      expect(output.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'Default curve intensity=%{public}s', String(output[1].intensity));
      expect(output[1].intensity).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'Default curve frequency=%{public}s', String(output[2].frequency));
      expect(output[2].frequency).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'Explicit zero curve intensity=%{public}s', String(output[0].intensity));
      expect(output[0].intensity).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'Curve relative time=%{public}d', output[2].time);
      expect(output[2].time).assertEqual(200);
    });

    /**
     * @tc.number SUB_VIBRATOR_BUILDER_0009
     * @tc.name testVibratorBuilder0009
     * @tc.desc SDK同类长事件链式构造分别保留时长及不同通道，不假定输出数组排序。
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorBuilder0009', 0, (): void => {
      const firstOptions: vibrator.ContinuousParam = { index: 1, intensity: 40, frequency: 20 };
      const secondOptions: vibrator.ContinuousParam = { index: 2, intensity: 60, frequency: 80 };
      const pattern: vibrator.VibratorPattern = new vibrator.VibratorPatternBuilder()
        .addContinuousEvent(25, 15, firstOptions).addContinuousEvent(0, 1, secondOptions).build();
      hilog.info(DOMAIN, TAG, 'Continuous chain count=%{public}d', pattern.events.length);
      expect(pattern.events.length).assertEqual(2);
      const early: vibrator.VibratorEvent = eventAt(pattern, 0);
      const late: vibrator.VibratorEvent = eventAt(pattern, 25);
      hilog.info(DOMAIN, TAG, 'Continuous chain early duration=%{public}s', String(early.duration));
      expect(early.duration).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Continuous chain late duration=%{public}s', String(late.duration));
      expect(late.duration).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'Continuous chain early channel=%{public}s', String(early.index));
      expect(early.index).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'Continuous chain late channel=%{public}s', String(late.index));
      expect(late.index).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'Continuous chain intensity sum=%{public}d',
        (early.intensity ?? 0) + (late.intensity ?? 0));
      expect((early.intensity ?? 0) + (late.intensity ?? 0)).assertEqual(100);
    });
  });
}
