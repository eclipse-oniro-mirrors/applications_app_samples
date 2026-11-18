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

export default function FileNameMatrixPart1Test(): void {
  describe('FileNameMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0100
     * @tc.name      testFileName0001
     * @tc.desc      Verify file name extraction for 'https://example.com/dir0/file0.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0001 begin');
      expect(getFileNameFromUrl('https://example.com/dir0/file0.dat')).assertEqual('file0.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0001 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0200
     * @tc.name      testFileName0002
     * @tc.desc      Verify file name extraction for 'https://example.com/dir1/file1.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0002 begin');
      expect(getFileNameFromUrl('https://example.com/dir1/file1.dat')).assertEqual('file1.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0002 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0300
     * @tc.name      testFileName0003
     * @tc.desc      Verify file name extraction for 'https://example.com/dir2/file2.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0003 begin');
      expect(getFileNameFromUrl('https://example.com/dir2/file2.dat')).assertEqual('file2.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0003 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0400
     * @tc.name      testFileName0004
     * @tc.desc      Verify file name extraction for 'https://example.com/dir3/file3.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0004 begin');
      expect(getFileNameFromUrl('https://example.com/dir3/file3.dat')).assertEqual('file3.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0004 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0500
     * @tc.name      testFileName0005
     * @tc.desc      Verify file name extraction for 'https://example.com/dir4/file4.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0005 begin');
      expect(getFileNameFromUrl('https://example.com/dir4/file4.dat')).assertEqual('file4.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0005 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0600
     * @tc.name      testFileName0006
     * @tc.desc      Verify file name extraction for 'https://example.com/dir5/file5.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0006 begin');
      expect(getFileNameFromUrl('https://example.com/dir5/file5.dat')).assertEqual('file5.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0006 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0700
     * @tc.name      testFileName0007
     * @tc.desc      Verify file name extraction for 'https://example.com/dir6/file6.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0007 begin');
      expect(getFileNameFromUrl('https://example.com/dir6/file6.dat')).assertEqual('file6.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0007 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0800
     * @tc.name      testFileName0008
     * @tc.desc      Verify file name extraction for 'https://example.com/dir7/file7.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0008 begin');
      expect(getFileNameFromUrl('https://example.com/dir7/file7.dat')).assertEqual('file7.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0008 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_0900
     * @tc.name      testFileName0009
     * @tc.desc      Verify file name extraction for 'https://example.com/dir8/file8.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0009 begin');
      expect(getFileNameFromUrl('https://example.com/dir8/file8.dat')).assertEqual('file8.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0009 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1000
     * @tc.name      testFileName0010
     * @tc.desc      Verify file name extraction for 'https://example.com/dir9/file9.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0010 begin');
      expect(getFileNameFromUrl('https://example.com/dir9/file9.dat')).assertEqual('file9.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0010 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1100
     * @tc.name      testFileName0011
     * @tc.desc      Verify file name extraction for 'https://example.com/dir10/file10.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0011 begin');
      expect(getFileNameFromUrl('https://example.com/dir10/file10.dat')).assertEqual('file10.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0011 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1200
     * @tc.name      testFileName0012
     * @tc.desc      Verify file name extraction for 'https://example.com/dir11/file11.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0012 begin');
      expect(getFileNameFromUrl('https://example.com/dir11/file11.dat')).assertEqual('file11.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0012 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1300
     * @tc.name      testFileName0013
     * @tc.desc      Verify file name extraction for 'https://example.com/dir12/file12.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0013 begin');
      expect(getFileNameFromUrl('https://example.com/dir12/file12.dat')).assertEqual('file12.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0013 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1400
     * @tc.name      testFileName0014
     * @tc.desc      Verify file name extraction for 'https://example.com/dir13/file13.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0014 begin');
      expect(getFileNameFromUrl('https://example.com/dir13/file13.dat')).assertEqual('file13.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0014 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1500
     * @tc.name      testFileName0015
     * @tc.desc      Verify file name extraction for 'https://example.com/dir14/file14.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0015 begin');
      expect(getFileNameFromUrl('https://example.com/dir14/file14.dat')).assertEqual('file14.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0015 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1600
     * @tc.name      testFileName0016
     * @tc.desc      Verify file name extraction for 'https://example.com/dir15/file15.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0016 begin');
      expect(getFileNameFromUrl('https://example.com/dir15/file15.dat')).assertEqual('file15.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0016 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1700
     * @tc.name      testFileName0017
     * @tc.desc      Verify file name extraction for 'https://example.com/dir16/file16.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0017 begin');
      expect(getFileNameFromUrl('https://example.com/dir16/file16.dat')).assertEqual('file16.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0017 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1800
     * @tc.name      testFileName0018
     * @tc.desc      Verify file name extraction for 'https://example.com/dir17/file17.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0018 begin');
      expect(getFileNameFromUrl('https://example.com/dir17/file17.dat')).assertEqual('file17.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0018 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_1900
     * @tc.name      testFileName0019
     * @tc.desc      Verify file name extraction for 'https://example.com/dir18/file18.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0019 begin');
      expect(getFileNameFromUrl('https://example.com/dir18/file18.dat')).assertEqual('file18.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0019 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2000
     * @tc.name      testFileName0020
     * @tc.desc      Verify file name extraction for 'https://example.com/dir19/file19.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0020 begin');
      expect(getFileNameFromUrl('https://example.com/dir19/file19.dat')).assertEqual('file19.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0020 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2100
     * @tc.name      testFileName0021
     * @tc.desc      Verify file name extraction for 'https://example.com/dir20/file20.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0021 begin');
      expect(getFileNameFromUrl('https://example.com/dir20/file20.dat')).assertEqual('file20.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0021 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2200
     * @tc.name      testFileName0022
     * @tc.desc      Verify file name extraction for 'https://example.com/dir21/file21.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0022 begin');
      expect(getFileNameFromUrl('https://example.com/dir21/file21.dat')).assertEqual('file21.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0022 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2300
     * @tc.name      testFileName0023
     * @tc.desc      Verify file name extraction for 'https://example.com/dir22/file22.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0023 begin');
      expect(getFileNameFromUrl('https://example.com/dir22/file22.dat')).assertEqual('file22.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0023 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2400
     * @tc.name      testFileName0024
     * @tc.desc      Verify file name extraction for 'https://example.com/dir23/file23.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0024 begin');
      expect(getFileNameFromUrl('https://example.com/dir23/file23.dat')).assertEqual('file23.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0024 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2500
     * @tc.name      testFileName0025
     * @tc.desc      Verify file name extraction for 'https://example.com/dir24/file24.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0025 begin');
      expect(getFileNameFromUrl('https://example.com/dir24/file24.dat')).assertEqual('file24.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0025 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2600
     * @tc.name      testFileName0026
     * @tc.desc      Verify file name extraction for 'https://example.com/dir25/file25.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0026 begin');
      expect(getFileNameFromUrl('https://example.com/dir25/file25.dat')).assertEqual('file25.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0026 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2700
     * @tc.name      testFileName0027
     * @tc.desc      Verify file name extraction for 'https://example.com/dir26/file26.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0027 begin');
      expect(getFileNameFromUrl('https://example.com/dir26/file26.dat')).assertEqual('file26.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0027 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2800
     * @tc.name      testFileName0028
     * @tc.desc      Verify file name extraction for 'https://example.com/dir27/file27.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0028 begin');
      expect(getFileNameFromUrl('https://example.com/dir27/file27.dat')).assertEqual('file27.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0028 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_2900
     * @tc.name      testFileName0029
     * @tc.desc      Verify file name extraction for 'https://example.com/dir28/file28.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0029 begin');
      expect(getFileNameFromUrl('https://example.com/dir28/file28.dat')).assertEqual('file28.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0029 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3000
     * @tc.name      testFileName0030
     * @tc.desc      Verify file name extraction for 'https://example.com/dir29/file29.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0030 begin');
      expect(getFileNameFromUrl('https://example.com/dir29/file29.dat')).assertEqual('file29.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0030 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3100
     * @tc.name      testFileName0031
     * @tc.desc      Verify file name extraction for 'https://example.com/dir30/file30.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0031 begin');
      expect(getFileNameFromUrl('https://example.com/dir30/file30.dat')).assertEqual('file30.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0031 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3200
     * @tc.name      testFileName0032
     * @tc.desc      Verify file name extraction for 'https://example.com/dir31/file31.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0032 begin');
      expect(getFileNameFromUrl('https://example.com/dir31/file31.dat')).assertEqual('file31.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0032 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3300
     * @tc.name      testFileName0033
     * @tc.desc      Verify file name extraction for 'https://example.com/dir32/file32.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0033 begin');
      expect(getFileNameFromUrl('https://example.com/dir32/file32.dat')).assertEqual('file32.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0033 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3400
     * @tc.name      testFileName0034
     * @tc.desc      Verify file name extraction for 'https://example.com/dir33/file33.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0034 begin');
      expect(getFileNameFromUrl('https://example.com/dir33/file33.dat')).assertEqual('file33.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0034 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3500
     * @tc.name      testFileName0035
     * @tc.desc      Verify file name extraction for 'https://example.com/dir34/file34.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0035 begin');
      expect(getFileNameFromUrl('https://example.com/dir34/file34.dat')).assertEqual('file34.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0035 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3600
     * @tc.name      testFileName0036
     * @tc.desc      Verify file name extraction for 'https://example.com/dir35/file35.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0036 begin');
      expect(getFileNameFromUrl('https://example.com/dir35/file35.dat')).assertEqual('file35.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0036 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3700
     * @tc.name      testFileName0037
     * @tc.desc      Verify file name extraction for 'https://example.com/dir36/file36.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0037 begin');
      expect(getFileNameFromUrl('https://example.com/dir36/file36.dat')).assertEqual('file36.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0037 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3800
     * @tc.name      testFileName0038
     * @tc.desc      Verify file name extraction for 'https://example.com/dir37/file37.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0038 begin');
      expect(getFileNameFromUrl('https://example.com/dir37/file37.dat')).assertEqual('file37.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0038 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_3900
     * @tc.name      testFileName0039
     * @tc.desc      Verify file name extraction for 'https://example.com/dir38/file38.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0039 begin');
      expect(getFileNameFromUrl('https://example.com/dir38/file38.dat')).assertEqual('file38.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0039 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4000
     * @tc.name      testFileName0040
     * @tc.desc      Verify file name extraction for 'https://example.com/dir39/file39.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0040 begin');
      expect(getFileNameFromUrl('https://example.com/dir39/file39.dat')).assertEqual('file39.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0040 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4100
     * @tc.name      testFileName0041
     * @tc.desc      Verify file name extraction for 'https://example.com/dir40/file40.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0041 begin');
      expect(getFileNameFromUrl('https://example.com/dir40/file40.dat')).assertEqual('file40.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0041 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4200
     * @tc.name      testFileName0042
     * @tc.desc      Verify file name extraction for 'https://example.com/dir41/file41.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0042 begin');
      expect(getFileNameFromUrl('https://example.com/dir41/file41.dat')).assertEqual('file41.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0042 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4300
     * @tc.name      testFileName0043
     * @tc.desc      Verify file name extraction for 'https://example.com/dir42/file42.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0043 begin');
      expect(getFileNameFromUrl('https://example.com/dir42/file42.dat')).assertEqual('file42.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0043 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4400
     * @tc.name      testFileName0044
     * @tc.desc      Verify file name extraction for 'https://example.com/dir43/file43.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0044 begin');
      expect(getFileNameFromUrl('https://example.com/dir43/file43.dat')).assertEqual('file43.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0044 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4500
     * @tc.name      testFileName0045
     * @tc.desc      Verify file name extraction for 'https://example.com/dir44/file44.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0045 begin');
      expect(getFileNameFromUrl('https://example.com/dir44/file44.dat')).assertEqual('file44.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0045 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4600
     * @tc.name      testFileName0046
     * @tc.desc      Verify file name extraction for 'https://example.com/dir45/file45.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0046 begin');
      expect(getFileNameFromUrl('https://example.com/dir45/file45.dat')).assertEqual('file45.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0046 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4700
     * @tc.name      testFileName0047
     * @tc.desc      Verify file name extraction for 'https://example.com/dir46/file46.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0047 begin');
      expect(getFileNameFromUrl('https://example.com/dir46/file46.dat')).assertEqual('file46.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0047 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4800
     * @tc.name      testFileName0048
     * @tc.desc      Verify file name extraction for 'https://example.com/dir47/file47.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0048 begin');
      expect(getFileNameFromUrl('https://example.com/dir47/file47.dat')).assertEqual('file47.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0048 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_4900
     * @tc.name      testFileName0049
     * @tc.desc      Verify file name extraction for 'https://example.com/dir48/file48.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0049 begin');
      expect(getFileNameFromUrl('https://example.com/dir48/file48.dat')).assertEqual('file48.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0049 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5000
     * @tc.name      testFileName0050
     * @tc.desc      Verify file name extraction for 'https://example.com/dir49/file49.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0050 begin');
      expect(getFileNameFromUrl('https://example.com/dir49/file49.dat')).assertEqual('file49.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0050 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5100
     * @tc.name      testFileName0051
     * @tc.desc      Verify file name extraction for 'https://example.com/dir50/file50.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0051 begin');
      expect(getFileNameFromUrl('https://example.com/dir50/file50.dat')).assertEqual('file50.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0051 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5200
     * @tc.name      testFileName0052
     * @tc.desc      Verify file name extraction for 'https://example.com/dir51/file51.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0052 begin');
      expect(getFileNameFromUrl('https://example.com/dir51/file51.dat')).assertEqual('file51.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0052 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5300
     * @tc.name      testFileName0053
     * @tc.desc      Verify file name extraction for 'https://example.com/dir52/file52.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0053 begin');
      expect(getFileNameFromUrl('https://example.com/dir52/file52.dat')).assertEqual('file52.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0053 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5400
     * @tc.name      testFileName0054
     * @tc.desc      Verify file name extraction for 'https://example.com/dir53/file53.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0054 begin');
      expect(getFileNameFromUrl('https://example.com/dir53/file53.dat')).assertEqual('file53.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0054 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5500
     * @tc.name      testFileName0055
     * @tc.desc      Verify file name extraction for 'https://example.com/dir54/file54.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0055 begin');
      expect(getFileNameFromUrl('https://example.com/dir54/file54.dat')).assertEqual('file54.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0055 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5600
     * @tc.name      testFileName0056
     * @tc.desc      Verify file name extraction for 'https://example.com/dir55/file55.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0056 begin');
      expect(getFileNameFromUrl('https://example.com/dir55/file55.dat')).assertEqual('file55.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0056 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5700
     * @tc.name      testFileName0057
     * @tc.desc      Verify file name extraction for 'https://example.com/dir56/file56.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0057 begin');
      expect(getFileNameFromUrl('https://example.com/dir56/file56.dat')).assertEqual('file56.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0057 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5800
     * @tc.name      testFileName0058
     * @tc.desc      Verify file name extraction for 'https://example.com/dir57/file57.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0058 begin');
      expect(getFileNameFromUrl('https://example.com/dir57/file57.dat')).assertEqual('file57.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0058 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_5900
     * @tc.name      testFileName0059
     * @tc.desc      Verify file name extraction for 'https://example.com/dir58/file58.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0059 begin');
      expect(getFileNameFromUrl('https://example.com/dir58/file58.dat')).assertEqual('file58.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0059 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6000
     * @tc.name      testFileName0060
     * @tc.desc      Verify file name extraction for 'https://example.com/dir59/file59.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0060 begin');
      expect(getFileNameFromUrl('https://example.com/dir59/file59.dat')).assertEqual('file59.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0060 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6100
     * @tc.name      testFileName0061
     * @tc.desc      Verify file name extraction for 'https://example.com/dir60/file60.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0061 begin');
      expect(getFileNameFromUrl('https://example.com/dir60/file60.dat')).assertEqual('file60.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0061 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6200
     * @tc.name      testFileName0062
     * @tc.desc      Verify file name extraction for 'https://example.com/dir61/file61.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0062 begin');
      expect(getFileNameFromUrl('https://example.com/dir61/file61.dat')).assertEqual('file61.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0062 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6300
     * @tc.name      testFileName0063
     * @tc.desc      Verify file name extraction for 'https://example.com/dir62/file62.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0063 begin');
      expect(getFileNameFromUrl('https://example.com/dir62/file62.dat')).assertEqual('file62.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0063 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6400
     * @tc.name      testFileName0064
     * @tc.desc      Verify file name extraction for 'https://example.com/dir63/file63.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0064 begin');
      expect(getFileNameFromUrl('https://example.com/dir63/file63.dat')).assertEqual('file63.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0064 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6500
     * @tc.name      testFileName0065
     * @tc.desc      Verify file name extraction for 'https://example.com/dir64/file64.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0065 begin');
      expect(getFileNameFromUrl('https://example.com/dir64/file64.dat')).assertEqual('file64.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0065 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6600
     * @tc.name      testFileName0066
     * @tc.desc      Verify file name extraction for 'https://example.com/dir65/file65.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0066 begin');
      expect(getFileNameFromUrl('https://example.com/dir65/file65.dat')).assertEqual('file65.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0066 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6700
     * @tc.name      testFileName0067
     * @tc.desc      Verify file name extraction for 'https://example.com/dir66/file66.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0067 begin');
      expect(getFileNameFromUrl('https://example.com/dir66/file66.dat')).assertEqual('file66.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0067 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6800
     * @tc.name      testFileName0068
     * @tc.desc      Verify file name extraction for 'https://example.com/dir67/file67.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0068 begin');
      expect(getFileNameFromUrl('https://example.com/dir67/file67.dat')).assertEqual('file67.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0068 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_6900
     * @tc.name      testFileName0069
     * @tc.desc      Verify file name extraction for 'https://example.com/dir68/file68.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0069 begin');
      expect(getFileNameFromUrl('https://example.com/dir68/file68.dat')).assertEqual('file68.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0069 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7000
     * @tc.name      testFileName0070
     * @tc.desc      Verify file name extraction for 'https://example.com/dir69/file69.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0070 begin');
      expect(getFileNameFromUrl('https://example.com/dir69/file69.dat')).assertEqual('file69.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0070 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7100
     * @tc.name      testFileName0071
     * @tc.desc      Verify file name extraction for 'https://example.com/dir70/file70.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0071 begin');
      expect(getFileNameFromUrl('https://example.com/dir70/file70.dat')).assertEqual('file70.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0071 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7200
     * @tc.name      testFileName0072
     * @tc.desc      Verify file name extraction for 'https://example.com/dir71/file71.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0072 begin');
      expect(getFileNameFromUrl('https://example.com/dir71/file71.dat')).assertEqual('file71.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0072 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7300
     * @tc.name      testFileName0073
     * @tc.desc      Verify file name extraction for 'https://example.com/dir72/file72.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0073 begin');
      expect(getFileNameFromUrl('https://example.com/dir72/file72.dat')).assertEqual('file72.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0073 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7400
     * @tc.name      testFileName0074
     * @tc.desc      Verify file name extraction for 'https://example.com/dir73/file73.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0074 begin');
      expect(getFileNameFromUrl('https://example.com/dir73/file73.dat')).assertEqual('file73.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0074 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7500
     * @tc.name      testFileName0075
     * @tc.desc      Verify file name extraction for 'https://example.com/dir74/file74.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0075 begin');
      expect(getFileNameFromUrl('https://example.com/dir74/file74.dat')).assertEqual('file74.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0075 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7600
     * @tc.name      testFileName0076
     * @tc.desc      Verify file name extraction for 'https://example.com/dir75/file75.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0076 begin');
      expect(getFileNameFromUrl('https://example.com/dir75/file75.dat')).assertEqual('file75.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0076 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7700
     * @tc.name      testFileName0077
     * @tc.desc      Verify file name extraction for 'https://example.com/dir76/file76.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0077 begin');
      expect(getFileNameFromUrl('https://example.com/dir76/file76.dat')).assertEqual('file76.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0077 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7800
     * @tc.name      testFileName0078
     * @tc.desc      Verify file name extraction for 'https://example.com/dir77/file77.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0078 begin');
      expect(getFileNameFromUrl('https://example.com/dir77/file77.dat')).assertEqual('file77.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0078 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_7900
     * @tc.name      testFileName0079
     * @tc.desc      Verify file name extraction for 'https://example.com/dir78/file78.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0079 begin');
      expect(getFileNameFromUrl('https://example.com/dir78/file78.dat')).assertEqual('file78.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0079 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8000
     * @tc.name      testFileName0080
     * @tc.desc      Verify file name extraction for 'https://example.com/dir79/file79.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0080 begin');
      expect(getFileNameFromUrl('https://example.com/dir79/file79.dat')).assertEqual('file79.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0080 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8100
     * @tc.name      testFileName0081
     * @tc.desc      Verify file name extraction for 'https://example.com/dir80/file80.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0081 begin');
      expect(getFileNameFromUrl('https://example.com/dir80/file80.dat')).assertEqual('file80.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0081 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8200
     * @tc.name      testFileName0082
     * @tc.desc      Verify file name extraction for 'https://example.com/dir81/file81.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0082 begin');
      expect(getFileNameFromUrl('https://example.com/dir81/file81.dat')).assertEqual('file81.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0082 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8300
     * @tc.name      testFileName0083
     * @tc.desc      Verify file name extraction for 'https://example.com/dir82/file82.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0083 begin');
      expect(getFileNameFromUrl('https://example.com/dir82/file82.dat')).assertEqual('file82.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0083 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8400
     * @tc.name      testFileName0084
     * @tc.desc      Verify file name extraction for 'https://example.com/dir83/file83.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0084 begin');
      expect(getFileNameFromUrl('https://example.com/dir83/file83.dat')).assertEqual('file83.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0084 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8500
     * @tc.name      testFileName0085
     * @tc.desc      Verify file name extraction for 'https://example.com/dir84/file84.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0085 begin');
      expect(getFileNameFromUrl('https://example.com/dir84/file84.dat')).assertEqual('file84.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0085 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8600
     * @tc.name      testFileName0086
     * @tc.desc      Verify file name extraction for 'https://example.com/dir85/file85.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0086 begin');
      expect(getFileNameFromUrl('https://example.com/dir85/file85.dat')).assertEqual('file85.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0086 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8700
     * @tc.name      testFileName0087
     * @tc.desc      Verify file name extraction for 'https://example.com/dir86/file86.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0087 begin');
      expect(getFileNameFromUrl('https://example.com/dir86/file86.dat')).assertEqual('file86.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0087 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8800
     * @tc.name      testFileName0088
     * @tc.desc      Verify file name extraction for 'https://example.com/dir87/file87.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0088 begin');
      expect(getFileNameFromUrl('https://example.com/dir87/file87.dat')).assertEqual('file87.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0088 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_8900
     * @tc.name      testFileName0089
     * @tc.desc      Verify file name extraction for 'https://example.com/dir88/file88.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0089 begin');
      expect(getFileNameFromUrl('https://example.com/dir88/file88.dat')).assertEqual('file88.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0089 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP1_9000
     * @tc.name      testFileName0090
     * @tc.desc      Verify file name extraction for 'https://example.com/dir89/file89.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0090 begin');
      expect(getFileNameFromUrl('https://example.com/dir89/file89.dat')).assertEqual('file89.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0090 end');
    })

  })
}
