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
const TAG: string = 'VibratorContinuousScheduleTable02';

function runMatrix1025(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 24,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 25,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1026(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 47,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1027(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 48,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 49,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1028(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 99,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 100,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousScheduleTable02(): void {
  describe('VibratorContinuousScheduleTable02', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1025
     * @tc.name testVibratorMatrix1025
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1025', 0, (): void => {
      const report: MatrixReport = runMatrix1025();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(29529);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1026
     * @tc.name testVibratorMatrix1026
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1026', 0, (): void => {
      const report: MatrixReport = runMatrix1026();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(15016);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1027
     * @tc.name testVibratorMatrix1027
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1027', 0, (): void => {
      const report: MatrixReport = runMatrix1027();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(29369);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1028
     * @tc.name testVibratorMatrix1028
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1028', 0, (): void => {
      const report: MatrixReport = runMatrix1028();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(17103);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

  });
}
