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
const TAG: string = 'VibratorMixedSequence701';

function runMatrix1109(): MatrixReport {
  const rows: BuilderRow[] = [
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66000,
        duration: 1,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66000,
        duration: 1,
        intensity: 0,
        frequency: 100,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66051,
        duration: 1,
        intensity: 20,
        frequency: 99,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66051,
        duration: 1,
        intensity: 20,
        frequency: 99,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66102,
        duration: 1,
        intensity: 40,
        frequency: 80,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66102,
        duration: 1,
        intensity: 40,
        frequency: 80,
        index: 0,
      },
    },
    {
      input: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66153,
        duration: 1,
        intensity: 60,
        frequency: 70,
        index: 0,
      },
      expected: {
        eventType: vibrator.VibratorEventType.CONTINUOUS,
        time: 66153,
        duration: 1,
        intensity: 60,
        frequency: 70,
        index: 0,
      },
    },
