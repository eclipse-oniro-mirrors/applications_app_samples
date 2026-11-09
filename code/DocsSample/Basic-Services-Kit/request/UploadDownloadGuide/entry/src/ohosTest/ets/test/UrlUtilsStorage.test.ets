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

const STORE_NAME: string = 'server_url';
const URL_KEY: string = 'url';
const DEFAULT_URL: string = 'http://192.168.1.1/';
let context: common.UIAbilityContext;

export default function urlUtilsStorageTest(): void {
  describe('UploadDownloadUrlUtilsStorageTest', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0100
     * @tc.name      testUploadDownloadUrlStorage0001
     * @tc.desc      Verify URL value 1 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://192.168.3.2/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.3.2/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0200
     * @tc.name      testUploadDownloadUrlStorage0002
     * @tc.desc      Verify URL value 2 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'https://192.168.3.3/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.3.3/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0300
     * @tc.name      testUploadDownloadUrlStorage0003
     * @tc.desc      Verify URL value 3 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://localhost:8080/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://localhost:8080/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0400
     * @tc.name      testUploadDownloadUrlStorage0004
     * @tc.desc      Verify URL value 4 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://example.com/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0500
     * @tc.name      testUploadDownloadUrlStorage0005
     * @tc.desc      Verify URL value 5 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'https://example.com/path');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://example.com/path');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0600
     * @tc.name      testUploadDownloadUrlStorage0006
     * @tc.desc      Verify URL value 6 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://example.com:9090/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com:9090/upload');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0700
     * @tc.name      testUploadDownloadUrlStorage0007
     * @tc.desc      Verify URL value 7 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://example.com/download?name=test.txt');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/download?name=test.txt');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0800
     * @tc.name      testUploadDownloadUrlStorage0008
     * @tc.desc      Verify URL value 8 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://example.com/a/b/c');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/a/b/c');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_0900
     * @tc.name      testUploadDownloadUrlStorage0009
     * @tc.desc      Verify URL value 9 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1000
     * @tc.name      testUploadDownloadUrlStorage0010
     * @tc.desc      Verify URL value 10 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'https://127.0.0.1:443/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://127.0.0.1:443/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1100
     * @tc.name      testUploadDownloadUrlStorage0011
     * @tc.desc      Verify URL value 11 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://10.0.0.1/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://10.0.0.1/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1200
     * @tc.name      testUploadDownloadUrlStorage0012
     * @tc.desc      Verify URL value 12 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://172.16.0.1/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://172.16.0.1/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1300
     * @tc.name      testUploadDownloadUrlStorage0013
     * @tc.desc      Verify URL value 13 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1400
     * @tc.name      testUploadDownloadUrlStorage0014
     * @tc.desc      Verify URL value 14 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'https://host/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://host/upload');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1500
     * @tc.name      testUploadDownloadUrlStorage0015
     * @tc.desc      Verify URL value 15 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host:1234/path?x=1&y=2');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host:1234/path?x=1&y=2');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1600
     * @tc.name      testUploadDownloadUrlStorage0016
     * @tc.desc      Verify URL value 16 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/#fragment');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/#fragment');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1700
     * @tc.name      testUploadDownloadUrlStorage0017
     * @tc.desc      Verify URL value 17 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://user@host/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://user@host/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1800
     * @tc.name      testUploadDownloadUrlStorage0018
     * @tc.desc      Verify URL value 18 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/中文');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/中文');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_1900
     * @tc.name      testUploadDownloadUrlStorage0019
     * @tc.desc      Verify URL value 19 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/space path');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/space path');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2000
     * @tc.name      testUploadDownloadUrlStorage0020
     * @tc.desc      Verify URL value 20 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/special<>"');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/special<>"');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2100
     * @tc.name      testUploadDownloadUrlStorage0021
     * @tc.desc      Verify URL value 21 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/long/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/long/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2200
     * @tc.name      testUploadDownloadUrlStorage0022
     * @tc.desc      Verify URL value 22 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com:8443/api/v1/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com:8443/api/v1/upload');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2300
     * @tc.name      testUploadDownloadUrlStorage0023
     * @tc.desc      Verify URL value 23 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://server.example.com/api/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://server.example.com/api/download');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2400
     * @tc.name      testUploadDownloadUrlStorage0024
     * @tc.desc      Verify URL value 24 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://1.2.3.4:65535/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://1.2.3.4:65535/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2500
     * @tc.name      testUploadDownloadUrlStorage0025
     * @tc.desc      Verify URL value 25 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://[::1]/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://[::1]/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2600
     * @tc.name      testUploadDownloadUrlStorage0026
     * @tc.desc      Verify URL value 26 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/?empty=');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/?empty=');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2700
     * @tc.name      testUploadDownloadUrlStorage0027
     * @tc.desc      Verify URL value 27 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/path%20encoded');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/path%20encoded');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2800
     * @tc.name      testUploadDownloadUrlStorage0028
     * @tc.desc      Verify URL value 28 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/plus+value');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/plus+value');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_2900
     * @tc.name      testUploadDownloadUrlStorage0029
     * @tc.desc      Verify URL value 29 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/amp&value');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/amp&value');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URL_3000
     * @tc.name      testUploadDownloadUrlStorage0030
     * @tc.desc      Verify URL value 30 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlStorage0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await urlUtils.saveUrl(context, 'http://host/end/');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://host/end/');
          expect(typeof value).assertEqual('string');
          expect(value.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
