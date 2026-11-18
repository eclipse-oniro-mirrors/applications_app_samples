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

export default function managingExternalStorageSequence7Test(): void {
  describe('ManagingExternalStorageSequence7Test', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0001
     * @tc.name      testManagingExternalStorageSequence7_0001
     * @tc.desc      Verify seven-step action sequence RRRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0001 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0001 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0002
     * @tc.name      testManagingExternalStorageSequence7_0002
     * @tc.desc      Verify seven-step action sequence RRRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0002 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0002 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0003
     * @tc.name      testManagingExternalStorageSequence7_0003
     * @tc.desc      Verify seven-step action sequence RRRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0003 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0003 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0004
     * @tc.name      testManagingExternalStorageSequence7_0004
     * @tc.desc      Verify seven-step action sequence RRRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0004 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0004 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0005
     * @tc.name      testManagingExternalStorageSequence7_0005
     * @tc.desc      Verify seven-step action sequence RRRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0005 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0005 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0006
     * @tc.name      testManagingExternalStorageSequence7_0006
     * @tc.desc      Verify seven-step action sequence RRRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0006 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0006 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0007
     * @tc.name      testManagingExternalStorageSequence7_0007
     * @tc.desc      Verify seven-step action sequence RRRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0007 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0007 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0008
     * @tc.name      testManagingExternalStorageSequence7_0008
     * @tc.desc      Verify seven-step action sequence RRRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0008 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0008 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0009
     * @tc.name      testManagingExternalStorageSequence7_0009
     * @tc.desc      Verify seven-step action sequence RRRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0009 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0009 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0010
     * @tc.name      testManagingExternalStorageSequence7_0010
     * @tc.desc      Verify seven-step action sequence RRRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0010 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0010 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0011
     * @tc.name      testManagingExternalStorageSequence7_0011
     * @tc.desc      Verify seven-step action sequence RRRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0011 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0011 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0012
     * @tc.name      testManagingExternalStorageSequence7_0012
     * @tc.desc      Verify seven-step action sequence RRRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0012 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0012 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0013
     * @tc.name      testManagingExternalStorageSequence7_0013
     * @tc.desc      Verify seven-step action sequence RRRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0013 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0013 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0014
     * @tc.name      testManagingExternalStorageSequence7_0014
     * @tc.desc      Verify seven-step action sequence RRRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0014 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0014 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0015
     * @tc.name      testManagingExternalStorageSequence7_0015
     * @tc.desc      Verify seven-step action sequence RRRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0015 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0015 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0016
     * @tc.name      testManagingExternalStorageSequence7_0016
     * @tc.desc      Verify seven-step action sequence RRRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0016 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0016 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0017
     * @tc.name      testManagingExternalStorageSequence7_0017
     * @tc.desc      Verify seven-step action sequence RRSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0017 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0017 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0018
     * @tc.name      testManagingExternalStorageSequence7_0018
     * @tc.desc      Verify seven-step action sequence RRSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0018 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0018 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0019
     * @tc.name      testManagingExternalStorageSequence7_0019
     * @tc.desc      Verify seven-step action sequence RRSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0019 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0019 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0020
     * @tc.name      testManagingExternalStorageSequence7_0020
     * @tc.desc      Verify seven-step action sequence RRSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0020 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0020 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0021
     * @tc.name      testManagingExternalStorageSequence7_0021
     * @tc.desc      Verify seven-step action sequence RRSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0021 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0021 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0022
     * @tc.name      testManagingExternalStorageSequence7_0022
     * @tc.desc      Verify seven-step action sequence RRSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0022 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0022 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0023
     * @tc.name      testManagingExternalStorageSequence7_0023
     * @tc.desc      Verify seven-step action sequence RRSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0023 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0023 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0024
     * @tc.name      testManagingExternalStorageSequence7_0024
     * @tc.desc      Verify seven-step action sequence RRSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0024 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0024 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0025
     * @tc.name      testManagingExternalStorageSequence7_0025
     * @tc.desc      Verify seven-step action sequence RRSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0025 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0025 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0026
     * @tc.name      testManagingExternalStorageSequence7_0026
     * @tc.desc      Verify seven-step action sequence RRSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0026 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0026 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0027
     * @tc.name      testManagingExternalStorageSequence7_0027
     * @tc.desc      Verify seven-step action sequence RRSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0027 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0027 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0028
     * @tc.name      testManagingExternalStorageSequence7_0028
     * @tc.desc      Verify seven-step action sequence RRSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0028 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0028 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0029
     * @tc.name      testManagingExternalStorageSequence7_0029
     * @tc.desc      Verify seven-step action sequence RRSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0029 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0029 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0030
     * @tc.name      testManagingExternalStorageSequence7_0030
     * @tc.desc      Verify seven-step action sequence RRSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0030 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0030 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0031
     * @tc.name      testManagingExternalStorageSequence7_0031
     * @tc.desc      Verify seven-step action sequence RRSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0031 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0031 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0032
     * @tc.name      testManagingExternalStorageSequence7_0032
     * @tc.desc      Verify seven-step action sequence RRSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0032 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RRSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0032 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0033
     * @tc.name      testManagingExternalStorageSequence7_0033
     * @tc.desc      Verify seven-step action sequence RSRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0033 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0033 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0034
     * @tc.name      testManagingExternalStorageSequence7_0034
     * @tc.desc      Verify seven-step action sequence RSRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0034 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0034 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0035
     * @tc.name      testManagingExternalStorageSequence7_0035
     * @tc.desc      Verify seven-step action sequence RSRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0035 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0035 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0036
     * @tc.name      testManagingExternalStorageSequence7_0036
     * @tc.desc      Verify seven-step action sequence RSRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0036 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0036 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0037
     * @tc.name      testManagingExternalStorageSequence7_0037
     * @tc.desc      Verify seven-step action sequence RSRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0037 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0037 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0038
     * @tc.name      testManagingExternalStorageSequence7_0038
     * @tc.desc      Verify seven-step action sequence RSRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0038 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0038 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0039
     * @tc.name      testManagingExternalStorageSequence7_0039
     * @tc.desc      Verify seven-step action sequence RSRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0039 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0039 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0040
     * @tc.name      testManagingExternalStorageSequence7_0040
     * @tc.desc      Verify seven-step action sequence RSRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0040 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0040 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0041
     * @tc.name      testManagingExternalStorageSequence7_0041
     * @tc.desc      Verify seven-step action sequence RSRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0041 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0041 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0042
     * @tc.name      testManagingExternalStorageSequence7_0042
     * @tc.desc      Verify seven-step action sequence RSRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0042 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0042 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0043
     * @tc.name      testManagingExternalStorageSequence7_0043
     * @tc.desc      Verify seven-step action sequence RSRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0043 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0043 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0044
     * @tc.name      testManagingExternalStorageSequence7_0044
     * @tc.desc      Verify seven-step action sequence RSRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0044 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0044 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0045
     * @tc.name      testManagingExternalStorageSequence7_0045
     * @tc.desc      Verify seven-step action sequence RSRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0045 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0045 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0046
     * @tc.name      testManagingExternalStorageSequence7_0046
     * @tc.desc      Verify seven-step action sequence RSRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0046 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0046 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0047
     * @tc.name      testManagingExternalStorageSequence7_0047
     * @tc.desc      Verify seven-step action sequence RSRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0047 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0047 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0048
     * @tc.name      testManagingExternalStorageSequence7_0048
     * @tc.desc      Verify seven-step action sequence RSRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0048 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0048 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0049
     * @tc.name      testManagingExternalStorageSequence7_0049
     * @tc.desc      Verify seven-step action sequence RSSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0049 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0049 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0050
     * @tc.name      testManagingExternalStorageSequence7_0050
     * @tc.desc      Verify seven-step action sequence RSSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0050 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0050 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0051
     * @tc.name      testManagingExternalStorageSequence7_0051
     * @tc.desc      Verify seven-step action sequence RSSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0051 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0051 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0052
     * @tc.name      testManagingExternalStorageSequence7_0052
     * @tc.desc      Verify seven-step action sequence RSSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0052 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0052 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0053
     * @tc.name      testManagingExternalStorageSequence7_0053
     * @tc.desc      Verify seven-step action sequence RSSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0053 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0053 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0054
     * @tc.name      testManagingExternalStorageSequence7_0054
     * @tc.desc      Verify seven-step action sequence RSSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0054 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0054 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0055
     * @tc.name      testManagingExternalStorageSequence7_0055
     * @tc.desc      Verify seven-step action sequence RSSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0055 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0055 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0056
     * @tc.name      testManagingExternalStorageSequence7_0056
     * @tc.desc      Verify seven-step action sequence RSSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0056 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0056 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0057
     * @tc.name      testManagingExternalStorageSequence7_0057
     * @tc.desc      Verify seven-step action sequence RSSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0057 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0057 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0058
     * @tc.name      testManagingExternalStorageSequence7_0058
     * @tc.desc      Verify seven-step action sequence RSSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0058 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0058 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0059
     * @tc.name      testManagingExternalStorageSequence7_0059
     * @tc.desc      Verify seven-step action sequence RSSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0059 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0059 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0060
     * @tc.name      testManagingExternalStorageSequence7_0060
     * @tc.desc      Verify seven-step action sequence RSSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0060 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0060 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE7_0061
     * @tc.name      testManagingExternalStorageSequence7_0061
     * @tc.desc      Verify seven-step action sequence RSSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence7_0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0061 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'length7 RSSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence7_0061 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
