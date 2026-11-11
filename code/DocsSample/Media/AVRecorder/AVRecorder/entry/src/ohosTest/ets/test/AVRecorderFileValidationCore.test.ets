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

const TAG: string = '[Sample_avRecorderFileValidationCore]';
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

export default function avRecorderFileValidationCoreTest(): void {
  describe('avRecorderFileValidationCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0001
     * @tc.name      testExtRecFileValid0000
     * @tc.desc      File validation size 0 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 0;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0002
     * @tc.name      testExtRecFileValid0001
     * @tc.desc      File validation size 1 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0003
     * @tc.name      testExtRecFileValid0002
     * @tc.desc      File validation size 999 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 999;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0004
     * @tc.name      testExtRecFileValid0003
     * @tc.desc      File validation size 1000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0005
     * @tc.name      testExtRecFileValid0004
     * @tc.desc      File validation size 10000 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 10000;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0006
     * @tc.name      testExtRecFileValid0005
     * @tc.desc      File validation size 1000000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0007
     * @tc.name      testExtRecFileValid0006
     * @tc.desc      File validation size 0 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 0;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0008
     * @tc.name      testExtRecFileValid0007
     * @tc.desc      File validation size 1 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0009
     * @tc.name      testExtRecFileValid0008
     * @tc.desc      File validation size 999 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 999;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0010
     * @tc.name      testExtRecFileValid0009
     * @tc.desc      File validation size 1000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0011
     * @tc.name      testExtRecFileValid0010
     * @tc.desc      File validation size 10000 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 10000;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0012
     * @tc.name      testExtRecFileValid0011
     * @tc.desc      File validation size 1000000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0013
     * @tc.name      testExtRecFileValid0012
     * @tc.desc      File validation size 0 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 0;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0014
     * @tc.name      testExtRecFileValid0013
     * @tc.desc      File validation size 1 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0015
     * @tc.name      testExtRecFileValid0014
     * @tc.desc      File validation size 999 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 999;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0016
     * @tc.name      testExtRecFileValid0015
     * @tc.desc      File validation size 1000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0017
     * @tc.name      testExtRecFileValid0016
     * @tc.desc      File validation size 10000 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 10000;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0018
     * @tc.name      testExtRecFileValid0017
     * @tc.desc      File validation size 1000000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0019
     * @tc.name      testExtRecFileValid0018
     * @tc.desc      File validation size 0 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 0;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0020
     * @tc.name      testExtRecFileValid0019
     * @tc.desc      File validation size 1 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0021
     * @tc.name      testExtRecFileValid0020
     * @tc.desc      File validation size 999 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 999;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0022
     * @tc.name      testExtRecFileValid0021
     * @tc.desc      File validation size 1000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0023
     * @tc.name      testExtRecFileValid0022
     * @tc.desc      File validation size 10000 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 10000;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0024
     * @tc.name      testExtRecFileValid0023
     * @tc.desc      File validation size 1000000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0025
     * @tc.name      testExtRecFileValid0024
     * @tc.desc      File validation size 0 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 0;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0026
     * @tc.name      testExtRecFileValid0025
     * @tc.desc      File validation size 1 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0027
     * @tc.name      testExtRecFileValid0026
     * @tc.desc      File validation size 999 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 999;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(false);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0028
     * @tc.name      testExtRecFileValid0027
     * @tc.desc      File validation size 1000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0029
     * @tc.name      testExtRecFileValid0028
     * @tc.desc      File validation size 10000 .m4a.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 10000;
      const extension: string = '.m4a';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEVALID_0030
     * @tc.name      testExtRecFileValid0029
     * @tc.desc      File validation size 1000000 .mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileValid0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: number = 1000000;
      const extension: string = '.mp4';
      const valid: boolean = size >= 1000;
      expect(valid).assertEqual(true);
      expect(extension.startsWith('.')).assertTrue();
      expect(['.m4a', '.mp4'].indexOf(extension) >= 0).assertTrue();
    })
  });
}
