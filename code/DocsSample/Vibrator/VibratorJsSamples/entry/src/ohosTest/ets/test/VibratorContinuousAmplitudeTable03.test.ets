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
const TAG: string = 'VibratorContinuousAmplitudeTable03';

function runMatrix1074(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 0,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 1,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 50,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1075(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 20,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 34,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 50,
        frequency: 100,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1076(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 70,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 80,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 50,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

function runMatrix1077(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 97,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 99,
        frequency: 100,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 0,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 0,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 1,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 1,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 20,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 20,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 34,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 50,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 70,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 70,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 80,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 80,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 97,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 97,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 99,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 99,
        index: 2,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 100,
        index: 2,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 17,
        duration: 2468,
        intensity: 100,
        frequency: 100,
        index: 2,
      },
    },
  ];
  return checkBuilderRows(rows);
}

export default function vibratorContinuousAmplitudeTable03(): void {
  describe('VibratorContinuousAmplitudeTable03', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1074
     * @tc.name testVibratorMatrix1074
     * @tc.desc 长事件强度频率交叉组合与三通道输出，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1074', 0, (): void => {
      const report: MatrixReport = runMatrix1074();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(61700);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(330);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1075
     * @tc.name testVibratorMatrix1075
     * @tc.desc 长事件强度频率交叉组合与三通道输出，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1075', 0, (): void => {
      const report: MatrixReport = runMatrix1075();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(61700);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(2820);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1076
     * @tc.name testVibratorMatrix1076
     * @tc.desc 长事件强度频率交叉组合与三通道输出，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1076', 0, (): void => {
      const report: MatrixReport = runMatrix1076();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(61700);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(5955);
    });

    /**
     * @tc.number SUB_VIBRATOR_MATRIX_1077
     * @tc.name testVibratorMatrix1077
     * @tc.desc 长事件强度频率交叉组合与三通道输出，逐项核对25组输出及累计时长和通道加权强度。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorMatrix1077', 0, (): void => {
      const report: MatrixReport = runMatrix1077();
      hilog.info(DOMAIN, TAG, 'Event count=%{public}d', report.eventCount);
      expect(report.eventCount).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'Duration sum=%{public}d', report.durationSum);
      expect(report.durationSum).assertEqual(61700);
      hilog.info(DOMAIN, TAG, 'Channel intensity sum=%{public}d', report.channelIntensitySum);
      expect(report.channelIntensitySum).assertEqual(7425);
    });

  });
}
