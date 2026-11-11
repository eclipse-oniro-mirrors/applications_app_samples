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
import { DOMAIN, TAG, launchEntry, click, clickSequence, readStatus } from './BehaviorRuntime';

export default function managingExternalStorageSequence10Test(): void {
  describe('ManagingExternalStorageSequence10Test', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0001
     * @tc.name      testManagingExternalStorageSequence10_0001
     * @tc.desc      Verify ten-step action sequence RRRRRRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0001 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0001 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0002
     * @tc.name      testManagingExternalStorageSequence10_0002
     * @tc.desc      Verify ten-step action sequence RRRRRRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0002 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0002 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0003
     * @tc.name      testManagingExternalStorageSequence10_0003
     * @tc.desc      Verify ten-step action sequence RRRRRRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0003 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0003 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0004
     * @tc.name      testManagingExternalStorageSequence10_0004
     * @tc.desc      Verify ten-step action sequence RRRRRRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0004 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0004 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0005
     * @tc.name      testManagingExternalStorageSequence10_0005
     * @tc.desc      Verify ten-step action sequence RRRRRRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0005 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0005 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0006
     * @tc.name      testManagingExternalStorageSequence10_0006
     * @tc.desc      Verify ten-step action sequence RRRRRRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0006 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0006 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0007
     * @tc.name      testManagingExternalStorageSequence10_0007
     * @tc.desc      Verify ten-step action sequence RRRRRRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0007 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0007 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0008
     * @tc.name      testManagingExternalStorageSequence10_0008
     * @tc.desc      Verify ten-step action sequence RRRRRRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0008 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0008 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0009
     * @tc.name      testManagingExternalStorageSequence10_0009
     * @tc.desc      Verify ten-step action sequence RRRRRRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0009 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0009 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0010
     * @tc.name      testManagingExternalStorageSequence10_0010
     * @tc.desc      Verify ten-step action sequence RRRRRRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0010 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0010 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0011
     * @tc.name      testManagingExternalStorageSequence10_0011
     * @tc.desc      Verify ten-step action sequence RRRRRRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0011 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0011 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0012
     * @tc.name      testManagingExternalStorageSequence10_0012
     * @tc.desc      Verify ten-step action sequence RRRRRRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0012 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0012 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0013
     * @tc.name      testManagingExternalStorageSequence10_0013
     * @tc.desc      Verify ten-step action sequence RRRRRRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0013 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0013 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0014
     * @tc.name      testManagingExternalStorageSequence10_0014
     * @tc.desc      Verify ten-step action sequence RRRRRRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0014 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0014 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0015
     * @tc.name      testManagingExternalStorageSequence10_0015
     * @tc.desc      Verify ten-step action sequence RRRRRRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0015 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0015 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0016
     * @tc.name      testManagingExternalStorageSequence10_0016
     * @tc.desc      Verify ten-step action sequence RRRRRRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0016 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0016 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0017
     * @tc.name      testManagingExternalStorageSequence10_0017
     * @tc.desc      Verify ten-step action sequence RRRRRSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0017 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0017 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0018
     * @tc.name      testManagingExternalStorageSequence10_0018
     * @tc.desc      Verify ten-step action sequence RRRRRSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0018 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0018 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0019
     * @tc.name      testManagingExternalStorageSequence10_0019
     * @tc.desc      Verify ten-step action sequence RRRRRSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0019 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0019 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0020
     * @tc.name      testManagingExternalStorageSequence10_0020
     * @tc.desc      Verify ten-step action sequence RRRRRSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0020 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0020 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0021
     * @tc.name      testManagingExternalStorageSequence10_0021
     * @tc.desc      Verify ten-step action sequence RRRRRSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0021 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0021 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0022
     * @tc.name      testManagingExternalStorageSequence10_0022
     * @tc.desc      Verify ten-step action sequence RRRRRSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0022 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0022 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0023
     * @tc.name      testManagingExternalStorageSequence10_0023
     * @tc.desc      Verify ten-step action sequence RRRRRSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0023 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0023 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0024
     * @tc.name      testManagingExternalStorageSequence10_0024
     * @tc.desc      Verify ten-step action sequence RRRRRSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0024 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0024 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0025
     * @tc.name      testManagingExternalStorageSequence10_0025
     * @tc.desc      Verify ten-step action sequence RRRRRSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0025 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0025 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0026
     * @tc.name      testManagingExternalStorageSequence10_0026
     * @tc.desc      Verify ten-step action sequence RRRRRSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0026 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0026 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0027
     * @tc.name      testManagingExternalStorageSequence10_0027
     * @tc.desc      Verify ten-step action sequence RRRRRSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0027 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0027 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0028
     * @tc.name      testManagingExternalStorageSequence10_0028
     * @tc.desc      Verify ten-step action sequence RRRRRSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0028 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0028 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0029
     * @tc.name      testManagingExternalStorageSequence10_0029
     * @tc.desc      Verify ten-step action sequence RRRRRSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0029 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0029 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0030
     * @tc.name      testManagingExternalStorageSequence10_0030
     * @tc.desc      Verify ten-step action sequence RRRRRSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0030 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0030 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0031
     * @tc.name      testManagingExternalStorageSequence10_0031
     * @tc.desc      Verify ten-step action sequence RRRRRSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0031 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0031 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0032
     * @tc.name      testManagingExternalStorageSequence10_0032
     * @tc.desc      Verify ten-step action sequence RRRRRSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0032 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRRSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0032 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0033
     * @tc.name      testManagingExternalStorageSequence10_0033
     * @tc.desc      Verify ten-step action sequence RRRRSRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0033 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0033 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0034
     * @tc.name      testManagingExternalStorageSequence10_0034
     * @tc.desc      Verify ten-step action sequence RRRRSRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0034 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0034 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0035
     * @tc.name      testManagingExternalStorageSequence10_0035
     * @tc.desc      Verify ten-step action sequence RRRRSRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0035 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0035 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0036
     * @tc.name      testManagingExternalStorageSequence10_0036
     * @tc.desc      Verify ten-step action sequence RRRRSRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0036 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0036 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0037
     * @tc.name      testManagingExternalStorageSequence10_0037
     * @tc.desc      Verify ten-step action sequence RRRRSRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0037 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0037 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0038
     * @tc.name      testManagingExternalStorageSequence10_0038
     * @tc.desc      Verify ten-step action sequence RRRRSRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0038 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0038 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0039
     * @tc.name      testManagingExternalStorageSequence10_0039
     * @tc.desc      Verify ten-step action sequence RRRRSRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0039 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0039 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0040
     * @tc.name      testManagingExternalStorageSequence10_0040
     * @tc.desc      Verify ten-step action sequence RRRRSRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0040 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0040 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0041
     * @tc.name      testManagingExternalStorageSequence10_0041
     * @tc.desc      Verify ten-step action sequence RRRRSRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0041 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0041 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0042
     * @tc.name      testManagingExternalStorageSequence10_0042
     * @tc.desc      Verify ten-step action sequence RRRRSRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0042 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0042 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0043
     * @tc.name      testManagingExternalStorageSequence10_0043
     * @tc.desc      Verify ten-step action sequence RRRRSRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0043 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0043 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0044
     * @tc.name      testManagingExternalStorageSequence10_0044
     * @tc.desc      Verify ten-step action sequence RRRRSRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0044 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0044 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0045
     * @tc.name      testManagingExternalStorageSequence10_0045
     * @tc.desc      Verify ten-step action sequence RRRRSRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0045 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0045 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0046
     * @tc.name      testManagingExternalStorageSequence10_0046
     * @tc.desc      Verify ten-step action sequence RRRRSRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0046 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0046 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0047
     * @tc.name      testManagingExternalStorageSequence10_0047
     * @tc.desc      Verify ten-step action sequence RRRRSRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0047 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0047 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0048
     * @tc.name      testManagingExternalStorageSequence10_0048
     * @tc.desc      Verify ten-step action sequence RRRRSRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0048 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0048 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0049
     * @tc.name      testManagingExternalStorageSequence10_0049
     * @tc.desc      Verify ten-step action sequence RRRRSSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0049 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0049 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0050
     * @tc.name      testManagingExternalStorageSequence10_0050
     * @tc.desc      Verify ten-step action sequence RRRRSSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0050 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0050 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0051
     * @tc.name      testManagingExternalStorageSequence10_0051
     * @tc.desc      Verify ten-step action sequence RRRRSSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0051 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0051 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0052
     * @tc.name      testManagingExternalStorageSequence10_0052
     * @tc.desc      Verify ten-step action sequence RRRRSSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0052 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0052 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0053
     * @tc.name      testManagingExternalStorageSequence10_0053
     * @tc.desc      Verify ten-step action sequence RRRRSSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0053 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0053 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0054
     * @tc.name      testManagingExternalStorageSequence10_0054
     * @tc.desc      Verify ten-step action sequence RRRRSSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0054 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0054 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0055
     * @tc.name      testManagingExternalStorageSequence10_0055
     * @tc.desc      Verify ten-step action sequence RRRRSSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0055 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0055 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0056
     * @tc.name      testManagingExternalStorageSequence10_0056
     * @tc.desc      Verify ten-step action sequence RRRRSSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0056 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0056 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0057
     * @tc.name      testManagingExternalStorageSequence10_0057
     * @tc.desc      Verify ten-step action sequence RRRRSSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0057 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0057 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0058
     * @tc.name      testManagingExternalStorageSequence10_0058
     * @tc.desc      Verify ten-step action sequence RRRRSSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0058 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0058 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0059
     * @tc.name      testManagingExternalStorageSequence10_0059
     * @tc.desc      Verify ten-step action sequence RRRRSSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0059 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0059 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0060
     * @tc.name      testManagingExternalStorageSequence10_0060
     * @tc.desc      Verify ten-step action sequence RRRRSSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0060 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0060 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0061
     * @tc.name      testManagingExternalStorageSequence10_0061
     * @tc.desc      Verify ten-step action sequence RRRRSSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0061 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0061 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0062
     * @tc.name      testManagingExternalStorageSequence10_0062
     * @tc.desc      Verify ten-step action sequence RRRRSSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0062 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0062 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0063
     * @tc.name      testManagingExternalStorageSequence10_0063
     * @tc.desc      Verify ten-step action sequence RRRRSSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0063 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0063 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0064
     * @tc.name      testManagingExternalStorageSequence10_0064
     * @tc.desc      Verify ten-step action sequence RRRRSSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0064 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRRSSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0064 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0065
     * @tc.name      testManagingExternalStorageSequence10_0065
     * @tc.desc      Verify ten-step action sequence RRRSRRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0065 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0065 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0066
     * @tc.name      testManagingExternalStorageSequence10_0066
     * @tc.desc      Verify ten-step action sequence RRRSRRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0066 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0066 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0067
     * @tc.name      testManagingExternalStorageSequence10_0067
     * @tc.desc      Verify ten-step action sequence RRRSRRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0067 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0067 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0068
     * @tc.name      testManagingExternalStorageSequence10_0068
     * @tc.desc      Verify ten-step action sequence RRRSRRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0068 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0068 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
