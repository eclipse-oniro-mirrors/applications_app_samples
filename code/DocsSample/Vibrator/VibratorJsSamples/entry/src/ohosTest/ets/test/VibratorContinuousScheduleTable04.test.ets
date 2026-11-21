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
const TAG: string = 'VibratorContinuousScheduleTable04';

function runMatrix1033(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1794999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1034(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1795000,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799998,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1035(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1799999,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1800000,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1036(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 0,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousScheduleTable04(): void {
  describe('VibratorContinuousScheduleTable04', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1033
     * @tc.name testVibratorMatrix1033
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1033', 0, (): void => {
      const report: MatrixReport = runMatrix1033();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(17103);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1034
     * @tc.name testVibratorMatrix1034
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1034', 0, (): void => {
      const report: MatrixReport = runMatrix1034();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(27311);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1035
     * @tc.name testVibratorMatrix1035
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1035', 0, (): void => {
      const report: MatrixReport = runMatrix1035();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(29529);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2328);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1036
     * @tc.name testVibratorMatrix1036
     * @tc.desc 长事件时间及一至五千毫秒时长三通道组合，逐项核对24组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1036', 0, (): void => {
      const report: MatrixReport = runMatrix1036();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(15016);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(4656);
    });

  });
}
