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

export default function urlUtilsExtraTest(): void {
  describe('UploadDownloadUrlUtilsExtraTest', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0100
     * @tc.name      testUploadDownloadUrlExtra0001
     * @tc.desc      Verify extra URL value 1 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0001');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra01');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra01');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0200
     * @tc.name      testUploadDownloadUrlExtra0002
     * @tc.desc      Verify extra URL value 2 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0002');
        try {
          await urlUtils.saveUrl(context, 'https://host/extra02');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/extra02');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0300
     * @tc.name      testUploadDownloadUrlExtra0003
     * @tc.desc      Verify extra URL value 3 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0003');
        try {
          await urlUtils.saveUrl(context, 'http://host:8000/extra03');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host:8000/extra03');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0400
     * @tc.name      testUploadDownloadUrlExtra0004
     * @tc.desc      Verify extra URL value 4 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0004');
        try {
          await urlUtils.saveUrl(context, 'https://host:8443/extra04');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host:8443/extra04');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0500
     * @tc.name      testUploadDownloadUrlExtra0005
     * @tc.desc      Verify extra URL value 5 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0005');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra/a/b');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra/a/b');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0600
     * @tc.name      testUploadDownloadUrlExtra0006
     * @tc.desc      Verify extra URL value 6 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0006');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra?x=1');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra?x=1');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0700
     * @tc.name      testUploadDownloadUrlExtra0007
     * @tc.desc      Verify extra URL value 7 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0007');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra?x=1&y=2');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra?x=1&y=2');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0800
     * @tc.name      testUploadDownloadUrlExtra0008
     * @tc.desc      Verify extra URL value 8 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0008');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra#top');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra#top');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_0900
     * @tc.name      testUploadDownloadUrlExtra0009
     * @tc.desc      Verify extra URL value 9 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0009');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra%20space');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra%20space');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1000
     * @tc.name      testUploadDownloadUrlExtra0010
     * @tc.desc      Verify extra URL value 10 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0010');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra+plus');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra+plus');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1100
     * @tc.name      testUploadDownloadUrlExtra0011
     * @tc.desc      Verify extra URL value 11 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0011');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra,comma');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra,comma');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1200
     * @tc.name      testUploadDownloadUrlExtra0012
     * @tc.desc      Verify extra URL value 12 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0012');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra;param');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra;param');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1300
     * @tc.name      testUploadDownloadUrlExtra0013
     * @tc.desc      Verify extra URL value 13 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0013');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra=value');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra=value');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1400
     * @tc.name      testUploadDownloadUrlExtra0014
     * @tc.desc      Verify extra URL value 14 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0014');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra~tilde');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra~tilde');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1500
     * @tc.name      testUploadDownloadUrlExtra0015
     * @tc.desc      Verify extra URL value 15 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0015');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra-dash');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra-dash');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1600
     * @tc.name      testUploadDownloadUrlExtra0016
     * @tc.desc      Verify extra URL value 16 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0016');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra_underscore');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra_underscore');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1700
     * @tc.name      testUploadDownloadUrlExtra0017
     * @tc.desc      Verify extra URL value 17 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0017');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra.dot');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra.dot');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1800
     * @tc.name      testUploadDownloadUrlExtra0018
     * @tc.desc      Verify extra URL value 18 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0018');
        try {
          await urlUtils.saveUrl(context, 'http://host/中文路径');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/中文路径');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_1900
     * @tc.name      testUploadDownloadUrlExtra0019
     * @tc.desc      Verify extra URL value 19 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0019');
        try {
          await urlUtils.saveUrl(context, 'http://host/extra/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/extra/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_EXTRA_2000
     * @tc.name      testUploadDownloadUrlExtra0020
     * @tc.desc      Verify extra URL value 20 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlExtra0020');
        try {
          await urlUtils.saveUrl(context, 'https://host/extra/final');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/extra/final');
          expect(typeof value).assertEqual('string');
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
