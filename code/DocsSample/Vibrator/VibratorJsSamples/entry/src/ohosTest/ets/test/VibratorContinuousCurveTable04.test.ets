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
const TAG: string = 'VibratorContinuousCurveTable04';

function runMatrix1095(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -64,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -46,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -28,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -10,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 9,
            intensity: 0.75,
          },
          {
            time: 448,
            frequency: 27,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 45,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 63,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 81,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -64,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -46,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -28,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -10,
          },
          {
            time: 384,
            intensity: 75,
            frequency: 9,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 27,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 45,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 63,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 81,
          },
          {
            time: 704,
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
        duration: 704,
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
            frequency: -82,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -64,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -46,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -28,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -10,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 9,
            intensity: 0.25,
          },
          {
            time: 448,
            frequency: 27,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 45,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 63,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 81,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -64,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -46,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -28,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -10,
          },
          {
            time: 384,
            intensity: 25,
            frequency: 9,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 27,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 45,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 63,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 81,
          },
          {
            time: 704,
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
        duration: 704,
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
            frequency: -82,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -64,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -46,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -28,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -10,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 9,
            intensity: 0.75,
          },
          {
            time: 448,
            frequency: 27,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 45,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 63,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 81,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -64,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -46,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -28,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -10,
          },
          {
            time: 384,
            intensity: 75,
            frequency: 9,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 27,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 45,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 63,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 81,
          },
          {
            time: 704,
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
        duration: 704,
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
            frequency: -82,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -64,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -46,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -28,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -10,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 9,
            intensity: 0.25,
          },
          {
            time: 448,
            frequency: 27,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 45,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 63,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 81,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -64,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -46,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -28,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -10,
          },
          {
            time: 384,
            intensity: 25,
            frequency: 9,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 27,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 45,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 63,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 81,
          },
          {
            time: 704,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1096(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -64,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -46,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -28,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -10,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 9,
            intensity: 0.75,
          },
          {
            time: 448,
            frequency: 27,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 45,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 63,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 81,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -64,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -46,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -28,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -10,
          },
          {
            time: 384,
            intensity: 75,
            frequency: 9,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 27,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 45,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 63,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 81,
          },
          {
            time: 704,
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
        duration: 704,
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
            frequency: -82,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -64,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -46,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: -28,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -10,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 9,
            intensity: 0.25,
          },
          {
            time: 448,
            frequency: 27,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 45,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 63,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 81,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 704,
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
            frequency: -82,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -64,
          },
          {
            time: 192,
            intensity: 50,
            frequency: -46,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -28,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -10,
          },
          {
            time: 384,
            intensity: 25,
            frequency: 9,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 27,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 45,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 63,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 81,
          },
          {
            time: 704,
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
        duration: 768,
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
            frequency: -84,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -67,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -17,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 16,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 66,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 83,
            intensity: 0.75,
          },
          {
            time: 768,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -67,
          },
          {
            time: 192,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -17,
          },
          {
            time: 384,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 16,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 66,
          },
          {
            time: 704,
            intensity: 75,
            frequency: 83,
          },
          {
            time: 768,
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
        duration: 768,
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
            frequency: -84,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -67,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -17,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 16,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 66,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 83,
            intensity: 0.25,
          },
          {
            time: 768,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -67,
          },
          {
            time: 192,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -17,
          },
          {
            time: 384,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 16,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 66,
          },
          {
            time: 704,
            intensity: 25,
            frequency: 83,
          },
          {
            time: 768,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1097(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -67,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -17,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 16,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 66,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 83,
            intensity: 0.75,
          },
          {
            time: 768,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -67,
          },
          {
            time: 192,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -17,
          },
          {
            time: 384,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 16,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 66,
          },
          {
            time: 704,
            intensity: 75,
            frequency: 83,
          },
          {
            time: 768,
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
        duration: 768,
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
            frequency: -84,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -67,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -17,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 16,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 66,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 83,
            intensity: 0.25,
          },
          {
            time: 768,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -67,
          },
          {
            time: 192,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -17,
          },
          {
            time: 384,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 16,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 66,
          },
          {
            time: 704,
            intensity: 25,
            frequency: 83,
          },
          {
            time: 768,
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
        duration: 768,
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
            frequency: -84,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -67,
            intensity: 0.25,
          },
          {
            time: 192,
            frequency: -50,
            intensity: 0.25,
          },
          {
            time: 256,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -17,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 16,
            intensity: 0.75,
          },
          {
            time: 512,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 576,
            frequency: 50,
            intensity: 0.75,
          },
          {
            time: 640,
            frequency: 66,
            intensity: 0.75,
          },
          {
            time: 704,
            frequency: 83,
            intensity: 0.75,
          },
          {
            time: 768,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
          },
          {
            time: 128,
            intensity: 25,
            frequency: -67,
          },
          {
            time: 192,
            intensity: 25,
            frequency: -50,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -17,
          },
          {
            time: 384,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 448,
            intensity: 75,
            frequency: 16,
          },
          {
            time: 512,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 576,
            intensity: 75,
            frequency: 50,
          },
          {
            time: 640,
            intensity: 75,
            frequency: 66,
          },
          {
            time: 704,
            intensity: 75,
            frequency: 83,
          },
          {
            time: 768,
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
        duration: 768,
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
            frequency: -84,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -67,
            intensity: 0.75,
          },
          {
            time: 192,
            frequency: -50,
            intensity: 0.75,
          },
          {
            time: 256,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 320,
            frequency: -17,
            intensity: 0.5,
          },
          {
            time: 384,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 448,
            frequency: 16,
            intensity: 0.25,
          },
          {
            time: 512,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 576,
            frequency: 50,
            intensity: 0.25,
          },
          {
            time: 640,
            frequency: 66,
            intensity: 0.25,
          },
          {
            time: 704,
            frequency: 83,
            intensity: 0.25,
          },
          {
            time: 768,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 768,
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
            frequency: -84,
          },
          {
            time: 128,
            intensity: 75,
            frequency: -67,
          },
          {
            time: 192,
            intensity: 75,
            frequency: -50,
          },
          {
            time: 256,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 320,
            intensity: 50,
            frequency: -17,
          },
          {
            time: 384,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 448,
            intensity: 25,
            frequency: 16,
          },
          {
            time: 512,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 576,
            intensity: 25,
            frequency: 50,
          },
          {
            time: 640,
            intensity: 25,
            frequency: 66,
          },
          {
            time: 704,
            intensity: 25,
            frequency: 83,
          },
          {
            time: 768,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1098(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 832,
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
