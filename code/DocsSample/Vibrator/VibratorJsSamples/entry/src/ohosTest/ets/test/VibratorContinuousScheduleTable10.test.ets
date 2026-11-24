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
const TAG: string = 'VibratorContinuousScheduleTable10';

function runMatrix1057(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1058(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1059(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1060(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1000,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2467,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousScheduleTable10(): void {
  describe('VibratorContinuousScheduleTable10', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1057
     * @tc.name testVibratorMatrix1057
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1057', 0, (): void => {
      const report: MatrixReport = runMatrix1057();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(29369);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(6984);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1058
     * @tc.name testVibratorMatrix1058
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1058', 0, (): void => {
      const report: MatrixReport = runMatrix1058();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(17103);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(6984);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1059
     * @tc.name testVibratorMatrix1059
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1059', 0, (): void => {
      const report: MatrixReport = runMatrix1059();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(27311);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(6984);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1060
     * @tc.name testVibratorMatrix1060
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1060', 0, (): void => {
      const report: MatrixReport = runMatrix1060();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(29529);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(6984);
    });

  });
}
