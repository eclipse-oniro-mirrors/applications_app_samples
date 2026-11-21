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
const TAG: string = 'VibratorContinuousOptionTable01';

function runMatrix1078(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1079(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1080(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1081(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        frequency: 34,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 26,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousOptionTable01(): void {
  describe('VibratorContinuousOptionTable01', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1078
     * @tc.name testVibratorMatrix1078
     * @tc.desc 长事件可选参数省略与典型时长组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1078', 0, (): void => {
      const report: MatrixReport = runMatrix1078();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(4728);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1079
     * @tc.name testVibratorMatrix1079
     * @tc.desc 长事件可选参数省略与典型时长组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1079', 0, (): void => {
      const report: MatrixReport = runMatrix1079();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(328);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(4728);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1080
     * @tc.name testVibratorMatrix1080
     * @tc.desc 长事件可选参数省略与典型时长组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1080', 0, (): void => {
      const report: MatrixReport = runMatrix1080();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1376);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(4728);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1081
     * @tc.name testVibratorMatrix1081
     * @tc.desc 长事件可选参数省略与典型时长组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1081', 0, (): void => {
      const report: MatrixReport = runMatrix1081();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(16792);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(4728);
    });

  });
}
