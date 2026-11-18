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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  prepareCase,
  finishCase,
  logSuite,
  downloadFilesData,
  selectDownloadPage,
  hasId,
} from '../Shared/SharedDriver';

export default function downloadModelPart40Test(): void {
  describe('DownloadModelPart40Test', (): void => {
    beforeAll((): void => {
      logSuite('DownloadModelPart40Test', 'started');
    });
    beforeEach((): void => {
      logSuite('DownloadModelPart40Test', 'model fixture isolated');
    });
    afterEach(async (): Promise<void> => {
      await finishCase();
    });
    afterAll((): void => {
      logSuite('DownloadModelPart40Test', 'finished');
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0100
    // @tc.name downloadModelPart40Test001
    // @tc.desc Verify downloadFilesData copy with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url, first.fileStatus, first.downloadTime);
      const secondUrl: string = second.url;
      expect(secondUrl).assertEqual(expectedUrl);
      const secondId: string = second.id;
      expect(secondId).not().assertEqual(originalId);
      second.url = 'https://example.test/replaced.bin';
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0200
    // @tc.name downloadModelPart40Test002
    // @tc.desc Verify downloadFilesData status with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      first.fileStatus = 1;
      const completed: number = first.fileStatus;
      const expectedCompleted: number = 1;
      expect(completed).assertEqual(expectedCompleted);
      first.fileStatus = 0;
      const reset: number = first.fileStatus;
      expect(reset).assertEqual(expectedStatus);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0300
    // @tc.name downloadModelPart40Test003
    // @tc.desc Verify downloadFilesData url with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const replacement: string = 'https://example.test/retry.bin';
      first.url = replacement;
      const actual: string = first.url;
      expect(actual).assertEqual(replacement);
      first.url = expectedUrl;
      const restored: string = first.url;
      expect(restored).assertEqual(expectedUrl);
      const retainedTime: number = first.downloadTime;
      expect(retainedTime).assertEqual(expectedTime);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0400
    // @tc.name downloadModelPart40Test004
    // @tc.desc Verify downloadFilesData time with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const updatedTime: number = expectedTime + 1;
      first.downloadTime = updatedTime;
      const actual: number = first.downloadTime;
      expect(actual).assertEqual(updatedTime);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0500
    // @tc.name downloadModelPart40Test005
    // @tc.desc Verify downloadFilesData identity with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url);
      const third: downloadFilesData = new downloadFilesData(first.url);
      const secondId: string = second.id;
      const thirdId: string = third.id;
      expect(secondId).not().assertEqual(originalId);
      expect(thirdId).not().assertEqual(secondId);
      expect(thirdId).not().assertEqual(originalId);
      const idUnchanged: string = first.id;
      expect(idUnchanged).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0600
    // @tc.name downloadModelPart40Test006
    // @tc.desc Verify downloadFilesData queue with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url);
      const queue: downloadFilesData[] = [first, second];
      const remaining: downloadFilesData[] = queue.filter((item: downloadFilesData): boolean => item.id !== originalId);
      const remainingCount: number = remaining.length;
      const expectedCount: number = 1;
      expect(remainingCount).assertEqual(expectedCount);
      const retainedId: string = remaining[0].id;
      const secondId: string = second.id;
      expect(retainedId).assertEqual(secondId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0700
    // @tc.name downloadModelPart40Test007
    // @tc.desc Verify downloadFilesData history with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const history: downloadFilesData[] = [];
      first.fileStatus = 1;
      history.push(first);
      const storedUrl: string = history[0].url;
      expect(storedUrl).assertEqual(expectedUrl);
      const storedTime: number = history[0].downloadTime;
      expect(storedTime).assertEqual(expectedTime);
      const storedId: string = history[0].id;
      expect(storedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0800
    // @tc.name downloadModelPart40Test008
    // @tc.desc Verify downloadFilesData default with URL class 7 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1728529510880;
      expect(initialTime).assertEqual(expectedTime);
      const fresh: downloadFilesData = new downloadFilesData();
      const freshUrl: string = fresh.url;
      const emptyUrl: string = '';
      expect(freshUrl).assertEqual(emptyUrl);
      const freshTime: number = fresh.downloadTime;
      const zero: number = 0;
      expect(freshTime).assertEqual(zero);
      const firstId: string = first.id;
      expect(firstId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_0900
    // @tc.name downloadModelPart40Test009
    // @tc.desc Verify downloadFilesData copy with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url, first.fileStatus, first.downloadTime);
      const secondUrl: string = second.url;
      expect(secondUrl).assertEqual(expectedUrl);
      const secondId: string = second.id;
      expect(secondId).not().assertEqual(originalId);
      second.url = 'https://example.test/replaced.bin';
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1000
    // @tc.name downloadModelPart40Test010
    // @tc.desc Verify downloadFilesData status with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      first.fileStatus = 1;
      const completed: number = first.fileStatus;
      const expectedCompleted: number = 1;
      expect(completed).assertEqual(expectedCompleted);
      first.fileStatus = 0;
      const reset: number = first.fileStatus;
      expect(reset).assertEqual(expectedStatus);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1100
    // @tc.name downloadModelPart40Test011
    // @tc.desc Verify downloadFilesData url with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const replacement: string = 'https://example.test/retry.bin';
      first.url = replacement;
      const actual: string = first.url;
      expect(actual).assertEqual(replacement);
      first.url = expectedUrl;
      const restored: string = first.url;
      expect(restored).assertEqual(expectedUrl);
      const retainedTime: number = first.downloadTime;
      expect(retainedTime).assertEqual(expectedTime);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1200
    // @tc.name downloadModelPart40Test012
    // @tc.desc Verify downloadFilesData time with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const updatedTime: number = expectedTime + 1;
      first.downloadTime = updatedTime;
      const actual: number = first.downloadTime;
      expect(actual).assertEqual(updatedTime);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1300
    // @tc.name downloadModelPart40Test013
    // @tc.desc Verify downloadFilesData identity with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url);
      const third: downloadFilesData = new downloadFilesData(first.url);
      const secondId: string = second.id;
      const thirdId: string = third.id;
      expect(secondId).not().assertEqual(originalId);
      expect(thirdId).not().assertEqual(secondId);
      expect(thirdId).not().assertEqual(originalId);
      const idUnchanged: string = first.id;
      expect(idUnchanged).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1400
    // @tc.name downloadModelPart40Test014
    // @tc.desc Verify downloadFilesData queue with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url);
      const queue: downloadFilesData[] = [first, second];
      const remaining: downloadFilesData[] = queue.filter((item: downloadFilesData): boolean => item.id !== originalId);
      const remainingCount: number = remaining.length;
      const expectedCount: number = 1;
      expect(remainingCount).assertEqual(expectedCount);
      const retainedId: string = remaining[0].id;
      const secondId: string = second.id;
      expect(retainedId).assertEqual(secondId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1500
    // @tc.name downloadModelPart40Test015
    // @tc.desc Verify downloadFilesData history with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const history: downloadFilesData[] = [];
      first.fileStatus = 1;
      history.push(first);
      const storedUrl: string = history[0].url;
      expect(storedUrl).assertEqual(expectedUrl);
      const storedTime: number = history[0].downloadTime;
      expect(storedTime).assertEqual(expectedTime);
      const storedId: string = history[0].id;
      expect(storedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1600
    // @tc.name downloadModelPart40Test016
    // @tc.desc Verify downloadFilesData default with URL class 7 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483647;
      expect(initialTime).assertEqual(expectedTime);
      const fresh: downloadFilesData = new downloadFilesData();
      const freshUrl: string = fresh.url;
      const emptyUrl: string = '';
      expect(freshUrl).assertEqual(emptyUrl);
      const freshTime: number = fresh.downloadTime;
      const zero: number = 0;
      expect(freshTime).assertEqual(zero);
      const firstId: string = first.id;
      expect(firstId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1700
    // @tc.name downloadModelPart40Test017
    // @tc.desc Verify downloadFilesData copy with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url, first.fileStatus, first.downloadTime);
      const secondUrl: string = second.url;
      expect(secondUrl).assertEqual(expectedUrl);
      const secondId: string = second.id;
      expect(secondId).not().assertEqual(originalId);
      second.url = 'https://example.test/replaced.bin';
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1800
    // @tc.name downloadModelPart40Test018
    // @tc.desc Verify downloadFilesData status with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      first.fileStatus = 1;
      const completed: number = first.fileStatus;
      const expectedCompleted: number = 1;
      expect(completed).assertEqual(expectedCompleted);
      first.fileStatus = 0;
      const reset: number = first.fileStatus;
      expect(reset).assertEqual(expectedStatus);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_1900
    // @tc.name downloadModelPart40Test019
    // @tc.desc Verify downloadFilesData url with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const replacement: string = 'https://example.test/retry.bin';
      first.url = replacement;
      const actual: string = first.url;
      expect(actual).assertEqual(replacement);
      first.url = expectedUrl;
      const restored: string = first.url;
      expect(restored).assertEqual(expectedUrl);
      const retainedTime: number = first.downloadTime;
      expect(retainedTime).assertEqual(expectedTime);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2000
    // @tc.name downloadModelPart40Test020
    // @tc.desc Verify downloadFilesData time with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const updatedTime: number = expectedTime + 1;
      first.downloadTime = updatedTime;
      const actual: number = first.downloadTime;
      expect(actual).assertEqual(updatedTime);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2100
    // @tc.name downloadModelPart40Test021
    // @tc.desc Verify downloadFilesData identity with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url);
      const third: downloadFilesData = new downloadFilesData(first.url);
      const secondId: string = second.id;
      const thirdId: string = third.id;
      expect(secondId).not().assertEqual(originalId);
      expect(thirdId).not().assertEqual(secondId);
      expect(thirdId).not().assertEqual(originalId);
      const idUnchanged: string = first.id;
      expect(idUnchanged).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2200
    // @tc.name downloadModelPart40Test022
    // @tc.desc Verify downloadFilesData queue with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url);
      const queue: downloadFilesData[] = [first, second];
      const remaining: downloadFilesData[] = queue.filter((item: downloadFilesData): boolean => item.id !== originalId);
      const remainingCount: number = remaining.length;
      const expectedCount: number = 1;
      expect(remainingCount).assertEqual(expectedCount);
      const retainedId: string = remaining[0].id;
      const secondId: string = second.id;
      expect(retainedId).assertEqual(secondId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2300
    // @tc.name downloadModelPart40Test023
    // @tc.desc Verify downloadFilesData history with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const history: downloadFilesData[] = [];
      first.fileStatus = 1;
      history.push(first);
      const storedUrl: string = history[0].url;
      expect(storedUrl).assertEqual(expectedUrl);
      const storedTime: number = history[0].downloadTime;
      expect(storedTime).assertEqual(expectedTime);
      const storedId: string = history[0].id;
      expect(storedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2400
    // @tc.name downloadModelPart40Test024
    // @tc.desc Verify downloadFilesData default with URL class 7 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 2147483648;
      expect(initialTime).assertEqual(expectedTime);
      const fresh: downloadFilesData = new downloadFilesData();
      const freshUrl: string = fresh.url;
      const emptyUrl: string = '';
      expect(freshUrl).assertEqual(emptyUrl);
      const freshTime: number = fresh.downloadTime;
      const zero: number = 0;
      expect(freshTime).assertEqual(zero);
      const firstId: string = first.id;
      expect(firstId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2500
    // @tc.name downloadModelPart40Test025
    // @tc.desc Verify downloadFilesData copy with URL class 7 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
      expect(initialTime).assertEqual(expectedTime);
      const second: downloadFilesData = new downloadFilesData(first.url, first.fileStatus, first.downloadTime);
      const secondUrl: string = second.url;
      expect(secondUrl).assertEqual(expectedUrl);
      const secondId: string = second.id;
      expect(secondId).not().assertEqual(originalId);
      second.url = 'https://example.test/replaced.bin';
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2600
    // @tc.name downloadModelPart40Test026
    // @tc.desc Verify downloadFilesData status with URL class 7 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
      expect(initialTime).assertEqual(expectedTime);
      first.fileStatus = 1;
      const completed: number = first.fileStatus;
      const expectedCompleted: number = 1;
      expect(completed).assertEqual(expectedCompleted);
      first.fileStatus = 0;
      const reset: number = first.fileStatus;
      expect(reset).assertEqual(expectedStatus);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2700
    // @tc.name downloadModelPart40Test027
    // @tc.desc Verify downloadFilesData url with URL class 7 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
      expect(initialTime).assertEqual(expectedTime);
      const replacement: string = 'https://example.test/retry.bin';
      first.url = replacement;
      const actual: string = first.url;
      expect(actual).assertEqual(replacement);
      first.url = expectedUrl;
      const restored: string = first.url;
      expect(restored).assertEqual(expectedUrl);
      const retainedTime: number = first.downloadTime;
      expect(retainedTime).assertEqual(expectedTime);
    });

    // @tc.number SAMPLE_DOWNLOAD_040_2800
    // @tc.name downloadModelPart40Test028
    // @tc.desc Verify downloadFilesData time with URL class 7 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart40Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('http://127.0.0.1:8080/a.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'http://127.0.0.1:8080/a.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
      expect(initialTime).assertEqual(expectedTime);
      const updatedTime: number = expectedTime + 1;
      first.downloadTime = updatedTime;
      const actual: number = first.downloadTime;
      expect(actual).assertEqual(updatedTime);
      const retainedId: string = first.id;
      expect(retainedId).assertEqual(originalId);
      const retainedUrl: string = first.url;
      expect(retainedUrl).assertEqual(expectedUrl);
    });
  });
}
