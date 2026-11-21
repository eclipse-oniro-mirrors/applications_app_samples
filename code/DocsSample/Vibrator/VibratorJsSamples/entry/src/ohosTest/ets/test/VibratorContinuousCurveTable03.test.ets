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
const TAG: string = 'VibratorContinuousCurveTable03';

function runMatrix1091(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 512,
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
            frequency: -75,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -25,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: 25,
            intensity: 0.75,
          },
          {
            time: 384,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 448,
            frequency: 75,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 512,
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
            frequency: -75,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -25,
          },
          {
            time: 256,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 320,
            intensity: 75,
            frequency: 25,
          },
          {
            time: 384,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 75,
          },
          {
            time: 512,
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
        duration: 512,
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
            frequency: -75,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -25,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: 25,
            intensity: 0.25,
          },
          {
            time: 384,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 448,
            frequency: 75,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 512,
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
            frequency: -75,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -25,
          },
          {
            time: 256,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 320,
            intensity: 25,
            frequency: 25,
          },
          {
            time: 384,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 75,
          },
          {
            time: 512,
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
        duration: 512,
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
            frequency: -75,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -25,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: 25,
            intensity: 0.75,
          },
          {
            time: 384,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 448,
            frequency: 75,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 512,
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
            frequency: -75,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -25,
          },
          {
            time: 256,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 320,
            intensity: 75,
            frequency: 25,
          },
          {
            time: 384,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 75,
          },
          {
            time: 512,
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
        duration: 512,
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
            frequency: -75,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -25,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: 25,
            intensity: 0.25,
          },
          {
            time: 384,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 448,
            frequency: 75,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 512,
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
            frequency: -75,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -25,
          },
          {
            time: 256,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 320,
            intensity: 25,
            frequency: 25,
          },
          {
            time: 384,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 75,
          },
          {
            time: 512,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1092(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 576,
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
            frequency: -78,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -56,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -12,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: 11,
            intensity: 0.75,
          },
          {
            time: 384,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 448,
            frequency: 55,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 77,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 576,
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
            frequency: -78,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -56,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -12,
          },
          {
            time: 320,
            intensity: 75,
            frequency: 11,
          },
          {
            time: 384,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 55,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 77,
          },
          {
            time: 576,
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
        duration: 576,
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
            frequency: -78,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -56,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -12,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: 11,
            intensity: 0.25,
          },
          {
            time: 384,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 448,
            frequency: 55,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 77,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 576,
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
            frequency: -78,
          },
          {
            time: 128,
