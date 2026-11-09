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
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let context: common.UIAbilityContext;

export default function uploadInvalidExtraTest(): void {
  describe('UploadDownloadUploadInvalidExtraTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0100
     * @tc.name      testUploadDownloadUploadInvalid0001
     * @tc.desc      Verify invalid upload config: empty url.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0001');
        try {
          const config: request.UploadConfig = {
            url: '',
            header: {},
            method: '',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0200
     * @tc.name      testUploadDownloadUploadInvalid0002
     * @tc.desc      Verify invalid upload config: invalid url.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0002');
        try {
          const config: request.UploadConfig = {
            url: 'invalid_url',
            header: {},
            method: 'POST',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0300
     * @tc.name      testUploadDownloadUploadInvalid0003
     * @tc.desc      Verify invalid upload config: incomplete url.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0003');
        try {
          const config: request.UploadConfig = {
            url: 'http://',
            header: {},
            method: 'POST',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0400
     * @tc.name      testUploadDownloadUploadInvalid0004
     * @tc.desc      Verify invalid upload config: url with space.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0004');
        try {
          const config: request.UploadConfig = {
            url: 'http:// host/',
            header: {},
            method: 'POST',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0500
     * @tc.name      testUploadDownloadUploadInvalid0005
     * @tc.desc      Verify invalid upload config: empty method.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0005');
        try {
          const config: request.UploadConfig = {
            url: 'http://host/',
            header: {},
            method: '',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0600
     * @tc.name      testUploadDownloadUploadInvalid0006
     * @tc.desc      Verify invalid upload config: invalid method.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0006');
        try {
          const config: request.UploadConfig = {
            url: 'http://host/',
            header: {},
            method: 'INVALID',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0700
     * @tc.name      testUploadDownloadUploadInvalid0007
     * @tc.desc      Verify invalid upload config: empty files.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0007');
        try {
          const config: request.UploadConfig = {
            url: 'http://host/',
            header: {},
            method: 'POST',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0800
     * @tc.name      testUploadDownloadUploadInvalid0008
     * @tc.desc      Verify invalid upload config: empty file uri.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0008');
        try {
          const config: request.UploadConfig = {
            url: 'http://host/',
            header: {},
            method: 'POST',
            files: [{
              filename: 'x.txt',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_0900
     * @tc.name      testUploadDownloadUploadInvalid0009
     * @tc.desc      Verify invalid upload config: empty filename.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0009');
        try {
          const config: request.UploadConfig = {
            url: 'http://host/',
            header: {},
            method: 'POST',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_UPLOAD_INVALID_1000
     * @tc.name      testUploadDownloadUploadInvalid0010
     * @tc.desc      Verify invalid upload config: unsupported scheme.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUploadInvalid0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUploadInvalid0010');
        try {
          const config: request.UploadConfig = {
            url: 'ftp://host/file',
            header: {},
            method: 'POST',
            files: [{
              filename: '',
              name: 'test',
              uri: '',
              type: 'txt'
            }],
            data: [{ name: 'name', value: 'value' }]
          };
          let failed: boolean = false;
          let message: string = '';
          try {
            await request.uploadFile(context, config);
          } catch (err) {
            failed = true;
            message = String((err as BusinessError).message);
          }
          expect(failed).assertTrue();
          expect(message.length > 0).assertTrue();
          expect(typeof message).assertEqual('string');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
