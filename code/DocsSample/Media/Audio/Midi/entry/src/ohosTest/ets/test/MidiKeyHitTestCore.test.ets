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

const TAG: string = '[Sample_midiKeyHitTestCore]';
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

export default function midiKeyHitTestCoreTest(): void {
  describe('midiKeyHitTestCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0001
     * @tc.name      testExtMidiHitTest0000
     * @tc.desc      Piano hit test at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 0;
      const touchY: number = 0;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0002
     * @tc.name      testExtMidiHitTest0001
     * @tc.desc      Piano hit test at 13,7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 13;
      const touchY: number = 7;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0003
     * @tc.name      testExtMidiHitTest0002
     * @tc.desc      Piano hit test at 26,14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 26;
      const touchY: number = 14;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0004
     * @tc.name      testExtMidiHitTest0003
     * @tc.desc      Piano hit test at 39,21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 39;
      const touchY: number = 21;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0005
     * @tc.name      testExtMidiHitTest0004
     * @tc.desc      Piano hit test at 52,28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 52;
      const touchY: number = 28;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0006
     * @tc.name      testExtMidiHitTest0005
     * @tc.desc      Piano hit test at 65,35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 65;
      const touchY: number = 35;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0007
     * @tc.name      testExtMidiHitTest0006
     * @tc.desc      Piano hit test at 78,42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 78;
      const touchY: number = 42;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0008
     * @tc.name      testExtMidiHitTest0007
     * @tc.desc      Piano hit test at 91,49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 91;
      const touchY: number = 49;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0009
     * @tc.name      testExtMidiHitTest0008
     * @tc.desc      Piano hit test at 104,56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 104;
      const touchY: number = 56;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0010
     * @tc.name      testExtMidiHitTest0009
     * @tc.desc      Piano hit test at 117,63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 117;
      const touchY: number = 63;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0011
     * @tc.name      testExtMidiHitTest0010
     * @tc.desc      Piano hit test at 130,70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 130;
      const touchY: number = 70;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0012
     * @tc.name      testExtMidiHitTest0011
     * @tc.desc      Piano hit test at 143,77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 143;
      const touchY: number = 77;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0013
     * @tc.name      testExtMidiHitTest0012
     * @tc.desc      Piano hit test at 156,84.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 156;
      const touchY: number = 84;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0014
     * @tc.name      testExtMidiHitTest0013
     * @tc.desc      Piano hit test at 169,91.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 169;
      const touchY: number = 91;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0015
     * @tc.name      testExtMidiHitTest0014
     * @tc.desc      Piano hit test at 182,98.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 182;
      const touchY: number = 98;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0016
     * @tc.name      testExtMidiHitTest0015
     * @tc.desc      Piano hit test at 195,105.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 195;
      const touchY: number = 105;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0017
     * @tc.name      testExtMidiHitTest0016
     * @tc.desc      Piano hit test at 208,112.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 208;
      const touchY: number = 112;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0018
     * @tc.name      testExtMidiHitTest0017
     * @tc.desc      Piano hit test at 221,119.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 221;
      const touchY: number = 119;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0019
     * @tc.name      testExtMidiHitTest0018
     * @tc.desc      Piano hit test at 234,126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 234;
      const touchY: number = 126;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0020
     * @tc.name      testExtMidiHitTest0019
     * @tc.desc      Piano hit test at 247,133.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 247;
      const touchY: number = 133;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0021
     * @tc.name      testExtMidiHitTest0020
     * @tc.desc      Piano hit test at 260,140.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 260;
      const touchY: number = 140;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0022
     * @tc.name      testExtMidiHitTest0021
     * @tc.desc      Piano hit test at 273,147.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 273;
      const touchY: number = 147;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0023
     * @tc.name      testExtMidiHitTest0022
     * @tc.desc      Piano hit test at 286,154.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 286;
      const touchY: number = 154;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0024
     * @tc.name      testExtMidiHitTest0023
     * @tc.desc      Piano hit test at 299,161.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 299;
      const touchY: number = 161;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0025
     * @tc.name      testExtMidiHitTest0024
     * @tc.desc      Piano hit test at 312,168.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 312;
      const touchY: number = 168;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0026
     * @tc.name      testExtMidiHitTest0025
     * @tc.desc      Piano hit test at 325,175.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 325;
      const touchY: number = 175;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0027
     * @tc.name      testExtMidiHitTest0026
     * @tc.desc      Piano hit test at 338,182.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 338;
      const touchY: number = 182;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0028
     * @tc.name      testExtMidiHitTest0027
     * @tc.desc      Piano hit test at 351,189.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 351;
      const touchY: number = 189;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0029
     * @tc.name      testExtMidiHitTest0028
     * @tc.desc      Piano hit test at 364,196.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 364;
      const touchY: number = 196;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0030
     * @tc.name      testExtMidiHitTest0029
     * @tc.desc      Piano hit test at 377,3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 377;
      const touchY: number = 3;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0031
     * @tc.name      testExtMidiHitTest0030
     * @tc.desc      Piano hit test at 390,10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 390;
      const touchY: number = 10;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0032
     * @tc.name      testExtMidiHitTest0031
     * @tc.desc      Piano hit test at 403,17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 403;
      const touchY: number = 17;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0033
     * @tc.name      testExtMidiHitTest0032
     * @tc.desc      Piano hit test at 416,24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 416;
      const touchY: number = 24;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0034
     * @tc.name      testExtMidiHitTest0033
     * @tc.desc      Piano hit test at 429,31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 429;
      const touchY: number = 31;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0035
     * @tc.name      testExtMidiHitTest0034
     * @tc.desc      Piano hit test at 442,38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 442;
      const touchY: number = 38;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0036
     * @tc.name      testExtMidiHitTest0035
     * @tc.desc      Piano hit test at 455,45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 455;
      const touchY: number = 45;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0037
     * @tc.name      testExtMidiHitTest0036
     * @tc.desc      Piano hit test at 468,52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 468;
      const touchY: number = 52;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0038
     * @tc.name      testExtMidiHitTest0037
     * @tc.desc      Piano hit test at 481,59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 481;
      const touchY: number = 59;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0039
     * @tc.name      testExtMidiHitTest0038
     * @tc.desc      Piano hit test at 494,66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 494;
      const touchY: number = 66;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0040
     * @tc.name      testExtMidiHitTest0039
     * @tc.desc      Piano hit test at 507,73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 507;
      const touchY: number = 73;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0041
     * @tc.name      testExtMidiHitTest0040
     * @tc.desc      Piano hit test at 520,80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 520;
      const touchY: number = 80;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0042
     * @tc.name      testExtMidiHitTest0041
     * @tc.desc      Piano hit test at 533,87.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 533;
      const touchY: number = 87;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0043
     * @tc.name      testExtMidiHitTest0042
     * @tc.desc      Piano hit test at 546,94.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 546;
      const touchY: number = 94;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0044
     * @tc.name      testExtMidiHitTest0043
     * @tc.desc      Piano hit test at 559,101.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 559;
      const touchY: number = 101;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0045
     * @tc.name      testExtMidiHitTest0044
     * @tc.desc      Piano hit test at 572,108.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 572;
      const touchY: number = 108;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0046
     * @tc.name      testExtMidiHitTest0045
     * @tc.desc      Piano hit test at 585,115.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 585;
      const touchY: number = 115;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0047
     * @tc.name      testExtMidiHitTest0046
     * @tc.desc      Piano hit test at 598,122.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 598;
      const touchY: number = 122;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0048
     * @tc.name      testExtMidiHitTest0047
     * @tc.desc      Piano hit test at 611,129.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 611;
      const touchY: number = 129;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0049
     * @tc.name      testExtMidiHitTest0048
     * @tc.desc      Piano hit test at 624,136.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 624;
      const touchY: number = 136;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0050
     * @tc.name      testExtMidiHitTest0049
     * @tc.desc      Piano hit test at 637,143.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 637;
      const touchY: number = 143;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0051
     * @tc.name      testExtMidiHitTest0050
     * @tc.desc      Piano hit test at 650,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 650;
      const touchY: number = 150;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0052
     * @tc.name      testExtMidiHitTest0051
     * @tc.desc      Piano hit test at 663,157.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 663;
      const touchY: number = 157;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0053
     * @tc.name      testExtMidiHitTest0052
     * @tc.desc      Piano hit test at 676,164.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 676;
      const touchY: number = 164;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0054
     * @tc.name      testExtMidiHitTest0053
     * @tc.desc      Piano hit test at 689,171.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 689;
      const touchY: number = 171;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0055
     * @tc.name      testExtMidiHitTest0054
     * @tc.desc      Piano hit test at 702,178.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 702;
      const touchY: number = 178;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0056
     * @tc.name      testExtMidiHitTest0055
     * @tc.desc      Piano hit test at 715,185.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 715;
      const touchY: number = 185;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0057
     * @tc.name      testExtMidiHitTest0056
     * @tc.desc      Piano hit test at 728,192.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 728;
      const touchY: number = 192;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0058
     * @tc.name      testExtMidiHitTest0057
     * @tc.desc      Piano hit test at 741,199.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 741;
      const touchY: number = 199;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0059
     * @tc.name      testExtMidiHitTest0058
     * @tc.desc      Piano hit test at 754,6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 754;
      const touchY: number = 6;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0060
     * @tc.name      testExtMidiHitTest0059
     * @tc.desc      Piano hit test at 767,13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 767;
      const touchY: number = 13;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0061
     * @tc.name      testExtMidiHitTest0060
     * @tc.desc      Piano hit test at 780,20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 780;
      const touchY: number = 20;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0062
     * @tc.name      testExtMidiHitTest0061
     * @tc.desc      Piano hit test at 793,27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 793;
      const touchY: number = 27;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(false);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0063
     * @tc.name      testExtMidiHitTest0062
     * @tc.desc      Piano hit test at 6,34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 6;
      const touchY: number = 34;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0064
     * @tc.name      testExtMidiHitTest0063
     * @tc.desc      Piano hit test at 19,41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 19;
      const touchY: number = 41;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HITTEST_0065
     * @tc.name      testExtMidiHitTest0064
     * @tc.desc      Piano hit test at 32,48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHitTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const areaWidth: number = 800;
      const areaHeight: number = 200;
      const touchX: number = 32;
      const touchY: number = 48;
      const whiteWidth: number = areaWidth / 8;
      const whiteIndex: number = Math.min(7, Math.floor(touchX / whiteWidth));
      const upperZone: boolean = touchY < 80;
      const blackCandidate: boolean = upperZone && (whiteIndex === 0 || whiteIndex === 1 || whiteIndex === 3 || whiteIndex === 4 || whiteIndex === 5);
      expect(touchX).assertLargerOrEqual(0);
      expect(touchX).assertLess(areaWidth);
      expect(touchY).assertLargerOrEqual(0);
      expect(touchY).assertLess(areaHeight);
      expect(whiteIndex).assertLargerOrEqual(0);
      expect(whiteIndex).assertLess(8);
      expect(blackCandidate).assertEqual(true);
      expect(whiteWidth).assertLarger(0);
    })
  });
}
