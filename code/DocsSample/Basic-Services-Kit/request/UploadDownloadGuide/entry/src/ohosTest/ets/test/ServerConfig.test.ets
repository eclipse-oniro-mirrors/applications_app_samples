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

export default function serverConfigTest(): void {
  describe('UploadDownloadServerConfigTest', () => {
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0100
     * @tc.name      testUploadDownloadServerConfig0001
     * @tc.desc      Verify server configuration 1 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0001');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0200
     * @tc.name      testUploadDownloadServerConfig0002
     * @tc.desc      Verify server configuration 2 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0002');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10/api/v1/file');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10/api/v1/file');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0300
     * @tc.name      testUploadDownloadServerConfig0003
     * @tc.desc      Verify server configuration 3 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0003');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0400
     * @tc.name      testUploadDownloadServerConfig0004
     * @tc.desc      Verify server configuration 4 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0004');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/server?task=4');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/server?task=4');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0500
     * @tc.name      testUploadDownloadServerConfig0005
     * @tc.desc      Verify server configuration 5 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0005');
        try {
          await urlUtils.saveUrl(context, 'http://example.com:8005/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com:8005/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0600
     * @tc.name      testUploadDownloadServerConfig0006
     * @tc.desc      Verify server configuration 6 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0006');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com/upload');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0700
     * @tc.name      testUploadDownloadServerConfig0007
     * @tc.desc      Verify server configuration 7 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0007');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0800
     * @tc.name      testUploadDownloadServerConfig0008
     * @tc.desc      Verify server configuration 8 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0008');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/api/v1/file?task=8');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/api/v1/file?task=8');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_0900
     * @tc.name      testUploadDownloadServerConfig0009
     * @tc.desc      Verify server configuration 9 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0009');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1000
     * @tc.name      testUploadDownloadServerConfig0010
     * @tc.desc      Verify server configuration 10 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0010');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10:8010/server');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10:8010/server');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1100
     * @tc.name      testUploadDownloadServerConfig0011
     * @tc.desc      Verify server configuration 11 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0011');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1200
     * @tc.name      testUploadDownloadServerConfig0012
     * @tc.desc      Verify server configuration 12 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0012');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/upload?task=12');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/upload?task=12');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1300
     * @tc.name      testUploadDownloadServerConfig0013
     * @tc.desc      Verify server configuration 13 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0013');
        try {
          await urlUtils.saveUrl(context, 'http://example.com/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1400
     * @tc.name      testUploadDownloadServerConfig0014
     * @tc.desc      Verify server configuration 14 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0014');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com/api/v1/file');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com/api/v1/file');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1500
     * @tc.name      testUploadDownloadServerConfig0015
     * @tc.desc      Verify server configuration 15 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0015');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com:8015/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com:8015/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1600
     * @tc.name      testUploadDownloadServerConfig0016
     * @tc.desc      Verify server configuration 16 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0016');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/server?task=16');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/server?task=16');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1700
     * @tc.name      testUploadDownloadServerConfig0017
     * @tc.desc      Verify server configuration 17 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0017');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1800
     * @tc.name      testUploadDownloadServerConfig0018
     * @tc.desc      Verify server configuration 18 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0018');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10/upload');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_1900
     * @tc.name      testUploadDownloadServerConfig0019
     * @tc.desc      Verify server configuration 19 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0019');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2000
     * @tc.name      testUploadDownloadServerConfig0020
     * @tc.desc      Verify server configuration 20 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0020');
        try {
          await urlUtils.saveUrl(context, 'https://localhost:8020/api/v1/file?task=20');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost:8020/api/v1/file?task=20');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2100
     * @tc.name      testUploadDownloadServerConfig0021
     * @tc.desc      Verify server configuration 21 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0021');
        try {
          await urlUtils.saveUrl(context, 'http://example.com/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2200
     * @tc.name      testUploadDownloadServerConfig0022
     * @tc.desc      Verify server configuration 22 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0022');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com/server');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com/server');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2300
     * @tc.name      testUploadDownloadServerConfig0023
     * @tc.desc      Verify server configuration 23 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0023');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2400
     * @tc.name      testUploadDownloadServerConfig0024
     * @tc.desc      Verify server configuration 24 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0024');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/upload?task=24');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/upload?task=24');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2500
     * @tc.name      testUploadDownloadServerConfig0025
     * @tc.desc      Verify server configuration 25 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0025');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11:8025/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11:8025/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2600
     * @tc.name      testUploadDownloadServerConfig0026
     * @tc.desc      Verify server configuration 26 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0026');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10/api/v1/file');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10/api/v1/file');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2700
     * @tc.name      testUploadDownloadServerConfig0027
     * @tc.desc      Verify server configuration 27 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0027');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2800
     * @tc.name      testUploadDownloadServerConfig0028
     * @tc.desc      Verify server configuration 28 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0028');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/server?task=28');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/server?task=28');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_2900
     * @tc.name      testUploadDownloadServerConfig0029
     * @tc.desc      Verify server configuration 29 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0029');
        try {
          await urlUtils.saveUrl(context, 'http://example.com/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3000
     * @tc.name      testUploadDownloadServerConfig0030
     * @tc.desc      Verify server configuration 30 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0030');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com:8030/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com:8030/upload');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3100
     * @tc.name      testUploadDownloadServerConfig0031
     * @tc.desc      Verify server configuration 31 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0031');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3200
     * @tc.name      testUploadDownloadServerConfig0032
     * @tc.desc      Verify server configuration 32 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0032');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/api/v1/file?task=32');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/api/v1/file?task=32');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3300
     * @tc.name      testUploadDownloadServerConfig0033
     * @tc.desc      Verify server configuration 33 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0033');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3400
     * @tc.name      testUploadDownloadServerConfig0034
     * @tc.desc      Verify server configuration 34 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0034');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10/server');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10/server');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3500
     * @tc.name      testUploadDownloadServerConfig0035
     * @tc.desc      Verify server configuration 35 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0035');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1:8035/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1:8035/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3600
     * @tc.name      testUploadDownloadServerConfig0036
     * @tc.desc      Verify server configuration 36 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0036');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/upload?task=36');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/upload?task=36');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3700
     * @tc.name      testUploadDownloadServerConfig0037
     * @tc.desc      Verify server configuration 37 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0037');
        try {
          await urlUtils.saveUrl(context, 'http://example.com/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3800
     * @tc.name      testUploadDownloadServerConfig0038
     * @tc.desc      Verify server configuration 38 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0038');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com/api/v1/file');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com/api/v1/file');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_3900
     * @tc.name      testUploadDownloadServerConfig0039
     * @tc.desc      Verify server configuration 39 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0039');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4000
     * @tc.name      testUploadDownloadServerConfig0040
     * @tc.desc      Verify server configuration 40 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0040');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10:8040/server?task=40');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10:8040/server?task=40');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4100
     * @tc.name      testUploadDownloadServerConfig0041
     * @tc.desc      Verify server configuration 41 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0041');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4200
     * @tc.name      testUploadDownloadServerConfig0042
     * @tc.desc      Verify server configuration 42 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0042');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10/upload');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4300
     * @tc.name      testUploadDownloadServerConfig0043
     * @tc.desc      Verify server configuration 43 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0043');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4400
     * @tc.name      testUploadDownloadServerConfig0044
     * @tc.desc      Verify server configuration 44 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0044');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/api/v1/file?task=44');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/api/v1/file?task=44');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4500
     * @tc.name      testUploadDownloadServerConfig0045
     * @tc.desc      Verify server configuration 45 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0045');
        try {
          await urlUtils.saveUrl(context, 'http://example.com:8045/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com:8045/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4600
     * @tc.name      testUploadDownloadServerConfig0046
     * @tc.desc      Verify server configuration 46 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0046');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com/server');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com/server');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4700
     * @tc.name      testUploadDownloadServerConfig0047
     * @tc.desc      Verify server configuration 47 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0047');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com/hfs');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4800
     * @tc.name      testUploadDownloadServerConfig0048
     * @tc.desc      Verify server configuration 48 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0048');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/upload?task=48');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/upload?task=48');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_4900
     * @tc.name      testUploadDownloadServerConfig0049
     * @tc.desc      Verify server configuration 49 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0049');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11/download');
          expect(value.length > 0).assertTrue();
          expect(value.startsWith('http')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5000
     * @tc.name      testUploadDownloadServerConfig0050
     * @tc.desc      Verify server configuration 50 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0050');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10:8050/api/v1/file');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10:8050/api/v1/file');
          expect(typeof value).assertEqual('string');
          expect(value.length > 8).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5100
     * @tc.name      testUploadDownloadServerConfig0051
     * @tc.desc      Verify server configuration 51 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0051');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5200
     * @tc.name      testUploadDownloadServerConfig0052
     * @tc.desc      Verify server configuration 52 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
  });
}
