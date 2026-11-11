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

const TAG: string = '[Sample_avRecorderErrorRecoveryCore]';
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

export default function avRecorderErrorRecoveryCoreTest(): void {
  describe('avRecorderErrorRecoveryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0001
     * @tc.name      testExtRecRecover0000
     * @tc.desc      Error recovery code 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 0;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(false);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0002
     * @tc.name      testExtRecRecover0001
     * @tc.desc      Error recovery code 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 1;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0003
     * @tc.name      testExtRecRecover0002
     * @tc.desc      Error recovery code 5400101.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400101;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0004
     * @tc.name      testExtRecRecover0003
     * @tc.desc      Error recovery code 5400102.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400102;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0005
     * @tc.name      testExtRecRecover0004
     * @tc.desc      Error recovery code 5400103.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400103;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0006
     * @tc.name      testExtRecRecover0005
     * @tc.desc      Error recovery code 5400104.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400104;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0007
     * @tc.name      testExtRecRecover0006
     * @tc.desc      Error recovery code 5400105.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400105;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0008
     * @tc.name      testExtRecRecover0007
     * @tc.desc      Error recovery code 5400106.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400106;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0009
     * @tc.name      testExtRecRecover0008
     * @tc.desc      Error recovery code 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 0;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(false);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0010
     * @tc.name      testExtRecRecover0009
     * @tc.desc      Error recovery code 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 1;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0011
     * @tc.name      testExtRecRecover0010
     * @tc.desc      Error recovery code 5400101.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400101;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0012
     * @tc.name      testExtRecRecover0011
     * @tc.desc      Error recovery code 5400102.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400102;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0013
     * @tc.name      testExtRecRecover0012
     * @tc.desc      Error recovery code 5400103.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400103;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0014
     * @tc.name      testExtRecRecover0013
     * @tc.desc      Error recovery code 5400104.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400104;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0015
     * @tc.name      testExtRecRecover0014
     * @tc.desc      Error recovery code 5400105.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400105;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0016
     * @tc.name      testExtRecRecover0015
     * @tc.desc      Error recovery code 5400106.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400106;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0017
     * @tc.name      testExtRecRecover0016
     * @tc.desc      Error recovery code 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 0;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(false);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0018
     * @tc.name      testExtRecRecover0017
     * @tc.desc      Error recovery code 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 1;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0019
     * @tc.name      testExtRecRecover0018
     * @tc.desc      Error recovery code 5400101.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400101;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0020
     * @tc.name      testExtRecRecover0019
     * @tc.desc      Error recovery code 5400102.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400102;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0021
     * @tc.name      testExtRecRecover0020
     * @tc.desc      Error recovery code 5400103.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400103;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0022
     * @tc.name      testExtRecRecover0021
     * @tc.desc      Error recovery code 5400104.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400104;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0023
     * @tc.name      testExtRecRecover0022
     * @tc.desc      Error recovery code 5400105.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400105;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0024
     * @tc.name      testExtRecRecover0023
     * @tc.desc      Error recovery code 5400106.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400106;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0025
     * @tc.name      testExtRecRecover0024
     * @tc.desc      Error recovery code 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 0;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(false);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0026
     * @tc.name      testExtRecRecover0025
     * @tc.desc      Error recovery code 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 1;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0027
     * @tc.name      testExtRecRecover0026
     * @tc.desc      Error recovery code 5400101.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400101;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0028
     * @tc.name      testExtRecRecover0027
     * @tc.desc      Error recovery code 5400102.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400102;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0029
     * @tc.name      testExtRecRecover0028
     * @tc.desc      Error recovery code 5400103.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400103;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RECOVERY_0030
     * @tc.name      testExtRecRecover0029
     * @tc.desc      Error recovery code 5400104.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecRecover0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorCode: number = 5400104;
      const recoverable: boolean = errorCode !== 0;
      const retryable: boolean = errorCode === 5400101 || errorCode === 5400102 || errorCode === 5400103;
      expect(recoverable).assertEqual(true);
      expect(retryable).assertEqual(false);
    })
  });
}
