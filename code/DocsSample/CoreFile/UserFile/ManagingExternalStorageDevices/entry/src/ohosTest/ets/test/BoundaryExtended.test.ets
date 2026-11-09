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

export default function managingExternalStorageExtendedBoundaryTest(): void {
  describe('ManagingExternalStorageExtendedBoundaryTest', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0001
     * @tc.name      testManagingExternalStorageExtendedBoundary0001
     * @tc.desc      Verify subscribing 26 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0001 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 26 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0001 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0002
     * @tc.name      testManagingExternalStorageExtendedBoundary0002
     * @tc.desc      Verify subscribing 27 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0002 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 27 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0002 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0003
     * @tc.name      testManagingExternalStorageExtendedBoundary0003
     * @tc.desc      Verify subscribing 28 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0003 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 28 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0003 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0004
     * @tc.name      testManagingExternalStorageExtendedBoundary0004
     * @tc.desc      Verify subscribing 29 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0004 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 29 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0004 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0005
     * @tc.name      testManagingExternalStorageExtendedBoundary0005
     * @tc.desc      Verify subscribing 30 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0005 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 30 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0005 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0006
     * @tc.name      testManagingExternalStorageExtendedBoundary0006
     * @tc.desc      Verify subscribing 31 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0006 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 31 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0006 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0007
     * @tc.name      testManagingExternalStorageExtendedBoundary0007
     * @tc.desc      Verify subscribing 32 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0007 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 32 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0007 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0008
     * @tc.name      testManagingExternalStorageExtendedBoundary0008
     * @tc.desc      Verify subscribing 33 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0008 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 33 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0008 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0009
     * @tc.name      testManagingExternalStorageExtendedBoundary0009
     * @tc.desc      Verify subscribing 34 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0009 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 34 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0009 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0010
     * @tc.name      testManagingExternalStorageExtendedBoundary0010
     * @tc.desc      Verify subscribing 35 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0010 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 35 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0010 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0011
     * @tc.name      testManagingExternalStorageExtendedBoundary0011
     * @tc.desc      Verify subscribing 36 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0011 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 36 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0011 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0012
     * @tc.name      testManagingExternalStorageExtendedBoundary0012
     * @tc.desc      Verify subscribing 37 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0012 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 37 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0012 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0013
     * @tc.name      testManagingExternalStorageExtendedBoundary0013
     * @tc.desc      Verify subscribing 38 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0013 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 38 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0013 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0014
     * @tc.name      testManagingExternalStorageExtendedBoundary0014
     * @tc.desc      Verify subscribing 39 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0014 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 39 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0014 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0015
     * @tc.name      testManagingExternalStorageExtendedBoundary0015
     * @tc.desc      Verify subscribing 40 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0015 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 40 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0015 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0016
     * @tc.name      testManagingExternalStorageExtendedBoundary0016
     * @tc.desc      Verify subscribing 41 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0016 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 41 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0016 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0017
     * @tc.name      testManagingExternalStorageExtendedBoundary0017
     * @tc.desc      Verify subscribing 42 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0017 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 42 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0017 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0018
     * @tc.name      testManagingExternalStorageExtendedBoundary0018
     * @tc.desc      Verify subscribing 43 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0018 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 43 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0018 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0019
     * @tc.name      testManagingExternalStorageExtendedBoundary0019
     * @tc.desc      Verify subscribing 44 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0019 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 44 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0019 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0020
     * @tc.name      testManagingExternalStorageExtendedBoundary0020
     * @tc.desc      Verify subscribing 45 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0020 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 45 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0020 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0021
     * @tc.name      testManagingExternalStorageExtendedBoundary0021
     * @tc.desc      Verify subscribing 46 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0021 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 46 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0021 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0022
     * @tc.name      testManagingExternalStorageExtendedBoundary0022
     * @tc.desc      Verify subscribing 47 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0022 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 47 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0022 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0023
     * @tc.name      testManagingExternalStorageExtendedBoundary0023
     * @tc.desc      Verify subscribing 48 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0023 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 48 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0023 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0024
     * @tc.name      testManagingExternalStorageExtendedBoundary0024
     * @tc.desc      Verify subscribing 49 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0024 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 49 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0024 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0025
     * @tc.name      testManagingExternalStorageExtendedBoundary0025
     * @tc.desc      Verify subscribing 50 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0025 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 50 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0025 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0026
     * @tc.name      testManagingExternalStorageExtendedBoundary0026
     * @tc.desc      Verify receiving 26 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0026 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 26 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0026 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0027
     * @tc.name      testManagingExternalStorageExtendedBoundary0027
     * @tc.desc      Verify receiving 27 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0027 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 27 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0027 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0028
     * @tc.name      testManagingExternalStorageExtendedBoundary0028
     * @tc.desc      Verify receiving 28 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0028 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 28 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0028 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0029
     * @tc.name      testManagingExternalStorageExtendedBoundary0029
     * @tc.desc      Verify receiving 29 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0029 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 29 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0029 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY2_0030
     * @tc.name      testManagingExternalStorageExtendedBoundary0030
     * @tc.desc      Verify receiving 30 times.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageExtendedBoundary0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0030 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 30 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageExtendedBoundary0030 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
