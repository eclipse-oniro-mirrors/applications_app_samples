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

export default function managingExternalStorageExtendedBoundaryTestPart3(): void {
  describe('ManagingExternalStorageExtendedBoundaryTestPart3', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0049
     * @tc.name      testManagingExternalStorageExtendedBoundary0049
     * @tc.desc      Verify receiving 49 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0049 begin');
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
          hilog.info(DOMAIN, TAG, 'receive repeat 49 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0049 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0050
     * @tc.name      testManagingExternalStorageExtendedBoundary0050
     * @tc.desc      Verify receiving 50 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0050 begin');
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
          hilog.info(DOMAIN, TAG, 'receive repeat 50 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0050 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0051
     * @tc.name      testManagingExternalStorageExtendedBoundary0051
     * @tc.desc      Verify receive/subscribe cycle 21.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0051 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 21 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0051 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0052
     * @tc.name      testManagingExternalStorageExtendedBoundary0052
     * @tc.desc      Verify receive/subscribe cycle 22.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0052 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 22 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0052 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0053
     * @tc.name      testManagingExternalStorageExtendedBoundary0053
     * @tc.desc      Verify receive/subscribe cycle 23.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0053 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 23 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0053 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0054
     * @tc.name      testManagingExternalStorageExtendedBoundary0054
     * @tc.desc      Verify receive/subscribe cycle 24.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0054 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 24 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0054 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0055
     * @tc.name      testManagingExternalStorageExtendedBoundary0055
     * @tc.desc      Verify receive/subscribe cycle 25.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0055 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 25 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0055 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0056
     * @tc.name      testManagingExternalStorageExtendedBoundary0056
     * @tc.desc      Verify receive/subscribe cycle 26.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0056 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 26 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0056 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0057
     * @tc.name      testManagingExternalStorageExtendedBoundary0057
     * @tc.desc      Verify receive/subscribe cycle 27.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0057 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 27 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0057 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0058
     * @tc.name      testManagingExternalStorageExtendedBoundary0058
     * @tc.desc      Verify receive/subscribe cycle 28.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0058 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 28 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0058 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0059
     * @tc.name      testManagingExternalStorageExtendedBoundary0059
     * @tc.desc      Verify receive/subscribe cycle 29.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0059 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 29 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0059 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0060
     * @tc.name      testManagingExternalStorageExtendedBoundary0060
     * @tc.desc      Verify receive/subscribe cycle 30.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0060 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 30 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0060 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0061
     * @tc.name      testManagingExternalStorageExtendedBoundary0061
     * @tc.desc      Verify receive/subscribe cycle 31.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0061 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 31 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0061 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0062
     * @tc.name      testManagingExternalStorageExtendedBoundary0062
     * @tc.desc      Verify receive/subscribe cycle 32.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0062 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 32 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0062 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0063
     * @tc.name      testManagingExternalStorageExtendedBoundary0063
     * @tc.desc      Verify receive/subscribe cycle 33.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0063 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 33 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0063 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0064
     * @tc.name      testManagingExternalStorageExtendedBoundary0064
     * @tc.desc      Verify receive/subscribe cycle 34.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0064 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 34 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0064 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0065
     * @tc.name      testManagingExternalStorageExtendedBoundary0065
     * @tc.desc      Verify receive/subscribe cycle 35.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0065 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 35 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0065 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0066
     * @tc.name      testManagingExternalStorageExtendedBoundary0066
     * @tc.desc      Verify receive/subscribe cycle 36.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0066 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 36 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0066 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0067
     * @tc.name      testManagingExternalStorageExtendedBoundary0067
     * @tc.desc      Verify receive/subscribe cycle 37.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0067 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 37 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0067 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0068
     * @tc.name      testManagingExternalStorageExtendedBoundary0068
     * @tc.desc      Verify receive/subscribe cycle 38.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0068 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 38 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0068 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0069
     * @tc.name      testManagingExternalStorageExtendedBoundary0069
     * @tc.desc      Verify receive/subscribe cycle 39.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0069 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 39 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0069 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0070
     * @tc.name      testManagingExternalStorageExtendedBoundary0070
     * @tc.desc      Verify receive/subscribe cycle 40.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0070 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 40 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0070 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
