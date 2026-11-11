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

export default function serverConfigTestPart2(): void {
  describe('UploadDownloadServerConfigTestPart2', () => {
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
    it('testUploadDownloadServerConfig0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0052');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/server?task=52');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/server?task=52');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5300
     * @tc.name      testUploadDownloadServerConfig0053
     * @tc.desc      Verify server configuration 53 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0053');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5400
     * @tc.name      testUploadDownloadServerConfig0054
     * @tc.desc      Verify server configuration 54 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0054');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5500
     * @tc.name      testUploadDownloadServerConfig0055
     * @tc.desc      Verify server configuration 55 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0055');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com:8055/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com:8055/download');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5600
     * @tc.name      testUploadDownloadServerConfig0056
     * @tc.desc      Verify server configuration 56 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0056');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/api/v1/file?task=56');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/api/v1/file?task=56');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5700
     * @tc.name      testUploadDownloadServerConfig0057
     * @tc.desc      Verify server configuration 57 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0057');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5800
     * @tc.name      testUploadDownloadServerConfig0058
     * @tc.desc      Verify server configuration 58 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0058');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_5900
     * @tc.name      testUploadDownloadServerConfig0059
     * @tc.desc      Verify server configuration 59 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0059');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6000
     * @tc.name      testUploadDownloadServerConfig0060
     * @tc.desc      Verify server configuration 60 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0060');
        try {
          await urlUtils.saveUrl(context, 'https://localhost:8060/upload?task=60');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost:8060/upload?task=60');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6100
     * @tc.name      testUploadDownloadServerConfig0061
     * @tc.desc      Verify server configuration 61 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0061');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6200
     * @tc.name      testUploadDownloadServerConfig0062
     * @tc.desc      Verify server configuration 62 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0062');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6300
     * @tc.name      testUploadDownloadServerConfig0063
     * @tc.desc      Verify server configuration 63 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0063');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6400
     * @tc.name      testUploadDownloadServerConfig0064
     * @tc.desc      Verify server configuration 64 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0064');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/server?task=64');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/server?task=64');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6500
     * @tc.name      testUploadDownloadServerConfig0065
     * @tc.desc      Verify server configuration 65 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0065');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11:8065/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11:8065/hfs');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6600
     * @tc.name      testUploadDownloadServerConfig0066
     * @tc.desc      Verify server configuration 66 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0066');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6700
     * @tc.name      testUploadDownloadServerConfig0067
     * @tc.desc      Verify server configuration 67 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0067');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6800
     * @tc.name      testUploadDownloadServerConfig0068
     * @tc.desc      Verify server configuration 68 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0068');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/api/v1/file?task=68');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/api/v1/file?task=68');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_6900
     * @tc.name      testUploadDownloadServerConfig0069
     * @tc.desc      Verify server configuration 69 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0069');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7000
     * @tc.name      testUploadDownloadServerConfig0070
     * @tc.desc      Verify server configuration 70 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0070');
        try {
          await urlUtils.saveUrl(context, 'https://server.example.com:8070/server');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://server.example.com:8070/server');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7100
     * @tc.name      testUploadDownloadServerConfig0071
     * @tc.desc      Verify server configuration 71 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0071');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7200
     * @tc.name      testUploadDownloadServerConfig0072
     * @tc.desc      Verify server configuration 72 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0072');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/upload?task=72');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/upload?task=72');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7300
     * @tc.name      testUploadDownloadServerConfig0073
     * @tc.desc      Verify server configuration 73 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0073');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7400
     * @tc.name      testUploadDownloadServerConfig0074
     * @tc.desc      Verify server configuration 74 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0074');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7500
     * @tc.name      testUploadDownloadServerConfig0075
     * @tc.desc      Verify server configuration 75 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0075');
        try {
          await urlUtils.saveUrl(context, 'http://127.0.0.1:8075/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://127.0.0.1:8075/files');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7600
     * @tc.name      testUploadDownloadServerConfig0076
     * @tc.desc      Verify server configuration 76 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0076');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/server?task=76');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/server?task=76');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7700
     * @tc.name      testUploadDownloadServerConfig0077
     * @tc.desc      Verify server configuration 77 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0077');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7800
     * @tc.name      testUploadDownloadServerConfig0078
     * @tc.desc      Verify server configuration 78 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0078');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_7900
     * @tc.name      testUploadDownloadServerConfig0079
     * @tc.desc      Verify server configuration 79 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0079');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8000
     * @tc.name      testUploadDownloadServerConfig0080
     * @tc.desc      Verify server configuration 80 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0080');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10:8080/api/v1/file?task=80');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10:8080/api/v1/file?task=80');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8100
     * @tc.name      testUploadDownloadServerConfig0081
     * @tc.desc      Verify server configuration 81 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0081');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8200
     * @tc.name      testUploadDownloadServerConfig0082
     * @tc.desc      Verify server configuration 82 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0082');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8300
     * @tc.name      testUploadDownloadServerConfig0083
     * @tc.desc      Verify server configuration 83 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0083');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8400
     * @tc.name      testUploadDownloadServerConfig0084
     * @tc.desc      Verify server configuration 84 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0084');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/upload?task=84');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/upload?task=84');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8500
     * @tc.name      testUploadDownloadServerConfig0085
     * @tc.desc      Verify server configuration 85 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0085');
        try {
          await urlUtils.saveUrl(context, 'http://example.com:8085/download');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://example.com:8085/download');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8600
     * @tc.name      testUploadDownloadServerConfig0086
     * @tc.desc      Verify server configuration 86 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0086');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8700
     * @tc.name      testUploadDownloadServerConfig0087
     * @tc.desc      Verify server configuration 87 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0087');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8800
     * @tc.name      testUploadDownloadServerConfig0088
     * @tc.desc      Verify server configuration 88 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0088');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/server?task=88');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/server?task=88');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_8900
     * @tc.name      testUploadDownloadServerConfig0089
     * @tc.desc      Verify server configuration 89 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0089');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9000
     * @tc.name      testUploadDownloadServerConfig0090
     * @tc.desc      Verify server configuration 90 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0090');
        try {
          await urlUtils.saveUrl(context, 'https://10.0.0.10:8090/upload');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://10.0.0.10:8090/upload');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9100
     * @tc.name      testUploadDownloadServerConfig0091
     * @tc.desc      Verify server configuration 91 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0091');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9200
     * @tc.name      testUploadDownloadServerConfig0092
     * @tc.desc      Verify server configuration 92 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0092');
        try {
          await urlUtils.saveUrl(context, 'https://localhost/api/v1/file?task=92');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost/api/v1/file?task=92');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9300
     * @tc.name      testUploadDownloadServerConfig0093
     * @tc.desc      Verify server configuration 93 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0093');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9400
     * @tc.name      testUploadDownloadServerConfig0094
     * @tc.desc      Verify server configuration 94 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0094');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9500
     * @tc.name      testUploadDownloadServerConfig0095
     * @tc.desc      Verify server configuration 95 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0095');
        try {
          await urlUtils.saveUrl(context, 'http://files.example.com:8095/hfs');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://files.example.com:8095/hfs');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9600
     * @tc.name      testUploadDownloadServerConfig0096
     * @tc.desc      Verify server configuration 96 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0096');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/upload?task=96');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/upload?task=96');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9700
     * @tc.name      testUploadDownloadServerConfig0097
     * @tc.desc      Verify server configuration 97 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0097');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9800
     * @tc.name      testUploadDownloadServerConfig0098
     * @tc.desc      Verify server configuration 98 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0098');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_9900
     * @tc.name      testUploadDownloadServerConfig0099
     * @tc.desc      Verify server configuration 99 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0099');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_10000
     * @tc.name      testUploadDownloadServerConfig0100
     * @tc.desc      Verify server configuration 100 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0100');
        try {
          await urlUtils.saveUrl(context, 'https://localhost:8100/server?task=100');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://localhost:8100/server?task=100');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_10100
     * @tc.name      testUploadDownloadServerConfig0101
     * @tc.desc      Verify server configuration 101 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0101');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_10200
     * @tc.name      testUploadDownloadServerConfig0102
     * @tc.desc      Verify server configuration 102 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0102');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_10300
     * @tc.name      testUploadDownloadServerConfig0103
     * @tc.desc      Verify server configuration 103 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0103');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_10400
     * @tc.name      testUploadDownloadServerConfig0104
     * @tc.desc      Verify server configuration 104 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0104');
        try {
          await urlUtils.saveUrl(context, 'https://192.168.1.10/api/v1/file?task=104');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('https://192.168.1.10/api/v1/file?task=104');
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
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_SERVERCONFIG_10500
     * @tc.name      testUploadDownloadServerConfig0105
     * @tc.desc      Verify server configuration 105 persists.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadServerConfig0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadServerConfig0105');
        try {
          await urlUtils.saveUrl(context, 'http://192.168.1.11:8105/files');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual('http://192.168.1.11:8105/files');
          expect(typeof value).assertEqual('string');
          expect(value.includes('://')).assertTrue();
        } catch (err) {
          hilog.error(TEST_DOMAIN, TEST_TAG, 'test failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
