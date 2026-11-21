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
const TAG: string = 'VibratorContinuousScheduleTable11';

function runMatrix1061(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 2468,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1062(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 4999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 5000,
        duration: 1000,
        intensity: 97,
