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
const TAG: string = 'VibratorTransientAmplitudeTable02';

function runMatrix1005(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 0,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 0,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 1,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 1,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 20,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 20,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 34,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 34,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 50,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 50,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 70,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 70,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 80,
        index: 1,
      },
      expected: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 80,
        index: 1,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.TRANSIENT,
        time: 11,
        duration: 48,
        intensity: 0,
        frequency: 97,
        index: 1,
      },
