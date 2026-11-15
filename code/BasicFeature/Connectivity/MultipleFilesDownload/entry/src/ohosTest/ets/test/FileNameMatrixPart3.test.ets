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

export default function FileNameMatrixPart3Test(): void {
  describe('FileNameMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18100
     * @tc.name      testFileName0181
     * @tc.desc      Verify file name extraction for 'https://example.com/dir180/file180.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0181 begin');
      expect(getFileNameFromUrl('https://example.com/dir180/file180.dat')).assertEqual('file180.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0181 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18200
     * @tc.name      testFileName0182
     * @tc.desc      Verify file name extraction for 'https://example.com/dir181/file181.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0182 begin');
      expect(getFileNameFromUrl('https://example.com/dir181/file181.dat')).assertEqual('file181.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0182 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18300
     * @tc.name      testFileName0183
     * @tc.desc      Verify file name extraction for 'https://example.com/dir182/file182.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0183 begin');
      expect(getFileNameFromUrl('https://example.com/dir182/file182.dat')).assertEqual('file182.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0183 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18400
     * @tc.name      testFileName0184
     * @tc.desc      Verify file name extraction for 'https://example.com/dir183/file183.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0184 begin');
      expect(getFileNameFromUrl('https://example.com/dir183/file183.dat')).assertEqual('file183.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0184 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18500
     * @tc.name      testFileName0185
     * @tc.desc      Verify file name extraction for 'https://example.com/dir184/file184.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0185 begin');
      expect(getFileNameFromUrl('https://example.com/dir184/file184.dat')).assertEqual('file184.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0185 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18600
     * @tc.name      testFileName0186
     * @tc.desc      Verify file name extraction for 'https://example.com/dir185/file185.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0186 begin');
      expect(getFileNameFromUrl('https://example.com/dir185/file185.dat')).assertEqual('file185.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0186 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18700
     * @tc.name      testFileName0187
     * @tc.desc      Verify file name extraction for 'https://example.com/dir186/file186.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0187 begin');
      expect(getFileNameFromUrl('https://example.com/dir186/file186.dat')).assertEqual('file186.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0187 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18800
     * @tc.name      testFileName0188
     * @tc.desc      Verify file name extraction for 'https://example.com/dir187/file187.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0188 begin');
      expect(getFileNameFromUrl('https://example.com/dir187/file187.dat')).assertEqual('file187.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0188 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_18900
     * @tc.name      testFileName0189
     * @tc.desc      Verify file name extraction for 'https://example.com/dir188/file188.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0189 begin');
      expect(getFileNameFromUrl('https://example.com/dir188/file188.dat')).assertEqual('file188.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0189 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19000
     * @tc.name      testFileName0190
     * @tc.desc      Verify file name extraction for 'https://example.com/dir189/file189.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0190 begin');
      expect(getFileNameFromUrl('https://example.com/dir189/file189.dat')).assertEqual('file189.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0190 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19100
     * @tc.name      testFileName0191
     * @tc.desc      Verify file name extraction for 'https://example.com/dir190/file190.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0191 begin');
      expect(getFileNameFromUrl('https://example.com/dir190/file190.dat')).assertEqual('file190.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0191 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19200
     * @tc.name      testFileName0192
     * @tc.desc      Verify file name extraction for 'https://example.com/dir191/file191.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0192 begin');
      expect(getFileNameFromUrl('https://example.com/dir191/file191.dat')).assertEqual('file191.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0192 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19300
     * @tc.name      testFileName0193
     * @tc.desc      Verify file name extraction for 'https://example.com/dir192/file192.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0193 begin');
      expect(getFileNameFromUrl('https://example.com/dir192/file192.dat')).assertEqual('file192.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0193 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19400
     * @tc.name      testFileName0194
     * @tc.desc      Verify file name extraction for 'https://example.com/dir193/file193.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0194 begin');
      expect(getFileNameFromUrl('https://example.com/dir193/file193.dat')).assertEqual('file193.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0194 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19500
     * @tc.name      testFileName0195
     * @tc.desc      Verify file name extraction for 'https://example.com/dir194/file194.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0195 begin');
      expect(getFileNameFromUrl('https://example.com/dir194/file194.dat')).assertEqual('file194.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0195 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19600
     * @tc.name      testFileName0196
     * @tc.desc      Verify file name extraction for 'https://example.com/dir195/file195.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0196 begin');
      expect(getFileNameFromUrl('https://example.com/dir195/file195.dat')).assertEqual('file195.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0196 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19700
     * @tc.name      testFileName0197
     * @tc.desc      Verify file name extraction for 'https://example.com/dir196/file196.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0197 begin');
      expect(getFileNameFromUrl('https://example.com/dir196/file196.dat')).assertEqual('file196.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0197 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19800
     * @tc.name      testFileName0198
     * @tc.desc      Verify file name extraction for 'https://example.com/dir197/file197.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0198 begin');
      expect(getFileNameFromUrl('https://example.com/dir197/file197.dat')).assertEqual('file197.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0198 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_19900
     * @tc.name      testFileName0199
     * @tc.desc      Verify file name extraction for 'https://example.com/dir198/file198.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0199 begin');
      expect(getFileNameFromUrl('https://example.com/dir198/file198.dat')).assertEqual('file198.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0199 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20000
     * @tc.name      testFileName0200
     * @tc.desc      Verify file name extraction for 'https://example.com/dir199/file199.dat'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0200 begin');
      expect(getFileNameFromUrl('https://example.com/dir199/file199.dat')).assertEqual('file199.dat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0200 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20100
     * @tc.name      testFileName0201
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v0/photo0.png?size=0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0201 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v0/photo0.png?size=0')).assertEqual('photo0.png?size=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0201 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20200
     * @tc.name      testFileName0202
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v1/photo1.png?size=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0202 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v1/photo1.png?size=1')).assertEqual('photo1.png?size=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0202 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20300
     * @tc.name      testFileName0203
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v2/photo2.png?size=2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0203 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v2/photo2.png?size=2')).assertEqual('photo2.png?size=2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0203 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20400
     * @tc.name      testFileName0204
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v3/photo3.png?size=3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0204 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v3/photo3.png?size=3')).assertEqual('photo3.png?size=3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0204 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20500
     * @tc.name      testFileName0205
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v4/photo4.png?size=4'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0205 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v4/photo4.png?size=4')).assertEqual('photo4.png?size=4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0205 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20600
     * @tc.name      testFileName0206
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v5/photo5.png?size=5'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0206 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v5/photo5.png?size=5')).assertEqual('photo5.png?size=5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0206 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20700
     * @tc.name      testFileName0207
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v6/photo6.png?size=6'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0207 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v6/photo6.png?size=6')).assertEqual('photo6.png?size=6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0207 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20800
     * @tc.name      testFileName0208
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v7/photo7.png?size=7'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0208 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v7/photo7.png?size=7')).assertEqual('photo7.png?size=7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0208 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_20900
     * @tc.name      testFileName0209
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/release8/photo8.png?size=8'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0209 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/release8/photo8.png?size=8')).assertEqual('photo8.png?size=8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0209 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21000
     * @tc.name      testFileName0210
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v9/photo9.png?size=9'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0210 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v9/photo9.png?size=9')).assertEqual('photo9.png?size=9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0210 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21100
     * @tc.name      testFileName0211
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v10/photo10.png?size=10'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0211 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v10/photo10.png?size=10')).assertEqual('photo10.png?size=10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0211 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21200
     * @tc.name      testFileName0212
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v11/photo11.png?size=11'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0212 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v11/photo11.png?size=11')).assertEqual('photo11.png?size=11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0212 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21300
     * @tc.name      testFileName0213
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v12/photo12.png?size=12'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0213 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v12/photo12.png?size=12')).assertEqual('photo12.png?size=12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0213 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21400
     * @tc.name      testFileName0214
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v13/photo13.png?size=13'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0214 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v13/photo13.png?size=13')).assertEqual('photo13.png?size=13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0214 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21500
     * @tc.name      testFileName0215
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v14/photo14.png?size=14'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0215 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v14/photo14.png?size=14')).assertEqual('photo14.png?size=14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0215 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21600
     * @tc.name      testFileName0216
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v15/photo15.png?size=15'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0216 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v15/photo15.png?size=15')).assertEqual('photo15.png?size=15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0216 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21700
     * @tc.name      testFileName0217
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v16/photo16.png?size=16'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0217 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v16/photo16.png?size=16')).assertEqual('photo16.png?size=16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0217 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21800
     * @tc.name      testFileName0218
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v17/photo17.png?size=17'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0218 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v17/photo17.png?size=17')).assertEqual('photo17.png?size=17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0218 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_21900
     * @tc.name      testFileName0219
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v18/photo18.png?size=18'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0219 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v18/photo18.png?size=18')).assertEqual('photo18.png?size=18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0219 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22000
     * @tc.name      testFileName0220
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v19/photo19.png?size=19'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0220 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v19/photo19.png?size=19')).assertEqual('photo19.png?size=19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0220 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22100
     * @tc.name      testFileName0221
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v20/photo20.png?size=20'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0221 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v20/photo20.png?size=20')).assertEqual('photo20.png?size=20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0221 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22200
     * @tc.name      testFileName0222
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v21/photo21.png?size=21'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0222 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v21/photo21.png?size=21')).assertEqual('photo21.png?size=21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0222 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22300
     * @tc.name      testFileName0223
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v22/photo22.png?size=22'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0223 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v22/photo22.png?size=22')).assertEqual('photo22.png?size=22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0223 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22400
     * @tc.name      testFileName0224
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v23/photo23.png?size=23'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0224 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v23/photo23.png?size=23')).assertEqual('photo23.png?size=23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0224 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22500
     * @tc.name      testFileName0225
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v24/photo24.png?size=24'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0225 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v24/photo24.png?size=24')).assertEqual('photo24.png?size=24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0225 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22600
     * @tc.name      testFileName0226
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v25/photo25.png?size=25'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0226 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v25/photo25.png?size=25')).assertEqual('photo25.png?size=25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0226 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22700
     * @tc.name      testFileName0227
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v26/photo26.png?size=26'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0227 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v26/photo26.png?size=26')).assertEqual('photo26.png?size=26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0227 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22800
     * @tc.name      testFileName0228
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v27/photo27.png?size=27'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0228 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v27/photo27.png?size=27')).assertEqual('photo27.png?size=27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0228 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_22900
     * @tc.name      testFileName0229
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v28/photo28.png?size=28'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0229 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v28/photo28.png?size=28')).assertEqual('photo28.png?size=28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0229 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23000
     * @tc.name      testFileName0230
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v29/photo29.png?size=29'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0230 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v29/photo29.png?size=29')).assertEqual('photo29.png?size=29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0230 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23100
     * @tc.name      testFileName0231
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v30/photo30.png?size=30'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0231 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v30/photo30.png?size=30')).assertEqual('photo30.png?size=30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0231 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23200
     * @tc.name      testFileName0232
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v31/photo31.png?size=31'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0232 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v31/photo31.png?size=31')).assertEqual('photo31.png?size=31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0232 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23300
     * @tc.name      testFileName0233
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v32/photo32.png?size=32'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0233 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v32/photo32.png?size=32')).assertEqual('photo32.png?size=32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0233 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23400
     * @tc.name      testFileName0234
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v33/photo33.png?size=33'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0234 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v33/photo33.png?size=33')).assertEqual('photo33.png?size=33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0234 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23500
     * @tc.name      testFileName0235
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v34/photo34.png?size=34'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0235 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v34/photo34.png?size=34')).assertEqual('photo34.png?size=34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0235 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23600
     * @tc.name      testFileName0236
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v35/photo35.png?size=35'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0236 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v35/photo35.png?size=35')).assertEqual('photo35.png?size=35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0236 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23700
     * @tc.name      testFileName0237
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v36/photo36.png?size=36'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0237 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v36/photo36.png?size=36')).assertEqual('photo36.png?size=36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0237 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23800
     * @tc.name      testFileName0238
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v37/photo37.png?size=37'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0238 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v37/photo37.png?size=37')).assertEqual('photo37.png?size=37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0238 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_23900
     * @tc.name      testFileName0239
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v38/photo38.png?size=38'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0239 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v38/photo38.png?size=38')).assertEqual('photo38.png?size=38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0239 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24000
     * @tc.name      testFileName0240
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v39/photo39.png?size=39'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0240 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v39/photo39.png?size=39')).assertEqual('photo39.png?size=39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0240 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24100
     * @tc.name      testFileName0241
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v40/photo40.png?size=40'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0241 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v40/photo40.png?size=40')).assertEqual('photo40.png?size=40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0241 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24200
     * @tc.name      testFileName0242
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v41/photo41.png?size=41'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0242 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v41/photo41.png?size=41')).assertEqual('photo41.png?size=41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0242 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24300
     * @tc.name      testFileName0243
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v42/photo42.png?size=42'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0243 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v42/photo42.png?size=42')).assertEqual('photo42.png?size=42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0243 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24400
     * @tc.name      testFileName0244
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v43/photo43.png?size=43'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0244 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v43/photo43.png?size=43')).assertEqual('photo43.png?size=43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0244 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24500
     * @tc.name      testFileName0245
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v44/photo44.png?size=44'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0245 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v44/photo44.png?size=44')).assertEqual('photo44.png?size=44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0245 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24600
     * @tc.name      testFileName0246
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v45/photo45.png?size=45'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0246 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v45/photo45.png?size=45')).assertEqual('photo45.png?size=45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0246 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24700
     * @tc.name      testFileName0247
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v46/photo46.png?size=46'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0247 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v46/photo46.png?size=46')).assertEqual('photo46.png?size=46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0247 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24800
     * @tc.name      testFileName0248
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v47/photo47.png?size=47'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0248 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v47/photo47.png?size=47')).assertEqual('photo47.png?size=47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0248 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_24900
     * @tc.name      testFileName0249
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v48/photo48.png?size=48'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0249 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v48/photo48.png?size=48')).assertEqual('photo48.png?size=48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0249 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25000
     * @tc.name      testFileName0250
     * @tc.desc      Verify file name extraction for 'https://cdn.example.com/v49/photo49.png?size=49'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0250 begin');
      expect(getFileNameFromUrl('https://cdn.example.com/v49/photo49.png?size=49')).assertEqual('photo49.png?size=49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0250 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25100
     * @tc.name      testFileName0251
     * @tc.desc      Verify file name extraction for '/root/archive/item0.zip#part0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0251 begin');
      expect(getFileNameFromUrl('/root/archive/item0.zip#part0')).assertEqual('item0.zip#part0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0251 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25200
     * @tc.name      testFileName0252
     * @tc.desc      Verify file name extraction for '/root/archive/item1.zip#part1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0252 begin');
      expect(getFileNameFromUrl('/root/archive/item1.zip#part1')).assertEqual('item1.zip#part1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0252 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25300
     * @tc.name      testFileName0253
     * @tc.desc      Verify file name extraction for '/root/archive/item2.zip#part2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0253 begin');
      expect(getFileNameFromUrl('/root/archive/item2.zip#part2')).assertEqual('item2.zip#part2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0253 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25400
     * @tc.name      testFileName0254
     * @tc.desc      Verify file name extraction for '/root/archive/item3.zip#part3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0254 begin');
      expect(getFileNameFromUrl('/root/archive/item3.zip#part3')).assertEqual('item3.zip#part3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0254 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25500
     * @tc.name      testFileName0255
     * @tc.desc      Verify file name extraction for '/root/archive/item4.zip#part4'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0255 begin');
      expect(getFileNameFromUrl('/root/archive/item4.zip#part4')).assertEqual('item4.zip#part4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0255 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25600
     * @tc.name      testFileName0256
     * @tc.desc      Verify file name extraction for '/root/archive/item5.zip#part5'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0256 begin');
      expect(getFileNameFromUrl('/root/archive/item5.zip#part5')).assertEqual('item5.zip#part5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0256 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25700
     * @tc.name      testFileName0257
     * @tc.desc      Verify file name extraction for '/root/archive/item6.zip#part6'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0257 begin');
      expect(getFileNameFromUrl('/root/archive/item6.zip#part6')).assertEqual('item6.zip#part6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0257 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25800
     * @tc.name      testFileName0258
     * @tc.desc      Verify file name extraction for '/root/archive/item7.zip#part7'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0258 begin');
      expect(getFileNameFromUrl('/root/archive/item7.zip#part7')).assertEqual('item7.zip#part7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0258 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_25900
     * @tc.name      testFileName0259
     * @tc.desc      Verify file name extraction for '/root/archive/item8.zip#part8'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0259 begin');
      expect(getFileNameFromUrl('/root/archive/item8.zip#part8')).assertEqual('item8.zip#part8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0259 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26000
     * @tc.name      testFileName0260
     * @tc.desc      Verify file name extraction for '/root/archive/item9.zip#part9'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0260 begin');
      expect(getFileNameFromUrl('/root/archive/item9.zip#part9')).assertEqual('item9.zip#part9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0260 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26100
     * @tc.name      testFileName0261
     * @tc.desc      Verify file name extraction for '/root/archive/item10.zip#part10'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0261 begin');
      expect(getFileNameFromUrl('/root/archive/item10.zip#part10')).assertEqual('item10.zip#part10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0261 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26200
     * @tc.name      testFileName0262
     * @tc.desc      Verify file name extraction for '/root/archive/item11.zip#part11'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0262 begin');
      expect(getFileNameFromUrl('/root/archive/item11.zip#part11')).assertEqual('item11.zip#part11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0262 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26300
     * @tc.name      testFileName0263
     * @tc.desc      Verify file name extraction for '/root/archive/item12.zip#part12'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0263 begin');
      expect(getFileNameFromUrl('/root/archive/item12.zip#part12')).assertEqual('item12.zip#part12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0263 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26400
     * @tc.name      testFileName0264
     * @tc.desc      Verify file name extraction for '/root/archive/item13.zip#part13'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0264 begin');
      expect(getFileNameFromUrl('/root/archive/item13.zip#part13')).assertEqual('item13.zip#part13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0264 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26500
     * @tc.name      testFileName0265
     * @tc.desc      Verify file name extraction for '/root/archive/item14.zip#part14'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0265 begin');
      expect(getFileNameFromUrl('/root/archive/item14.zip#part14')).assertEqual('item14.zip#part14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0265 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26600
     * @tc.name      testFileName0266
     * @tc.desc      Verify file name extraction for '/root/archive/item15.zip#part15'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0266 begin');
      expect(getFileNameFromUrl('/root/archive/item15.zip#part15')).assertEqual('item15.zip#part15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0266 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26700
     * @tc.name      testFileName0267
     * @tc.desc      Verify file name extraction for '/root/archive/item16.zip#part16'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0267 begin');
      expect(getFileNameFromUrl('/root/archive/item16.zip#part16')).assertEqual('item16.zip#part16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0267 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26800
     * @tc.name      testFileName0268
     * @tc.desc      Verify file name extraction for '/root/archive/item17.zip#part17'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0268 begin');
      expect(getFileNameFromUrl('/root/archive/item17.zip#part17')).assertEqual('item17.zip#part17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0268 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_26900
     * @tc.name      testFileName0269
     * @tc.desc      Verify file name extraction for '/root/archive/item18.zip#part18'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0269 begin');
      expect(getFileNameFromUrl('/root/archive/item18.zip#part18')).assertEqual('item18.zip#part18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0269 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP3_27000
     * @tc.name      testFileName0270
     * @tc.desc      Verify file name extraction for '/root/archive/item19.zip#part19'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0270 begin');
      expect(getFileNameFromUrl('/root/archive/item19.zip#part19')).assertEqual('item19.zip#part19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0270 end');
    })

  })
}
