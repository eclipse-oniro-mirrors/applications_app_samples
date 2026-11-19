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
import { formatTime, getFileNameFromUrl } from 'multiplefilesdownload/src/main/ets/utils/formatTime';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MultipleFilesDownload]';

export default function FileNameMatrixPart2Test(): void {
  describe('FileNameMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9100
     * @tc.name      testFileName0091
     * @tc.desc      Verify file name extraction for 'https://example.com/dir90/file90.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0091 begin');
      expect(getFileNameFromUrl('https://example.com/dir90/file90.dat')).assertEqual('file90.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0091 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9200
     * @tc.name      testFileName0092
     * @tc.desc      Verify file name extraction for 'https://example.com/dir91/file91.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0092 begin');
      expect(getFileNameFromUrl('https://example.com/dir91/file91.dat')).assertEqual('file91.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0092 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9300
     * @tc.name      testFileName0093
     * @tc.desc      Verify file name extraction for 'https://example.com/dir92/file92.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0093 begin');
      expect(getFileNameFromUrl('https://example.com/dir92/file92.dat')).assertEqual('file92.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0093 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9400
     * @tc.name      testFileName0094
     * @tc.desc      Verify file name extraction for 'https://example.com/dir93/file93.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0094 begin');
      expect(getFileNameFromUrl('https://example.com/dir93/file93.dat')).assertEqual('file93.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0094 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9500
     * @tc.name      testFileName0095
     * @tc.desc      Verify file name extraction for 'https://example.com/dir94/file94.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0095 begin');
      expect(getFileNameFromUrl('https://example.com/dir94/file94.dat')).assertEqual('file94.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0095 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9600
     * @tc.name      testFileName0096
     * @tc.desc      Verify file name extraction for 'https://example.com/dir95/file95.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0096 begin');
      expect(getFileNameFromUrl('https://example.com/dir95/file95.dat')).assertEqual('file95.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0096 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9700
     * @tc.name      testFileName0097
     * @tc.desc      Verify file name extraction for 'https://example.com/dir96/file96.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0097 begin');
      expect(getFileNameFromUrl('https://example.com/dir96/file96.dat')).assertEqual('file96.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0097 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9800
     * @tc.name      testFileName0098
     * @tc.desc      Verify file name extraction for 'https://example.com/dir97/file97.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0098 begin');
      expect(getFileNameFromUrl('https://example.com/dir97/file97.dat')).assertEqual('file97.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0098 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_9900
     * @tc.name      testFileName0099
     * @tc.desc      Verify file name extraction for 'https://example.com/dir98/file98.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0099 begin');
      expect(getFileNameFromUrl('https://example.com/dir98/file98.dat')).assertEqual('file98.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0099 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0100
     * @tc.name      testFileName0100
     * @tc.desc      Verify file name extraction for 'https://example.com/dir99/file99.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0100 begin');
      expect(getFileNameFromUrl('https://example.com/dir99/file99.dat')).assertEqual('file99.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0100 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0200
     * @tc.name      testFileName0101
     * @tc.desc      Verify file name extraction for 'https://example.com/dir100/file100.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0101 begin');
      expect(getFileNameFromUrl('https://example.com/dir100/file100.dat')).assertEqual('file100.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0101 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0300
     * @tc.name      testFileName0102
     * @tc.desc      Verify file name extraction for 'https://example.com/dir101/file101.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0102 begin');
      expect(getFileNameFromUrl('https://example.com/dir101/file101.dat')).assertEqual('file101.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0102 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0400
     * @tc.name      testFileName0103
     * @tc.desc      Verify file name extraction for 'https://example.com/dir102/file102.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0103 begin');
      expect(getFileNameFromUrl('https://example.com/dir102/file102.dat')).assertEqual('file102.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0103 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0500
     * @tc.name      testFileName0104
     * @tc.desc      Verify file name extraction for 'https://example.com/dir103/file103.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0104 begin');
      expect(getFileNameFromUrl('https://example.com/dir103/file103.dat')).assertEqual('file103.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0104 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0600
     * @tc.name      testFileName0105
     * @tc.desc      Verify file name extraction for 'https://example.com/dir104/file104.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0105 begin');
      expect(getFileNameFromUrl('https://example.com/dir104/file104.dat')).assertEqual('file104.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0105 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0700
     * @tc.name      testFileName0106
     * @tc.desc      Verify file name extraction for 'https://example.com/dir105/file105.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0106 begin');
      expect(getFileNameFromUrl('https://example.com/dir105/file105.dat')).assertEqual('file105.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0106 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0800
     * @tc.name      testFileName0107
     * @tc.desc      Verify file name extraction for 'https://example.com/dir106/file106.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0107 begin');
      expect(getFileNameFromUrl('https://example.com/dir106/file106.dat')).assertEqual('file106.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0107 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_0900
     * @tc.name      testFileName0108
     * @tc.desc      Verify file name extraction for 'https://example.com/dir107/file107.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0108 begin');
      expect(getFileNameFromUrl('https://example.com/dir107/file107.dat')).assertEqual('file107.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0108 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1000
     * @tc.name      testFileName0109
     * @tc.desc      Verify file name extraction for 'https://example.com/dir108/file108.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0109 begin');
      expect(getFileNameFromUrl('https://example.com/dir108/file108.dat')).assertEqual('file108.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0109 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1100
     * @tc.name      testFileName0110
     * @tc.desc      Verify file name extraction for 'https://example.com/dir109/file109.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0110 begin');
      expect(getFileNameFromUrl('https://example.com/dir109/file109.dat')).assertEqual('file109.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0110 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1200
     * @tc.name      testFileName0111
     * @tc.desc      Verify file name extraction for 'https://example.com/dir110/file110.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0111 begin');
      expect(getFileNameFromUrl('https://example.com/dir110/file110.dat')).assertEqual('file110.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0111 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1300
     * @tc.name      testFileName0112
     * @tc.desc      Verify file name extraction for 'https://example.com/dir111/file111.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0112 begin');
      expect(getFileNameFromUrl('https://example.com/dir111/file111.dat')).assertEqual('file111.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0112 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1400
     * @tc.name      testFileName0113
     * @tc.desc      Verify file name extraction for 'https://example.com/dir112/file112.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0113 begin');
      expect(getFileNameFromUrl('https://example.com/dir112/file112.dat')).assertEqual('file112.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0113 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1500
     * @tc.name      testFileName0114
     * @tc.desc      Verify file name extraction for 'https://example.com/dir113/file113.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0114 begin');
      expect(getFileNameFromUrl('https://example.com/dir113/file113.dat')).assertEqual('file113.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0114 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1600
     * @tc.name      testFileName0115
     * @tc.desc      Verify file name extraction for 'https://example.com/dir114/file114.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0115 begin');
      expect(getFileNameFromUrl('https://example.com/dir114/file114.dat')).assertEqual('file114.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0115 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1700
     * @tc.name      testFileName0116
     * @tc.desc      Verify file name extraction for 'https://example.com/dir115/file115.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0116 begin');
      expect(getFileNameFromUrl('https://example.com/dir115/file115.dat')).assertEqual('file115.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0116 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1800
     * @tc.name      testFileName0117
     * @tc.desc      Verify file name extraction for 'https://example.com/dir116/file116.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0117 begin');
      expect(getFileNameFromUrl('https://example.com/dir116/file116.dat')).assertEqual('file116.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0117 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_1900
     * @tc.name      testFileName0118
     * @tc.desc      Verify file name extraction for 'https://example.com/dir117/file117.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0118 begin');
      expect(getFileNameFromUrl('https://example.com/dir117/file117.dat')).assertEqual('file117.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0118 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2000
     * @tc.name      testFileName0119
     * @tc.desc      Verify file name extraction for 'https://example.com/dir118/file118.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0119 begin');
      expect(getFileNameFromUrl('https://example.com/dir118/file118.dat')).assertEqual('file118.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0119 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2100
     * @tc.name      testFileName0120
     * @tc.desc      Verify file name extraction for 'https://example.com/dir119/file119.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0120 begin');
      expect(getFileNameFromUrl('https://example.com/dir119/file119.dat')).assertEqual('file119.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0120 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2200
     * @tc.name      testFileName0121
     * @tc.desc      Verify file name extraction for 'https://example.com/dir120/file120.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0121 begin');
      expect(getFileNameFromUrl('https://example.com/dir120/file120.dat')).assertEqual('file120.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0121 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2300
     * @tc.name      testFileName0122
     * @tc.desc      Verify file name extraction for 'https://example.com/dir121/file121.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0122 begin');
      expect(getFileNameFromUrl('https://example.com/dir121/file121.dat')).assertEqual('file121.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0122 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2400
     * @tc.name      testFileName0123
     * @tc.desc      Verify file name extraction for 'https://example.com/dir122/file122.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0123 begin');
      expect(getFileNameFromUrl('https://example.com/dir122/file122.dat')).assertEqual('file122.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0123 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2500
     * @tc.name      testFileName0124
     * @tc.desc      Verify file name extraction for 'https://example.com/dir123/file123.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0124 begin');
      expect(getFileNameFromUrl('https://example.com/dir123/file123.dat')).assertEqual('file123.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0124 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2600
     * @tc.name      testFileName0125
     * @tc.desc      Verify file name extraction for 'https://example.com/dir124/file124.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0125 begin');
      expect(getFileNameFromUrl('https://example.com/dir124/file124.dat')).assertEqual('file124.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0125 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2700
     * @tc.name      testFileName0126
     * @tc.desc      Verify file name extraction for 'https://example.com/dir125/file125.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0126 begin');
      expect(getFileNameFromUrl('https://example.com/dir125/file125.dat')).assertEqual('file125.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0126 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2800
     * @tc.name      testFileName0127
     * @tc.desc      Verify file name extraction for 'https://example.com/dir126/file126.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0127 begin');
      expect(getFileNameFromUrl('https://example.com/dir126/file126.dat')).assertEqual('file126.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0127 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_2900
     * @tc.name      testFileName0128
     * @tc.desc      Verify file name extraction for 'https://example.com/dir127/file127.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0128 begin');
      expect(getFileNameFromUrl('https://example.com/dir127/file127.dat')).assertEqual('file127.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0128 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3000
     * @tc.name      testFileName0129
     * @tc.desc      Verify file name extraction for 'https://example.com/dir128/file128.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0129 begin');
      expect(getFileNameFromUrl('https://example.com/dir128/file128.dat')).assertEqual('file128.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0129 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3100
     * @tc.name      testFileName0130
     * @tc.desc      Verify file name extraction for 'https://example.com/dir129/file129.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0130 begin');
      expect(getFileNameFromUrl('https://example.com/dir129/file129.dat')).assertEqual('file129.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0130 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3200
     * @tc.name      testFileName0131
     * @tc.desc      Verify file name extraction for 'https://example.com/dir130/file130.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0131 begin');
      expect(getFileNameFromUrl('https://example.com/dir130/file130.dat')).assertEqual('file130.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0131 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3300
     * @tc.name      testFileName0132
     * @tc.desc      Verify file name extraction for 'https://example.com/dir131/file131.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0132 begin');
      expect(getFileNameFromUrl('https://example.com/dir131/file131.dat')).assertEqual('file131.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0132 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3400
     * @tc.name      testFileName0133
     * @tc.desc      Verify file name extraction for 'https://example.com/dir132/file132.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0133 begin');
      expect(getFileNameFromUrl('https://example.com/dir132/file132.dat')).assertEqual('file132.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0133 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3500
     * @tc.name      testFileName0134
     * @tc.desc      Verify file name extraction for 'https://example.com/dir133/file133.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0134 begin');
      expect(getFileNameFromUrl('https://example.com/dir133/file133.dat')).assertEqual('file133.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0134 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3600
     * @tc.name      testFileName0135
     * @tc.desc      Verify file name extraction for 'https://example.com/dir134/file134.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0135 begin');
      expect(getFileNameFromUrl('https://example.com/dir134/file134.dat')).assertEqual('file134.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0135 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3700
     * @tc.name      testFileName0136
     * @tc.desc      Verify file name extraction for 'https://example.com/dir135/file135.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0136 begin');
      expect(getFileNameFromUrl('https://example.com/dir135/file135.dat')).assertEqual('file135.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0136 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3800
     * @tc.name      testFileName0137
     * @tc.desc      Verify file name extraction for 'https://example.com/dir136/file136.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0137 begin');
      expect(getFileNameFromUrl('https://example.com/dir136/file136.dat')).assertEqual('file136.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0137 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_3900
     * @tc.name      testFileName0138
     * @tc.desc      Verify file name extraction for 'https://example.com/dir137/file137.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0138 begin');
      expect(getFileNameFromUrl('https://example.com/dir137/file137.dat')).assertEqual('file137.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0138 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4000
     * @tc.name      testFileName0139
     * @tc.desc      Verify file name extraction for 'https://example.com/dir138/file138.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0139 begin');
      expect(getFileNameFromUrl('https://example.com/dir138/file138.dat')).assertEqual('file138.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0139 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4100
     * @tc.name      testFileName0140
     * @tc.desc      Verify file name extraction for 'https://example.com/dir139/file139.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0140 begin');
      expect(getFileNameFromUrl('https://example.com/dir139/file139.dat')).assertEqual('file139.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0140 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4200
     * @tc.name      testFileName0141
     * @tc.desc      Verify file name extraction for 'https://example.com/dir140/file140.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0141 begin');
      expect(getFileNameFromUrl('https://example.com/dir140/file140.dat')).assertEqual('file140.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0141 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4300
     * @tc.name      testFileName0142
     * @tc.desc      Verify file name extraction for 'https://example.com/dir141/file141.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0142 begin');
      expect(getFileNameFromUrl('https://example.com/dir141/file141.dat')).assertEqual('file141.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0142 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4400
     * @tc.name      testFileName0143
     * @tc.desc      Verify file name extraction for 'https://example.com/dir142/file142.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0143 begin');
      expect(getFileNameFromUrl('https://example.com/dir142/file142.dat')).assertEqual('file142.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0143 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4500
     * @tc.name      testFileName0144
     * @tc.desc      Verify file name extraction for 'https://example.com/dir143/file143.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0144 begin');
      expect(getFileNameFromUrl('https://example.com/dir143/file143.dat')).assertEqual('file143.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0144 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4600
     * @tc.name      testFileName0145
     * @tc.desc      Verify file name extraction for 'https://example.com/dir144/file144.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0145 begin');
      expect(getFileNameFromUrl('https://example.com/dir144/file144.dat')).assertEqual('file144.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0145 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4700
     * @tc.name      testFileName0146
     * @tc.desc      Verify file name extraction for 'https://example.com/dir145/file145.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0146 begin');
      expect(getFileNameFromUrl('https://example.com/dir145/file145.dat')).assertEqual('file145.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0146 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4800
     * @tc.name      testFileName0147
     * @tc.desc      Verify file name extraction for 'https://example.com/dir146/file146.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0147 begin');
      expect(getFileNameFromUrl('https://example.com/dir146/file146.dat')).assertEqual('file146.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0147 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_4900
     * @tc.name      testFileName0148
     * @tc.desc      Verify file name extraction for 'https://example.com/dir147/file147.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0148 begin');
      expect(getFileNameFromUrl('https://example.com/dir147/file147.dat')).assertEqual('file147.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0148 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5000
     * @tc.name      testFileName0149
     * @tc.desc      Verify file name extraction for 'https://example.com/dir148/file148.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0149 begin');
      expect(getFileNameFromUrl('https://example.com/dir148/file148.dat')).assertEqual('file148.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0149 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5100
     * @tc.name      testFileName0150
     * @tc.desc      Verify file name extraction for 'https://example.com/dir149/file149.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0150 begin');
      expect(getFileNameFromUrl('https://example.com/dir149/file149.dat')).assertEqual('file149.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0150 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5200
     * @tc.name      testFileName0151
     * @tc.desc      Verify file name extraction for 'https://example.com/dir150/file150.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0151 begin');
      expect(getFileNameFromUrl('https://example.com/dir150/file150.dat')).assertEqual('file150.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0151 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5300
     * @tc.name      testFileName0152
     * @tc.desc      Verify file name extraction for 'https://example.com/dir151/file151.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0152 begin');
      expect(getFileNameFromUrl('https://example.com/dir151/file151.dat')).assertEqual('file151.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0152 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5400
     * @tc.name      testFileName0153
     * @tc.desc      Verify file name extraction for 'https://example.com/dir152/file152.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0153 begin');
      expect(getFileNameFromUrl('https://example.com/dir152/file152.dat')).assertEqual('file152.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0153 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5500
     * @tc.name      testFileName0154
     * @tc.desc      Verify file name extraction for 'https://example.com/dir153/file153.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0154 begin');
      expect(getFileNameFromUrl('https://example.com/dir153/file153.dat')).assertEqual('file153.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0154 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5600
     * @tc.name      testFileName0155
     * @tc.desc      Verify file name extraction for 'https://example.com/dir154/file154.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0155 begin');
      expect(getFileNameFromUrl('https://example.com/dir154/file154.dat')).assertEqual('file154.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0155 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5700
     * @tc.name      testFileName0156
     * @tc.desc      Verify file name extraction for 'https://example.com/dir155/file155.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0156 begin');
      expect(getFileNameFromUrl('https://example.com/dir155/file155.dat')).assertEqual('file155.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0156 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5800
     * @tc.name      testFileName0157
     * @tc.desc      Verify file name extraction for 'https://example.com/dir156/file156.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0157 begin');
      expect(getFileNameFromUrl('https://example.com/dir156/file156.dat')).assertEqual('file156.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0157 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_5900
     * @tc.name      testFileName0158
     * @tc.desc      Verify file name extraction for 'https://example.com/dir157/file157.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0158 begin');
      expect(getFileNameFromUrl('https://example.com/dir157/file157.dat')).assertEqual('file157.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0158 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6000
     * @tc.name      testFileName0159
     * @tc.desc      Verify file name extraction for 'https://example.com/dir158/file158.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0159 begin');
      expect(getFileNameFromUrl('https://example.com/dir158/file158.dat')).assertEqual('file158.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0159 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6100
     * @tc.name      testFileName0160
     * @tc.desc      Verify file name extraction for 'https://example.com/dir159/file159.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0160 begin');
      expect(getFileNameFromUrl('https://example.com/dir159/file159.dat')).assertEqual('file159.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0160 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6200
     * @tc.name      testFileName0161
     * @tc.desc      Verify file name extraction for 'https://example.com/dir160/file160.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0161 begin');
      expect(getFileNameFromUrl('https://example.com/dir160/file160.dat')).assertEqual('file160.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0161 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6300
     * @tc.name      testFileName0162
     * @tc.desc      Verify file name extraction for 'https://example.com/dir161/file161.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0162 begin');
      expect(getFileNameFromUrl('https://example.com/dir161/file161.dat')).assertEqual('file161.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0162 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6400
     * @tc.name      testFileName0163
     * @tc.desc      Verify file name extraction for 'https://example.com/dir162/file162.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0163 begin');
      expect(getFileNameFromUrl('https://example.com/dir162/file162.dat')).assertEqual('file162.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0163 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6500
     * @tc.name      testFileName0164
     * @tc.desc      Verify file name extraction for 'https://example.com/dir163/file163.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0164 begin');
      expect(getFileNameFromUrl('https://example.com/dir163/file163.dat')).assertEqual('file163.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0164 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6600
     * @tc.name      testFileName0165
     * @tc.desc      Verify file name extraction for 'https://example.com/dir164/file164.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0165 begin');
      expect(getFileNameFromUrl('https://example.com/dir164/file164.dat')).assertEqual('file164.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0165 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6700
     * @tc.name      testFileName0166
     * @tc.desc      Verify file name extraction for 'https://example.com/dir165/file165.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0166 begin');
      expect(getFileNameFromUrl('https://example.com/dir165/file165.dat')).assertEqual('file165.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0166 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6800
     * @tc.name      testFileName0167
     * @tc.desc      Verify file name extraction for 'https://example.com/dir166/file166.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0167 begin');
      expect(getFileNameFromUrl('https://example.com/dir166/file166.dat')).assertEqual('file166.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0167 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_6900
     * @tc.name      testFileName0168
     * @tc.desc      Verify file name extraction for 'https://example.com/dir167/file167.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0168 begin');
      expect(getFileNameFromUrl('https://example.com/dir167/file167.dat')).assertEqual('file167.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0168 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7000
     * @tc.name      testFileName0169
     * @tc.desc      Verify file name extraction for 'https://example.com/dir168/file168.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0169 begin');
      expect(getFileNameFromUrl('https://example.com/dir168/file168.dat')).assertEqual('file168.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0169 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7100
     * @tc.name      testFileName0170
     * @tc.desc      Verify file name extraction for 'https://example.com/dir169/file169.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0170 begin');
      expect(getFileNameFromUrl('https://example.com/dir169/file169.dat')).assertEqual('file169.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0170 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7200
     * @tc.name      testFileName0171
     * @tc.desc      Verify file name extraction for 'https://example.com/dir170/file170.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0171 begin');
      expect(getFileNameFromUrl('https://example.com/dir170/file170.dat')).assertEqual('file170.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0171 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7300
     * @tc.name      testFileName0172
     * @tc.desc      Verify file name extraction for 'https://example.com/dir171/file171.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0172 begin');
      expect(getFileNameFromUrl('https://example.com/dir171/file171.dat')).assertEqual('file171.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0172 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7400
     * @tc.name      testFileName0173
     * @tc.desc      Verify file name extraction for 'https://example.com/dir172/file172.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0173 begin');
      expect(getFileNameFromUrl('https://example.com/dir172/file172.dat')).assertEqual('file172.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0173 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7500
     * @tc.name      testFileName0174
     * @tc.desc      Verify file name extraction for 'https://example.com/dir173/file173.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0174 begin');
      expect(getFileNameFromUrl('https://example.com/dir173/file173.dat')).assertEqual('file173.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0174 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7600
     * @tc.name      testFileName0175
     * @tc.desc      Verify file name extraction for 'https://example.com/dir174/file174.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0175 begin');
      expect(getFileNameFromUrl('https://example.com/dir174/file174.dat')).assertEqual('file174.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0175 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7700
     * @tc.name      testFileName0176
     * @tc.desc      Verify file name extraction for 'https://example.com/dir175/file175.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0176 begin');
      expect(getFileNameFromUrl('https://example.com/dir175/file175.dat')).assertEqual('file175.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0176 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7800
     * @tc.name      testFileName0177
     * @tc.desc      Verify file name extraction for 'https://example.com/dir176/file176.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0177 begin');
      expect(getFileNameFromUrl('https://example.com/dir176/file176.dat')).assertEqual('file176.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0177 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_7900
     * @tc.name      testFileName0178
     * @tc.desc      Verify file name extraction for 'https://example.com/dir177/file177.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0178 begin');
      expect(getFileNameFromUrl('https://example.com/dir177/file177.dat')).assertEqual('file177.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0178 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_8000
     * @tc.name      testFileName0179
     * @tc.desc      Verify file name extraction for 'https://example.com/dir178/file178.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0179 begin');
      expect(getFileNameFromUrl('https://example.com/dir178/file178.dat')).assertEqual('file178.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0179 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP2_ONE_8100
     * @tc.name      testFileName0180
     * @tc.desc      Verify file name extraction for 'https://example.com/dir179/file179.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0180 begin');
      expect(getFileNameFromUrl('https://example.com/dir179/file179.dat')).assertEqual('file179.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0180 end');
    })

  })
}
