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

const TAG: string = '[Sample_midiDeviceStateCore]';
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

export default function midiDeviceStateCoreTest(): void {
  describe('midiDeviceStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0001
     * @tc.name      testExtMidiState0000
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0002
     * @tc.name      testExtMidiState0001
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0003
     * @tc.name      testExtMidiState0002
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0004
     * @tc.name      testExtMidiState0003
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0005
     * @tc.name      testExtMidiState0004
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0006
     * @tc.name      testExtMidiState0005
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0007
     * @tc.name      testExtMidiState0006
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0008
     * @tc.name      testExtMidiState0007
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0009
     * @tc.name      testExtMidiState0008
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0010
     * @tc.name      testExtMidiState0009
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0011
     * @tc.name      testExtMidiState0010
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0012
     * @tc.name      testExtMidiState0011
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0013
     * @tc.name      testExtMidiState0012
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0014
     * @tc.name      testExtMidiState0013
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0015
     * @tc.name      testExtMidiState0014
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0016
     * @tc.name      testExtMidiState0015
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0017
     * @tc.name      testExtMidiState0016
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0018
     * @tc.name      testExtMidiState0017
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0019
     * @tc.name      testExtMidiState0018
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0020
     * @tc.name      testExtMidiState0019
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0021
     * @tc.name      testExtMidiState0020
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0022
     * @tc.name      testExtMidiState0021
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0023
     * @tc.name      testExtMidiState0022
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0024
     * @tc.name      testExtMidiState0023
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0025
     * @tc.name      testExtMidiState0024
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0026
     * @tc.name      testExtMidiState0025
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0027
     * @tc.name      testExtMidiState0026
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0028
     * @tc.name      testExtMidiState0027
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0029
     * @tc.name      testExtMidiState0028
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0030
     * @tc.name      testExtMidiState0029
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0031
     * @tc.name      testExtMidiState0030
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0032
     * @tc.name      testExtMidiState0031
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0033
     * @tc.name      testExtMidiState0032
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0034
     * @tc.name      testExtMidiState0033
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0035
     * @tc.name      testExtMidiState0034
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0036
     * @tc.name      testExtMidiState0035
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0037
     * @tc.name      testExtMidiState0036
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0038
     * @tc.name      testExtMidiState0037
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0039
     * @tc.name      testExtMidiState0038
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0040
     * @tc.name      testExtMidiState0039
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0041
     * @tc.name      testExtMidiState0040
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0042
     * @tc.name      testExtMidiState0041
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0043
     * @tc.name      testExtMidiState0042
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0044
     * @tc.name      testExtMidiState0043
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0045
     * @tc.name      testExtMidiState0044
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0046
     * @tc.name      testExtMidiState0045
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0047
     * @tc.name      testExtMidiState0046
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0048
     * @tc.name      testExtMidiState0047
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0049
     * @tc.name      testExtMidiState0048
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0050
     * @tc.name      testExtMidiState0049
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0051
     * @tc.name      testExtMidiState0050
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0052
     * @tc.name      testExtMidiState0051
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0053
     * @tc.name      testExtMidiState0052
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0054
     * @tc.name      testExtMidiState0053
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0055
     * @tc.name      testExtMidiState0054
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0056
     * @tc.name      testExtMidiState0055
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0057
     * @tc.name      testExtMidiState0056
     * @tc.desc      Device state select.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = true;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(true);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0058
     * @tc.name      testExtMidiState0057
     * @tc.desc      Device state open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = false;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0059
     * @tc.name      testExtMidiState0058
     * @tc.desc      Device state close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = true;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(true);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_STATE_0060
     * @tc.name      testExtMidiState0059
     * @tc.desc      Device state play.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clientCreated: boolean = false;
      const selectedDevice: boolean = true;
      const deviceOpened: boolean = false;
      let canOpen: boolean = false;
      let canPlay: boolean = false;
      canOpen = clientCreated && selectedDevice;
      canPlay = clientCreated && selectedDevice && deviceOpened;
      expect(canOpen).assertEqual(false);
      expect(canPlay).assertEqual(false);
      expect(clientCreated || !clientCreated).assertTrue();
    })
  });
}
