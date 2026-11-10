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

export default function managingExternalStorageBoundaryTestPart2(): void {
  describe('ManagingExternalStorageBoundaryTestPart2', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0028
     * @tc.name      testManagingExternalStorageBoundary0028
     * @tc.desc      Verify receiving 3 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0028 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 3 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0028 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0029
     * @tc.name      testManagingExternalStorageBoundary0029
     * @tc.desc      Verify receiving 4 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0029 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 4 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0029 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0030
     * @tc.name      testManagingExternalStorageBoundary0030
     * @tc.desc      Verify receiving 5 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0030 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 5 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0030 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0031
     * @tc.name      testManagingExternalStorageBoundary0031
     * @tc.desc      Verify receiving 6 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0031 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 6 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0031 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0032
     * @tc.name      testManagingExternalStorageBoundary0032
     * @tc.desc      Verify receiving 7 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0032 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 7 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0032 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0033
     * @tc.name      testManagingExternalStorageBoundary0033
     * @tc.desc      Verify receiving 8 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0033 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 8 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0033 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0034
     * @tc.name      testManagingExternalStorageBoundary0034
     * @tc.desc      Verify receiving 9 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0034 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 9 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0034 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0035
     * @tc.name      testManagingExternalStorageBoundary0035
     * @tc.desc      Verify receiving 10 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0035 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 10 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0035 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0036
     * @tc.name      testManagingExternalStorageBoundary0036
     * @tc.desc      Verify receiving 11 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0036 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 11 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0036 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0037
     * @tc.name      testManagingExternalStorageBoundary0037
     * @tc.desc      Verify receiving 12 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0037 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 12 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0037 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0038
     * @tc.name      testManagingExternalStorageBoundary0038
     * @tc.desc      Verify receiving 13 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0038 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 13 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0038 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0039
     * @tc.name      testManagingExternalStorageBoundary0039
     * @tc.desc      Verify receiving 14 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0039 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 14 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0039 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0040
     * @tc.name      testManagingExternalStorageBoundary0040
     * @tc.desc      Verify receiving 15 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0040 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 15 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0040 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0041
     * @tc.name      testManagingExternalStorageBoundary0041
     * @tc.desc      Verify receiving 16 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0041 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 16 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0041 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0042
     * @tc.name      testManagingExternalStorageBoundary0042
     * @tc.desc      Verify receiving 17 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0042 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 17 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0042 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0043
     * @tc.name      testManagingExternalStorageBoundary0043
     * @tc.desc      Verify receiving 18 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0043 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 18 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0043 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0044
     * @tc.name      testManagingExternalStorageBoundary0044
     * @tc.desc      Verify receiving 19 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0044 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 19 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0044 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0045
     * @tc.name      testManagingExternalStorageBoundary0045
     * @tc.desc      Verify receiving 20 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0045 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 20 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0045 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0046
     * @tc.name      testManagingExternalStorageBoundary0046
     * @tc.desc      Verify receiving 21 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0046 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 21 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0046 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0047
     * @tc.name      testManagingExternalStorageBoundary0047
     * @tc.desc      Verify receiving 22 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0047 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 22 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0047 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0048
     * @tc.name      testManagingExternalStorageBoundary0048
     * @tc.desc      Verify receiving 23 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0048 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 23 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0048 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0049
     * @tc.name      testManagingExternalStorageBoundary0049
     * @tc.desc      Verify receiving 24 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0049 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 24 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0049 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0050
     * @tc.name      testManagingExternalStorageBoundary0050
     * @tc.desc      Verify receiving 25 times keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0050 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive repeat 25 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0050 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0051
     * @tc.name      testManagingExternalStorageBoundary0051
     * @tc.desc      Verify receive/subscribe cycle 1 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0051 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 1 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0051 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0052
     * @tc.name      testManagingExternalStorageBoundary0052
     * @tc.desc      Verify receive/subscribe cycle 2 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0052 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 2 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0052 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0053
     * @tc.name      testManagingExternalStorageBoundary0053
     * @tc.desc      Verify receive/subscribe cycle 3 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0053 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 3 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0053 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0054
     * @tc.name      testManagingExternalStorageBoundary0054
     * @tc.desc      Verify receive/subscribe cycle 4 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0054 begin');
          await launchEntry();
          await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
await click('receiveButton');
await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 4 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0054 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0055
     * @tc.name      testManagingExternalStorageBoundary0055
     * @tc.desc      Verify receive/subscribe cycle 5 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0055 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 5 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0055 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0056
     * @tc.name      testManagingExternalStorageBoundary0056
     * @tc.desc      Verify receive/subscribe cycle 6 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0056 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 6 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0056 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0057
     * @tc.name      testManagingExternalStorageBoundary0057
     * @tc.desc      Verify receive/subscribe cycle 7 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0057 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 7 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0057 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0058
     * @tc.name      testManagingExternalStorageBoundary0058
     * @tc.desc      Verify receive/subscribe cycle 8 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0058 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 8 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0058 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0059
     * @tc.name      testManagingExternalStorageBoundary0059
     * @tc.desc      Verify receive/subscribe cycle 9 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0059 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 9 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0059 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0060
     * @tc.name      testManagingExternalStorageBoundary0060
     * @tc.desc      Verify receive/subscribe cycle 10 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0060 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 10 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0060 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0061
     * @tc.name      testManagingExternalStorageBoundary0061
     * @tc.desc      Verify receive/subscribe cycle 11 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0061 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 11 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0061 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0062
     * @tc.name      testManagingExternalStorageBoundary0062
     * @tc.desc      Verify receive/subscribe cycle 12 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0062 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 12 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0062 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0063
     * @tc.name      testManagingExternalStorageBoundary0063
     * @tc.desc      Verify receive/subscribe cycle 13 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0063 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 13 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0063 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0064
     * @tc.name      testManagingExternalStorageBoundary0064
     * @tc.desc      Verify receive/subscribe cycle 14 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0064 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 14 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0064 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0065
     * @tc.name      testManagingExternalStorageBoundary0065
     * @tc.desc      Verify receive/subscribe cycle 15 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0065 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 15 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0065 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0066
     * @tc.name      testManagingExternalStorageBoundary0066
     * @tc.desc      Verify receive/subscribe cycle 16 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0066 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 16 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0066 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0067
     * @tc.name      testManagingExternalStorageBoundary0067
     * @tc.desc      Verify receive/subscribe cycle 17 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0067 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 17 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0067 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BOUNDARY_0068
     * @tc.name      testManagingExternalStorageBoundary0068
     * @tc.desc      Verify receive/subscribe cycle 18 ends in the success state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBoundary0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0068 begin');
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
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle 18 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBoundary0068 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
