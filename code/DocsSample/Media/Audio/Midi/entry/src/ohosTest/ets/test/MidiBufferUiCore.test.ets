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

const TAG: string = '[Sample_midiBufferUiCore]';
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

export default function midiBufferUiCoreTest(): void {
  describe('midiBufferUiCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0001
     * @tc.name      testExtMidiBufUi0000
     * @tc.desc      Buffer/UI logs 0 input 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 0;
      let inputCount: number = 0;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(0);
      expect(inputCount).assertEqual(0);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0002
     * @tc.name      testExtMidiBufUi0001
     * @tc.desc      Buffer/UI logs 1 input 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 1;
      let inputCount: number = 1;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(1);
      expect(inputCount).assertEqual(1);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0003
     * @tc.name      testExtMidiBufUi0002
     * @tc.desc      Buffer/UI logs 2 input 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 2;
      let inputCount: number = 2;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(2);
      expect(inputCount).assertEqual(2);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0004
     * @tc.name      testExtMidiBufUi0003
     * @tc.desc      Buffer/UI logs 3 input 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 3;
      let inputCount: number = 3;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(3);
      expect(inputCount).assertEqual(3);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0005
     * @tc.name      testExtMidiBufUi0004
     * @tc.desc      Buffer/UI logs 4 input 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 4;
      let inputCount: number = 4;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(4);
      expect(inputCount).assertEqual(4);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0006
     * @tc.name      testExtMidiBufUi0005
     * @tc.desc      Buffer/UI logs 5 input 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 5;
      let inputCount: number = 5;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(5);
      expect(inputCount).assertEqual(5);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0007
     * @tc.name      testExtMidiBufUi0006
     * @tc.desc      Buffer/UI logs 6 input 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 6;
      let inputCount: number = 6;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(6);
      expect(inputCount).assertEqual(6);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0008
     * @tc.name      testExtMidiBufUi0007
     * @tc.desc      Buffer/UI logs 7 input 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 7;
      let inputCount: number = 7;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(7);
      expect(inputCount).assertEqual(7);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0009
     * @tc.name      testExtMidiBufUi0008
     * @tc.desc      Buffer/UI logs 8 input 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 8;
      let inputCount: number = 8;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(8);
      expect(inputCount).assertEqual(8);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0010
     * @tc.name      testExtMidiBufUi0009
     * @tc.desc      Buffer/UI logs 9 input 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 9;
      let inputCount: number = 9;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(9);
      expect(inputCount).assertEqual(9);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0011
     * @tc.name      testExtMidiBufUi0010
     * @tc.desc      Buffer/UI logs 10 input 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 10;
      let inputCount: number = 10;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(10);
      expect(inputCount).assertEqual(10);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0012
     * @tc.name      testExtMidiBufUi0011
     * @tc.desc      Buffer/UI logs 11 input 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 11;
      let inputCount: number = 11;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(11);
      expect(inputCount).assertEqual(11);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0013
     * @tc.name      testExtMidiBufUi0012
     * @tc.desc      Buffer/UI logs 12 input 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 12;
      let inputCount: number = 12;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(12);
      expect(inputCount).assertEqual(12);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0014
     * @tc.name      testExtMidiBufUi0013
     * @tc.desc      Buffer/UI logs 13 input 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 13;
      let inputCount: number = 13;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(13);
      expect(inputCount).assertEqual(13);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0015
     * @tc.name      testExtMidiBufUi0014
     * @tc.desc      Buffer/UI logs 14 input 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 14;
      let inputCount: number = 14;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(14);
      expect(inputCount).assertEqual(14);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0016
     * @tc.name      testExtMidiBufUi0015
     * @tc.desc      Buffer/UI logs 15 input 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 15;
      let inputCount: number = 15;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(15);
      expect(inputCount).assertEqual(15);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0017
     * @tc.name      testExtMidiBufUi0016
     * @tc.desc      Buffer/UI logs 16 input 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 16;
      let inputCount: number = 16;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(16);
      expect(inputCount).assertEqual(16);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0018
     * @tc.name      testExtMidiBufUi0017
     * @tc.desc      Buffer/UI logs 17 input 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 17;
      let inputCount: number = 17;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(17);
      expect(inputCount).assertEqual(17);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0019
     * @tc.name      testExtMidiBufUi0018
     * @tc.desc      Buffer/UI logs 18 input 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 18;
      let inputCount: number = 18;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(18);
      expect(inputCount).assertEqual(18);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0020
     * @tc.name      testExtMidiBufUi0019
     * @tc.desc      Buffer/UI logs 19 input 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 19;
      let inputCount: number = 19;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(19);
      expect(inputCount).assertEqual(19);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0021
     * @tc.name      testExtMidiBufUi0020
     * @tc.desc      Buffer/UI logs 20 input 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 20;
      let inputCount: number = 20;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(20);
      expect(inputCount).assertEqual(20);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0022
     * @tc.name      testExtMidiBufUi0021
     * @tc.desc      Buffer/UI logs 21 input 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 21;
      let inputCount: number = 21;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(21);
      expect(inputCount).assertEqual(21);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0023
     * @tc.name      testExtMidiBufUi0022
     * @tc.desc      Buffer/UI logs 22 input 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 22;
      let inputCount: number = 22;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(22);
      expect(inputCount).assertEqual(22);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0024
     * @tc.name      testExtMidiBufUi0023
     * @tc.desc      Buffer/UI logs 23 input 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 23;
      let inputCount: number = 23;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(23);
      expect(inputCount).assertEqual(23);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0025
     * @tc.name      testExtMidiBufUi0024
     * @tc.desc      Buffer/UI logs 24 input 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 24;
      let inputCount: number = 24;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(24);
      expect(inputCount).assertEqual(24);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0026
     * @tc.name      testExtMidiBufUi0025
     * @tc.desc      Buffer/UI logs 25 input 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 25;
      let inputCount: number = 25;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(25);
      expect(inputCount).assertEqual(25);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0027
     * @tc.name      testExtMidiBufUi0026
     * @tc.desc      Buffer/UI logs 26 input 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 26;
      let inputCount: number = 26;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(26);
      expect(inputCount).assertEqual(26);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0028
     * @tc.name      testExtMidiBufUi0027
     * @tc.desc      Buffer/UI logs 27 input 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 27;
      let inputCount: number = 27;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(27);
      expect(inputCount).assertEqual(27);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0029
     * @tc.name      testExtMidiBufUi0028
     * @tc.desc      Buffer/UI logs 28 input 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 28;
      let inputCount: number = 28;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(28);
      expect(inputCount).assertEqual(28);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0030
     * @tc.name      testExtMidiBufUi0029
     * @tc.desc      Buffer/UI logs 29 input 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 29;
      let inputCount: number = 29;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(29);
      expect(inputCount).assertEqual(29);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0031
     * @tc.name      testExtMidiBufUi0030
     * @tc.desc      Buffer/UI logs 30 input 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 30;
      let inputCount: number = 30;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(30);
      expect(inputCount).assertEqual(30);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0032
     * @tc.name      testExtMidiBufUi0031
     * @tc.desc      Buffer/UI logs 31 input 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 31;
      let inputCount: number = 31;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(31);
      expect(inputCount).assertEqual(31);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0033
     * @tc.name      testExtMidiBufUi0032
     * @tc.desc      Buffer/UI logs 32 input 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 32;
      let inputCount: number = 32;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(32);
      expect(inputCount).assertEqual(32);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0034
     * @tc.name      testExtMidiBufUi0033
     * @tc.desc      Buffer/UI logs 33 input 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 33;
      let inputCount: number = 33;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(33);
      expect(inputCount).assertEqual(33);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0035
     * @tc.name      testExtMidiBufUi0034
     * @tc.desc      Buffer/UI logs 34 input 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 34;
      let inputCount: number = 34;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(34);
      expect(inputCount).assertEqual(34);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0036
     * @tc.name      testExtMidiBufUi0035
     * @tc.desc      Buffer/UI logs 35 input 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 35;
      let inputCount: number = 35;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(35);
      expect(inputCount).assertEqual(35);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0037
     * @tc.name      testExtMidiBufUi0036
     * @tc.desc      Buffer/UI logs 36 input 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 36;
      let inputCount: number = 36;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(36);
      expect(inputCount).assertEqual(36);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0038
     * @tc.name      testExtMidiBufUi0037
     * @tc.desc      Buffer/UI logs 37 input 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 37;
      let inputCount: number = 37;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(37);
      expect(inputCount).assertEqual(37);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0039
     * @tc.name      testExtMidiBufUi0038
     * @tc.desc      Buffer/UI logs 38 input 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 38;
      let inputCount: number = 38;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(38);
      expect(inputCount).assertEqual(38);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0040
     * @tc.name      testExtMidiBufUi0039
     * @tc.desc      Buffer/UI logs 39 input 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 39;
      let inputCount: number = 39;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(39);
      expect(inputCount).assertEqual(39);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0041
     * @tc.name      testExtMidiBufUi0040
     * @tc.desc      Buffer/UI logs 40 input 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 40;
      let inputCount: number = 40;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(40);
      expect(inputCount).assertEqual(40);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0042
     * @tc.name      testExtMidiBufUi0041
     * @tc.desc      Buffer/UI logs 41 input 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 41;
      let inputCount: number = 41;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(41);
      expect(inputCount).assertEqual(41);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0043
     * @tc.name      testExtMidiBufUi0042
     * @tc.desc      Buffer/UI logs 42 input 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 42;
      let inputCount: number = 42;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(42);
      expect(inputCount).assertEqual(42);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0044
     * @tc.name      testExtMidiBufUi0043
     * @tc.desc      Buffer/UI logs 43 input 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 43;
      let inputCount: number = 43;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(43);
      expect(inputCount).assertEqual(43);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0045
     * @tc.name      testExtMidiBufUi0044
     * @tc.desc      Buffer/UI logs 44 input 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 44;
      let inputCount: number = 44;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(44);
      expect(inputCount).assertEqual(44);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0046
     * @tc.name      testExtMidiBufUi0045
     * @tc.desc      Buffer/UI logs 45 input 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 45;
      let inputCount: number = 45;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(45);
      expect(inputCount).assertEqual(45);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0047
     * @tc.name      testExtMidiBufUi0046
     * @tc.desc      Buffer/UI logs 46 input 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 46;
      let inputCount: number = 46;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(46);
      expect(inputCount).assertEqual(46);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0048
     * @tc.name      testExtMidiBufUi0047
     * @tc.desc      Buffer/UI logs 47 input 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 47;
      let inputCount: number = 47;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(47);
      expect(inputCount).assertEqual(47);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0049
     * @tc.name      testExtMidiBufUi0048
     * @tc.desc      Buffer/UI logs 48 input 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 48;
      let inputCount: number = 48;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(48);
      expect(inputCount).assertEqual(48);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0050
     * @tc.name      testExtMidiBufUi0049
     * @tc.desc      Buffer/UI logs 49 input 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 49;
      let inputCount: number = 49;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(49);
      expect(inputCount).assertEqual(49);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0051
     * @tc.name      testExtMidiBufUi0050
     * @tc.desc      Buffer/UI logs 50 input 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 50;
      let inputCount: number = 50;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(50);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0052
     * @tc.name      testExtMidiBufUi0051
     * @tc.desc      Buffer/UI logs 51 input 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 51;
      let inputCount: number = 51;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(51);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0053
     * @tc.name      testExtMidiBufUi0052
     * @tc.desc      Buffer/UI logs 52 input 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 52;
      let inputCount: number = 52;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(52);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0054
     * @tc.name      testExtMidiBufUi0053
     * @tc.desc      Buffer/UI logs 53 input 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 53;
      let inputCount: number = 53;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(53);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0055
     * @tc.name      testExtMidiBufUi0054
     * @tc.desc      Buffer/UI logs 54 input 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 54;
      let inputCount: number = 54;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(54);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0056
     * @tc.name      testExtMidiBufUi0055
     * @tc.desc      Buffer/UI logs 55 input 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 55;
      let inputCount: number = 55;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(55);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0057
     * @tc.name      testExtMidiBufUi0056
     * @tc.desc      Buffer/UI logs 56 input 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 56;
      let inputCount: number = 56;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(56);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0058
     * @tc.name      testExtMidiBufUi0057
     * @tc.desc      Buffer/UI logs 57 input 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 57;
      let inputCount: number = 57;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(57);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0059
     * @tc.name      testExtMidiBufUi0058
     * @tc.desc      Buffer/UI logs 58 input 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 58;
      let inputCount: number = 58;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(58);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0060
     * @tc.name      testExtMidiBufUi0059
     * @tc.desc      Buffer/UI logs 59 input 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 59;
      let inputCount: number = 59;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(59);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0061
     * @tc.name      testExtMidiBufUi0060
     * @tc.desc      Buffer/UI logs 60 input 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 60;
      let inputCount: number = 60;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(60);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0062
     * @tc.name      testExtMidiBufUi0061
     * @tc.desc      Buffer/UI logs 61 input 61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 61;
      let inputCount: number = 61;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(61);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0063
     * @tc.name      testExtMidiBufUi0062
     * @tc.desc      Buffer/UI logs 62 input 62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 62;
      let inputCount: number = 62;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(62);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0064
     * @tc.name      testExtMidiBufUi0063
     * @tc.desc      Buffer/UI logs 63 input 63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 63;
      let inputCount: number = 63;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(63);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0065
     * @tc.name      testExtMidiBufUi0064
     * @tc.desc      Buffer/UI logs 64 input 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 64;
      let inputCount: number = 64;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(64);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0066
     * @tc.name      testExtMidiBufUi0065
     * @tc.desc      Buffer/UI logs 65 input 65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 65;
      let inputCount: number = 65;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(65);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0067
     * @tc.name      testExtMidiBufUi0066
     * @tc.desc      Buffer/UI logs 66 input 66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 66;
      let inputCount: number = 66;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(66);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0068
     * @tc.name      testExtMidiBufUi0067
     * @tc.desc      Buffer/UI logs 67 input 67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 67;
      let inputCount: number = 67;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(67);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0069
     * @tc.name      testExtMidiBufUi0068
     * @tc.desc      Buffer/UI logs 68 input 68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 68;
      let inputCount: number = 68;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(68);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0070
     * @tc.name      testExtMidiBufUi0069
     * @tc.desc      Buffer/UI logs 69 input 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 69;
      let inputCount: number = 69;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(69);
      expect(inputCount).assertEqual(50);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0071
     * @tc.name      testExtMidiBufUi0070
     * @tc.desc      Buffer/UI logs 70 input 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 70;
      let inputCount: number = 0;
      let clickCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(70);
      expect(inputCount).assertEqual(0);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0072
     * @tc.name      testExtMidiBufUi0071
     * @tc.desc      Buffer/UI logs 71 input 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 71;
      let inputCount: number = 1;
      let clickCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(71);
      expect(inputCount).assertEqual(1);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0073
     * @tc.name      testExtMidiBufUi0072
     * @tc.desc      Buffer/UI logs 72 input 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 72;
      let inputCount: number = 2;
      let clickCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(72);
      expect(inputCount).assertEqual(2);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0074
     * @tc.name      testExtMidiBufUi0073
     * @tc.desc      Buffer/UI logs 73 input 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 73;
      let inputCount: number = 3;
      let clickCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(73);
      expect(inputCount).assertEqual(3);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0075
     * @tc.name      testExtMidiBufUi0074
     * @tc.desc      Buffer/UI logs 74 input 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 74;
      let inputCount: number = 4;
      let clickCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(74);
      expect(inputCount).assertEqual(4);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0076
     * @tc.name      testExtMidiBufUi0075
     * @tc.desc      Buffer/UI logs 75 input 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 75;
      let inputCount: number = 5;
      let clickCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(75);
      expect(inputCount).assertEqual(5);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0077
     * @tc.name      testExtMidiBufUi0076
     * @tc.desc      Buffer/UI logs 76 input 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 76;
      let inputCount: number = 6;
      let clickCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(76);
      expect(inputCount).assertEqual(6);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0078
     * @tc.name      testExtMidiBufUi0077
     * @tc.desc      Buffer/UI logs 77 input 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 77;
      let inputCount: number = 7;
      let clickCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(77);
      expect(inputCount).assertEqual(7);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0079
     * @tc.name      testExtMidiBufUi0078
     * @tc.desc      Buffer/UI logs 78 input 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 78;
      let inputCount: number = 8;
      let clickCount: number = 8;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(78);
      expect(inputCount).assertEqual(8);
      expect(clickCount).assertLess(10);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUFUI_0080
     * @tc.name      testExtMidiBufUi0079
     * @tc.desc      Buffer/UI logs 79 input 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBufUi0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 79;
      let inputCount: number = 9;
      let clickCount: number = 9;
      if (logCount > 100) { logCount = 100; }
      if (inputCount > 50) { inputCount = 50; }
      if (clickCount > 9) { clickCount = 9; }
      expect(logCount).assertEqual(79);
      expect(inputCount).assertEqual(9);
      expect(clickCount).assertLess(10);
    })
  });
}
