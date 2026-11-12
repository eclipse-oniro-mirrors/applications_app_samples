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

const TAG: string = '[Sample_midiNoteFrequencyCore]';
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

export default function midiNoteFrequencyCoreTest(): void {
  describe('midiNoteFrequencyCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0001
     * @tc.name      testExtMidiFreq0000
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0002
     * @tc.name      testExtMidiFreq0001
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0003
     * @tc.name      testExtMidiFreq0002
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0004
     * @tc.name      testExtMidiFreq0003
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0005
     * @tc.name      testExtMidiFreq0004
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0006
     * @tc.name      testExtMidiFreq0005
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0007
     * @tc.name      testExtMidiFreq0006
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0008
     * @tc.name      testExtMidiFreq0007
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0009
     * @tc.name      testExtMidiFreq0008
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0010
     * @tc.name      testExtMidiFreq0009
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0011
     * @tc.name      testExtMidiFreq0010
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0012
     * @tc.name      testExtMidiFreq0011
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0013
     * @tc.name      testExtMidiFreq0012
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0014
     * @tc.name      testExtMidiFreq0013
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0015
     * @tc.name      testExtMidiFreq0014
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0016
     * @tc.name      testExtMidiFreq0015
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0017
     * @tc.name      testExtMidiFreq0016
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0018
     * @tc.name      testExtMidiFreq0017
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0019
     * @tc.name      testExtMidiFreq0018
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0020
     * @tc.name      testExtMidiFreq0019
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0021
     * @tc.name      testExtMidiFreq0020
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0022
     * @tc.name      testExtMidiFreq0021
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0023
     * @tc.name      testExtMidiFreq0022
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0024
     * @tc.name      testExtMidiFreq0023
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0025
     * @tc.name      testExtMidiFreq0024
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0026
     * @tc.name      testExtMidiFreq0025
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0027
     * @tc.name      testExtMidiFreq0026
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0028
     * @tc.name      testExtMidiFreq0027
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0029
     * @tc.name      testExtMidiFreq0028
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0030
     * @tc.name      testExtMidiFreq0029
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0031
     * @tc.name      testExtMidiFreq0030
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0032
     * @tc.name      testExtMidiFreq0031
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0033
     * @tc.name      testExtMidiFreq0032
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0034
     * @tc.name      testExtMidiFreq0033
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0035
     * @tc.name      testExtMidiFreq0034
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0036
     * @tc.name      testExtMidiFreq0035
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0037
     * @tc.name      testExtMidiFreq0036
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0038
     * @tc.name      testExtMidiFreq0037
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0039
     * @tc.name      testExtMidiFreq0038
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0040
     * @tc.name      testExtMidiFreq0039
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0041
     * @tc.name      testExtMidiFreq0040
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0042
     * @tc.name      testExtMidiFreq0041
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0043
     * @tc.name      testExtMidiFreq0042
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0044
     * @tc.name      testExtMidiFreq0043
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0045
     * @tc.name      testExtMidiFreq0044
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0046
     * @tc.name      testExtMidiFreq0045
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0047
     * @tc.name      testExtMidiFreq0046
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0048
     * @tc.name      testExtMidiFreq0047
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0049
     * @tc.name      testExtMidiFreq0048
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0050
     * @tc.name      testExtMidiFreq0049
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0051
     * @tc.name      testExtMidiFreq0050
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0052
     * @tc.name      testExtMidiFreq0051
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0053
     * @tc.name      testExtMidiFreq0052
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0054
     * @tc.name      testExtMidiFreq0053
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0055
     * @tc.name      testExtMidiFreq0054
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0056
     * @tc.name      testExtMidiFreq0055
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0057
     * @tc.name      testExtMidiFreq0056
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0058
     * @tc.name      testExtMidiFreq0057
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0059
     * @tc.name      testExtMidiFreq0058
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0060
     * @tc.name      testExtMidiFreq0059
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0061
     * @tc.name      testExtMidiFreq0060
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0062
     * @tc.name      testExtMidiFreq0061
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0063
     * @tc.name      testExtMidiFreq0062
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0064
     * @tc.name      testExtMidiFreq0063
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0065
     * @tc.name      testExtMidiFreq0064
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0066
     * @tc.name      testExtMidiFreq0065
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0067
     * @tc.name      testExtMidiFreq0066
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0068
     * @tc.name      testExtMidiFreq0067
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0069
     * @tc.name      testExtMidiFreq0068
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0070
     * @tc.name      testExtMidiFreq0069
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0071
     * @tc.name      testExtMidiFreq0070
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0072
     * @tc.name      testExtMidiFreq0071
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0073
     * @tc.name      testExtMidiFreq0072
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0074
     * @tc.name      testExtMidiFreq0073
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0075
     * @tc.name      testExtMidiFreq0074
     * @tc.desc      Note C#4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 61;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C#' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0076
     * @tc.name      testExtMidiFreq0075
     * @tc.desc      Note A4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 69;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'A' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0077
     * @tc.name      testExtMidiFreq0076
     * @tc.desc      Note C5 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 72;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0078
     * @tc.name      testExtMidiFreq0077
     * @tc.desc      Note C6 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 84;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0079
     * @tc.name      testExtMidiFreq0078
     * @tc.desc      Note C3 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 48;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_FREQ_0080
     * @tc.name      testExtMidiFreq0079
     * @tc.desc      Note C4 frequency.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiFreq0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const note: number = 60;
      const octave: number = Math.floor(note / 12) - 1;
      const name: string = 'C' + octave.toString();
      const frequency: number = 440 * Math.pow(2, (note - 69) / 12);
      expect(name.length).assertLarger(1);
      expect(octave).assertLargerOrEqual(-1);
      expect(frequency).assertLarger(0);
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
    })
  });
}
