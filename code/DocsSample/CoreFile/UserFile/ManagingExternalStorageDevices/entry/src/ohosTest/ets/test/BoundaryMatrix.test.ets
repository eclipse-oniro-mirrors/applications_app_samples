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

export default function managingExternalStorageBoundaryTest(): void {
  describe('ManagingExternalStorageBoundaryTest', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0001
     * @tc.name      testManagingExternalStorageBoundary0001
     * @tc.desc      Verify subscribing 1 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0001 begin');
          await launchEntry();
          await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 1 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0001 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0002
     * @tc.name      testManagingExternalStorageBoundary0002
     * @tc.desc      Verify subscribing 2 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0002 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 2 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0002 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0003
     * @tc.name      testManagingExternalStorageBoundary0003
     * @tc.desc      Verify subscribing 3 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0003 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 3 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0003 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0004
     * @tc.name      testManagingExternalStorageBoundary0004
     * @tc.desc      Verify subscribing 4 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0004 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 4 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0004 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0005
     * @tc.name      testManagingExternalStorageBoundary0005
     * @tc.desc      Verify subscribing 5 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0005 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 5 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0005 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0006
     * @tc.name      testManagingExternalStorageBoundary0006
     * @tc.desc      Verify subscribing 6 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0006 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 6 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0006 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0007
     * @tc.name      testManagingExternalStorageBoundary0007
     * @tc.desc      Verify subscribing 7 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0007 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 7 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0007 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0008
     * @tc.name      testManagingExternalStorageBoundary0008
     * @tc.desc      Verify subscribing 8 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0008 begin');
          await launchEntry();
          await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 8 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0008 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0009
     * @tc.name      testManagingExternalStorageBoundary0009
     * @tc.desc      Verify subscribing 9 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0009 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 9 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0009 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0010
     * @tc.name      testManagingExternalStorageBoundary0010
     * @tc.desc      Verify subscribing 10 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0010 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 10 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0010 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0011
     * @tc.name      testManagingExternalStorageBoundary0011
     * @tc.desc      Verify subscribing 11 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0011 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 11 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0011 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0012
     * @tc.name      testManagingExternalStorageBoundary0012
     * @tc.desc      Verify subscribing 12 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0012 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 12 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0012 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0013
     * @tc.name      testManagingExternalStorageBoundary0013
     * @tc.desc      Verify subscribing 13 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0013 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 13 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0013 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0014
     * @tc.name      testManagingExternalStorageBoundary0014
     * @tc.desc      Verify subscribing 14 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0014 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 14 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0014 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0015
     * @tc.name      testManagingExternalStorageBoundary0015
     * @tc.desc      Verify subscribing 15 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0015 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 15 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0015 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0016
     * @tc.name      testManagingExternalStorageBoundary0016
     * @tc.desc      Verify subscribing 16 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0016 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 16 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0016 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0017
     * @tc.name      testManagingExternalStorageBoundary0017
     * @tc.desc      Verify subscribing 17 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0017 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 17 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0017 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0018
     * @tc.name      testManagingExternalStorageBoundary0018
     * @tc.desc      Verify subscribing 18 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0018 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 18 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0018 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0019
     * @tc.name      testManagingExternalStorageBoundary0019
     * @tc.desc      Verify subscribing 19 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0019 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 19 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0019 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0020
     * @tc.name      testManagingExternalStorageBoundary0020
     * @tc.desc      Verify subscribing 20 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0020 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 20 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0020 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0021
     * @tc.name      testManagingExternalStorageBoundary0021
     * @tc.desc      Verify subscribing 21 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0021 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 21 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0021 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0022
     * @tc.name      testManagingExternalStorageBoundary0022
     * @tc.desc      Verify subscribing 22 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0022 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 22 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0022 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0023
     * @tc.name      testManagingExternalStorageBoundary0023
     * @tc.desc      Verify subscribing 23 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0023 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 23 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0023 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0024
     * @tc.name      testManagingExternalStorageBoundary0024
     * @tc.desc      Verify subscribing 24 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0024 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 24 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0024 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0025
     * @tc.name      testManagingExternalStorageBoundary0025
     * @tc.desc      Verify subscribing 25 times keeps the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0025 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe repeat 25 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0025 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0026
     * @tc.name      testManagingExternalStorageBoundary0026
     * @tc.desc      Verify receiving 1 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0026 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 1 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0026 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0027
     * @tc.name      testManagingExternalStorageBoundary0027
     * @tc.desc      Verify receiving 2 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0027 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 2 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0027 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
