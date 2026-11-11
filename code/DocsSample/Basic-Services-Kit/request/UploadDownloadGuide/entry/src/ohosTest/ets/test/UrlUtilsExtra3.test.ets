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

import { describe, expect, it, Level, Size, TestType, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { urlUtils } from 'uploadanddownload';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

const STORE_NAME: string = 'server_url';
const URL_KEY: string = 'url';
let context: common.UIAbilityContext;

export default function urlUtilsExtra3Test(): void {
  describe('UploadDownloadUrlUtilsExtra3Test', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    });
    beforeEach(async () => {
      let pref = preferences.getPreferencesSync(context, { name: STORE_NAME });
      pref.deleteSync(URL_KEY);
      pref.flushSync();
    });
    afterAll(async () => {
      let pref = preferences.getPreferencesSync(context, { name: STORE_NAME });
      pref.deleteSync(URL_KEY);
      pref.flushSync();
    });
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0100
     * @tc.name      testUploadDownloadUrlExtra30001
     * @tc.desc      Verify additional URL case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30001');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra3/one');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra3/one');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0200
     * @tc.name      testUploadDownloadUrlExtra30002
     * @tc.desc      Verify additional URL case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30002');
        try {
          await urlUtils.saveUrl(context, 'https://host/extra3/two');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/extra3/two');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0300
     * @tc.name      testUploadDownloadUrlExtra30003
     * @tc.desc      Verify additional URL case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30003');
        try {
          await urlUtils.saveUrl(context, 'http://host:7100/extra3/three');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host:7100/extra3/three');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0400
     * @tc.name      testUploadDownloadUrlExtra30004
     * @tc.desc      Verify additional URL case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30004');
        try {
          await urlUtils.saveUrl(context, 'https://host:7543/extra3/four');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host:7543/extra3/four');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0500
     * @tc.name      testUploadDownloadUrlExtra30005
     * @tc.desc      Verify additional URL case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30005');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra3/a/b/c');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra3/a/b/c');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0600
     * @tc.name      testUploadDownloadUrlExtra30006
     * @tc.desc      Verify additional URL case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30006');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra3?q=10');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra3?q=10');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0700
     * @tc.name      testUploadDownloadUrlExtra30007
     * @tc.desc      Verify additional URL case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30007');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra3?q=10&r=20');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra3?q=10&r=20');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0800
     * @tc.name      testUploadDownloadUrlExtra30008
     * @tc.desc      Verify additional URL case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30008');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra3#frag');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra3#frag');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_0900
     * @tc.name      testUploadDownloadUrlExtra30009
     * @tc.desc      Verify additional URL case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30009');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra3%20space');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra3%20space');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA3_1000
     * @tc.name      testUploadDownloadUrlExtra30010
     * @tc.desc      Verify additional URL case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra30010');
        try {
          await urlUtils.saveUrl(context, 'https://host/extra3/final');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/extra3/final');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
