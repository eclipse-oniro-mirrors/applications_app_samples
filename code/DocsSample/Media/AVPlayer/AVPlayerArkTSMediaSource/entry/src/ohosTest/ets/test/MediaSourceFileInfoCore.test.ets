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
import { FileInfo, FileType, ProgressType } from '../../../main/ets/components/download';

const TAG: string = '[Sample_MediaSourceFileInfoCore]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceFileInfoCoreTest(): void {
  describe('mediaSourceFileInfoCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0001
     * @tc.name      testSafeFileInfo0001
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_0', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_0');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0002
     * @tc.name      testSafeFileInfo0002
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_1', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_1');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0003
     * @tc.name      testSafeFileInfo0003
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_2', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_2');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0004
     * @tc.name      testSafeFileInfo0004
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_3', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_3');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0005
     * @tc.name      testSafeFileInfo0005
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_4', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_4');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0006
     * @tc.name      testSafeFileInfo0006
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_5', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_5');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0007
     * @tc.name      testSafeFileInfo0007
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_6', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_6');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0008
     * @tc.name      testSafeFileInfo0008
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_7', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_7');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0009
     * @tc.name      testSafeFileInfo0009
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_8', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_8');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0010
     * @tc.name      testSafeFileInfo0010
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_9', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_9');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0011
     * @tc.name      testSafeFileInfo0011
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_10', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_10');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0012
     * @tc.name      testSafeFileInfo0012
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_11', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_11');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0013
     * @tc.name      testSafeFileInfo0013
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_12', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_12');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0014
     * @tc.name      testSafeFileInfo0014
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_13', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_13');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0015
     * @tc.name      testSafeFileInfo0015
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_14', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_14');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0016
     * @tc.name      testSafeFileInfo0016
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_15', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_15');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0017
     * @tc.name      testSafeFileInfo0017
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_16', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_16');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0018
     * @tc.name      testSafeFileInfo0018
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_17', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_17');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0019
     * @tc.name      testSafeFileInfo0019
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_18', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_18');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0020
     * @tc.name      testSafeFileInfo0020
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_19', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_19');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0021
     * @tc.name      testSafeFileInfo0021
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_20', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_20');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0022
     * @tc.name      testSafeFileInfo0022
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_21', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_21');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0023
     * @tc.name      testSafeFileInfo0023
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_22', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_22');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0024
     * @tc.name      testSafeFileInfo0024
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_23', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_23');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0025
     * @tc.name      testSafeFileInfo0025
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_24', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_24');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0026
     * @tc.name      testSafeFileInfo0026
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_25', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_25');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0027
     * @tc.name      testSafeFileInfo0027
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_26', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_26');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0028
     * @tc.name      testSafeFileInfo0028
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_27', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_27');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0029
     * @tc.name      testSafeFileInfo0029
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_28', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_28');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0030
     * @tc.name      testSafeFileInfo0030
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_29', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_29');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0031
     * @tc.name      testSafeFileInfo0031
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_30', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_30');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0032
     * @tc.name      testSafeFileInfo0032
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_31', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_31');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0033
     * @tc.name      testSafeFileInfo0033
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_32', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_32');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0034
     * @tc.name      testSafeFileInfo0034
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_33', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_33');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0035
     * @tc.name      testSafeFileInfo0035
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_34', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_34');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0036
     * @tc.name      testSafeFileInfo0036
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_35', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_35');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0037
     * @tc.name      testSafeFileInfo0037
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_36', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_36');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0038
     * @tc.name      testSafeFileInfo0038
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_37', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_37');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0039
     * @tc.name      testSafeFileInfo0039
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_38', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_38');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0040
     * @tc.name      testSafeFileInfo0040
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_39', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_39');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0041
     * @tc.name      testSafeFileInfo0041
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_40', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_40');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0042
     * @tc.name      testSafeFileInfo0042
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_41', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_41');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0043
     * @tc.name      testSafeFileInfo0043
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_42', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_42');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0044
     * @tc.name      testSafeFileInfo0044
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_43', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_43');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0045
     * @tc.name      testSafeFileInfo0045
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_44', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_44');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0046
     * @tc.name      testSafeFileInfo0046
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_45', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_45');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0047
     * @tc.name      testSafeFileInfo0047
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_46', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_46');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0048
     * @tc.name      testSafeFileInfo0048
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_47', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_47');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0049
     * @tc.name      testSafeFileInfo0049
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_48', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_48');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0050
     * @tc.name      testSafeFileInfo0050
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_49', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_49');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0051
     * @tc.name      testSafeFileInfo0051
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_50', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_50');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0052
     * @tc.name      testSafeFileInfo0052
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_51', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_51');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0053
     * @tc.name      testSafeFileInfo0053
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_52', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_52');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0054
     * @tc.name      testSafeFileInfo0054
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_53', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_53');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0055
     * @tc.name      testSafeFileInfo0055
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_54', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_54');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0056
     * @tc.name      testSafeFileInfo0056
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_55', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_55');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0057
     * @tc.name      testSafeFileInfo0057
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_56', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_56');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0058
     * @tc.name      testSafeFileInfo0058
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_57', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_57');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0059
     * @tc.name      testSafeFileInfo0059
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_58', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_58');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0060
     * @tc.name      testSafeFileInfo0060
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_59', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_59');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0061
     * @tc.name      testSafeFileInfo0061
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_60', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_60');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0062
     * @tc.name      testSafeFileInfo0062
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_61', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_61');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0063
     * @tc.name      testSafeFileInfo0063
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_62', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_62');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0064
     * @tc.name      testSafeFileInfo0064
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_63', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_63');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0065
     * @tc.name      testSafeFileInfo0065
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_64', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_64');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0066
     * @tc.name      testSafeFileInfo0066
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_65', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_65');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0067
     * @tc.name      testSafeFileInfo0067
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_66', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_66');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0068
     * @tc.name      testSafeFileInfo0068
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_67', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_67');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0069
     * @tc.name      testSafeFileInfo0069
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_68', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_68');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0070
     * @tc.name      testSafeFileInfo0070
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_69', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_69');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0071
     * @tc.name      testSafeFileInfo0071
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_70', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_70');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0072
     * @tc.name      testSafeFileInfo0072
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_71', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_71');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0073
     * @tc.name      testSafeFileInfo0073
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_72', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_72');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0074
     * @tc.name      testSafeFileInfo0074
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_73', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_73');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0075
     * @tc.name      testSafeFileInfo0075
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_74', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_74');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0076
     * @tc.name      testSafeFileInfo0076
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_75', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_75');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0077
     * @tc.name      testSafeFileInfo0077
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_76', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_76');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0078
     * @tc.name      testSafeFileInfo0078
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_77', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_77');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0079
     * @tc.name      testSafeFileInfo0079
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_78', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_78');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0080
     * @tc.name      testSafeFileInfo0080
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_79', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_79');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0081
     * @tc.name      testSafeFileInfo0081
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_80', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_80');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0082
     * @tc.name      testSafeFileInfo0082
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_81', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_81');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0083
     * @tc.name      testSafeFileInfo0083
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_82', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_82');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0084
     * @tc.name      testSafeFileInfo0084
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_83', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_83');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0085
     * @tc.name      testSafeFileInfo0085
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_84', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_84');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0086
     * @tc.name      testSafeFileInfo0086
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_85', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_85');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0087
     * @tc.name      testSafeFileInfo0087
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_86', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_86');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0088
     * @tc.name      testSafeFileInfo0088
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_87', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_87');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0089
     * @tc.name      testSafeFileInfo0089
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_88', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_88');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0090
     * @tc.name      testSafeFileInfo0090
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_89', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_89');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0091
     * @tc.name      testSafeFileInfo0091
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_90', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_90');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0092
     * @tc.name      testSafeFileInfo0092
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_91', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_91');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0093
     * @tc.name      testSafeFileInfo0093
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_92', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_92');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0094
     * @tc.name      testSafeFileInfo0094
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_93', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_93');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0095
     * @tc.name      testSafeFileInfo0095
     * @tc.desc      FileInfo carries URL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_94', FileType.URL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_94');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0096
     * @tc.name      testSafeFileInfo0096
     * @tc.desc      FileInfo carries MEDIA_SOURCE and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_95', FileType.MEDIA_SOURCE, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_95');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0097
     * @tc.name      testSafeFileInfo0097
     * @tc.desc      FileInfo carries LOCAL and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_96', FileType.LOCAL, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_96');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0098
     * @tc.name      testSafeFileInfo0098
     * @tc.desc      FileInfo carries URL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_97', FileType.URL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_97');
      expect(info.type).assertEqual(FileType.URL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0099
     * @tc.name      testSafeFileInfo0099
     * @tc.desc      FileInfo carries MEDIA_SOURCE and TIME_UPDATE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_98', FileType.MEDIA_SOURCE, ProgressType.TIME_UPDATE);
      expect(info.fileName).assertEqual('asset_98');
      expect(info.type).assertEqual(FileType.MEDIA_SOURCE);
      expect(info.progress).assertEqual(ProgressType.TIME_UPDATE);
      expect(info.fileName.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_FI_0100
     * @tc.name      testSafeFileInfo0100
     * @tc.desc      FileInfo carries LOCAL and GET_PTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: FileInfo = new FileInfo('asset_99', FileType.LOCAL, ProgressType.GET_PTS);
      expect(info.fileName).assertEqual('asset_99');
      expect(info.type).assertEqual(FileType.LOCAL);
      expect(info.progress).assertEqual(ProgressType.GET_PTS);
      expect(info.fileName.length).assertLarger(0);
    })
  })
}
