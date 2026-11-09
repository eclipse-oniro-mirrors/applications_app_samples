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
const DEFAULT_SERVER_URL: string = 'http://192.168.1.1/';
let context: common.UIAbilityContext;

async function clearSavedUrl(): Promise<void> {
  try {
    let preference = await preferences.getPreferences(context, STORE_NAME);
    await preference.delete(URL_KEY);
    await preference.flush();
  } catch (err) {
  }
}

export default function urlUtilsBoundaryTest(): void {
  describe('UploadDownloadUrlUtilsBoundaryTest', () => {
    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
        .createModuleContext('entry') as common.UIAbilityContext;
    });

    beforeEach(async () => {
      await clearSavedUrl();
    });

    afterAll(async () => {
      await clearSavedUrl();
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0100
     * @tc.name      testUploadDownloadUrlBoundary0001
     * @tc.desc      Verify saving an empty address falls back to the built-in server address.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0001');
        try {
          await urlUtils.saveUrl(context, '');
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(DEFAULT_SERVER_URL);
          expect(value === '').assertFalse();
          expect(value.startsWith('http://')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0200
     * @tc.name      testUploadDownloadUrlBoundary0002
     * @tc.desc      Verify a whitespace-only address is stored as entered and does not use the default.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0002');
        try {
          const whitespace: string = '   ';
          await urlUtils.saveUrl(context, whitespace);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(whitespace);
          expect(value.trim()).assertEqual('');
          expect(value === DEFAULT_SERVER_URL).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0300
     * @tc.name      testUploadDownloadUrlBoundary0003
     * @tc.desc      Verify leading and trailing spaces of an address are preserved across a round trip.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0003');
        try {
          const padded: string = '  http://192.168.1.50/files?name=a.txt  ';
          await urlUtils.saveUrl(context, padded);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(padded);
          expect(value.startsWith('  http://')).assertTrue();
          expect(value.endsWith('  ')).assertTrue();
          expect(value.length).assertEqual(padded.length);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0400
     * @tc.name      testUploadDownloadUrlBoundary0004
     * @tc.desc      Verify an address containing Chinese text and spaces returns unchanged.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0004');
        try {
          const unicodeUrl: string = 'http://192.168.1.60/资料/报告 2026.pdf?名称=测试&flag=1';
          await urlUtils.saveUrl(context, unicodeUrl);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(unicodeUrl);
          expect(value.indexOf('资料') >= 0).assertTrue();
          expect(value.indexOf('名称=测试') >= 0).assertTrue();
          expect(value.length).assertEqual(unicodeUrl.length);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0500
     * @tc.name      testUploadDownloadUrlBoundary0005
     * @tc.desc      Verify a 2048-character address is stored in full without truncation.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0005');
        try {
          let longUrl: string = 'http://host/';
          for (let index = 0; index < 2036; index++) {
            longUrl += 'a';
          }
          await urlUtils.saveUrl(context, longUrl);
          const value: string = await urlUtils.getUrl(context);
          expect(value.length).assertEqual(2048);
          expect(value).assertEqual(longUrl);
          expect(value.startsWith('http://host/')).assertTrue();
          expect(value.endsWith('aaaaaaaa')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0600
     * @tc.name      testUploadDownloadUrlBoundary0006
     * @tc.desc      Verify line breaks and tabs inside an address survive the round trip.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0006');
        try {
          const controlUrl: string = 'http://host/a\nb\tc';
          await urlUtils.saveUrl(context, controlUrl);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(controlUrl);
          expect(value.indexOf('\n') >= 0).assertTrue();
          expect(value.indexOf('\t') >= 0).assertTrue();
          expect(value.length).assertEqual(controlUrl.length);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0700
     * @tc.name      testUploadDownloadUrlBoundary0007
     * @tc.desc      Verify saving a new address replaces the previous one instead of appending it.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0007');
        try {
          const firstUrl: string = 'http://192.168.1.71/first';
          const secondUrl: string = 'http://192.168.1.72/second';
          await urlUtils.saveUrl(context, firstUrl);
          await urlUtils.saveUrl(context, secondUrl);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(secondUrl);
          expect(value === firstUrl).assertFalse();
          expect(value.indexOf('first')).assertEqual(-1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0800
     * @tc.name      testUploadDownloadUrlBoundary0008
     * @tc.desc      Verify saving the same address repeatedly leaves one stable stored value.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0008');
        try {
          const repeatedUrl: string = 'http://192.168.1.73/hfs';
          await urlUtils.saveUrl(context, repeatedUrl);
          await urlUtils.saveUrl(context, repeatedUrl);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(repeatedUrl);
          expect(value.length).assertEqual(repeatedUrl.length);
          expect(value.endsWith('/hfs')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_0900
     * @tc.name      testUploadDownloadUrlBoundary0009
     * @tc.desc      Verify clearing a saved address after a custom value returns to the default address.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0009');
        try {
          const customUrl: string = 'http://192.168.1.74/custom';
          await urlUtils.saveUrl(context, customUrl);
          const saved: string = await urlUtils.getUrl(context);
          expect(saved).assertEqual(customUrl);
          await urlUtils.saveUrl(context, '');
          const cleared: string = await urlUtils.getUrl(context);
          expect(cleared).assertEqual(DEFAULT_SERVER_URL);
          expect(cleared === customUrl).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_URLBOUNDARY_1000
     * @tc.name      testUploadDownloadUrlBoundary0010
     * @tc.desc      Verify an address without a trailing slash is not normalized before storage.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadUrlBoundary0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadUrlBoundary0010');
        try {
          const noSlash: string = 'http://192.168.1.75/hfs';
          await urlUtils.saveUrl(context, noSlash);
          const value: string = await urlUtils.getUrl(context);
          expect(value).assertEqual(noSlash);
          expect(value.endsWith('/hfs')).assertTrue();
          expect(value.endsWith('/hfs/')).assertFalse();
          expect(value.length).assertEqual(noSlash.length);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
