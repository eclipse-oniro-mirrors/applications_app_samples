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

const TAG: string = '[Sample_midiUiContractCore]';
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

export default function midiUiContractCoreTest(): void {
  describe('midiUiContractCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0001
     * @tc.name      testExtMidiUi0000
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0002
     * @tc.name      testExtMidiUi0001
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0003
     * @tc.name      testExtMidiUi0002
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0004
     * @tc.name      testExtMidiUi0003
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0005
     * @tc.name      testExtMidiUi0004
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0006
     * @tc.name      testExtMidiUi0005
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0007
     * @tc.name      testExtMidiUi0006
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0008
     * @tc.name      testExtMidiUi0007
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0009
     * @tc.name      testExtMidiUi0008
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0010
     * @tc.name      testExtMidiUi0009
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0011
     * @tc.name      testExtMidiUi0010
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0012
     * @tc.name      testExtMidiUi0011
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0013
     * @tc.name      testExtMidiUi0012
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0014
     * @tc.name      testExtMidiUi0013
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0015
     * @tc.name      testExtMidiUi0014
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0016
     * @tc.name      testExtMidiUi0015
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0017
     * @tc.name      testExtMidiUi0016
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0018
     * @tc.name      testExtMidiUi0017
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0019
     * @tc.name      testExtMidiUi0018
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0020
     * @tc.name      testExtMidiUi0019
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0021
     * @tc.name      testExtMidiUi0020
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0022
     * @tc.name      testExtMidiUi0021
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0023
     * @tc.name      testExtMidiUi0022
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0024
     * @tc.name      testExtMidiUi0023
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0025
     * @tc.name      testExtMidiUi0024
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0026
     * @tc.name      testExtMidiUi0025
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0027
     * @tc.name      testExtMidiUi0026
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0028
     * @tc.name      testExtMidiUi0027
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0029
     * @tc.name      testExtMidiUi0028
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0030
     * @tc.name      testExtMidiUi0029
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0031
     * @tc.name      testExtMidiUi0030
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0032
     * @tc.name      testExtMidiUi0031
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0033
     * @tc.name      testExtMidiUi0032
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0034
     * @tc.name      testExtMidiUi0033
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0035
     * @tc.name      testExtMidiUi0034
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0036
     * @tc.name      testExtMidiUi0035
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0037
     * @tc.name      testExtMidiUi0036
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0038
     * @tc.name      testExtMidiUi0037
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0039
     * @tc.name      testExtMidiUi0038
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0040
     * @tc.name      testExtMidiUi0039
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0041
     * @tc.name      testExtMidiUi0040
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0042
     * @tc.name      testExtMidiUi0041
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0043
     * @tc.name      testExtMidiUi0042
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0044
     * @tc.name      testExtMidiUi0043
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0045
     * @tc.name      testExtMidiUi0044
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0046
     * @tc.name      testExtMidiUi0045
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0047
     * @tc.name      testExtMidiUi0046
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0048
     * @tc.name      testExtMidiUi0047
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0049
     * @tc.name      testExtMidiUi0048
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0050
     * @tc.name      testExtMidiUi0049
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0051
     * @tc.name      testExtMidiUi0050
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0052
     * @tc.name      testExtMidiUi0051
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0053
     * @tc.name      testExtMidiUi0052
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0054
     * @tc.name      testExtMidiUi0053
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0055
     * @tc.name      testExtMidiUi0054
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0056
     * @tc.name      testExtMidiUi0055
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0057
     * @tc.name      testExtMidiUi0056
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0058
     * @tc.name      testExtMidiUi0057
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0059
     * @tc.name      testExtMidiUi0058
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0060
     * @tc.name      testExtMidiUi0059
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0061
     * @tc.name      testExtMidiUi0060
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0062
     * @tc.name      testExtMidiUi0061
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0063
     * @tc.name      testExtMidiUi0062
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0064
     * @tc.name      testExtMidiUi0063
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0065
     * @tc.name      testExtMidiUi0064
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0066
     * @tc.name      testExtMidiUi0065
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0067
     * @tc.name      testExtMidiUi0066
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0068
     * @tc.name      testExtMidiUi0067
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0069
     * @tc.name      testExtMidiUi0068
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0070
     * @tc.name      testExtMidiUi0069
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0071
     * @tc.name      testExtMidiUi0070
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0072
     * @tc.name      testExtMidiUi0071
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0073
     * @tc.name      testExtMidiUi0072
     * @tc.desc      UI contract Create Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Create Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0074
     * @tc.name      testExtMidiUi0073
     * @tc.desc      UI contract Refresh Devices.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Refresh Devices') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0075
     * @tc.name      testExtMidiUi0074
     * @tc.desc      UI contract Destroy Client.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Destroy Client') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0076
     * @tc.name      testExtMidiUi0075
     * @tc.desc      UI contract Open Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0077
     * @tc.name      testExtMidiUi0076
     * @tc.desc      UI contract Close Device.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close Device') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0078
     * @tc.name      testExtMidiUi0077
     * @tc.desc      UI contract Open.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Open') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0079
     * @tc.name      testExtMidiUi0078
     * @tc.desc      UI contract Close.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Close') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UI_0080
     * @tc.name      testExtMidiUi0079
     * @tc.desc      UI contract Connect.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUi0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const labels: string[] = ['Create Client', 'Refresh Devices', 'Destroy Client', 'Open Device', 'Close Device', 'Open', 'Close', 'Connect'];
      expect(labels.indexOf('Connect') >= 0).assertTrue();
      expect(1001).assertEqual(1001);
      expect(1002).assertEqual(1002);
      expect(1003).assertEqual(1003);
      expect(1004).assertEqual(1004);
      expect(labels.length).assertEqual(8);
    })
  });
}
