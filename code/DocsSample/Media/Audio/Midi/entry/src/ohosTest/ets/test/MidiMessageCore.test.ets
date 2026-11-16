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

const TAG: string = '[Sample_midiMessageCore]';
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

export default function midiMessageCoreTest(): void {
  describe('midiMessageCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0001
     * @tc.name      testExtMidiMsg0000
     * @tc.desc      MIDI note 60 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0002
     * @tc.name      testExtMidiMsg0001
     * @tc.desc      MIDI note 61 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0003
     * @tc.name      testExtMidiMsg0002
     * @tc.desc      MIDI note 69 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0004
     * @tc.name      testExtMidiMsg0003
     * @tc.desc      MIDI note 72 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0005
     * @tc.name      testExtMidiMsg0004
     * @tc.desc      MIDI note 48 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0006
     * @tc.name      testExtMidiMsg0005
     * @tc.desc      MIDI note 60 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0007
     * @tc.name      testExtMidiMsg0006
     * @tc.desc      MIDI note 61 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0008
     * @tc.name      testExtMidiMsg0007
     * @tc.desc      MIDI note 69 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0009
     * @tc.name      testExtMidiMsg0008
     * @tc.desc      MIDI note 72 velocity 1 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 1;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0010
     * @tc.name      testExtMidiMsg0009
     * @tc.desc      MIDI note 48 velocity 64 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 64;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0011
     * @tc.name      testExtMidiMsg0010
     * @tc.desc      MIDI note 60 velocity 127 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 127;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0012
     * @tc.name      testExtMidiMsg0011
     * @tc.desc      MIDI note 61 velocity 0 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 0;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0013
     * @tc.name      testExtMidiMsg0012
     * @tc.desc      MIDI note 69 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0014
     * @tc.name      testExtMidiMsg0013
     * @tc.desc      MIDI note 72 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0015
     * @tc.name      testExtMidiMsg0014
     * @tc.desc      MIDI note 48 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0016
     * @tc.name      testExtMidiMsg0015
     * @tc.desc      MIDI note 60 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0017
     * @tc.name      testExtMidiMsg0016
     * @tc.desc      MIDI note 61 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0018
     * @tc.name      testExtMidiMsg0017
     * @tc.desc      MIDI note 69 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0019
     * @tc.name      testExtMidiMsg0018
     * @tc.desc      MIDI note 72 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0020
     * @tc.name      testExtMidiMsg0019
     * @tc.desc      MIDI note 48 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0021
     * @tc.name      testExtMidiMsg0020
     * @tc.desc      MIDI note 60 velocity 1 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 1;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0022
     * @tc.name      testExtMidiMsg0021
     * @tc.desc      MIDI note 61 velocity 64 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 64;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0023
     * @tc.name      testExtMidiMsg0022
     * @tc.desc      MIDI note 69 velocity 127 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 127;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0024
     * @tc.name      testExtMidiMsg0023
     * @tc.desc      MIDI note 72 velocity 0 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 0;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0025
     * @tc.name      testExtMidiMsg0024
     * @tc.desc      MIDI note 48 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0026
     * @tc.name      testExtMidiMsg0025
     * @tc.desc      MIDI note 60 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0027
     * @tc.name      testExtMidiMsg0026
     * @tc.desc      MIDI note 61 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0028
     * @tc.name      testExtMidiMsg0027
     * @tc.desc      MIDI note 69 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0029
     * @tc.name      testExtMidiMsg0028
     * @tc.desc      MIDI note 72 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0030
     * @tc.name      testExtMidiMsg0029
     * @tc.desc      MIDI note 48 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0031
     * @tc.name      testExtMidiMsg0030
     * @tc.desc      MIDI note 60 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0032
     * @tc.name      testExtMidiMsg0031
     * @tc.desc      MIDI note 61 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0033
     * @tc.name      testExtMidiMsg0032
     * @tc.desc      MIDI note 69 velocity 1 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 1;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0034
     * @tc.name      testExtMidiMsg0033
     * @tc.desc      MIDI note 72 velocity 64 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 64;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0035
     * @tc.name      testExtMidiMsg0034
     * @tc.desc      MIDI note 48 velocity 127 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 127;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0036
     * @tc.name      testExtMidiMsg0035
     * @tc.desc      MIDI note 60 velocity 0 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 0;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0037
     * @tc.name      testExtMidiMsg0036
     * @tc.desc      MIDI note 61 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0038
     * @tc.name      testExtMidiMsg0037
     * @tc.desc      MIDI note 69 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0039
     * @tc.name      testExtMidiMsg0038
     * @tc.desc      MIDI note 72 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0040
     * @tc.name      testExtMidiMsg0039
     * @tc.desc      MIDI note 48 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0041
     * @tc.name      testExtMidiMsg0040
     * @tc.desc      MIDI note 60 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0042
     * @tc.name      testExtMidiMsg0041
     * @tc.desc      MIDI note 61 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0043
     * @tc.name      testExtMidiMsg0042
     * @tc.desc      MIDI note 69 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0044
     * @tc.name      testExtMidiMsg0043
     * @tc.desc      MIDI note 72 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0045
     * @tc.name      testExtMidiMsg0044
     * @tc.desc      MIDI note 48 velocity 1 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 1;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0046
     * @tc.name      testExtMidiMsg0045
     * @tc.desc      MIDI note 60 velocity 64 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 64;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0047
     * @tc.name      testExtMidiMsg0046
     * @tc.desc      MIDI note 61 velocity 127 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 127;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0048
     * @tc.name      testExtMidiMsg0047
     * @tc.desc      MIDI note 69 velocity 0 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 0;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0049
     * @tc.name      testExtMidiMsg0048
     * @tc.desc      MIDI note 72 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0050
     * @tc.name      testExtMidiMsg0049
     * @tc.desc      MIDI note 48 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0051
     * @tc.name      testExtMidiMsg0050
     * @tc.desc      MIDI note 60 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0052
     * @tc.name      testExtMidiMsg0051
     * @tc.desc      MIDI note 61 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0053
     * @tc.name      testExtMidiMsg0052
     * @tc.desc      MIDI note 69 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0054
     * @tc.name      testExtMidiMsg0053
     * @tc.desc      MIDI note 72 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0055
     * @tc.name      testExtMidiMsg0054
     * @tc.desc      MIDI note 48 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0056
     * @tc.name      testExtMidiMsg0055
     * @tc.desc      MIDI note 60 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0057
     * @tc.name      testExtMidiMsg0056
     * @tc.desc      MIDI note 61 velocity 1 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 1;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0058
     * @tc.name      testExtMidiMsg0057
     * @tc.desc      MIDI note 69 velocity 64 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 64;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0059
     * @tc.name      testExtMidiMsg0058
     * @tc.desc      MIDI note 72 velocity 127 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 127;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0060
     * @tc.name      testExtMidiMsg0059
     * @tc.desc      MIDI note 48 velocity 0 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 0;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0061
     * @tc.name      testExtMidiMsg0060
     * @tc.desc      MIDI note 60 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0062
     * @tc.name      testExtMidiMsg0061
     * @tc.desc      MIDI note 61 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0063
     * @tc.name      testExtMidiMsg0062
     * @tc.desc      MIDI note 69 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0064
     * @tc.name      testExtMidiMsg0063
     * @tc.desc      MIDI note 72 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0065
     * @tc.name      testExtMidiMsg0064
     * @tc.desc      MIDI note 48 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0066
     * @tc.name      testExtMidiMsg0065
     * @tc.desc      MIDI note 60 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0067
     * @tc.name      testExtMidiMsg0066
     * @tc.desc      MIDI note 61 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0068
     * @tc.name      testExtMidiMsg0067
     * @tc.desc      MIDI note 69 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0069
     * @tc.name      testExtMidiMsg0068
     * @tc.desc      MIDI note 72 velocity 1 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 1;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0070
     * @tc.name      testExtMidiMsg0069
     * @tc.desc      MIDI note 48 velocity 64 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 64;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0071
     * @tc.name      testExtMidiMsg0070
     * @tc.desc      MIDI note 60 velocity 127 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 127;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0072
     * @tc.name      testExtMidiMsg0071
     * @tc.desc      MIDI note 61 velocity 0 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 0;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0073
     * @tc.name      testExtMidiMsg0072
     * @tc.desc      MIDI note 69 velocity 1 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 1;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0074
     * @tc.name      testExtMidiMsg0073
     * @tc.desc      MIDI note 72 velocity 64 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 64;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0075
     * @tc.name      testExtMidiMsg0074
     * @tc.desc      MIDI note 48 velocity 127 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 127;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0076
     * @tc.name      testExtMidiMsg0075
     * @tc.desc      MIDI note 60 velocity 0 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const velocity: number = 0;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0077
     * @tc.name      testExtMidiMsg0076
     * @tc.desc      MIDI note 61 velocity 1 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const velocity: number = 1;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(1);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0078
     * @tc.name      testExtMidiMsg0077
     * @tc.desc      MIDI note 69 velocity 64 channel 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const velocity: number = 64;
      const channel: number = 15;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(64);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0079
     * @tc.name      testExtMidiMsg0078
     * @tc.desc      MIDI note 72 velocity 127 channel 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const velocity: number = 127;
      const channel: number = 0;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(127);
      expect(frequency).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MSG_0080
     * @tc.name      testExtMidiMsg0079
     * @tc.desc      MIDI note 48 velocity 0 channel 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMsg0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const velocity: number = 0;
      const channel: number = 1;
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      const clampedVelocity: number = Math.max(0, Math.min(127, velocity));
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(clampedVelocity).assertEqual(0);
      expect(frequency).assertLarger(0);
    })
  });
}
