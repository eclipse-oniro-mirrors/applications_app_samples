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
const TAG: string = 'VibratorContinuousCurveTable02';

function runMatrix1087(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 320,
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
        index: 2,
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
        duration: 384,
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
            frequency: -67,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 320,
            frequency: 66,
            intensity: 0.75,
          },
          {
            time: 384,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
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
            frequency: -67,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 192,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 256,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 320,
            intensity: 75,
            frequency: 66,
          },
          {
            time: 384,
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
        duration: 384,
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
            frequency: -67,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 320,
            frequency: 66,
            intensity: 0.25,
          },
          {
            time: 384,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
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
            frequency: -67,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 192,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 256,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 320,
            intensity: 25,
            frequency: 66,
          },
          {
            time: 384,
            intensity: 0,
            frequency: 100,
          },
        ],
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1088(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
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
            frequency: -67,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 320,
            frequency: 66,
            intensity: 0.75,
          },
          {
            time: 384,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
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
            frequency: -67,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 192,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 256,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 320,
            intensity: 75,
            frequency: 66,
          },
          {
            time: 384,
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
        duration: 384,
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
            frequency: -67,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 320,
            frequency: 66,
            intensity: 0.25,
          },
          {
            time: 384,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
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
            frequency: -67,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 192,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 256,
            intensity: 25,
            frequency: 33,
          },
          {
            time: 320,
            intensity: 25,
            frequency: 66,
          },
          {
            time: 384,
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
        duration: 384,
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
            frequency: -67,
            intensity: 0.25,
          },
          {
            time: 128,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 33,
            intensity: 0.75,
          },
          {
            time: 320,
            frequency: 66,
            intensity: 0.75,
          },
          {
            time: 384,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
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
            frequency: -67,
          },
          {
            time: 128,
            intensity: 50,
            frequency: -34,
          },
          {
            time: 192,
            intensity: 50,
            frequency: 0,
          },
          {
            time: 256,
            intensity: 75,
            frequency: 33,
          },
          {
            time: 320,
            intensity: 75,
            frequency: 66,
          },
          {
            time: 384,
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
        duration: 384,
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
            frequency: -67,
            intensity: 0.75,
          },
          {
            time: 128,
            frequency: -34,
            intensity: 0.5,
          },
          {
            time: 192,
            frequency: 0,
            intensity: 0.5,
          },
          {
            time: 256,
            frequency: 33,
            intensity: 0.25,
          },
          {
            time: 320,
            frequency: 66,
            intensity: 0.25,
          },
          {
            time: 384,
            frequency: 100,
            intensity: 0,
          },
        ],
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 42,
        duration: 384,
        intensity: 80,
        frequency: 70,
        index: 2,
        points: [
          {
            time: 0,
            intensity: 0,
            frequency: -100,
