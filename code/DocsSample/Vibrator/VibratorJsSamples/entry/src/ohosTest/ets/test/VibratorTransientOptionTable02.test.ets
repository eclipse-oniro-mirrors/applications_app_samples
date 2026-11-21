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
const TAG: string = 'VibratorTransientOptionTable02';

function runMatrix1017(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 100,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1018(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2467,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 2468,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 4999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1019(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 5000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1794999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
