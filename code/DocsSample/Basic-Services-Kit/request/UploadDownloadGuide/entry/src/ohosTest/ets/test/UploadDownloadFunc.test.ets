/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { requestDownload, urlUtils, fileUtils } from 'uploadanddownload';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { request } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { preferences } from '@kit.ArkData';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

const TAG = '[UploadDownloadFuncTest]';
const STORE_NAME = 'server_url';
const URL_KEY = 'url';
const DIR_NAME = 'FuncTestDir';
const TEST_FILE_NAME = 'func_test.txt';
const CLEAR_FILE_NAME = 'clearexist_test.txt';

export default function uploadDownloadFuncTest(): void {
  describe('UploadDownloadFuncTest', () => {
    let context: common.UIAbilityContext;

    beforeAll(async () => {
      context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().createModuleContext('entry') as common.UIAbilityContext;
    })

    afterAll(async () => {
      try {
        let dir = context.filesDir + '/' + DIR_NAME;
        if (fileIo.accessSync(dir)) {
          fileIo.rmdirSync(dir);
        }
        let clearFilePath = context.cacheDir + '/' + CLEAR_FILE_NAME;
        if (fileIo.accessSync(clearFilePath)) {
          fileIo.unlinkSync(clearFilePath);
        }
        let preference = await preferences.getPreferences(context, STORE_NAME);
        await preference.delete(URL_KEY);
        await preference.flush();
      } catch (error) {
        console.error(`${TAG} afterAll cleanup error: ${error}`);
      }
    })

    /**
     * @tc.name   testUploadDownloadFunc0001
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0100
     * @tc.desc   urlUtils saveUrl and getUrl roundtrip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0001');
      const testUrl = 'http://192.168.3.2/';
      await urlUtils.saveUrl(context, testUrl);
      let url = await urlUtils.getUrl(context);
      expect(url).assertEqual(testUrl);
      expect(typeof url).assertEqual('string');
      expect(url.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   testUploadDownloadFunc0002
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0200
     * @tc.desc   urlUtils getUrl returns default server url when no url is saved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0002');
      let preference = await preferences.getPreferences(context, STORE_NAME);
      await preference.delete(URL_KEY);
      await preference.flush();
      let url = await urlUtils.getUrl(context);
      expect(url).assertEqual('http://192.168.1.1/');
      expect(url.startsWith('http://')).assertTrue();
      expect(url.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   testUploadDownloadFunc0003
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0300
     * @tc.desc   requestDownload clearExistFile deletes an existing file and tolerates a missing file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0003');
      let filePath = context.cacheDir + '/' + CLEAR_FILE_NAME;
      let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(file);
      expect(fileIo.accessSync(filePath)).assertTrue();
      requestDownload.clearExistFile(filePath);
      expect(fileIo.accessSync(filePath)).assertFalse();
      requestDownload.clearExistFile(filePath);
      expect(fileIo.accessSync(filePath)).assertFalse();
      done();
    })

    /**
     * @tc.name   testUploadDownloadFunc0004
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0400
     * @tc.desc   fileUtils initDownloadDir creates Pictures Videos Others folders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0004');
      let dir = context.filesDir + '/' + DIR_NAME;
      if (!fileIo.accessSync(dir)) {
        fileIo.mkdirSync(dir, true);
      }
      await fileUtils.initDownloadDir(dir);
      expect(fileIo.accessSync(dir + '/Pictures')).assertTrue();
      expect(fileIo.accessSync(dir + '/Videos')).assertTrue();
      expect(fileIo.accessSync(dir + '/Others')).assertTrue();
      done();
    })

    /**
     * @tc.name   testUploadDownloadFunc0005
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0500
     * @tc.desc   fileUtils listFiles returns created file in folder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0005');
      let dir = context.filesDir + '/' + DIR_NAME;
      let filePath = dir + '/Others/' + TEST_FILE_NAME;
      let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(file);
      let files = await fileUtils.listFiles(dir, 'Others');
      expect(files).assertContain(TEST_FILE_NAME);
      expect(Array.isArray(files)).assertTrue();
      expect(files.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   testUploadDownloadFunc0006
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0600
     * @tc.desc   fileUtils clearFolder removes all files in folder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0006');
      let dir = context.filesDir + '/' + DIR_NAME;
      await fileUtils.clearFolder(dir, 'Others');
      let files = await fileUtils.listFiles(dir, 'Others');
      expect(files.length).assertEqual(0);
      expect(Array.isArray(files)).assertTrue();
      expect(files.indexOf(TEST_FILE_NAME) === -1).assertTrue();
      done();
    })

    /**
     * @tc.name   testUploadDownloadFunc0007
     * @tc.number SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_0700
     * @tc.desc   request downloadFile rejects with a business error for an invalid url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadDownloadFunc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadFunc0007');
      try {
        await request.downloadFile(context, {
          url: 'invalid_url_for_test',
          filePath: context.cacheDir + '/func_test_download.bin',
        });
        expect('downloadFile should throw for invalid url').assertFail();
      } catch (error) {
        expect(() => {
          throw new Error(`${error}`);
        }).assertThrowError('The parameters check fails   Parse url error');
        expect(String(error).length > 0).assertTrue();
        expect(error !== null).assertTrue();
      }
      done();
    })
  })
}
