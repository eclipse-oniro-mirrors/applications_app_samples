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

const TAG: string = '[Sample_midiMessageCodecCore]';
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

export default function midiMessageCodecCoreTest(): void {
  describe('midiMessageCodecCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0001
     * @tc.name      testExtMidiCodec0000
     * @tc.desc      MIDI codec noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 0;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0002
     * @tc.name      testExtMidiCodec0001
     * @tc.desc      MIDI codec noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 1;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0003
     * @tc.name      testExtMidiCodec0002
     * @tc.desc      MIDI codec cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 2;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0004
     * @tc.name      testExtMidiCodec0003
     * @tc.desc      MIDI codec program ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 3;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0005
     * @tc.name      testExtMidiCodec0004
     * @tc.desc      MIDI codec noteOn ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 4;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0006
     * @tc.name      testExtMidiCodec0005
     * @tc.desc      MIDI codec noteOff ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 5;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0007
     * @tc.name      testExtMidiCodec0006
     * @tc.desc      MIDI codec cc ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 6;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0008
     * @tc.name      testExtMidiCodec0007
     * @tc.desc      MIDI codec program ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 7;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0009
     * @tc.name      testExtMidiCodec0008
     * @tc.desc      MIDI codec noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 8;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0010
     * @tc.name      testExtMidiCodec0009
     * @tc.desc      MIDI codec noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 9;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0011
     * @tc.name      testExtMidiCodec0010
     * @tc.desc      MIDI codec cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 10;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0012
     * @tc.name      testExtMidiCodec0011
     * @tc.desc      MIDI codec program ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 11;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0013
     * @tc.name      testExtMidiCodec0012
     * @tc.desc      MIDI codec noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 12;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0014
     * @tc.name      testExtMidiCodec0013
     * @tc.desc      MIDI codec noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 13;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0015
     * @tc.name      testExtMidiCodec0014
     * @tc.desc      MIDI codec cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 14;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0016
     * @tc.name      testExtMidiCodec0015
     * @tc.desc      MIDI codec program ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 15;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0017
     * @tc.name      testExtMidiCodec0016
     * @tc.desc      MIDI codec noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 16;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0018
     * @tc.name      testExtMidiCodec0017
     * @tc.desc      MIDI codec noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 17;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0019
     * @tc.name      testExtMidiCodec0018
     * @tc.desc      MIDI codec cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 18;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0020
     * @tc.name      testExtMidiCodec0019
     * @tc.desc      MIDI codec program ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 19;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0021
     * @tc.name      testExtMidiCodec0020
     * @tc.desc      MIDI codec noteOn ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 20;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0022
     * @tc.name      testExtMidiCodec0021
     * @tc.desc      MIDI codec noteOff ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 21;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0023
     * @tc.name      testExtMidiCodec0022
     * @tc.desc      MIDI codec cc ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 22;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0024
     * @tc.name      testExtMidiCodec0023
     * @tc.desc      MIDI codec program ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 23;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0025
     * @tc.name      testExtMidiCodec0024
     * @tc.desc      MIDI codec noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 24;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0026
     * @tc.name      testExtMidiCodec0025
     * @tc.desc      MIDI codec noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 25;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0027
     * @tc.name      testExtMidiCodec0026
     * @tc.desc      MIDI codec cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 26;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0028
     * @tc.name      testExtMidiCodec0027
     * @tc.desc      MIDI codec program ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 27;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0029
     * @tc.name      testExtMidiCodec0028
     * @tc.desc      MIDI codec noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 28;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0030
     * @tc.name      testExtMidiCodec0029
     * @tc.desc      MIDI codec noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 29;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0031
     * @tc.name      testExtMidiCodec0030
     * @tc.desc      MIDI codec cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 30;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0032
     * @tc.name      testExtMidiCodec0031
     * @tc.desc      MIDI codec program ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 31;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0033
     * @tc.name      testExtMidiCodec0032
     * @tc.desc      MIDI codec noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 32;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0034
     * @tc.name      testExtMidiCodec0033
     * @tc.desc      MIDI codec noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 33;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0035
     * @tc.name      testExtMidiCodec0034
     * @tc.desc      MIDI codec cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 34;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0036
     * @tc.name      testExtMidiCodec0035
     * @tc.desc      MIDI codec program ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 35;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0037
     * @tc.name      testExtMidiCodec0036
     * @tc.desc      MIDI codec noteOn ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 36;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0038
     * @tc.name      testExtMidiCodec0037
     * @tc.desc      MIDI codec noteOff ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 37;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0039
     * @tc.name      testExtMidiCodec0038
     * @tc.desc      MIDI codec cc ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 38;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0040
     * @tc.name      testExtMidiCodec0039
     * @tc.desc      MIDI codec program ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 39;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0041
     * @tc.name      testExtMidiCodec0040
     * @tc.desc      MIDI codec noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 40;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0042
     * @tc.name      testExtMidiCodec0041
     * @tc.desc      MIDI codec noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 41;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0043
     * @tc.name      testExtMidiCodec0042
     * @tc.desc      MIDI codec cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 42;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0044
     * @tc.name      testExtMidiCodec0043
     * @tc.desc      MIDI codec program ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 43;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0045
     * @tc.name      testExtMidiCodec0044
     * @tc.desc      MIDI codec noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 44;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0046
     * @tc.name      testExtMidiCodec0045
     * @tc.desc      MIDI codec noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 45;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0047
     * @tc.name      testExtMidiCodec0046
     * @tc.desc      MIDI codec cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 46;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0048
     * @tc.name      testExtMidiCodec0047
     * @tc.desc      MIDI codec program ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 47;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0049
     * @tc.name      testExtMidiCodec0048
     * @tc.desc      MIDI codec noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 48;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0050
     * @tc.name      testExtMidiCodec0049
     * @tc.desc      MIDI codec noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 49;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0051
     * @tc.name      testExtMidiCodec0050
     * @tc.desc      MIDI codec cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 50;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0052
     * @tc.name      testExtMidiCodec0051
     * @tc.desc      MIDI codec program ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 51;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0053
     * @tc.name      testExtMidiCodec0052
     * @tc.desc      MIDI codec noteOn ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 52;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0054
     * @tc.name      testExtMidiCodec0053
     * @tc.desc      MIDI codec noteOff ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 53;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0055
     * @tc.name      testExtMidiCodec0054
     * @tc.desc      MIDI codec cc ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 54;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0056
     * @tc.name      testExtMidiCodec0055
     * @tc.desc      MIDI codec program ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 55;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0057
     * @tc.name      testExtMidiCodec0056
     * @tc.desc      MIDI codec noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 56;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0058
     * @tc.name      testExtMidiCodec0057
     * @tc.desc      MIDI codec noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 57;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0059
     * @tc.name      testExtMidiCodec0058
     * @tc.desc      MIDI codec cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 58;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0060
     * @tc.name      testExtMidiCodec0059
     * @tc.desc      MIDI codec program ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 59;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0061
     * @tc.name      testExtMidiCodec0060
     * @tc.desc      MIDI codec noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 60;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0062
     * @tc.name      testExtMidiCodec0061
     * @tc.desc      MIDI codec noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 61;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0063
     * @tc.name      testExtMidiCodec0062
     * @tc.desc      MIDI codec cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 62;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0064
     * @tc.name      testExtMidiCodec0063
     * @tc.desc      MIDI codec program ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 63;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0065
     * @tc.name      testExtMidiCodec0064
     * @tc.desc      MIDI codec noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 64;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0066
     * @tc.name      testExtMidiCodec0065
     * @tc.desc      MIDI codec noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 65;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0067
     * @tc.name      testExtMidiCodec0066
     * @tc.desc      MIDI codec cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 66;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0068
     * @tc.name      testExtMidiCodec0067
     * @tc.desc      MIDI codec program ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 67;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0069
     * @tc.name      testExtMidiCodec0068
     * @tc.desc      MIDI codec noteOn ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 68;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0070
     * @tc.name      testExtMidiCodec0069
     * @tc.desc      MIDI codec noteOff ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 69;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0071
     * @tc.name      testExtMidiCodec0070
     * @tc.desc      MIDI codec cc ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 70;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0072
     * @tc.name      testExtMidiCodec0071
     * @tc.desc      MIDI codec program ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 71;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0073
     * @tc.name      testExtMidiCodec0072
     * @tc.desc      MIDI codec noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 72;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0074
     * @tc.name      testExtMidiCodec0073
     * @tc.desc      MIDI codec noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 73;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0075
     * @tc.name      testExtMidiCodec0074
     * @tc.desc      MIDI codec cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 74;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0076
     * @tc.name      testExtMidiCodec0075
     * @tc.desc      MIDI codec program ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 75;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0077
     * @tc.name      testExtMidiCodec0076
     * @tc.desc      MIDI codec noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const status: number = 144 | channel;
      const note: number = 60;
      const velocity: number = 0;
      const controller: number = 76;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0078
     * @tc.name      testExtMidiCodec0077
     * @tc.desc      MIDI codec noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const status: number = 128 | channel;
      const note: number = 61;
      const velocity: number = 1;
      const controller: number = 77;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0079
     * @tc.name      testExtMidiCodec0078
     * @tc.desc      MIDI codec cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const status: number = 176 | channel;
      const note: number = 72;
      const velocity: number = 64;
      const controller: number = 78;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_CODEC_0080
     * @tc.name      testExtMidiCodec0079
     * @tc.desc      MIDI codec program ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiCodec0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const status: number = 192 | channel;
      const note: number = 48;
      const velocity: number = 127;
      const controller: number = 79;
      expect(status & 0x0F).assertEqual(channel);
      expect(status >= 0x80 && status <= 0xEF).assertTrue();
      expect(note).assertLargerOrEqual(0);
      expect(note).assertLessOrEqual(127);
      expect(velocity).assertLargerOrEqual(0);
      expect(velocity).assertLessOrEqual(127);
      expect(controller).assertLessOrEqual(127);
    })
  });
}
