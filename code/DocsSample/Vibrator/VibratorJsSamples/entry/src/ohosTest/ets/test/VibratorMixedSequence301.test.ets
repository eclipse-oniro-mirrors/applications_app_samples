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
const TAG: string = 'VibratorMixedSequence301';

function runMatrix1105(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62000,
        duration: 1,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62000,
        duration: 1,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62051,
        duration: 1,
        intensity: 20,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62051,
        duration: 1,
        intensity: 20,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62102,
        duration: 1,
        intensity: 40,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62102,
        duration: 1,
        intensity: 40,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62153,
        duration: 1,
        intensity: 60,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62153,
        duration: 1,
        intensity: 60,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62204,
        duration: 1,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62204,
        duration: 1,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62255,
        duration: 1,
        intensity: 100,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 62255,
        duration: 1,
        intensity: 100,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62306,
        duration: 48,
        intensity: 99,
        frequency: 20,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62306,
        duration: 48,
        intensity: 99,
        frequency: 20,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62357,
        duration: 48,
        intensity: 97,
        frequency: 10,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62357,
        duration: 48,
        intensity: 97,
        frequency: 10,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62408,
        duration: 48,
        intensity: 70,
        frequency: 2,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62408,
        duration: 48,
        intensity: 70,
        frequency: 2,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62459,
        duration: 48,
        intensity: 50,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62459,
        duration: 48,
        intensity: 50,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62510,
        duration: 48,
        intensity: 34,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62510,
        duration: 48,
        intensity: 34,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62561,
        duration: 48,
        intensity: 1,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 62561,
        duration: 48,
        intensity: 1,
        frequency: 97,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorMixedSequence301(): void {
  describe('VibratorMixedSequence301', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1105
     * @tc.name testVibratorMatrix1105
     * @tc.desc 混合序列多通道错峰，逐项核对12组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1105', 0, (): void => {
      const report: MatrixReport = runMatrix1105();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(294);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(1337);
    });

  });
}
