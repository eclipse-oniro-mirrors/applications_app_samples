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
const TAG: string = 'VibratorContinuousScheduleTable05';

function runMatrix1037(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 4999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 1,
        duration: 5000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 1,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 2,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 9,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 10,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 15,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 16,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 25,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 48,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 99,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 100,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 999,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 1000,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 9,
        duration: 2468,
        intensity: 97,
        frequency: 34,
        index: 1,
      },
    },
    {
