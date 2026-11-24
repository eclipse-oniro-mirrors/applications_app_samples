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
import { expect } from '@ohos/hypium';

export interface BuilderInput {
  eventType: vibrator.VibratorEventType;
  time: number;
  duration: number;
  intensity?: number;
  frequency?: number;
  index?: number;
  points?: vibrator.VibratorCurvePoint[];
}

export interface BuilderRow {
  input: BuilderInput;
  expected: vibrator.VibratorEvent;
}

export interface MatrixReport {
  eventCount: number;
  durationSum: number;
  channelIntensitySum: number;
}

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorMatrix';

function orderedEvent(left: vibrator.VibratorEvent, right: vibrator.VibratorEvent): number {
  return left.time - right.time || left.eventType - right.eventType ||
    (left.duration ?? 0) - (right.duration ?? 0) || (left.index ?? 0) - (right.index ?? 0) ||
    (left.intensity ?? 0) - (right.intensity ?? 0) || (left.frequency ?? 0) - (right.frequency ?? 0);
}

export function checkBuilderRows(rows: BuilderRow[]): MatrixReport {
  const builder: vibrator.VibratorPatternBuilder = new vibrator.VibratorPatternBuilder();
  const expected: vibrator.VibratorEvent[] = [];
  for (const row of rows) {
    const input: BuilderInput = row.input;
    if (input.eventType === vibrator.VibratorEventType.CONTINUOUS) {
      const options: vibrator.ContinuousParam = {};
      if (input.intensity !== undefined) {
        options.intensity = input.intensity;
      }
      if (input.frequency !== undefined) {
        options.frequency = input.frequency;
      }
      if (input.index !== undefined) {
        options.index = input.index;
      }
      if (input.points !== undefined) {
        options.points = input.points;
      }
      builder.addContinuousEvent(input.time, input.duration, options);
    } else {
      const options: vibrator.TransientParam = {};
      if (input.intensity !== undefined) {
        options.intensity = input.intensity;
      }
      if (input.frequency !== undefined) {
        options.frequency = input.frequency;
      }
      if (input.index !== undefined) {
        options.index = input.index;
      }
      builder.addTransientEvent(input.time, options);
    }
    expected.push(row.expected);
  }
  const pattern: vibrator.VibratorPattern = builder.build();
  hilog.info(DOMAIN, TAG, 'Pattern absolute time=%{public}d', pattern.time);
  expect(pattern.time).assertEqual(0);
  hilog.info(DOMAIN, TAG, 'Events actual=%{public}d expected=%{public}d', pattern.events.length, rows.length);
  expect(pattern.events.length).assertEqual(rows.length);
  const events: vibrator.VibratorEvent[] = pattern.events.slice().sort(orderedEvent);
  expected.sort(orderedEvent);
  let durationSum: number = 0;
  let channelIntensitySum: number = 0;
  for (let i: number = 0; i < events.length; i++) {
    const actual: vibrator.VibratorEvent = events[i];
    const oracle: vibrator.VibratorEvent = expected[i];
    hilog.info(DOMAIN, TAG, 'Event %{public}d type=%{public}d', i, actual.eventType);
    expect(actual.eventType).assertEqual(oracle.eventType);
    hilog.info(DOMAIN, TAG, 'Event %{public}d time=%{public}d', i, actual.time);
    expect(actual.time).assertEqual(oracle.time);
    hilog.info(DOMAIN, TAG, 'Event %{public}d duration=%{public}s', i, String(actual.duration));
    expect(actual.duration).assertEqual(oracle.duration);
    hilog.info(DOMAIN, TAG, 'Event %{public}d intensity=%{public}s', i, String(actual.intensity));
    expect(actual.intensity).assertEqual(oracle.intensity);
    hilog.info(DOMAIN, TAG, 'Event %{public}d frequency=%{public}s', i, String(actual.frequency));
    expect(actual.frequency).assertEqual(oracle.frequency);
    hilog.info(DOMAIN, TAG, 'Event %{public}d channel=%{public}s', i, String(actual.index));
    expect(actual.index).assertEqual(oracle.index);
    if (oracle.points !== undefined) {
      if (actual.points === undefined) {
        throw new Error('Continuous event lost its curve');
      }
      hilog.info(DOMAIN, TAG, 'Event %{public}d points=%{public}d', i, actual.points.length);
      expect(actual.points.length).assertEqual(oracle.points.length);
      for (let j: number = 0; j < oracle.points.length; j++) {
        const point: vibrator.VibratorCurvePoint = actual.points[j];
        const pointOracle: vibrator.VibratorCurvePoint = oracle.points[j];
        hilog.info(DOMAIN, TAG, 'Point %{public}d time=%{public}d', j, point.time);
        expect(point.time).assertEqual(pointOracle.time);
        hilog.info(DOMAIN, TAG, 'Point %{public}d gain=%{public}s', j, String(point.intensity));
        expect(point.intensity).assertEqual(pointOracle.intensity);
        hilog.info(DOMAIN, TAG, 'Point %{public}d frequency=%{public}s', j, String(point.frequency));
        expect(point.frequency).assertEqual(pointOracle.frequency);
      }
    }
    durationSum += actual.duration ?? 0;
    channelIntensitySum += ((actual.index ?? -1) + 1) * (actual.intensity ?? -1);
  }
  const report: MatrixReport = {
    eventCount: events.length,
    durationSum: durationSum,
    channelIntensitySum: channelIntensitySum
  };
  return report;
}
