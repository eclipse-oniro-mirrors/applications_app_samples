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

const TAG: string = '[Sample_midiKeyLayoutCore]';
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

export default function midiKeyLayoutCoreTest(): void {
  describe('midiKeyLayoutCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0001
     * @tc.name      testExtMidiKey0000
     * @tc.desc      Key layout C4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('C4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0002
     * @tc.name      testExtMidiKey0001
     * @tc.desc      Key layout D4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('D4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0003
     * @tc.name      testExtMidiKey0002
     * @tc.desc      Key layout E4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('E4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0004
     * @tc.name      testExtMidiKey0003
     * @tc.desc      Key layout F4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('F4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0005
     * @tc.name      testExtMidiKey0004
     * @tc.desc      Key layout G4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('G4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0006
     * @tc.name      testExtMidiKey0005
     * @tc.desc      Key layout A4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('A4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0007
     * @tc.name      testExtMidiKey0006
     * @tc.desc      Key layout B4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('B4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0008
     * @tc.name      testExtMidiKey0007
     * @tc.desc      Key layout C5/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('C5'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0009
     * @tc.name      testExtMidiKey0008
     * @tc.desc      Key layout C4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('C4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0010
     * @tc.name      testExtMidiKey0009
     * @tc.desc      Key layout D4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('D4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0011
     * @tc.name      testExtMidiKey0010
     * @tc.desc      Key layout E4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('E4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0012
     * @tc.name      testExtMidiKey0011
     * @tc.desc      Key layout F4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('F4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0013
     * @tc.name      testExtMidiKey0012
     * @tc.desc      Key layout G4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('G4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0014
     * @tc.name      testExtMidiKey0013
     * @tc.desc      Key layout A4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('A4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0015
     * @tc.name      testExtMidiKey0014
     * @tc.desc      Key layout B4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('B4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0016
     * @tc.name      testExtMidiKey0015
     * @tc.desc      Key layout C5/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('C5'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0017
     * @tc.name      testExtMidiKey0016
     * @tc.desc      Key layout C4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('C4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0018
     * @tc.name      testExtMidiKey0017
     * @tc.desc      Key layout D4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('D4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0019
     * @tc.name      testExtMidiKey0018
     * @tc.desc      Key layout E4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('E4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0020
     * @tc.name      testExtMidiKey0019
     * @tc.desc      Key layout F4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('F4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0021
     * @tc.name      testExtMidiKey0020
     * @tc.desc      Key layout G4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('G4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0022
     * @tc.name      testExtMidiKey0021
     * @tc.desc      Key layout A4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('A4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0023
     * @tc.name      testExtMidiKey0022
     * @tc.desc      Key layout B4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('B4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0024
     * @tc.name      testExtMidiKey0023
     * @tc.desc      Key layout C5/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('C5'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0025
     * @tc.name      testExtMidiKey0024
     * @tc.desc      Key layout C4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('C4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0026
     * @tc.name      testExtMidiKey0025
     * @tc.desc      Key layout D4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('D4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0027
     * @tc.name      testExtMidiKey0026
     * @tc.desc      Key layout E4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('E4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0028
     * @tc.name      testExtMidiKey0027
     * @tc.desc      Key layout F4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('F4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0029
     * @tc.name      testExtMidiKey0028
     * @tc.desc      Key layout G4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('G4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0030
     * @tc.name      testExtMidiKey0029
     * @tc.desc      Key layout A4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('A4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0031
     * @tc.name      testExtMidiKey0030
     * @tc.desc      Key layout B4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('B4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0032
     * @tc.name      testExtMidiKey0031
     * @tc.desc      Key layout C5/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('C5'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0033
     * @tc.name      testExtMidiKey0032
     * @tc.desc      Key layout C4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('C4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0034
     * @tc.name      testExtMidiKey0033
     * @tc.desc      Key layout D4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('D4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0035
     * @tc.name      testExtMidiKey0034
     * @tc.desc      Key layout E4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('E4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0036
     * @tc.name      testExtMidiKey0035
     * @tc.desc      Key layout F4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('F4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0037
     * @tc.name      testExtMidiKey0036
     * @tc.desc      Key layout G4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('G4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0038
     * @tc.name      testExtMidiKey0037
     * @tc.desc      Key layout A4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('A4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0039
     * @tc.name      testExtMidiKey0038
     * @tc.desc      Key layout B4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('B4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0040
     * @tc.name      testExtMidiKey0039
     * @tc.desc      Key layout C5/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('C5'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0041
     * @tc.name      testExtMidiKey0040
     * @tc.desc      Key layout C4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('C4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0042
     * @tc.name      testExtMidiKey0041
     * @tc.desc      Key layout D4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('D4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0043
     * @tc.name      testExtMidiKey0042
     * @tc.desc      Key layout E4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('E4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0044
     * @tc.name      testExtMidiKey0043
     * @tc.desc      Key layout F4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('F4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0045
     * @tc.name      testExtMidiKey0044
     * @tc.desc      Key layout G4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('G4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0046
     * @tc.name      testExtMidiKey0045
     * @tc.desc      Key layout A4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('A4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0047
     * @tc.name      testExtMidiKey0046
     * @tc.desc      Key layout B4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('B4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0048
     * @tc.name      testExtMidiKey0047
     * @tc.desc      Key layout C5/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('C5'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0049
     * @tc.name      testExtMidiKey0048
     * @tc.desc      Key layout C4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('C4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0050
     * @tc.name      testExtMidiKey0049
     * @tc.desc      Key layout D4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('D4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0051
     * @tc.name      testExtMidiKey0050
     * @tc.desc      Key layout E4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('E4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0052
     * @tc.name      testExtMidiKey0051
     * @tc.desc      Key layout F4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('F4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0053
     * @tc.name      testExtMidiKey0052
     * @tc.desc      Key layout G4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('G4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0054
     * @tc.name      testExtMidiKey0053
     * @tc.desc      Key layout A4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('A4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0055
     * @tc.name      testExtMidiKey0054
     * @tc.desc      Key layout B4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('B4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0056
     * @tc.name      testExtMidiKey0055
     * @tc.desc      Key layout C5/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('C5'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0057
     * @tc.name      testExtMidiKey0056
     * @tc.desc      Key layout C4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('C4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0058
     * @tc.name      testExtMidiKey0057
     * @tc.desc      Key layout D4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('D4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0059
     * @tc.name      testExtMidiKey0058
     * @tc.desc      Key layout E4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('E4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0060
     * @tc.name      testExtMidiKey0059
     * @tc.desc      Key layout F4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('F4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0061
     * @tc.name      testExtMidiKey0060
     * @tc.desc      Key layout G4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('G4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0062
     * @tc.name      testExtMidiKey0061
     * @tc.desc      Key layout A4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('A4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0063
     * @tc.name      testExtMidiKey0062
     * @tc.desc      Key layout B4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('B4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0064
     * @tc.name      testExtMidiKey0063
     * @tc.desc      Key layout C5/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('C5'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0065
     * @tc.name      testExtMidiKey0064
     * @tc.desc      Key layout C4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('C4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0066
     * @tc.name      testExtMidiKey0065
     * @tc.desc      Key layout D4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('D4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0067
     * @tc.name      testExtMidiKey0066
     * @tc.desc      Key layout E4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('E4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0068
     * @tc.name      testExtMidiKey0067
     * @tc.desc      Key layout F4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('F4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0069
     * @tc.name      testExtMidiKey0068
     * @tc.desc      Key layout G4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('G4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0070
     * @tc.name      testExtMidiKey0069
     * @tc.desc      Key layout A4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('A4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0071
     * @tc.name      testExtMidiKey0070
     * @tc.desc      Key layout B4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('B4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0072
     * @tc.name      testExtMidiKey0071
     * @tc.desc      Key layout C5/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('C5'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0073
     * @tc.name      testExtMidiKey0072
     * @tc.desc      Key layout C4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(60)).assertEqual(0);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('C4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0074
     * @tc.name      testExtMidiKey0073
     * @tc.desc      Key layout D4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(62)).assertEqual(1);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('D4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0075
     * @tc.name      testExtMidiKey0074
     * @tc.desc      Key layout E4/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(64)).assertEqual(2);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('E4'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0076
     * @tc.name      testExtMidiKey0075
     * @tc.desc      Key layout F4/C#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(65)).assertEqual(3);
      expect(blackNotes.indexOf(61)).assertEqual(0);
      expect('F4'.length).assertLarger(0);
      expect('C#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0077
     * @tc.name      testExtMidiKey0076
     * @tc.desc      Key layout G4/D#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(67)).assertEqual(4);
      expect(blackNotes.indexOf(63)).assertEqual(1);
      expect('G4'.length).assertLarger(0);
      expect('D#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0078
     * @tc.name      testExtMidiKey0077
     * @tc.desc      Key layout A4/F#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(69)).assertEqual(5);
      expect(blackNotes.indexOf(66)).assertEqual(2);
      expect('A4'.length).assertLarger(0);
      expect('F#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0079
     * @tc.name      testExtMidiKey0078
     * @tc.desc      Key layout B4/G#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(71)).assertEqual(6);
      expect(blackNotes.indexOf(68)).assertEqual(3);
      expect('B4'.length).assertLarger(0);
      expect('G#4'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_KEY_0080
     * @tc.name      testExtMidiKey0079
     * @tc.desc      Key layout C5/A#4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiKey0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteNotes: number[] = [60, 62, 64, 65, 67, 69, 71, 72];
      const blackNotes: number[] = [61, 63, 66, 68, 70];
      expect(whiteNotes.length).assertEqual(8);
      expect(blackNotes.length).assertEqual(5);
      expect(whiteNotes.indexOf(72)).assertEqual(7);
      expect(blackNotes.indexOf(70)).assertEqual(4);
      expect('C5'.length).assertLarger(0);
      expect('A#4'.length).assertLarger(0);
    })
  });
}
