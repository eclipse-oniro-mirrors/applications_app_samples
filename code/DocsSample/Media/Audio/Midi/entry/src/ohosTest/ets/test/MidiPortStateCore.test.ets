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

const TAG: string = '[Sample_midiPortStateCore]';
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

export default function midiPortStateCoreTest(): void {
  describe('midiPortStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0001
     * @tc.name      testExtMidiPort0000
     * @tc.desc      Port state 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0002
     * @tc.name      testExtMidiPort0001
     * @tc.desc      Port state 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0003
     * @tc.name      testExtMidiPort0002
     * @tc.desc      Port state 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0004
     * @tc.name      testExtMidiPort0003
     * @tc.desc      Port state 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0005
     * @tc.name      testExtMidiPort0004
     * @tc.desc      Port state 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0006
     * @tc.name      testExtMidiPort0005
     * @tc.desc      Port state 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0007
     * @tc.name      testExtMidiPort0006
     * @tc.desc      Port state 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0008
     * @tc.name      testExtMidiPort0007
     * @tc.desc      Port state 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0009
     * @tc.name      testExtMidiPort0008
     * @tc.desc      Port state 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0010
     * @tc.name      testExtMidiPort0009
     * @tc.desc      Port state 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0011
     * @tc.name      testExtMidiPort0010
     * @tc.desc      Port state 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0012
     * @tc.name      testExtMidiPort0011
     * @tc.desc      Port state 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0013
     * @tc.name      testExtMidiPort0012
     * @tc.desc      Port state 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0014
     * @tc.name      testExtMidiPort0013
     * @tc.desc      Port state 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0015
     * @tc.name      testExtMidiPort0014
     * @tc.desc      Port state 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0016
     * @tc.name      testExtMidiPort0015
     * @tc.desc      Port state 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0017
     * @tc.name      testExtMidiPort0016
     * @tc.desc      Port state 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0018
     * @tc.name      testExtMidiPort0017
     * @tc.desc      Port state 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0019
     * @tc.name      testExtMidiPort0018
     * @tc.desc      Port state 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0020
     * @tc.name      testExtMidiPort0019
     * @tc.desc      Port state 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0021
     * @tc.name      testExtMidiPort0020
     * @tc.desc      Port state 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0022
     * @tc.name      testExtMidiPort0021
     * @tc.desc      Port state 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0023
     * @tc.name      testExtMidiPort0022
     * @tc.desc      Port state 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0024
     * @tc.name      testExtMidiPort0023
     * @tc.desc      Port state 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0025
     * @tc.name      testExtMidiPort0024
     * @tc.desc      Port state 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0026
     * @tc.name      testExtMidiPort0025
     * @tc.desc      Port state 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0027
     * @tc.name      testExtMidiPort0026
     * @tc.desc      Port state 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0028
     * @tc.name      testExtMidiPort0027
     * @tc.desc      Port state 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0029
     * @tc.name      testExtMidiPort0028
     * @tc.desc      Port state 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0030
     * @tc.name      testExtMidiPort0029
     * @tc.desc      Port state 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0031
     * @tc.name      testExtMidiPort0030
     * @tc.desc      Port state 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0032
     * @tc.name      testExtMidiPort0031
     * @tc.desc      Port state 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0033
     * @tc.name      testExtMidiPort0032
     * @tc.desc      Port state 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0034
     * @tc.name      testExtMidiPort0033
     * @tc.desc      Port state 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0035
     * @tc.name      testExtMidiPort0034
     * @tc.desc      Port state 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0036
     * @tc.name      testExtMidiPort0035
     * @tc.desc      Port state 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0037
     * @tc.name      testExtMidiPort0036
     * @tc.desc      Port state 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0038
     * @tc.name      testExtMidiPort0037
     * @tc.desc      Port state 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0039
     * @tc.name      testExtMidiPort0038
     * @tc.desc      Port state 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0040
     * @tc.name      testExtMidiPort0039
     * @tc.desc      Port state 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0041
     * @tc.name      testExtMidiPort0040
     * @tc.desc      Port state 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0042
     * @tc.name      testExtMidiPort0041
     * @tc.desc      Port state 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0043
     * @tc.name      testExtMidiPort0042
     * @tc.desc      Port state 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0044
     * @tc.name      testExtMidiPort0043
     * @tc.desc      Port state 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0045
     * @tc.name      testExtMidiPort0044
     * @tc.desc      Port state 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0046
     * @tc.name      testExtMidiPort0045
     * @tc.desc      Port state 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0047
     * @tc.name      testExtMidiPort0046
     * @tc.desc      Port state 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0048
     * @tc.name      testExtMidiPort0047
     * @tc.desc      Port state 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0049
     * @tc.name      testExtMidiPort0048
     * @tc.desc      Port state 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0050
     * @tc.name      testExtMidiPort0049
     * @tc.desc      Port state 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0051
     * @tc.name      testExtMidiPort0050
     * @tc.desc      Port state 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0052
     * @tc.name      testExtMidiPort0051
     * @tc.desc      Port state 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0053
     * @tc.name      testExtMidiPort0052
     * @tc.desc      Port state 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0054
     * @tc.name      testExtMidiPort0053
     * @tc.desc      Port state 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0055
     * @tc.name      testExtMidiPort0054
     * @tc.desc      Port state 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0056
     * @tc.name      testExtMidiPort0055
     * @tc.desc      Port state 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0057
     * @tc.name      testExtMidiPort0056
     * @tc.desc      Port state 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0058
     * @tc.name      testExtMidiPort0057
     * @tc.desc      Port state 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0059
     * @tc.name      testExtMidiPort0058
     * @tc.desc      Port state 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0060
     * @tc.name      testExtMidiPort0059
     * @tc.desc      Port state 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0061
     * @tc.name      testExtMidiPort0060
     * @tc.desc      Port state 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0062
     * @tc.name      testExtMidiPort0061
     * @tc.desc      Port state 61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0063
     * @tc.name      testExtMidiPort0062
     * @tc.desc      Port state 62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0064
     * @tc.name      testExtMidiPort0063
     * @tc.desc      Port state 63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0065
     * @tc.name      testExtMidiPort0064
     * @tc.desc      Port state 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0066
     * @tc.name      testExtMidiPort0065
     * @tc.desc      Port state 65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0067
     * @tc.name      testExtMidiPort0066
     * @tc.desc      Port state 66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0068
     * @tc.name      testExtMidiPort0067
     * @tc.desc      Port state 67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0069
     * @tc.name      testExtMidiPort0068
     * @tc.desc      Port state 68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0070
     * @tc.name      testExtMidiPort0069
     * @tc.desc      Port state 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0071
     * @tc.name      testExtMidiPort0070
     * @tc.desc      Port state 70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0072
     * @tc.name      testExtMidiPort0071
     * @tc.desc      Port state 71.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0073
     * @tc.name      testExtMidiPort0072
     * @tc.desc      Port state 72.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0074
     * @tc.name      testExtMidiPort0073
     * @tc.desc      Port state 73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0075
     * @tc.name      testExtMidiPort0074
     * @tc.desc      Port state 74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0076
     * @tc.name      testExtMidiPort0075
     * @tc.desc      Port state 75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = true;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0077
     * @tc.name      testExtMidiPort0076
     * @tc.desc      Port state 76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = true;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(true);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0078
     * @tc.name      testExtMidiPort0077
     * @tc.desc      Port state 77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0079
     * @tc.name      testExtMidiPort0078
     * @tc.desc      Port state 78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const deviceOpened: boolean = false;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT_0080
     * @tc.name      testExtMidiPort0079
     * @tc.desc      Port state 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const deviceOpened: boolean = true;
      const inputOpen: boolean = false;
      const outputOpen: boolean = false;
      const canReceive: boolean = clientCreated && deviceOpened && inputOpen;
      const canSend: boolean = clientCreated && deviceOpened && outputOpen;
      expect(canReceive).assertEqual(false);
      expect(canSend).assertEqual(false);
    })
  });
}
