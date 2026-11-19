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

const TAG: string = '[Sample_keyboardSoundFrameMatrix]';
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

export default function keyboardSoundFrameMatrixTest(): void {
  describe('keyboardSoundFrameMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0001
     * @tc.name      testExtKeyboardFrame0000
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0002
     * @tc.name      testExtKeyboardFrame0001
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0003
     * @tc.name      testExtKeyboardFrame0002
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0004
     * @tc.name      testExtKeyboardFrame0003
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0005
     * @tc.name      testExtKeyboardFrame0004
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0006
     * @tc.name      testExtKeyboardFrame0005
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0007
     * @tc.name      testExtKeyboardFrame0006
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0008
     * @tc.name      testExtKeyboardFrame0007
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0009
     * @tc.name      testExtKeyboardFrame0008
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0010
     * @tc.name      testExtKeyboardFrame0009
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0011
     * @tc.name      testExtKeyboardFrame0010
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0012
     * @tc.name      testExtKeyboardFrame0011
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0013
     * @tc.name      testExtKeyboardFrame0012
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0014
     * @tc.name      testExtKeyboardFrame0013
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0015
     * @tc.name      testExtKeyboardFrame0014
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0016
     * @tc.name      testExtKeyboardFrame0015
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0017
     * @tc.name      testExtKeyboardFrame0016
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0018
     * @tc.name      testExtKeyboardFrame0017
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0019
     * @tc.name      testExtKeyboardFrame0018
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0020
     * @tc.name      testExtKeyboardFrame0019
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0021
     * @tc.name      testExtKeyboardFrame0020
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0022
     * @tc.name      testExtKeyboardFrame0021
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0023
     * @tc.name      testExtKeyboardFrame0022
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0024
     * @tc.name      testExtKeyboardFrame0023
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0025
     * @tc.name      testExtKeyboardFrame0024
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0026
     * @tc.name      testExtKeyboardFrame0025
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0027
     * @tc.name      testExtKeyboardFrame0026
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0028
     * @tc.name      testExtKeyboardFrame0027
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0029
     * @tc.name      testExtKeyboardFrame0028
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0030
     * @tc.name      testExtKeyboardFrame0029
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0031
     * @tc.name      testExtKeyboardFrame0030
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0032
     * @tc.name      testExtKeyboardFrame0031
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0033
     * @tc.name      testExtKeyboardFrame0032
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0034
     * @tc.name      testExtKeyboardFrame0033
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0035
     * @tc.name      testExtKeyboardFrame0034
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0036
     * @tc.name      testExtKeyboardFrame0035
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0037
     * @tc.name      testExtKeyboardFrame0036
     * @tc.desc      Frame matrix 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(256);
      expect(samples).assertEqual(128);
      expect(bytes / 4).assertEqual(64);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0038
     * @tc.name      testExtKeyboardFrame0037
     * @tc.desc      Frame matrix 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0039
     * @tc.name      testExtKeyboardFrame0038
     * @tc.desc      Frame matrix 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(1024);
      expect(samples).assertEqual(512);
      expect(bytes / 4).assertEqual(256);
      expect(channels).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAME_0040
     * @tc.name      testExtKeyboardFrame0039
     * @tc.desc      Frame matrix 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrame0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const bytes: number = frames * channels * 2;
      const samples: number = frames * channels;
      expect(bytes).assertEqual(4096);
      expect(samples).assertEqual(2048);
      expect(bytes / 4).assertEqual(1024);
      expect(channels).assertLarger(0);
    })
  });
}
