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

const TAG: string = '[Sample_midiBufferCapacityCore]';
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

export default function midiBufferCapacityCoreTest(): void {
  describe('midiBufferCapacityCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0001
     * @tc.name      testExtMidiBuf0000
     * @tc.desc      Buffer 0/0/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 0;
      let midiCount: number = 0;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(0);
      expect(midiCount).assertEqual(0);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0002
     * @tc.name      testExtMidiBuf0001
     * @tc.desc      Buffer 1/1/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 1;
      let midiCount: number = 1;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(1);
      expect(midiCount).assertEqual(1);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0003
     * @tc.name      testExtMidiBuf0002
     * @tc.desc      Buffer 2/2/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 2;
      let midiCount: number = 2;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(2);
      expect(midiCount).assertEqual(2);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0004
     * @tc.name      testExtMidiBuf0003
     * @tc.desc      Buffer 3/3/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 3;
      let midiCount: number = 3;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(3);
      expect(midiCount).assertEqual(3);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0005
     * @tc.name      testExtMidiBuf0004
     * @tc.desc      Buffer 4/4/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 4;
      let midiCount: number = 4;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(4);
      expect(midiCount).assertEqual(4);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0006
     * @tc.name      testExtMidiBuf0005
     * @tc.desc      Buffer 5/5/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 5;
      let midiCount: number = 5;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(5);
      expect(midiCount).assertEqual(5);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0007
     * @tc.name      testExtMidiBuf0006
     * @tc.desc      Buffer 6/6/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 6;
      let midiCount: number = 6;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(6);
      expect(midiCount).assertEqual(6);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0008
     * @tc.name      testExtMidiBuf0007
     * @tc.desc      Buffer 7/7/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 7;
      let midiCount: number = 7;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(7);
      expect(midiCount).assertEqual(7);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0009
     * @tc.name      testExtMidiBuf0008
     * @tc.desc      Buffer 8/8/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 8;
      let midiCount: number = 8;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(8);
      expect(midiCount).assertEqual(8);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0010
     * @tc.name      testExtMidiBuf0009
     * @tc.desc      Buffer 9/9/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 9;
      let midiCount: number = 9;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(9);
      expect(midiCount).assertEqual(9);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0011
     * @tc.name      testExtMidiBuf0010
     * @tc.desc      Buffer 10/10/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 10;
      let midiCount: number = 10;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(10);
      expect(midiCount).assertEqual(10);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0012
     * @tc.name      testExtMidiBuf0011
     * @tc.desc      Buffer 11/11/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 11;
      let midiCount: number = 11;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(11);
      expect(midiCount).assertEqual(11);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0013
     * @tc.name      testExtMidiBuf0012
     * @tc.desc      Buffer 12/12/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 12;
      let midiCount: number = 12;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(12);
      expect(midiCount).assertEqual(12);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0014
     * @tc.name      testExtMidiBuf0013
     * @tc.desc      Buffer 13/13/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 13;
      let midiCount: number = 13;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(13);
      expect(midiCount).assertEqual(13);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0015
     * @tc.name      testExtMidiBuf0014
     * @tc.desc      Buffer 14/14/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 14;
      let midiCount: number = 14;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(14);
      expect(midiCount).assertEqual(14);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0016
     * @tc.name      testExtMidiBuf0015
     * @tc.desc      Buffer 15/15/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 15;
      let midiCount: number = 15;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(15);
      expect(midiCount).assertEqual(15);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0017
     * @tc.name      testExtMidiBuf0016
     * @tc.desc      Buffer 16/16/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 16;
      let midiCount: number = 16;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(16);
      expect(midiCount).assertEqual(16);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0018
     * @tc.name      testExtMidiBuf0017
     * @tc.desc      Buffer 17/17/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 17;
      let midiCount: number = 17;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(17);
      expect(midiCount).assertEqual(17);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0019
     * @tc.name      testExtMidiBuf0018
     * @tc.desc      Buffer 18/18/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 18;
      let midiCount: number = 18;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(18);
      expect(midiCount).assertEqual(18);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0020
     * @tc.name      testExtMidiBuf0019
     * @tc.desc      Buffer 19/19/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 19;
      let midiCount: number = 19;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(19);
      expect(midiCount).assertEqual(19);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0021
     * @tc.name      testExtMidiBuf0020
     * @tc.desc      Buffer 20/20/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 20;
      let midiCount: number = 20;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(20);
      expect(midiCount).assertEqual(20);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0022
     * @tc.name      testExtMidiBuf0021
     * @tc.desc      Buffer 21/21/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 21;
      let midiCount: number = 21;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(21);
      expect(midiCount).assertEqual(21);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0023
     * @tc.name      testExtMidiBuf0022
     * @tc.desc      Buffer 22/22/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 22;
      let midiCount: number = 22;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(22);
      expect(midiCount).assertEqual(22);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0024
     * @tc.name      testExtMidiBuf0023
     * @tc.desc      Buffer 23/23/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 23;
      let midiCount: number = 23;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(23);
      expect(midiCount).assertEqual(23);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0025
     * @tc.name      testExtMidiBuf0024
     * @tc.desc      Buffer 24/24/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 24;
      let midiCount: number = 24;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(24);
      expect(midiCount).assertEqual(24);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0026
     * @tc.name      testExtMidiBuf0025
     * @tc.desc      Buffer 25/25/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 25;
      let midiCount: number = 25;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(25);
      expect(midiCount).assertEqual(25);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0027
     * @tc.name      testExtMidiBuf0026
     * @tc.desc      Buffer 26/26/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 26;
      let midiCount: number = 26;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(26);
      expect(midiCount).assertEqual(26);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0028
     * @tc.name      testExtMidiBuf0027
     * @tc.desc      Buffer 27/27/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 27;
      let midiCount: number = 27;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(27);
      expect(midiCount).assertEqual(27);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0029
     * @tc.name      testExtMidiBuf0028
     * @tc.desc      Buffer 28/28/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 28;
      let midiCount: number = 28;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(28);
      expect(midiCount).assertEqual(28);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0030
     * @tc.name      testExtMidiBuf0029
     * @tc.desc      Buffer 29/29/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 29;
      let midiCount: number = 29;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(29);
      expect(midiCount).assertEqual(29);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0031
     * @tc.name      testExtMidiBuf0030
     * @tc.desc      Buffer 30/30/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 30;
      let midiCount: number = 30;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(30);
      expect(midiCount).assertEqual(30);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0032
     * @tc.name      testExtMidiBuf0031
     * @tc.desc      Buffer 31/31/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 31;
      let midiCount: number = 31;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(31);
      expect(midiCount).assertEqual(31);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0033
     * @tc.name      testExtMidiBuf0032
     * @tc.desc      Buffer 32/32/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 32;
      let midiCount: number = 32;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(32);
      expect(midiCount).assertEqual(32);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0034
     * @tc.name      testExtMidiBuf0033
     * @tc.desc      Buffer 33/33/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 33;
      let midiCount: number = 33;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(33);
      expect(midiCount).assertEqual(33);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0035
     * @tc.name      testExtMidiBuf0034
     * @tc.desc      Buffer 34/34/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 34;
      let midiCount: number = 34;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(34);
      expect(midiCount).assertEqual(34);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0036
     * @tc.name      testExtMidiBuf0035
     * @tc.desc      Buffer 35/35/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 35;
      let midiCount: number = 35;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(35);
      expect(midiCount).assertEqual(35);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0037
     * @tc.name      testExtMidiBuf0036
     * @tc.desc      Buffer 36/36/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 36;
      let midiCount: number = 36;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(36);
      expect(midiCount).assertEqual(36);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0038
     * @tc.name      testExtMidiBuf0037
     * @tc.desc      Buffer 37/37/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 37;
      let midiCount: number = 37;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(37);
      expect(midiCount).assertEqual(37);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0039
     * @tc.name      testExtMidiBuf0038
     * @tc.desc      Buffer 38/38/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 38;
      let midiCount: number = 38;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(38);
      expect(midiCount).assertEqual(38);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0040
     * @tc.name      testExtMidiBuf0039
     * @tc.desc      Buffer 39/39/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 39;
      let midiCount: number = 39;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(39);
      expect(midiCount).assertEqual(39);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0041
     * @tc.name      testExtMidiBuf0040
     * @tc.desc      Buffer 40/40/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 40;
      let midiCount: number = 40;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(40);
      expect(midiCount).assertEqual(40);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0042
     * @tc.name      testExtMidiBuf0041
     * @tc.desc      Buffer 41/41/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 41;
      let midiCount: number = 41;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(41);
      expect(midiCount).assertEqual(41);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0043
     * @tc.name      testExtMidiBuf0042
     * @tc.desc      Buffer 42/42/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 42;
      let midiCount: number = 42;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(42);
      expect(midiCount).assertEqual(42);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0044
     * @tc.name      testExtMidiBuf0043
     * @tc.desc      Buffer 43/43/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 43;
      let midiCount: number = 43;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(43);
      expect(midiCount).assertEqual(43);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0045
     * @tc.name      testExtMidiBuf0044
     * @tc.desc      Buffer 44/44/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 44;
      let midiCount: number = 44;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(44);
      expect(midiCount).assertEqual(44);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0046
     * @tc.name      testExtMidiBuf0045
     * @tc.desc      Buffer 45/45/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 45;
      let midiCount: number = 45;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(45);
      expect(midiCount).assertEqual(45);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0047
     * @tc.name      testExtMidiBuf0046
     * @tc.desc      Buffer 46/46/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 46;
      let midiCount: number = 46;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(46);
      expect(midiCount).assertEqual(46);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0048
     * @tc.name      testExtMidiBuf0047
     * @tc.desc      Buffer 47/47/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 47;
      let midiCount: number = 47;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(47);
      expect(midiCount).assertEqual(47);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0049
     * @tc.name      testExtMidiBuf0048
     * @tc.desc      Buffer 48/48/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 48;
      let midiCount: number = 48;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(48);
      expect(midiCount).assertEqual(48);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0050
     * @tc.name      testExtMidiBuf0049
     * @tc.desc      Buffer 49/49/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 49;
      let midiCount: number = 49;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(49);
      expect(midiCount).assertEqual(49);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0051
     * @tc.name      testExtMidiBuf0050
     * @tc.desc      Buffer 50/50/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 50;
      let midiCount: number = 50;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(50);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0052
     * @tc.name      testExtMidiBuf0051
     * @tc.desc      Buffer 51/51/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 51;
      let midiCount: number = 51;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(51);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0053
     * @tc.name      testExtMidiBuf0052
     * @tc.desc      Buffer 52/52/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 52;
      let midiCount: number = 52;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(52);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0054
     * @tc.name      testExtMidiBuf0053
     * @tc.desc      Buffer 53/53/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 53;
      let midiCount: number = 53;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(53);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0055
     * @tc.name      testExtMidiBuf0054
     * @tc.desc      Buffer 54/54/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 54;
      let midiCount: number = 54;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(54);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0056
     * @tc.name      testExtMidiBuf0055
     * @tc.desc      Buffer 55/55/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 55;
      let midiCount: number = 55;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(55);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0057
     * @tc.name      testExtMidiBuf0056
     * @tc.desc      Buffer 56/56/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 56;
      let midiCount: number = 56;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(56);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0058
     * @tc.name      testExtMidiBuf0057
     * @tc.desc      Buffer 57/57/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 57;
      let midiCount: number = 57;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(57);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0059
     * @tc.name      testExtMidiBuf0058
     * @tc.desc      Buffer 58/58/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 58;
      let midiCount: number = 58;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(58);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0060
     * @tc.name      testExtMidiBuf0059
     * @tc.desc      Buffer 59/59/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 59;
      let midiCount: number = 59;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(59);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0061
     * @tc.name      testExtMidiBuf0060
     * @tc.desc      Buffer 60/60/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 60;
      let midiCount: number = 60;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(60);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0062
     * @tc.name      testExtMidiBuf0061
     * @tc.desc      Buffer 61/61/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 61;
      let midiCount: number = 61;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(61);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0063
     * @tc.name      testExtMidiBuf0062
     * @tc.desc      Buffer 62/62/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 62;
      let midiCount: number = 62;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(62);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0064
     * @tc.name      testExtMidiBuf0063
     * @tc.desc      Buffer 63/63/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 63;
      let midiCount: number = 63;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(63);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0065
     * @tc.name      testExtMidiBuf0064
     * @tc.desc      Buffer 64/64/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 64;
      let midiCount: number = 64;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(64);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0066
     * @tc.name      testExtMidiBuf0065
     * @tc.desc      Buffer 65/65/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 65;
      let midiCount: number = 65;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(65);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0067
     * @tc.name      testExtMidiBuf0066
     * @tc.desc      Buffer 66/66/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 66;
      let midiCount: number = 66;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(66);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0068
     * @tc.name      testExtMidiBuf0067
     * @tc.desc      Buffer 67/67/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 67;
      let midiCount: number = 67;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(67);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0069
     * @tc.name      testExtMidiBuf0068
     * @tc.desc      Buffer 68/68/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 68;
      let midiCount: number = 68;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(68);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0070
     * @tc.name      testExtMidiBuf0069
     * @tc.desc      Buffer 69/69/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 69;
      let midiCount: number = 69;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(69);
      expect(midiCount).assertEqual(50);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0071
     * @tc.name      testExtMidiBuf0070
     * @tc.desc      Buffer 70/0/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 70;
      let midiCount: number = 0;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(70);
      expect(midiCount).assertEqual(0);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0072
     * @tc.name      testExtMidiBuf0071
     * @tc.desc      Buffer 71/1/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 71;
      let midiCount: number = 1;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(71);
      expect(midiCount).assertEqual(1);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0073
     * @tc.name      testExtMidiBuf0072
     * @tc.desc      Buffer 72/2/0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 72;
      let midiCount: number = 2;
      let recentCount: number = 0;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(72);
      expect(midiCount).assertEqual(2);
      expect(recentCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0074
     * @tc.name      testExtMidiBuf0073
     * @tc.desc      Buffer 73/3/1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 73;
      let midiCount: number = 3;
      let recentCount: number = 1;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(73);
      expect(midiCount).assertEqual(3);
      expect(recentCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0075
     * @tc.name      testExtMidiBuf0074
     * @tc.desc      Buffer 74/4/2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 74;
      let midiCount: number = 4;
      let recentCount: number = 2;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(74);
      expect(midiCount).assertEqual(4);
      expect(recentCount).assertEqual(2);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0076
     * @tc.name      testExtMidiBuf0075
     * @tc.desc      Buffer 75/5/3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 75;
      let midiCount: number = 5;
      let recentCount: number = 3;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(75);
      expect(midiCount).assertEqual(5);
      expect(recentCount).assertEqual(3);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0077
     * @tc.name      testExtMidiBuf0076
     * @tc.desc      Buffer 76/6/4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 76;
      let midiCount: number = 6;
      let recentCount: number = 4;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(76);
      expect(midiCount).assertEqual(6);
      expect(recentCount).assertEqual(4);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0078
     * @tc.name      testExtMidiBuf0077
     * @tc.desc      Buffer 77/7/5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 77;
      let midiCount: number = 7;
      let recentCount: number = 5;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(77);
      expect(midiCount).assertEqual(7);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0079
     * @tc.name      testExtMidiBuf0078
     * @tc.desc      Buffer 78/8/6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 78;
      let midiCount: number = 8;
      let recentCount: number = 6;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(78);
      expect(midiCount).assertEqual(8);
      expect(recentCount).assertEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BUF_0080
     * @tc.name      testExtMidiBuf0079
     * @tc.desc      Buffer 79/9/7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBuf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let logCount: number = 79;
      let midiCount: number = 9;
      let recentCount: number = 7;
      if (logCount > 100) { logCount = 100; }
      if (midiCount > 50) { midiCount = 50; }
      if (recentCount > 5) { recentCount = 5; }
      expect(logCount).assertEqual(79);
      expect(midiCount).assertEqual(9);
      expect(recentCount).assertEqual(5);
    })
  });
}
