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
const TAG: string = 'VibratorContinuousCurveTable05';

function runMatrix1099(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 832,
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
            frequency: -85,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -70,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -54,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: -39,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -24,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: -8,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 7,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 23,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 38,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 53,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 69,
            intensity: 0.75,
          },
          {
            time: 768,
            frequency: 84,
            intensity: 0.75,
          },
          {
            time: 832,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 832,
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
            frequency: -85,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -70,
          },
          {
            time: 192,
            intensity: 25,
            frequency: -54,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -39,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -24,
          },
          {
            time: 384,
            intensity: 50,
            frequency: -8,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 7,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 23,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 38,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 53,
          },
          {
            time: 704,
            intensity: 75,
            frequency: 69,
          },
          {
            time: 768,
            intensity: 75,
            frequency: 84,
          },
          {
            time: 832,
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
        duration: 832,
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
            frequency: -85,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -70,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -54,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: -39,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -24,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: -8,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 7,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 23,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 38,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 53,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 69,
            intensity: 0.25,
          },
          {
            time: 768,
            frequency: 84,
            intensity: 0.25,
          },
          {
            time: 832,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 832,
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
            frequency: -85,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -70,
          },
          {
            time: 192,
            intensity: 75,
            frequency: -54,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -39,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -24,
          },
          {
            time: 384,
            intensity: 50,
            frequency: -8,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 7,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 23,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 38,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 53,
          },
          {
            time: 704,
            intensity: 25,
            frequency: 69,
          },
          {
            time: 768,
            intensity: 25,
            frequency: 84,
          },
          {
            time: 832,
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
        duration: 896,
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
            frequency: -86,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -72,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -58,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: -43,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -29,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: -15,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 512,
            frequency: 14,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 28,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 42,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 57,
            intensity: 0.75,
          },
          {
            time: 768,
            frequency: 71,
            intensity: 0.75,
          },
          {
            time: 832,
            frequency: 85,
            intensity: 0.75,
          },
          {
            time: 896,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 896,
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
            frequency: -86,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -72,
          },
          {
            time: 192,
            intensity: 25,
            frequency: -58,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -43,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -29,
          },
          {
            time: 384,
            intensity: 50,
            frequency: -15,
          },
          {
            time: 448,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 14,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 28,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 42,
          },
          {
            time: 704,
            intensity: 75,
            frequency: 57,
          },
          {
            time: 768,
            intensity: 75,
            frequency: 71,
          },
          {
            time: 832,
            intensity: 75,
            frequency: 85,
          },
          {
            time: 896,
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
        duration: 896,
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
            frequency: -86,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -72,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -58,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: -43,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -29,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: -15,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 512,
            frequency: 14,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 28,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 42,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 57,
            intensity: 0.25,
          },
          {
            time: 768,
            frequency: 71,
            intensity: 0.25,
          },
          {
            time: 832,
            frequency: 85,
            intensity: 0.25,
          },
          {
            time: 896,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 896,
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
            frequency: -86,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -72,
          },
          {
            time: 192,
            intensity: 75,
            frequency: -58,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -43,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -29,
          },
          {
            time: 384,
            intensity: 50,
            frequency: -15,
          },
          {
            time: 448,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 14,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 28,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 42,
          },
          {
            time: 704,
            intensity: 25,
            frequency: 57,
          },
          {
            time: 768,
            intensity: 25,
            frequency: 71,
          },
          {
            time: 832,
            intensity: 25,
            frequency: 85,
          },
          {
            time: 896,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1100(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 896,
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
            frequency: -86,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -72,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -58,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: -43,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -29,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: -15,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 512,
            frequency: 14,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 28,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 42,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 57,
            intensity: 0.75,
          },
          {
            time: 768,
            frequency: 71,
            intensity: 0.75,
          },
          {
            time: 832,
            frequency: 85,
            intensity: 0.75,
          },
          {
            time: 896,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 896,
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
            frequency: -86,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -72,
          },
          {
            time: 192,
            intensity: 25,
            frequency: -58,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -43,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -29,
          },
          {
            time: 384,
            intensity: 50,
            frequency: -15,
          },
          {
            time: 448,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 14,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 28,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 42,
          },
          {
            time: 704,
            intensity: 75,
            frequency: 57,
          },
          {
            time: 768,
            intensity: 75,
            frequency: 71,
          },
          {
            time: 832,
            intensity: 75,
            frequency: 85,
          },
          {
            time: 896,
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
        duration: 896,
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
            frequency: -86,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -72,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -58,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: -43,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -29,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: -15,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 512,
            frequency: 14,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 28,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 42,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 57,
            intensity: 0.25,
          },
          {
            time: 768,
            frequency: 71,
            intensity: 0.25,
          },
          {
            time: 832,
            frequency: 85,
            intensity: 0.25,
          },
          {
            time: 896,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 896,
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
            frequency: -86,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -72,
          },
          {
            time: 192,
            intensity: 75,
            frequency: -58,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -43,
