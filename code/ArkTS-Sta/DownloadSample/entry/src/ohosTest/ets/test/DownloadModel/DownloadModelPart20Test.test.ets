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

export default function downloadModelPart20Test(): void {
  describe('DownloadModelPart20Test', (): void => {
    beforeAll((): void => {
      logSuite('DownloadModelPart20Test', 'started');
    });
    beforeEach((): void => {
      logSuite('DownloadModelPart20Test', 'model fixture isolated');
    });
    afterEach(async (): Promise<void> => {
      await finishCase();
    });
    afterAll((): void => {
      logSuite('DownloadModelPart20Test', 'finished');
    });

    // @tc.number SAMPLE_DOWNLOAD_020_0100
    // @tc.name downloadModelPart20Test001
    // @tc.desc Verify downloadFilesData url with URL class 3 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0200
    // @tc.name downloadModelPart20Test002
    // @tc.desc Verify downloadFilesData time with URL class 3 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0300
    // @tc.name downloadModelPart20Test003
    // @tc.desc Verify downloadFilesData identity with URL class 3 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0400
    // @tc.name downloadModelPart20Test004
    // @tc.desc Verify downloadFilesData queue with URL class 3 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0500
    // @tc.name downloadModelPart20Test005
    // @tc.desc Verify downloadFilesData history with URL class 3 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0600
    // @tc.name downloadModelPart20Test006
    // @tc.desc Verify downloadFilesData default with URL class 3 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0700
    // @tc.name downloadModelPart20Test007
    // @tc.desc Verify downloadFilesData copy with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0800
    // @tc.name downloadModelPart20Test008
    // @tc.desc Verify downloadFilesData status with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_0900
    // @tc.name downloadModelPart20Test009
    // @tc.desc Verify downloadFilesData url with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1000
    // @tc.name downloadModelPart20Test010
    // @tc.desc Verify downloadFilesData time with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1100
    // @tc.name downloadModelPart20Test011
    // @tc.desc Verify downloadFilesData identity with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1200
    // @tc.name downloadModelPart20Test012
    // @tc.desc Verify downloadFilesData queue with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1300
    // @tc.name downloadModelPart20Test013
    // @tc.desc Verify downloadFilesData history with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1400
    // @tc.name downloadModelPart20Test014
    // @tc.desc Verify downloadFilesData default with URL class 3 and timestamp 2147483647
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483647);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1500
    // @tc.name downloadModelPart20Test015
    // @tc.desc Verify downloadFilesData copy with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1600
    // @tc.name downloadModelPart20Test016
    // @tc.desc Verify downloadFilesData status with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1700
    // @tc.name downloadModelPart20Test017
    // @tc.desc Verify downloadFilesData url with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1800
    // @tc.name downloadModelPart20Test018
    // @tc.desc Verify downloadFilesData time with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_1900
    // @tc.name downloadModelPart20Test019
    // @tc.desc Verify downloadFilesData identity with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2000
    // @tc.name downloadModelPart20Test020
    // @tc.desc Verify downloadFilesData queue with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2100
    // @tc.name downloadModelPart20Test021
    // @tc.desc Verify downloadFilesData history with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2200
    // @tc.name downloadModelPart20Test022
    // @tc.desc Verify downloadFilesData default with URL class 3 and timestamp 2147483648
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 2147483648);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2300
    // @tc.name downloadModelPart20Test023
    // @tc.desc Verify downloadFilesData copy with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2400
    // @tc.name downloadModelPart20Test024
    // @tc.desc Verify downloadFilesData status with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2500
    // @tc.name downloadModelPart20Test025
    // @tc.desc Verify downloadFilesData url with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2600
    // @tc.name downloadModelPart20Test026
    // @tc.desc Verify downloadFilesData time with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
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

    // @tc.number SAMPLE_DOWNLOAD_020_2700
    // @tc.name downloadModelPart20Test027
    // @tc.desc Verify downloadFilesData identity with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
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

    // @tc.number SAMPLE_DOWNLOAD_020_2800
    // @tc.name downloadModelPart20Test028
    // @tc.desc Verify downloadFilesData queue with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
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

    // @tc.number SAMPLE_DOWNLOAD_020_2900
    // @tc.name downloadModelPart20Test029
    // @tc.desc Verify downloadFilesData history with URL class 3 and timestamp 4102444800000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart20Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/a%20b.zip', 0, 4102444800000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/a%20b.zip';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 4102444800000;
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
  });
}
