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

import { describe, expect, it, Level, Size, TestType, beforeAll } from '@ohos/hypium';
import { BusinessError, request } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let context: common.UIAbilityContext;

export default function requestInvalidExtraTest(): void {
  describe('UploadDownloadRequestInvalidExtraTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0100
     * @tc.name      testUploadDownloadRequestInvalid0001
     * @tc.desc      Verify invalid download URL case 1 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0001');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_1.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: '', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0200
     * @tc.name      testUploadDownloadRequestInvalid0002
     * @tc.desc      Verify invalid download URL case 2 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0002');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_2.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'invalid_url', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0300
     * @tc.name      testUploadDownloadRequestInvalid0003
     * @tc.desc      Verify invalid download URL case 3 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0003');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_3.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'http://', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0400
     * @tc.name      testUploadDownloadRequestInvalid0004
     * @tc.desc      Verify invalid download URL case 4 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0004');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_4.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'https://', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0500
     * @tc.name      testUploadDownloadRequestInvalid0005
     * @tc.desc      Verify invalid download URL case 5 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0005');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_5.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'ftp://host/file', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0600
     * @tc.name      testUploadDownloadRequestInvalid0006
     * @tc.desc      Verify invalid download URL case 6 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0006');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_6.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'file://host/file', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0700
     * @tc.name      testUploadDownloadRequestInvalid0007
     * @tc.desc      Verify invalid download URL case 7 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0007');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_7.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'http://[', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0800
     * @tc.name      testUploadDownloadRequestInvalid0008
     * @tc.desc      Verify invalid download URL case 8 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0008');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_8.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: '://missing-scheme', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_0900
     * @tc.name      testUploadDownloadRequestInvalid0009
     * @tc.desc      Verify invalid download URL case 9 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0009');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_9.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'http:// host/file', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_REQUEST_INVALID_1000
     * @tc.name      testUploadDownloadRequestInvalid0010
     * @tc.desc      Verify invalid download URL case 10 is rejected.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadRequestInvalid0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadRequestInvalid0010');
        try {
          const filePath: string = context.cacheDir + '/invalid_download_10.bin';
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.downloadFile(context, { url: 'http://host/%zz', filePath: filePath });
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(fileIo.accessSync(filePath)).assertFalse();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
