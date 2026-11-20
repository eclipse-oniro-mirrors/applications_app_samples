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

import { expect } from '@ohos/hypium';
import { KeyboardController } from '../../../../main/ets/model/KeyboardController';
import { ClientHarness } from './ClientHarness';
import { pressHardKey, releaseHardKey, isShiftHeld } from './TestSupport';

/**
 * One uniformly tapped key group and the journal it must produce.
 *
 * The keys are pressed and released one by one; every press must be accepted
 * and every release must be non-special. The expected array is the complete
 * journal after the group, not a suffix.
 */
export interface KeyPhase {
  keys: number[];
  expected: string[];
}

/** Runs one phase and verifies the full journal plus the shift state. */
export function runPhase(controller: KeyboardController, harness: ClientHarness,
  keys: number[], expected: string[]): void {
  for (let i = 0; i < keys.length; i++) {
    expect(pressHardKey(controller, keys[i])).assertEqual(true);
    expect(releaseHardKey(controller, keys[i])).assertEqual(false);
  }
  expect(harness.client.journal.length).assertEqual(expected.length);
  expect(harness.client.journal.join('|')).assertEqual(expected.join('|'));
  expect(isShiftHeld(controller)).assertEqual(false);
}

/** Runs several phases in order. */
export function runPhases(controller: KeyboardController, harness: ClientHarness,
  phases: KeyPhase[]): void {
  for (let i = 0; i < phases.length; i++) {
    runPhase(controller, harness, phases[i].keys, phases[i].expected);
  }
}

/** Taps one key and asserts both return values in one place. */
export function tapExpect(controller: KeyboardController, keyCode: number,
  downExpected: boolean, upExpected: boolean): void {
  expect(pressHardKey(controller, keyCode)).assertEqual(downExpected);
  expect(releaseHardKey(controller, keyCode)).assertEqual(upExpected);
}
