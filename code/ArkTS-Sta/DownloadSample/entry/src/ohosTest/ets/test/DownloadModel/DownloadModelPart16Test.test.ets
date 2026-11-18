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

export default function downloadModelPart16Test(): void {
  describe('DownloadModelPart16Test', (): void => {
    beforeAll((): void => {
      logSuite('DownloadModelPart16Test', 'started');
    });
    beforeEach((): void => {
      logSuite('DownloadModelPart16Test', 'model fixture isolated');
    });
    afterEach(async (): Promise<void> => {
      await finishCase();
    });
    afterAll((): void => {
      logSuite('DownloadModelPart16Test', 'finished');
    });

    // @tc.number SAMPLE_DOWNLOAD_016_0100
    // @tc.name downloadModelPart16Test001
    // @tc.desc Verify downloadFilesData copy with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0200
    // @tc.name downloadModelPart16Test002
    // @tc.desc Verify downloadFilesData status with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0300
    // @tc.name downloadModelPart16Test003
    // @tc.desc Verify downloadFilesData url with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0400
    // @tc.name downloadModelPart16Test004
    // @tc.desc Verify downloadFilesData time with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0500
    // @tc.name downloadModelPart16Test005
    // @tc.desc Verify downloadFilesData identity with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0600
    // @tc.name downloadModelPart16Test006
    // @tc.desc Verify downloadFilesData queue with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0700
    // @tc.name downloadModelPart16Test007
    // @tc.desc Verify downloadFilesData history with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0800
    // @tc.name downloadModelPart16Test008
    // @tc.desc Verify downloadFilesData default with URL class 2 and timestamp 1000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 1000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_0900
    // @tc.name downloadModelPart16Test009
    // @tc.desc Verify downloadFilesData copy with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1000
    // @tc.name downloadModelPart16Test010
    // @tc.desc Verify downloadFilesData status with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1100
    // @tc.name downloadModelPart16Test011
    // @tc.desc Verify downloadFilesData url with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1200
    // @tc.name downloadModelPart16Test012
    // @tc.desc Verify downloadFilesData time with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1300
    // @tc.name downloadModelPart16Test013
    // @tc.desc Verify downloadFilesData identity with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1400
    // @tc.name downloadModelPart16Test014
    // @tc.desc Verify downloadFilesData queue with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1500
    // @tc.name downloadModelPart16Test015
    // @tc.desc Verify downloadFilesData history with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1600
    // @tc.name downloadModelPart16Test016
    // @tc.desc Verify downloadFilesData default with URL class 2 and timestamp 86399999
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86399999);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86399999;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1700
    // @tc.name downloadModelPart16Test017
    // @tc.desc Verify downloadFilesData copy with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1800
    // @tc.name downloadModelPart16Test018
    // @tc.desc Verify downloadFilesData status with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_1900
    // @tc.name downloadModelPart16Test019
    // @tc.desc Verify downloadFilesData url with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_2000
    // @tc.name downloadModelPart16Test020
    // @tc.desc Verify downloadFilesData time with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_2100
    // @tc.name downloadModelPart16Test021
    // @tc.desc Verify downloadFilesData identity with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_2200
    // @tc.name downloadModelPart16Test022
    // @tc.desc Verify downloadFilesData queue with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_2300
    // @tc.name downloadModelPart16Test023
    // @tc.desc Verify downloadFilesData history with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_2400
    // @tc.name downloadModelPart16Test024
    // @tc.desc Verify downloadFilesData default with URL class 2 and timestamp 86400000
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 86400000);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
      expect(originalUrl).assertEqual(expectedUrl);
      const initialStatus: number = first.fileStatus;
      const expectedStatus: number = 0;
      expect(initialStatus).assertEqual(expectedStatus);
      const initialTime: number = first.downloadTime;
      const expectedTime: number = 86400000;
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

    // @tc.number SAMPLE_DOWNLOAD_016_2500
    // @tc.name downloadModelPart16Test025
    // @tc.desc Verify downloadFilesData copy with URL class 2 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
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

    // @tc.number SAMPLE_DOWNLOAD_016_2600
    // @tc.name downloadModelPart16Test026
    // @tc.desc Verify downloadFilesData status with URL class 2 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
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

    // @tc.number SAMPLE_DOWNLOAD_016_2700
    // @tc.name downloadModelPart16Test027
    // @tc.desc Verify downloadFilesData url with URL class 2 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
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

    // @tc.number SAMPLE_DOWNLOAD_016_2800
    // @tc.name downloadModelPart16Test028
    // @tc.desc Verify downloadFilesData time with URL class 2 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
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

    // @tc.number SAMPLE_DOWNLOAD_016_2900
    // @tc.name downloadModelPart16Test029
    // @tc.desc Verify downloadFilesData identity with URL class 2 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
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

    // @tc.number SAMPLE_DOWNLOAD_016_3000
    // @tc.name downloadModelPart16Test030
    // @tc.desc Verify downloadFilesData queue with URL class 2 and timestamp 1728529510880
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('downloadModelPart16Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const first: downloadFilesData = new downloadFilesData('https://example.test/', 0, 1728529510880);
      const originalId: string = first.id;
      const originalUrl: string = first.url;
      const expectedUrl: string = 'https://example.test/';
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
  });
}
