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
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1795000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1020(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799998,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1799999,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        frequency: 70,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 1800000,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorTransientOptionTable02(): void {
  describe('VibratorTransientOptionTable02', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1017
     * @tc.name testVibratorMatrix1017
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1017', 0, (): void => {
      const report: MatrixReport = runMatrix1017();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1018
     * @tc.name testVibratorMatrix1018
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1018', 0, (): void => {
      const report: MatrixReport = runMatrix1018();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1019
     * @tc.name testVibratorMatrix1019
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1019', 0, (): void => {
      const report: MatrixReport = runMatrix1019();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1020
     * @tc.name testVibratorMatrix1020
     * @tc.desc 短事件时间边界与三项可选参数省略组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1020', 0, (): void => {
      const report: MatrixReport = runMatrix1020();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1152);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(3240);
    });

  });
}
