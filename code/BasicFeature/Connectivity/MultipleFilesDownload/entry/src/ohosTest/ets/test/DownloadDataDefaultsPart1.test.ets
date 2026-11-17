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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { downloadFilesData } from 'multiplefilesdownload/src/main/ets/model/dataType';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MultipleFilesDownload]';

export default function DownloadDataDefaultsPart1Test(): void {
  describe('DownloadDataDefaultsPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATADEFP1_0100
     * @tc.name      testDownloadDefaults0001
     * @tc.desc      Verify default download data fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadDefaults0001 begin');
      const item: downloadFilesData = new downloadFilesData();
      expect(item.url).assertEqual('');
      expect(item.fileStatus).assertEqual(0);
      expect(item.downloadTime).assertEqual(0);
      expect(item.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadDefaults0001 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATADEFP1_0200
     * @tc.name      testDownloadExplicitEmpty0002
     * @tc.desc      Verify explicit empty values are preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadExplicitEmpty0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadExplicitEmpty0002 begin');
      const item: downloadFilesData = new downloadFilesData('', 0, 0);
      expect(item.url).assertEqual('');
      expect(item.fileStatus).assertEqual(0);
      expect(item.downloadTime).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadExplicitEmpty0002 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_DATADEFP1_0300
     * @tc.name      testDownloadStatusRange0003
     * @tc.desc      Verify status values can represent the documented 0..3 states.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDownloadStatusRange0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadStatusRange0003 begin');
      const zero: downloadFilesData = new downloadFilesData('u0', 0, 0);
      const one: downloadFilesData = new downloadFilesData('u1', 1, 1);
      const two: downloadFilesData = new downloadFilesData('u2', 2, 2);
      const three: downloadFilesData = new downloadFilesData('u3', 3, 3);
      expect(zero.fileStatus + one.fileStatus + two.fileStatus + three.fileStatus).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDownloadStatusRange0003 end');
    })

  })
}
