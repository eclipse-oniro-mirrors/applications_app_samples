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
const TAG: string = 'VibratorContinuousCurveTable01';

function runMatrix1083(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 97,
        frequency: 34,
        index: 0,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 128,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 97,
        frequency: 34,
        index: 0,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 128,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 192,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 80,
        frequency: 70,
        index: 0,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 128,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 80,
        frequency: 70,
        index: 0,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 128,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 192,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 128,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 128,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 192,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 80,
        frequency: 70,
        index: 1,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 128,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 80,
        frequency: 70,
        index: 1,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 128,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 192,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1084(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 97,
        frequency: 34,
        index: 2,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 128,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 97,
        frequency: 34,
        index: 2,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 128,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 192,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 80,
        frequency: 70,
        index: 2,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 128,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 192,
        intensity: 80,
        frequency: 70,
        index: 2,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 128,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 192,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 97,
        frequency: 34,
        index: 0,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 97,
        frequency: 34,
        index: 0,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 128,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 192,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 256,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 80,
        frequency: 70,
        index: 0,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 80,
        frequency: 70,
        index: 0,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 128,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 192,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 256,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1085(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 128,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 192,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 256,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 80,
        frequency: 70,
        index: 1,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 80,
        frequency: 70,
        index: 1,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 128,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 192,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 256,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 97,
        frequency: 34,
        index: 2,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 97,
        frequency: 34,
        index: 2,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 128,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 192,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 256,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 80,
        frequency: 70,
        index: 2,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 256,
        intensity: 80,
        frequency: 70,
        index: 2,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 128,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 192,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 256,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1086(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 97,
        frequency: 34,
        index: 0,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -60,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -20,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 20,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: 60,
            intensity: 0.75,
          },
          {
            time: 320,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 97,
        frequency: 34,
        index: 0,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 25,
            frequency: -60,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -20,
          },
          {
            time: 192,
            intensity: 75,
            frequency: 20,
          },
          {
            time: 256,
            intensity: 75,
            frequency: 60,
          },
          {
            time: 320,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 80,
        frequency: 70,
        index: 0,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -60,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -20,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 20,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: 60,
            intensity: 0.25,
          },
          {
            time: 320,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 80,
        frequency: 70,
        index: 0,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 75,
            frequency: -60,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -20,
          },
          {
            time: 192,
            intensity: 25,
            frequency: 20,
          },
          {
            time: 256,
            intensity: 25,
            frequency: 60,
          },
          {
            time: 320,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -60,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -20,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 20,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: 60,
            intensity: 0.75,
          },
          {
            time: 320,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 97,
        frequency: 34,
        index: 1,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 25,
            frequency: -60,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -20,
          },
          {
            time: 192,
            intensity: 75,
            frequency: 20,
          },
          {
            time: 256,
            intensity: 75,
            frequency: 60,
          },
          {
            time: 320,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 80,
        frequency: 70,
        index: 1,
        points: [
          {
            time: 0,
            frequency: -100,
            intensity: 0,
          },
          {
            time: 64,
            frequency: -60,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -20,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 20,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: 60,
            intensity: 0.25,
          },
          {
            time: 320,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
        intensity: 80,
        frequency: 70,
        index: 1,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
          },
          {
            time: 64,
            intensity: 75,
            frequency: -60,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -20,
          },
          {
            time: 192,
            intensity: 25,
            frequency: 20,
          },
          {
            time: 256,
            intensity: 25,
            frequency: 60,
          },
          {
            time: 320,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousCurveTable01(): void {
  describe('VibratorContinuousCurveTable01', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1083
     * @tc.name testVibratorMatrix1083
     * @tc.desc 四至十六点升降包络及相对频移组合，逐项核对4组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1083', 0, (): void => {
      const report: MatrixReport = runMatrix1083();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(768);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(531);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1084
     * @tc.name testVibratorMatrix1084
     * @tc.desc 四至十六点升降包络及相对频移组合，逐项核对4组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1084', 0, (): void => {
      const report: MatrixReport = runMatrix1084();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(896);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(708);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1085
     * @tc.name testVibratorMatrix1085
     * @tc.desc 四至十六点升降包络及相对频移组合，逐项核对4组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1085', 0, (): void => {
      const report: MatrixReport = runMatrix1085();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1024);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(885);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1086
     * @tc.name testVibratorMatrix1086
     * @tc.desc 四至十六点升降包络及相对频移组合，逐项核对4组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1086', 0, (): void => {
      const report: MatrixReport = runMatrix1086();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1280);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(531);
    });

  });
}
