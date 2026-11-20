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

const TAG: string = '[Sample_midiPianoMultiTouchCore]';
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

export default function midiPianoMultiTouchCoreTest(): void {
  describe('midiPianoMultiTouchCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0001
     * @tc.name      testExtMidiMulti0000
     * @tc.desc      Multi-touch 1 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0002
     * @tc.name      testExtMidiMulti0001
     * @tc.desc      Multi-touch 2 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0003
     * @tc.name      testExtMidiMulti0002
     * @tc.desc      Multi-touch 3 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0004
     * @tc.name      testExtMidiMulti0003
     * @tc.desc      Multi-touch 4 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0005
     * @tc.name      testExtMidiMulti0004
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0006
     * @tc.name      testExtMidiMulti0005
     * @tc.desc      Multi-touch 2 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0007
     * @tc.name      testExtMidiMulti0006
     * @tc.desc      Multi-touch 3 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0008
     * @tc.name      testExtMidiMulti0007
     * @tc.desc      Multi-touch 4 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0009
     * @tc.name      testExtMidiMulti0008
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0010
     * @tc.name      testExtMidiMulti0009
     * @tc.desc      Multi-touch 2 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0011
     * @tc.name      testExtMidiMulti0010
     * @tc.desc      Multi-touch 3 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0012
     * @tc.name      testExtMidiMulti0011
     * @tc.desc      Multi-touch 4 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0013
     * @tc.name      testExtMidiMulti0012
     * @tc.desc      Multi-touch 1 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0014
     * @tc.name      testExtMidiMulti0013
     * @tc.desc      Multi-touch 2 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0015
     * @tc.name      testExtMidiMulti0014
     * @tc.desc      Multi-touch 3 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0016
     * @tc.name      testExtMidiMulti0015
     * @tc.desc      Multi-touch 4 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0017
     * @tc.name      testExtMidiMulti0016
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0018
     * @tc.name      testExtMidiMulti0017
     * @tc.desc      Multi-touch 2 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0019
     * @tc.name      testExtMidiMulti0018
     * @tc.desc      Multi-touch 3 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0020
     * @tc.name      testExtMidiMulti0019
     * @tc.desc      Multi-touch 4 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0021
     * @tc.name      testExtMidiMulti0020
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0022
     * @tc.name      testExtMidiMulti0021
     * @tc.desc      Multi-touch 2 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0023
     * @tc.name      testExtMidiMulti0022
     * @tc.desc      Multi-touch 3 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0024
     * @tc.name      testExtMidiMulti0023
     * @tc.desc      Multi-touch 4 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0025
     * @tc.name      testExtMidiMulti0024
     * @tc.desc      Multi-touch 1 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0026
     * @tc.name      testExtMidiMulti0025
     * @tc.desc      Multi-touch 2 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0027
     * @tc.name      testExtMidiMulti0026
     * @tc.desc      Multi-touch 3 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0028
     * @tc.name      testExtMidiMulti0027
     * @tc.desc      Multi-touch 4 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0029
     * @tc.name      testExtMidiMulti0028
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0030
     * @tc.name      testExtMidiMulti0029
     * @tc.desc      Multi-touch 2 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0031
     * @tc.name      testExtMidiMulti0030
     * @tc.desc      Multi-touch 3 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0032
     * @tc.name      testExtMidiMulti0031
     * @tc.desc      Multi-touch 4 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0033
     * @tc.name      testExtMidiMulti0032
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0034
     * @tc.name      testExtMidiMulti0033
     * @tc.desc      Multi-touch 2 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0035
     * @tc.name      testExtMidiMulti0034
     * @tc.desc      Multi-touch 3 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0036
     * @tc.name      testExtMidiMulti0035
     * @tc.desc      Multi-touch 4 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0037
     * @tc.name      testExtMidiMulti0036
     * @tc.desc      Multi-touch 1 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0038
     * @tc.name      testExtMidiMulti0037
     * @tc.desc      Multi-touch 2 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0039
     * @tc.name      testExtMidiMulti0038
     * @tc.desc      Multi-touch 3 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0040
     * @tc.name      testExtMidiMulti0039
     * @tc.desc      Multi-touch 4 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0041
     * @tc.name      testExtMidiMulti0040
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0042
     * @tc.name      testExtMidiMulti0041
     * @tc.desc      Multi-touch 2 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0043
     * @tc.name      testExtMidiMulti0042
     * @tc.desc      Multi-touch 3 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0044
     * @tc.name      testExtMidiMulti0043
     * @tc.desc      Multi-touch 4 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0045
     * @tc.name      testExtMidiMulti0044
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0046
     * @tc.name      testExtMidiMulti0045
     * @tc.desc      Multi-touch 2 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0047
     * @tc.name      testExtMidiMulti0046
     * @tc.desc      Multi-touch 3 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0048
     * @tc.name      testExtMidiMulti0047
     * @tc.desc      Multi-touch 4 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0049
     * @tc.name      testExtMidiMulti0048
     * @tc.desc      Multi-touch 1 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0050
     * @tc.name      testExtMidiMulti0049
     * @tc.desc      Multi-touch 2 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0051
     * @tc.name      testExtMidiMulti0050
     * @tc.desc      Multi-touch 3 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0052
     * @tc.name      testExtMidiMulti0051
     * @tc.desc      Multi-touch 4 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0053
     * @tc.name      testExtMidiMulti0052
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0054
     * @tc.name      testExtMidiMulti0053
     * @tc.desc      Multi-touch 2 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0055
     * @tc.name      testExtMidiMulti0054
     * @tc.desc      Multi-touch 3 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0056
     * @tc.name      testExtMidiMulti0055
     * @tc.desc      Multi-touch 4 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0057
     * @tc.name      testExtMidiMulti0056
     * @tc.desc      Multi-touch 1 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0058
     * @tc.name      testExtMidiMulti0057
     * @tc.desc      Multi-touch 2 notes release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0059
     * @tc.name      testExtMidiMulti0058
     * @tc.desc      Multi-touch 3 notes release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_MULTI_0060
     * @tc.name      testExtMidiMulti0059
     * @tc.desc      Multi-touch 4 notes release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiMulti0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const notes: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < notes.length; index++) { active.push(notes[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(notes.length);
      expect(notes.length).assertLarger(0);
      expect(active.length).assertLargerOrEqual(0);
    })
  });
}
