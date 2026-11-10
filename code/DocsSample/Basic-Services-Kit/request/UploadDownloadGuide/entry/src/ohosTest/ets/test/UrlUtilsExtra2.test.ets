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

export default function urlUtilsExtra2Test(): void {
  describe('UploadDownloadUrlUtilsExtra2Test', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0100
     * @tc.name      testUploadDownloadUrlExtra20001
     * @tc.desc      Verify additional URL case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20001');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2/01');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2/01');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0200
     * @tc.name      testUploadDownloadUrlExtra20002
     * @tc.desc      Verify additional URL case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20002');
        try {
          await urlUtils.saveUrl(context, 'https://host/extra2/02');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/extra2/02');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0300
     * @tc.name      testUploadDownloadUrlExtra20003
     * @tc.desc      Verify additional URL case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20003');
        try {
          await urlUtils.saveUrl(context, 'http://host:7000/extra2/03');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host:7000/extra2/03');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0400
     * @tc.name      testUploadDownloadUrlExtra20004
     * @tc.desc      Verify additional URL case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20004');
        try {
          await urlUtils.saveUrl(context, 'https://host:7443/extra2/04');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host:7443/extra2/04');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0500
     * @tc.name      testUploadDownloadUrlExtra20005
     * @tc.desc      Verify additional URL case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20005');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2/a/b/c');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2/a/b/c');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0600
     * @tc.name      testUploadDownloadUrlExtra20006
     * @tc.desc      Verify additional URL case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20006');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2?q=1');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2?q=1');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0700
     * @tc.name      testUploadDownloadUrlExtra20007
     * @tc.desc      Verify additional URL case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20007');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2?q=1&r=2');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2?q=1&r=2');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0800
     * @tc.name      testUploadDownloadUrlExtra20008
     * @tc.desc      Verify additional URL case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20008');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2#frag');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2#frag');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_0900
     * @tc.name      testUploadDownloadUrlExtra20009
     * @tc.desc      Verify additional URL case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20009');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2%20space');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2%20space');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_1000
     * @tc.name      testUploadDownloadUrlExtra20010
     * @tc.desc      Verify additional URL case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20010');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2+plus');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2+plus');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_1100
     * @tc.name      testUploadDownloadUrlExtra20011
     * @tc.desc      Verify additional URL case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20011');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2,comma');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2,comma');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_1200
     * @tc.name      testUploadDownloadUrlExtra20012
     * @tc.desc      Verify additional URL case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20012');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2;param');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2;param');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_1300
     * @tc.name      testUploadDownloadUrlExtra20013
     * @tc.desc      Verify additional URL case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20013');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra2=value');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra2=value');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_1400
     * @tc.name      testUploadDownloadUrlExtra20014
     * @tc.desc      Verify additional URL case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20014');
        try {
          await urlUtils.saveUrl(context, 'http://host/中文/extra2');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/中文/extra2');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA2_1500
     * @tc.name      testUploadDownloadUrlExtra20015
     * @tc.desc      Verify additional URL case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra20015');
        try {
          await urlUtils.saveUrl(context, 'https://host/extra2/final');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/extra2/final');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
