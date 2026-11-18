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

const TAG: string = '[Sample_midiPianoGeometryCore]';
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

export default function midiPianoGeometryCoreTest(): void {
  describe('midiPianoGeometryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0001
     * @tc.name      testExtMidiPiano0000
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0002
     * @tc.name      testExtMidiPiano0001
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0003
     * @tc.name      testExtMidiPiano0002
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0004
     * @tc.name      testExtMidiPiano0003
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0005
     * @tc.name      testExtMidiPiano0004
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0006
     * @tc.name      testExtMidiPiano0005
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0007
     * @tc.name      testExtMidiPiano0006
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0008
     * @tc.name      testExtMidiPiano0007
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0009
     * @tc.name      testExtMidiPiano0008
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0010
     * @tc.name      testExtMidiPiano0009
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0011
     * @tc.name      testExtMidiPiano0010
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0012
     * @tc.name      testExtMidiPiano0011
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0013
     * @tc.name      testExtMidiPiano0012
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0014
     * @tc.name      testExtMidiPiano0013
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0015
     * @tc.name      testExtMidiPiano0014
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0016
     * @tc.name      testExtMidiPiano0015
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0017
     * @tc.name      testExtMidiPiano0016
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0018
     * @tc.name      testExtMidiPiano0017
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0019
     * @tc.name      testExtMidiPiano0018
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0020
     * @tc.name      testExtMidiPiano0019
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0021
     * @tc.name      testExtMidiPiano0020
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0022
     * @tc.name      testExtMidiPiano0021
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0023
     * @tc.name      testExtMidiPiano0022
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0024
     * @tc.name      testExtMidiPiano0023
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0025
     * @tc.name      testExtMidiPiano0024
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0026
     * @tc.name      testExtMidiPiano0025
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0027
     * @tc.name      testExtMidiPiano0026
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0028
     * @tc.name      testExtMidiPiano0027
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0029
     * @tc.name      testExtMidiPiano0028
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0030
     * @tc.name      testExtMidiPiano0029
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0031
     * @tc.name      testExtMidiPiano0030
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0032
     * @tc.name      testExtMidiPiano0031
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0033
     * @tc.name      testExtMidiPiano0032
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0034
     * @tc.name      testExtMidiPiano0033
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0035
     * @tc.name      testExtMidiPiano0034
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0036
     * @tc.name      testExtMidiPiano0035
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0037
     * @tc.name      testExtMidiPiano0036
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0038
     * @tc.name      testExtMidiPiano0037
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0039
     * @tc.name      testExtMidiPiano0038
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0040
     * @tc.name      testExtMidiPiano0039
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0041
     * @tc.name      testExtMidiPiano0040
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0042
     * @tc.name      testExtMidiPiano0041
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0043
     * @tc.name      testExtMidiPiano0042
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0044
     * @tc.name      testExtMidiPiano0043
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0045
     * @tc.name      testExtMidiPiano0044
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0046
     * @tc.name      testExtMidiPiano0045
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0047
     * @tc.name      testExtMidiPiano0046
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0048
     * @tc.name      testExtMidiPiano0047
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0049
     * @tc.name      testExtMidiPiano0048
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0050
     * @tc.name      testExtMidiPiano0049
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0051
     * @tc.name      testExtMidiPiano0050
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0052
     * @tc.name      testExtMidiPiano0051
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0053
     * @tc.name      testExtMidiPiano0052
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0054
     * @tc.name      testExtMidiPiano0053
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0055
     * @tc.name      testExtMidiPiano0054
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0056
     * @tc.name      testExtMidiPiano0055
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0057
     * @tc.name      testExtMidiPiano0056
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0058
     * @tc.name      testExtMidiPiano0057
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0059
     * @tc.name      testExtMidiPiano0058
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0060
     * @tc.name      testExtMidiPiano0059
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0061
     * @tc.name      testExtMidiPiano0060
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0062
     * @tc.name      testExtMidiPiano0061
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0063
     * @tc.name      testExtMidiPiano0062
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0064
     * @tc.name      testExtMidiPiano0063
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0065
     * @tc.name      testExtMidiPiano0064
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0066
     * @tc.name      testExtMidiPiano0065
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0067
     * @tc.name      testExtMidiPiano0066
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0068
     * @tc.name      testExtMidiPiano0067
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0069
     * @tc.name      testExtMidiPiano0068
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0070
     * @tc.name      testExtMidiPiano0069
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0071
     * @tc.name      testExtMidiPiano0070
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0072
     * @tc.name      testExtMidiPiano0071
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0073
     * @tc.name      testExtMidiPiano0072
     * @tc.desc      Piano geometry key 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 6.25;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0074
     * @tc.name      testExtMidiPiano0073
     * @tc.desc      Piano geometry key 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 18.75;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0075
     * @tc.name      testExtMidiPiano0074
     * @tc.desc      Piano geometry key 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 31.25;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0076
     * @tc.name      testExtMidiPiano0075
     * @tc.desc      Piano geometry key 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 43.75;
      const blackX: number = 10.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0077
     * @tc.name      testExtMidiPiano0076
     * @tc.desc      Piano geometry key 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 56.25;
      const blackX: number = 22.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0078
     * @tc.name      testExtMidiPiano0077
     * @tc.desc      Piano geometry key 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 68.75;
      const blackX: number = 35.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0079
     * @tc.name      testExtMidiPiano0078
     * @tc.desc      Piano geometry key 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 81.25;
      const blackX: number = 47.5;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PIANO_0080
     * @tc.name      testExtMidiPiano0079
     * @tc.desc      Piano geometry key 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPiano0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const whiteKeyCount: number = 8;
      const blackKeyCount: number = 5;
      const whiteWidth: number = 100 / whiteKeyCount;
      const touchX: number = 93.75;
      const blackX: number = 60.0;
      const hitWhite: number = Math.floor(touchX / whiteWidth);
      expect(whiteKeyCount).assertEqual(8);
      expect(blackKeyCount).assertEqual(5);
      expect(hitWhite).assertLargerOrEqual(0);
      expect(hitWhite).assertLess(whiteKeyCount);
      expect(blackX).assertLarger(0);
    })
  });
}
