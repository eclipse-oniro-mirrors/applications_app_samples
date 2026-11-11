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
import { FileType, ProgressType } from '../../../main/ets/components/download';

const TAG: string = '[Sample_MediaSourceFileInfoTail]';
const DOMAIN: number = 0xF812;

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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceFileInfoTailTest(): void {
  describe('mediaSourceFileInfoTailTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0001
     * @tc.name      testSafeFileInfoTail0001
     * @tc.desc      FileType/ProgressType enum values remain stable for index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0002
     * @tc.name      testSafeFileInfoTail0002
     * @tc.desc      FileType/ProgressType enum values remain stable for index 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0003
     * @tc.name      testSafeFileInfoTail0003
     * @tc.desc      FileType/ProgressType enum values remain stable for index 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0004
     * @tc.name      testSafeFileInfoTail0004
     * @tc.desc      FileType/ProgressType enum values remain stable for index 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0005
     * @tc.name      testSafeFileInfoTail0005
     * @tc.desc      FileType/ProgressType enum values remain stable for index 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0006
     * @tc.name      testSafeFileInfoTail0006
     * @tc.desc      FileType/ProgressType enum values remain stable for index 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0007
     * @tc.name      testSafeFileInfoTail0007
     * @tc.desc      FileType/ProgressType enum values remain stable for index 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0008
     * @tc.name      testSafeFileInfoTail0008
     * @tc.desc      FileType/ProgressType enum values remain stable for index 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0009
     * @tc.name      testSafeFileInfoTail0009
     * @tc.desc      FileType/ProgressType enum values remain stable for index 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0010
     * @tc.name      testSafeFileInfoTail0010
     * @tc.desc      FileType/ProgressType enum values remain stable for index 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0011
     * @tc.name      testSafeFileInfoTail0011
     * @tc.desc      FileType/ProgressType enum values remain stable for index 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0012
     * @tc.name      testSafeFileInfoTail0012
     * @tc.desc      FileType/ProgressType enum values remain stable for index 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0013
     * @tc.name      testSafeFileInfoTail0013
     * @tc.desc      FileType/ProgressType enum values remain stable for index 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0014
     * @tc.name      testSafeFileInfoTail0014
     * @tc.desc      FileType/ProgressType enum values remain stable for index 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0015
     * @tc.name      testSafeFileInfoTail0015
     * @tc.desc      FileType/ProgressType enum values remain stable for index 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0016
     * @tc.name      testSafeFileInfoTail0016
     * @tc.desc      FileType/ProgressType enum values remain stable for index 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0017
     * @tc.name      testSafeFileInfoTail0017
     * @tc.desc      FileType/ProgressType enum values remain stable for index 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0018
     * @tc.name      testSafeFileInfoTail0018
     * @tc.desc      FileType/ProgressType enum values remain stable for index 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0019
     * @tc.name      testSafeFileInfoTail0019
     * @tc.desc      FileType/ProgressType enum values remain stable for index 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0020
     * @tc.name      testSafeFileInfoTail0020
     * @tc.desc      FileType/ProgressType enum values remain stable for index 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0021
     * @tc.name      testSafeFileInfoTail0021
     * @tc.desc      FileType/ProgressType enum values remain stable for index 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0022
     * @tc.name      testSafeFileInfoTail0022
     * @tc.desc      FileType/ProgressType enum values remain stable for index 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0023
     * @tc.name      testSafeFileInfoTail0023
     * @tc.desc      FileType/ProgressType enum values remain stable for index 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0024
     * @tc.name      testSafeFileInfoTail0024
     * @tc.desc      FileType/ProgressType enum values remain stable for index 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0025
     * @tc.name      testSafeFileInfoTail0025
     * @tc.desc      FileType/ProgressType enum values remain stable for index 24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0026
     * @tc.name      testSafeFileInfoTail0026
     * @tc.desc      FileType/ProgressType enum values remain stable for index 25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0027
     * @tc.name      testSafeFileInfoTail0027
     * @tc.desc      FileType/ProgressType enum values remain stable for index 26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0028
     * @tc.name      testSafeFileInfoTail0028
     * @tc.desc      FileType/ProgressType enum values remain stable for index 27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0029
     * @tc.name      testSafeFileInfoTail0029
     * @tc.desc      FileType/ProgressType enum values remain stable for index 28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0030
     * @tc.name      testSafeFileInfoTail0030
     * @tc.desc      FileType/ProgressType enum values remain stable for index 29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0031
     * @tc.name      testSafeFileInfoTail0031
     * @tc.desc      FileType/ProgressType enum values remain stable for index 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0032
     * @tc.name      testSafeFileInfoTail0032
     * @tc.desc      FileType/ProgressType enum values remain stable for index 31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0033
     * @tc.name      testSafeFileInfoTail0033
     * @tc.desc      FileType/ProgressType enum values remain stable for index 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0034
     * @tc.name      testSafeFileInfoTail0034
     * @tc.desc      FileType/ProgressType enum values remain stable for index 33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0035
     * @tc.name      testSafeFileInfoTail0035
     * @tc.desc      FileType/ProgressType enum values remain stable for index 34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0036
     * @tc.name      testSafeFileInfoTail0036
     * @tc.desc      FileType/ProgressType enum values remain stable for index 35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0037
     * @tc.name      testSafeFileInfoTail0037
     * @tc.desc      FileType/ProgressType enum values remain stable for index 36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0038
     * @tc.name      testSafeFileInfoTail0038
     * @tc.desc      FileType/ProgressType enum values remain stable for index 37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0039
     * @tc.name      testSafeFileInfoTail0039
     * @tc.desc      FileType/ProgressType enum values remain stable for index 38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0040
     * @tc.name      testSafeFileInfoTail0040
     * @tc.desc      FileType/ProgressType enum values remain stable for index 39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0041
     * @tc.name      testSafeFileInfoTail0041
     * @tc.desc      FileType/ProgressType enum values remain stable for index 40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0042
     * @tc.name      testSafeFileInfoTail0042
     * @tc.desc      FileType/ProgressType enum values remain stable for index 41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0043
     * @tc.name      testSafeFileInfoTail0043
     * @tc.desc      FileType/ProgressType enum values remain stable for index 42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0044
     * @tc.name      testSafeFileInfoTail0044
     * @tc.desc      FileType/ProgressType enum values remain stable for index 43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0045
     * @tc.name      testSafeFileInfoTail0045
     * @tc.desc      FileType/ProgressType enum values remain stable for index 44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0046
     * @tc.name      testSafeFileInfoTail0046
     * @tc.desc      FileType/ProgressType enum values remain stable for index 45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0047
     * @tc.name      testSafeFileInfoTail0047
     * @tc.desc      FileType/ProgressType enum values remain stable for index 46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0048
     * @tc.name      testSafeFileInfoTail0048
     * @tc.desc      FileType/ProgressType enum values remain stable for index 47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0049
     * @tc.name      testSafeFileInfoTail0049
     * @tc.desc      FileType/ProgressType enum values remain stable for index 48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0050
     * @tc.name      testSafeFileInfoTail0050
     * @tc.desc      FileType/ProgressType enum values remain stable for index 49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0051
     * @tc.name      testSafeFileInfoTail0051
     * @tc.desc      FileType/ProgressType enum values remain stable for index 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0052
     * @tc.name      testSafeFileInfoTail0052
     * @tc.desc      FileType/ProgressType enum values remain stable for index 51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0053
     * @tc.name      testSafeFileInfoTail0053
     * @tc.desc      FileType/ProgressType enum values remain stable for index 52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0054
     * @tc.name      testSafeFileInfoTail0054
     * @tc.desc      FileType/ProgressType enum values remain stable for index 53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0055
     * @tc.name      testSafeFileInfoTail0055
     * @tc.desc      FileType/ProgressType enum values remain stable for index 54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0056
     * @tc.name      testSafeFileInfoTail0056
     * @tc.desc      FileType/ProgressType enum values remain stable for index 55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0057
     * @tc.name      testSafeFileInfoTail0057
     * @tc.desc      FileType/ProgressType enum values remain stable for index 56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0058
     * @tc.name      testSafeFileInfoTail0058
     * @tc.desc      FileType/ProgressType enum values remain stable for index 57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0059
     * @tc.name      testSafeFileInfoTail0059
     * @tc.desc      FileType/ProgressType enum values remain stable for index 58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0060
     * @tc.name      testSafeFileInfoTail0060
     * @tc.desc      FileType/ProgressType enum values remain stable for index 59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0061
     * @tc.name      testSafeFileInfoTail0061
     * @tc.desc      FileType/ProgressType enum values remain stable for index 60.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0062
     * @tc.name      testSafeFileInfoTail0062
     * @tc.desc      FileType/ProgressType enum values remain stable for index 61.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0063
     * @tc.name      testSafeFileInfoTail0063
     * @tc.desc      FileType/ProgressType enum values remain stable for index 62.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0064
     * @tc.name      testSafeFileInfoTail0064
     * @tc.desc      FileType/ProgressType enum values remain stable for index 63.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0065
     * @tc.name      testSafeFileInfoTail0065
     * @tc.desc      FileType/ProgressType enum values remain stable for index 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0066
     * @tc.name      testSafeFileInfoTail0066
     * @tc.desc      FileType/ProgressType enum values remain stable for index 65.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0067
     * @tc.name      testSafeFileInfoTail0067
     * @tc.desc      FileType/ProgressType enum values remain stable for index 66.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0068
     * @tc.name      testSafeFileInfoTail0068
     * @tc.desc      FileType/ProgressType enum values remain stable for index 67.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0069
     * @tc.name      testSafeFileInfoTail0069
     * @tc.desc      FileType/ProgressType enum values remain stable for index 68.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0070
     * @tc.name      testSafeFileInfoTail0070
     * @tc.desc      FileType/ProgressType enum values remain stable for index 69.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0071
     * @tc.name      testSafeFileInfoTail0071
     * @tc.desc      FileType/ProgressType enum values remain stable for index 70.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0072
     * @tc.name      testSafeFileInfoTail0072
     * @tc.desc      FileType/ProgressType enum values remain stable for index 71.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0073
     * @tc.name      testSafeFileInfoTail0073
     * @tc.desc      FileType/ProgressType enum values remain stable for index 72.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0074
     * @tc.name      testSafeFileInfoTail0074
     * @tc.desc      FileType/ProgressType enum values remain stable for index 73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0075
     * @tc.name      testSafeFileInfoTail0075
     * @tc.desc      FileType/ProgressType enum values remain stable for index 74.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0076
     * @tc.name      testSafeFileInfoTail0076
     * @tc.desc      FileType/ProgressType enum values remain stable for index 75.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0077
     * @tc.name      testSafeFileInfoTail0077
     * @tc.desc      FileType/ProgressType enum values remain stable for index 76.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0078
     * @tc.name      testSafeFileInfoTail0078
     * @tc.desc      FileType/ProgressType enum values remain stable for index 77.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0079
     * @tc.name      testSafeFileInfoTail0079
     * @tc.desc      FileType/ProgressType enum values remain stable for index 78.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0080
     * @tc.name      testSafeFileInfoTail0080
     * @tc.desc      FileType/ProgressType enum values remain stable for index 79.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0081
     * @tc.name      testSafeFileInfoTail0081
     * @tc.desc      FileType/ProgressType enum values remain stable for index 80.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0082
     * @tc.name      testSafeFileInfoTail0082
     * @tc.desc      FileType/ProgressType enum values remain stable for index 81.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0083
     * @tc.name      testSafeFileInfoTail0083
     * @tc.desc      FileType/ProgressType enum values remain stable for index 82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0084
     * @tc.name      testSafeFileInfoTail0084
     * @tc.desc      FileType/ProgressType enum values remain stable for index 83.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0085
     * @tc.name      testSafeFileInfoTail0085
     * @tc.desc      FileType/ProgressType enum values remain stable for index 84.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0086
     * @tc.name      testSafeFileInfoTail0086
     * @tc.desc      FileType/ProgressType enum values remain stable for index 85.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0087
     * @tc.name      testSafeFileInfoTail0087
     * @tc.desc      FileType/ProgressType enum values remain stable for index 86.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0088
     * @tc.name      testSafeFileInfoTail0088
     * @tc.desc      FileType/ProgressType enum values remain stable for index 87.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0089
     * @tc.name      testSafeFileInfoTail0089
     * @tc.desc      FileType/ProgressType enum values remain stable for index 88.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0090
     * @tc.name      testSafeFileInfoTail0090
     * @tc.desc      FileType/ProgressType enum values remain stable for index 89.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0091
     * @tc.name      testSafeFileInfoTail0091
     * @tc.desc      FileType/ProgressType enum values remain stable for index 90.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0092
     * @tc.name      testSafeFileInfoTail0092
     * @tc.desc      FileType/ProgressType enum values remain stable for index 91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0093
     * @tc.name      testSafeFileInfoTail0093
     * @tc.desc      FileType/ProgressType enum values remain stable for index 92.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0094
     * @tc.name      testSafeFileInfoTail0094
     * @tc.desc      FileType/ProgressType enum values remain stable for index 93.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0095
     * @tc.name      testSafeFileInfoTail0095
     * @tc.desc      FileType/ProgressType enum values remain stable for index 94.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0096
     * @tc.name      testSafeFileInfoTail0096
     * @tc.desc      FileType/ProgressType enum values remain stable for index 95.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0097
     * @tc.name      testSafeFileInfoTail0097
     * @tc.desc      FileType/ProgressType enum values remain stable for index 96.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0098
     * @tc.name      testSafeFileInfoTail0098
     * @tc.desc      FileType/ProgressType enum values remain stable for index 97.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0099
     * @tc.name      testSafeFileInfoTail0099
     * @tc.desc      FileType/ProgressType enum values remain stable for index 98.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FIT_0100
     * @tc.name      testSafeFileInfoTail0100
     * @tc.desc      FileType/ProgressType enum values remain stable for index 99.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfoTail0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(FileType.LOCAL).assertEqual(0);
      expect(FileType.URL).assertEqual(1);
      expect(FileType.MEDIA_SOURCE).assertEqual(2);
      expect(ProgressType.TIME_UPDATE).assertEqual(0);
      expect(ProgressType.GET_PTS).assertEqual(1);
      expect(FileType.LOCAL).assertLess(FileType.MEDIA_SOURCE);
    })
  })
}
