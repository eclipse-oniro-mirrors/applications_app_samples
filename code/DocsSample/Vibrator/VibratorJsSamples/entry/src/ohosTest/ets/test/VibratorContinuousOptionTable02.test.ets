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
const TAG: string = 'VibratorContinuousOptionTable02';

function runMatrix1082(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousOptionTable02(): void {
  describe('VibratorContinuousOptionTable02', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1082
     * @tc.name testVibratorMatrix1082
     * @tc.desc 长事件可选参数省略与典型时长组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1082', 0, (): void => {
      const report: MatrixReport = runMatrix1082();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(99736);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(4728);
    });

  });
}
