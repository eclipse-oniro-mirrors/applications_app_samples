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

export default function FileNameMatrixPart4Test(): void {
  describe('FileNameMatrixPart4', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27100
     * @tc.name      testFileName0271
     * @tc.desc      Verify file name extraction for 'plain0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0271 begin');
      expect(getFileNameFromUrl('plain0')).assertEqual('plain0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0271 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27200
     * @tc.name      testFileName0272
     * @tc.desc      Verify file name extraction for 'plain1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0272 begin');
      expect(getFileNameFromUrl('plain1')).assertEqual('plain1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0272 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27300
     * @tc.name      testFileName0273
     * @tc.desc      Verify file name extraction for 'plain2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0273 begin');
      expect(getFileNameFromUrl('plain2')).assertEqual('plain2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0273 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27400
     * @tc.name      testFileName0274
     * @tc.desc      Verify file name extraction for 'plain3'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0274 begin');
      expect(getFileNameFromUrl('plain3')).assertEqual('plain3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0274 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27500
     * @tc.name      testFileName0275
     * @tc.desc      Verify file name extraction for 'plain4'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0275 begin');
      expect(getFileNameFromUrl('plain4')).assertEqual('plain4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0275 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27600
     * @tc.name      testFileName0276
     * @tc.desc      Verify file name extraction for 'plain5'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0276 begin');
      expect(getFileNameFromUrl('plain5')).assertEqual('plain5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0276 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27700
     * @tc.name      testFileName0277
     * @tc.desc      Verify file name extraction for 'plain6'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0277 begin');
      expect(getFileNameFromUrl('plain6')).assertEqual('plain6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0277 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27800
     * @tc.name      testFileName0278
     * @tc.desc      Verify file name extraction for 'plain7'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0278 begin');
      expect(getFileNameFromUrl('plain7')).assertEqual('plain7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0278 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_27900
     * @tc.name      testFileName0279
     * @tc.desc      Verify file name extraction for 'plain8'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0279 begin');
      expect(getFileNameFromUrl('plain8')).assertEqual('plain8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0279 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28000
     * @tc.name      testFileName0280
     * @tc.desc      Verify file name extraction for 'plain9'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0280 begin');
      expect(getFileNameFromUrl('plain9')).assertEqual('plain9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0280 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28100
     * @tc.name      testFileName0281
     * @tc.desc      Verify file name extraction for ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0281 begin');
      expect(getFileNameFromUrl('')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0281 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28200
     * @tc.name      testFileName0282
     * @tc.desc      Verify file name extraction for '/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0282 begin');
      expect(getFileNameFromUrl('/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0282 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28300
     * @tc.name      testFileName0283
     * @tc.desc      Verify file name extraction for '//'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0283 begin');
      expect(getFileNameFromUrl('//')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0283 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28400
     * @tc.name      testFileName0284
     * @tc.desc      Verify file name extraction for 'a/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0284 begin');
      expect(getFileNameFromUrl('a/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0284 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28500
     * @tc.name      testFileName0285
     * @tc.desc      Verify file name extraction for 'a//'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0285 begin');
      expect(getFileNameFromUrl('a//')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0285 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28600
     * @tc.name      testFileName0286
     * @tc.desc      Verify file name extraction for 'https://host/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0286 begin');
      expect(getFileNameFromUrl('https://host/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0286 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28700
     * @tc.name      testFileName0287
     * @tc.desc      Verify file name extraction for 'https://host//'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0287 begin');
      expect(getFileNameFromUrl('https://host//')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0287 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28800
     * @tc.name      testFileName0288
     * @tc.desc      Verify file name extraction for 'dir/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0288 begin');
      expect(getFileNameFromUrl('dir/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0288 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_28900
     * @tc.name      testFileName0289
     * @tc.desc      Verify file name extraction for 'x/y/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0289 begin');
      expect(getFileNameFromUrl('x/y/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0289 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29000
     * @tc.name      testFileName0290
     * @tc.desc      Verify file name extraction for '//host//'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0290 begin');
      expect(getFileNameFromUrl('//host//')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0290 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29100
     * @tc.name      testFileName0291
     * @tc.desc      Verify file name extraction for 'https://host/文件 名称.pdf'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0291 begin');
      expect(getFileNameFromUrl('https://host/文件 名称.pdf')).assertEqual('文件 名称.pdf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0291 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29200
     * @tc.name      testFileName0292
     * @tc.desc      Verify file name extraction for 'https://host/name.with.dots.tar.gz'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0292 begin');
      expect(getFileNameFromUrl('https://host/name.with.dots.tar.gz')).assertEqual('name.with.dots.tar.gz');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0292 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29300
     * @tc.name      testFileName0293
     * @tc.desc      Verify file name extraction for 'https://host/UPPER.TXT'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0293 begin');
      expect(getFileNameFromUrl('https://host/UPPER.TXT')).assertEqual('UPPER.TXT');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0293 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29400
     * @tc.name      testFileName0294
     * @tc.desc      Verify file name extraction for 'https://host/dir/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0294 begin');
      expect(getFileNameFromUrl('https://host/dir/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0294 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29500
     * @tc.name      testFileName0295
     * @tc.desc      Verify file name extraction for 'q/w/e/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0295 begin');
      expect(getFileNameFromUrl('q/w/e/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0295 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29600
     * @tc.name      testFileName0296
     * @tc.desc      Verify file name extraction for 'a/b/'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0296 begin');
      expect(getFileNameFromUrl('a/b/')).assertEqual('未知文件名');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0296 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29700
     * @tc.name      testFileName0297
     * @tc.desc      Verify file name extraction for 'https://host/space name.doc'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0297 begin');
      expect(getFileNameFromUrl('https://host/space name.doc')).assertEqual('space name.doc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0297 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29800
     * @tc.name      testFileName0298
     * @tc.desc      Verify file name extraction for 'https://host/symbol@#$%.log'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0298 begin');
      expect(getFileNameFromUrl('https://host/symbol@#$%.log')).assertEqual('symbol@#$%.log');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0298 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_29900
     * @tc.name      testFileName0299
     * @tc.desc      Verify file name extraction for 'https://host/query.php?id=1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0299 begin');
      expect(getFileNameFromUrl('https://host/query.php?id=1')).assertEqual('query.php?id=1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0299 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FNAMEP4_30000
     * @tc.name      testFileName0300
     * @tc.desc      Verify file name extraction for 'https://host/encoded%20name.txt'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileName0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0300 begin');
      expect(getFileNameFromUrl('https://host/encoded%20name.txt')).assertEqual('encoded%20name.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileName0300 end');
    })

  })
}
