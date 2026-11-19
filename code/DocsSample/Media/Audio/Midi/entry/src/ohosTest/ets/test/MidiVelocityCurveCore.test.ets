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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_midiVelocityCurveCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function midiVelocityCurveCoreTest(): void {
  describe('midiVelocityCurveCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0001
     * @tc.name      testExtMidiVelocity0000
     * @tc.desc      Velocity 0 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 0;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0002
     * @tc.name      testExtMidiVelocity0001
     * @tc.desc      Velocity 1 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 1;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0003
     * @tc.name      testExtMidiVelocity0002
     * @tc.desc      Velocity 2 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 2;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0004
     * @tc.name      testExtMidiVelocity0003
     * @tc.desc      Velocity 3 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 3;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0005
     * @tc.name      testExtMidiVelocity0004
     * @tc.desc      Velocity 4 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 4;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0006
     * @tc.name      testExtMidiVelocity0005
     * @tc.desc      Velocity 5 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 5;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0007
     * @tc.name      testExtMidiVelocity0006
     * @tc.desc      Velocity 6 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 6;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0008
     * @tc.name      testExtMidiVelocity0007
     * @tc.desc      Velocity 7 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 7;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0009
     * @tc.name      testExtMidiVelocity0008
     * @tc.desc      Velocity 8 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 8;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0010
     * @tc.name      testExtMidiVelocity0009
     * @tc.desc      Velocity 9 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 9;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0011
     * @tc.name      testExtMidiVelocity0010
     * @tc.desc      Velocity 10 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 10;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0012
     * @tc.name      testExtMidiVelocity0011
     * @tc.desc      Velocity 11 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 11;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0013
     * @tc.name      testExtMidiVelocity0012
     * @tc.desc      Velocity 12 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 12;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0014
     * @tc.name      testExtMidiVelocity0013
     * @tc.desc      Velocity 13 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 13;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0015
     * @tc.name      testExtMidiVelocity0014
     * @tc.desc      Velocity 14 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 14;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0016
     * @tc.name      testExtMidiVelocity0015
     * @tc.desc      Velocity 15 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 15;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0017
     * @tc.name      testExtMidiVelocity0016
     * @tc.desc      Velocity 16 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 16;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0018
     * @tc.name      testExtMidiVelocity0017
     * @tc.desc      Velocity 17 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 17;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0019
     * @tc.name      testExtMidiVelocity0018
     * @tc.desc      Velocity 18 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 18;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0020
     * @tc.name      testExtMidiVelocity0019
     * @tc.desc      Velocity 19 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 19;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0021
     * @tc.name      testExtMidiVelocity0020
     * @tc.desc      Velocity 20 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 20;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0022
     * @tc.name      testExtMidiVelocity0021
     * @tc.desc      Velocity 21 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 21;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0023
     * @tc.name      testExtMidiVelocity0022
     * @tc.desc      Velocity 22 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 22;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0024
     * @tc.name      testExtMidiVelocity0023
     * @tc.desc      Velocity 23 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 23;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0025
     * @tc.name      testExtMidiVelocity0024
     * @tc.desc      Velocity 24 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 24;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0026
     * @tc.name      testExtMidiVelocity0025
     * @tc.desc      Velocity 25 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 25;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0027
     * @tc.name      testExtMidiVelocity0026
     * @tc.desc      Velocity 26 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 26;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0028
     * @tc.name      testExtMidiVelocity0027
     * @tc.desc      Velocity 27 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 27;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0029
     * @tc.name      testExtMidiVelocity0028
     * @tc.desc      Velocity 28 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 28;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0030
     * @tc.name      testExtMidiVelocity0029
     * @tc.desc      Velocity 29 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 29;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0031
     * @tc.name      testExtMidiVelocity0030
     * @tc.desc      Velocity 30 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 30;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0032
     * @tc.name      testExtMidiVelocity0031
     * @tc.desc      Velocity 31 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 31;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0033
     * @tc.name      testExtMidiVelocity0032
     * @tc.desc      Velocity 32 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 32;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0034
     * @tc.name      testExtMidiVelocity0033
     * @tc.desc      Velocity 33 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 33;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0035
     * @tc.name      testExtMidiVelocity0034
     * @tc.desc      Velocity 34 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 34;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0036
     * @tc.name      testExtMidiVelocity0035
     * @tc.desc      Velocity 35 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 35;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0037
     * @tc.name      testExtMidiVelocity0036
     * @tc.desc      Velocity 36 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 36;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0038
     * @tc.name      testExtMidiVelocity0037
     * @tc.desc      Velocity 37 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 37;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0039
     * @tc.name      testExtMidiVelocity0038
     * @tc.desc      Velocity 38 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 38;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0040
     * @tc.name      testExtMidiVelocity0039
     * @tc.desc      Velocity 39 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 39;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0041
     * @tc.name      testExtMidiVelocity0040
     * @tc.desc      Velocity 40 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 40;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0042
     * @tc.name      testExtMidiVelocity0041
     * @tc.desc      Velocity 41 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 41;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0043
     * @tc.name      testExtMidiVelocity0042
     * @tc.desc      Velocity 42 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 42;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0044
     * @tc.name      testExtMidiVelocity0043
     * @tc.desc      Velocity 43 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 43;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0045
     * @tc.name      testExtMidiVelocity0044
     * @tc.desc      Velocity 44 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 44;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0046
     * @tc.name      testExtMidiVelocity0045
     * @tc.desc      Velocity 45 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 45;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0047
     * @tc.name      testExtMidiVelocity0046
     * @tc.desc      Velocity 46 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 46;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0048
     * @tc.name      testExtMidiVelocity0047
     * @tc.desc      Velocity 47 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 47;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0049
     * @tc.name      testExtMidiVelocity0048
     * @tc.desc      Velocity 48 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 48;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0050
     * @tc.name      testExtMidiVelocity0049
     * @tc.desc      Velocity 49 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 49;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0051
     * @tc.name      testExtMidiVelocity0050
     * @tc.desc      Velocity 50 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 50;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0052
     * @tc.name      testExtMidiVelocity0051
     * @tc.desc      Velocity 51 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 51;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0053
     * @tc.name      testExtMidiVelocity0052
     * @tc.desc      Velocity 52 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 52;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0054
     * @tc.name      testExtMidiVelocity0053
     * @tc.desc      Velocity 53 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 53;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0055
     * @tc.name      testExtMidiVelocity0054
     * @tc.desc      Velocity 54 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 54;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0056
     * @tc.name      testExtMidiVelocity0055
     * @tc.desc      Velocity 55 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 55;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0057
     * @tc.name      testExtMidiVelocity0056
     * @tc.desc      Velocity 56 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 56;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0058
     * @tc.name      testExtMidiVelocity0057
     * @tc.desc      Velocity 57 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 57;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0059
     * @tc.name      testExtMidiVelocity0058
     * @tc.desc      Velocity 58 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 58;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0060
     * @tc.name      testExtMidiVelocity0059
     * @tc.desc      Velocity 59 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 59;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0061
     * @tc.name      testExtMidiVelocity0060
     * @tc.desc      Velocity 60 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 60;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0062
     * @tc.name      testExtMidiVelocity0061
     * @tc.desc      Velocity 61 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 61;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0063
     * @tc.name      testExtMidiVelocity0062
     * @tc.desc      Velocity 62 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 62;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0064
     * @tc.name      testExtMidiVelocity0063
     * @tc.desc      Velocity 63 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 63;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0065
     * @tc.name      testExtMidiVelocity0064
     * @tc.desc      Velocity 64 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 64;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0066
     * @tc.name      testExtMidiVelocity0065
     * @tc.desc      Velocity 65 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 65;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0067
     * @tc.name      testExtMidiVelocity0066
     * @tc.desc      Velocity 66 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 66;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0068
     * @tc.name      testExtMidiVelocity0067
     * @tc.desc      Velocity 67 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 67;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0069
     * @tc.name      testExtMidiVelocity0068
     * @tc.desc      Velocity 68 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 68;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0070
     * @tc.name      testExtMidiVelocity0069
     * @tc.desc      Velocity 69 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 69;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0071
     * @tc.name      testExtMidiVelocity0070
     * @tc.desc      Velocity 70 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 70;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0072
     * @tc.name      testExtMidiVelocity0071
     * @tc.desc      Velocity 71 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 71;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0073
     * @tc.name      testExtMidiVelocity0072
     * @tc.desc      Velocity 72 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 72;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0074
     * @tc.name      testExtMidiVelocity0073
     * @tc.desc      Velocity 73 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 73;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0075
     * @tc.name      testExtMidiVelocity0074
     * @tc.desc      Velocity 74 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 74;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0076
     * @tc.name      testExtMidiVelocity0075
     * @tc.desc      Velocity 75 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 75;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0077
     * @tc.name      testExtMidiVelocity0076
     * @tc.desc      Velocity 76 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 76;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0078
     * @tc.name      testExtMidiVelocity0077
     * @tc.desc      Velocity 77 curve 2.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 77;
      const curve: number = 2.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0079
     * @tc.name      testExtMidiVelocity0078
     * @tc.desc      Velocity 78 curve 1.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 78;
      const curve: number = 1.0;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_VELOCITY_0080
     * @tc.name      testExtMidiVelocity0079
     * @tc.desc      Velocity 79 curve 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiVelocity0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const velocity: number = 79;
      const curve: number = 0.5;
      const scaled: number = Math.max(0, Math.min(127, Math.round(Math.pow(velocity / 127, curve) * 127)));
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(scaled).assertLargerOrEqual(0);
      expect(scaled).assertLessOrEqual(127);
      expect(curve).assertLarger(0);
    })
  });
}
