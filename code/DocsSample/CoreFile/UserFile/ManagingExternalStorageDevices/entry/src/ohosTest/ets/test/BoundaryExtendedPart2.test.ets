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

import { describe, expect, it, Level, Size, TestType, beforeAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DOMAIN, TAG, launchEntry, click, readStatus } from './BehaviorRuntime';

export default function managingExternalStorageExtendedBoundaryTestPart2(): void {
  describe('ManagingExternalStorageExtendedBoundaryTestPart2', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0031
     * @tc.name      testManagingExternalStorageExtendedBoundary0031
     * @tc.desc      Verify receiving 31 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0031 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 31 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0031 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0032
     * @tc.name      testManagingExternalStorageExtendedBoundary0032
     * @tc.desc      Verify receiving 32 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0032 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 32 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0032 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0033
     * @tc.name      testManagingExternalStorageExtendedBoundary0033
     * @tc.desc      Verify receiving 33 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0033 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 33 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0033 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0034
     * @tc.name      testManagingExternalStorageExtendedBoundary0034
     * @tc.desc      Verify receiving 34 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0034 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 34 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0034 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0035
     * @tc.name      testManagingExternalStorageExtendedBoundary0035
     * @tc.desc      Verify receiving 35 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0035 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 35 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0035 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0036
     * @tc.name      testManagingExternalStorageExtendedBoundary0036
     * @tc.desc      Verify receiving 36 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0036 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 36 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0036 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
