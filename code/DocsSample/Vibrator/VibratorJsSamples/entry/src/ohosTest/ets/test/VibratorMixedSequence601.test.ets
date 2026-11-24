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
import { BuilderRow, MatrixReport, checkBuilderRows } from './BuilderMatrixSupport';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorMixedSequence601';

function runMatrix1108(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65000,
        duration: 1,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65000,
        duration: 1,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65051,
        duration: 1,
        intensity: 0,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65051,
        duration: 1,
        intensity: 0,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65102,
        duration: 1,
        intensity: 0,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65102,
        duration: 1,
        intensity: 0,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65153,
        duration: 1,
        intensity: 0,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65153,
        duration: 1,
        intensity: 0,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65204,
        duration: 1,
        intensity: 0,
        frequency: 50,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65204,
        duration: 1,
        intensity: 0,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65255,
        duration: 1,
        intensity: 0,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 65255,
        duration: 1,
        intensity: 0,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65306,
        duration: 48,
        intensity: 100,
        frequency: 20,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65306,
        duration: 48,
        intensity: 100,
        frequency: 20,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65357,
        duration: 48,
        intensity: 100,
        frequency: 10,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65357,
        duration: 48,
        intensity: 100,
        frequency: 10,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65408,
        duration: 48,
        intensity: 100,
        frequency: 2,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65408,
        duration: 48,
        intensity: 100,
        frequency: 2,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65459,
        duration: 48,
        intensity: 100,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65459,
        duration: 48,
        intensity: 100,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65510,
        duration: 48,
        intensity: 100,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65510,
        duration: 48,
        intensity: 100,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65561,
        duration: 48,
        intensity: 100,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 65561,
        duration: 48,
        intensity: 100,
        frequency: 97,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorMixedSequence601(): void {
  describe('VibratorMixedSequence601', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1108
     * @tc.name testVibratorMatrix1108
     * @tc.desc 混合序列静音及最大强度，逐项核对12组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1108', 0, (): void => {
      const report: MatrixReport = runMatrix1108();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(294);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(1600);
    });

  });
}
