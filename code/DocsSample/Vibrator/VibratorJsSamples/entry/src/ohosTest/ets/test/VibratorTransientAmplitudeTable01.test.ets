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
const TAG: string = 'VibratorTransientAmplitudeTable01';

function runMatrix1001(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 1,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 50,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1002(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 20,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 34,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 50,
        frequency: 100,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1003(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 70,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 80,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 50,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1004(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 97,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 99,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 0,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 0,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 1,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 1,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 20,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 20,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 34,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 50,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 70,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 97,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 97,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 100,
        frequency: 100,
        index: 0,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorTransientAmplitudeTable01(): void {
  describe('VibratorTransientAmplitudeTable01', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1001
     * @tc.name testVibratorMatrix1001
     * @tc.desc 短事件强度与频率双边界及三通道组合，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1001', 0, (): void => {
      const report: MatrixReport = runMatrix1001();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1200);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(110);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1002
     * @tc.name testVibratorMatrix1002
     * @tc.desc 短事件强度与频率双边界及三通道组合，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1002', 0, (): void => {
      const report: MatrixReport = runMatrix1002();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1200);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(940);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1003
     * @tc.name testVibratorMatrix1003
     * @tc.desc 短事件强度与频率双边界及三通道组合，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1003', 0, (): void => {
      const report: MatrixReport = runMatrix1003();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1200);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(1985);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1004
     * @tc.name testVibratorMatrix1004
     * @tc.desc 短事件强度与频率双边界及三通道组合，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1004', 0, (): void => {
      const report: MatrixReport = runMatrix1004();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(1200);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2475);
    });

  });
}
