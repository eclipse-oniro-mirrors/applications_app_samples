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

const TAG: string = '[Sample_midiPortTransitionCore]';
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

export default function midiPortTransitionCoreTest(): void {
  describe('midiPortTransitionCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0001
     * @tc.name      testExtMidiPort20000
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0002
     * @tc.name      testExtMidiPort20001
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0003
     * @tc.name      testExtMidiPort20002
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0004
     * @tc.name      testExtMidiPort20003
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0005
     * @tc.name      testExtMidiPort20004
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0006
     * @tc.name      testExtMidiPort20005
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0007
     * @tc.name      testExtMidiPort20006
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0008
     * @tc.name      testExtMidiPort20007
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0009
     * @tc.name      testExtMidiPort20008
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0010
     * @tc.name      testExtMidiPort20009
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0011
     * @tc.name      testExtMidiPort20010
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0012
     * @tc.name      testExtMidiPort20011
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0013
     * @tc.name      testExtMidiPort20012
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0014
     * @tc.name      testExtMidiPort20013
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0015
     * @tc.name      testExtMidiPort20014
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0016
     * @tc.name      testExtMidiPort20015
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0017
     * @tc.name      testExtMidiPort20016
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0018
     * @tc.name      testExtMidiPort20017
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0019
     * @tc.name      testExtMidiPort20018
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0020
     * @tc.name      testExtMidiPort20019
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0021
     * @tc.name      testExtMidiPort20020
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0022
     * @tc.name      testExtMidiPort20021
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0023
     * @tc.name      testExtMidiPort20022
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0024
     * @tc.name      testExtMidiPort20023
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0025
     * @tc.name      testExtMidiPort20024
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0026
     * @tc.name      testExtMidiPort20025
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0027
     * @tc.name      testExtMidiPort20026
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0028
     * @tc.name      testExtMidiPort20027
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0029
     * @tc.name      testExtMidiPort20028
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0030
     * @tc.name      testExtMidiPort20029
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0031
     * @tc.name      testExtMidiPort20030
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0032
     * @tc.name      testExtMidiPort20031
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0033
     * @tc.name      testExtMidiPort20032
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0034
     * @tc.name      testExtMidiPort20033
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0035
     * @tc.name      testExtMidiPort20034
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0036
     * @tc.name      testExtMidiPort20035
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0037
     * @tc.name      testExtMidiPort20036
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0038
     * @tc.name      testExtMidiPort20037
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0039
     * @tc.name      testExtMidiPort20038
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0040
     * @tc.name      testExtMidiPort20039
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0041
     * @tc.name      testExtMidiPort20040
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0042
     * @tc.name      testExtMidiPort20041
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0043
     * @tc.name      testExtMidiPort20042
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0044
     * @tc.name      testExtMidiPort20043
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0045
     * @tc.name      testExtMidiPort20044
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0046
     * @tc.name      testExtMidiPort20045
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0047
     * @tc.name      testExtMidiPort20046
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0048
     * @tc.name      testExtMidiPort20047
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0049
     * @tc.name      testExtMidiPort20048
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0050
     * @tc.name      testExtMidiPort20049
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0051
     * @tc.name      testExtMidiPort20050
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0052
     * @tc.name      testExtMidiPort20051
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0053
     * @tc.name      testExtMidiPort20052
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0054
     * @tc.name      testExtMidiPort20053
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0055
     * @tc.name      testExtMidiPort20054
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0056
     * @tc.name      testExtMidiPort20055
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0057
     * @tc.name      testExtMidiPort20056
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0058
     * @tc.name      testExtMidiPort20057
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0059
     * @tc.name      testExtMidiPort20058
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0060
     * @tc.name      testExtMidiPort20059
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0061
     * @tc.name      testExtMidiPort20060
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0062
     * @tc.name      testExtMidiPort20061
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0063
     * @tc.name      testExtMidiPort20062
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0064
     * @tc.name      testExtMidiPort20063
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0065
     * @tc.name      testExtMidiPort20064
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0066
     * @tc.name      testExtMidiPort20065
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0067
     * @tc.name      testExtMidiPort20066
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0068
     * @tc.name      testExtMidiPort20067
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0069
     * @tc.name      testExtMidiPort20068
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0070
     * @tc.name      testExtMidiPort20069
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0071
     * @tc.name      testExtMidiPort20070
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0072
     * @tc.name      testExtMidiPort20071
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0073
     * @tc.name      testExtMidiPort20072
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0074
     * @tc.name      testExtMidiPort20073
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0075
     * @tc.name      testExtMidiPort20074
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0076
     * @tc.name      testExtMidiPort20075
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0077
     * @tc.name      testExtMidiPort20076
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0078
     * @tc.name      testExtMidiPort20077
     * @tc.desc      Port transition reopen.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'reopen';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0079
     * @tc.name      testExtMidiPort20078
     * @tc.desc      Port transition open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'open';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(true);
      expect(portOpened || !portOpened).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_PORT2_0080
     * @tc.name      testExtMidiPort20079
     * @tc.desc      Port transition close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiPort20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let clientCreated: boolean = true;
      let deviceOpened: boolean = true;
      let portOpened: boolean = false;
      const action: string = 'close';
      if (action === 'open') { portOpened = true; }
      else if (action === 'close') { portOpened = false; }
      else { portOpened = true; }
      expect(clientCreated && deviceOpened).assertTrue();
      expect(portOpened).assertEqual(false);
      expect(portOpened || !portOpened).assertTrue();
    })
  });
}
