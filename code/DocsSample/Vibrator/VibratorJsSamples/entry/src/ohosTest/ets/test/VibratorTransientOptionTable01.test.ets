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
const TAG: string = 'VibratorTransientOptionTable01';

function runMatrix1013(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 0,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 9,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1014(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 10,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 14,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 15,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1015(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 24,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 25,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 47,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1016(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 48,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 49,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 99,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorTransientOptionTable01(): void {
  describe('VibratorTransientOptionTable01', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1013
     * @tc.name testVibratorMatrix1013
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1013', 0, (): void => {
      const report: MatrixReport = runMatrix1013();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1014
     * @tc.name testVibratorMatrix1014
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1014', 0, (): void => {
      const report: MatrixReport = runMatrix1014();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1015
     * @tc.name testVibratorMatrix1015
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1015', 0, (): void => {
      const report: MatrixReport = runMatrix1015();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1016
     * @tc.name testVibratorMatrix1016
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1016', 0, (): void => {
      const report: MatrixReport = runMatrix1016();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

  });
}
