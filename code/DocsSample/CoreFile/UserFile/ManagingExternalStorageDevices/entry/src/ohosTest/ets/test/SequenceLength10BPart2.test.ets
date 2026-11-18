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

export default function managingExternalStorageSequence10BTestPart2(): void {
  describe('ManagingExternalStorageSequence10BTestPart2', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100469
     * @tc.name      testManagingExternalStorageSequence100469
     * @tc.desc      Verify ten-step action sequence RSSSRSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100469',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100469 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100469 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100470
     * @tc.name      testManagingExternalStorageSequence100470
     * @tc.desc      Verify ten-step action sequence RSSSRSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100470',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100470 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100470 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100471
     * @tc.name      testManagingExternalStorageSequence100471
     * @tc.desc      Verify ten-step action sequence RSSSRSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100471',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100471 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100471 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100472
     * @tc.name      testManagingExternalStorageSequence100472
     * @tc.desc      Verify ten-step action sequence RSSSRSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100472',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100472 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100472 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100473
     * @tc.name      testManagingExternalStorageSequence100473
     * @tc.desc      Verify ten-step action sequence RSSSRSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100473',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100473 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100473 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100474
     * @tc.name      testManagingExternalStorageSequence100474
     * @tc.desc      Verify ten-step action sequence RSSSRSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100474',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100474 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100474 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100475
     * @tc.name      testManagingExternalStorageSequence100475
     * @tc.desc      Verify ten-step action sequence RSSSRSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100475',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100475 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100475 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100476
     * @tc.name      testManagingExternalStorageSequence100476
     * @tc.desc      Verify ten-step action sequence RSSSRSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100476',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100476 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100476 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100477
     * @tc.name      testManagingExternalStorageSequence100477
     * @tc.desc      Verify ten-step action sequence RSSSRSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100477',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100477 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100477 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100478
     * @tc.name      testManagingExternalStorageSequence100478
     * @tc.desc      Verify ten-step action sequence RSSSRSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100478',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100478 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100478 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100479
     * @tc.name      testManagingExternalStorageSequence100479
     * @tc.desc      Verify ten-step action sequence RSSSRSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100479',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100479 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100479 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100480
     * @tc.name      testManagingExternalStorageSequence100480
     * @tc.desc      Verify ten-step action sequence RSSSRSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100480',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100480 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSRSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSRSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100480 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100481
     * @tc.name      testManagingExternalStorageSequence100481
     * @tc.desc      Verify ten-step action sequence RSSSSRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100481',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100481 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100481 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100482
     * @tc.name      testManagingExternalStorageSequence100482
     * @tc.desc      Verify ten-step action sequence RSSSSRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100482',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100482 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100482 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100483
     * @tc.name      testManagingExternalStorageSequence100483
     * @tc.desc      Verify ten-step action sequence RSSSSRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100483',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100483 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100483 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100484
     * @tc.name      testManagingExternalStorageSequence100484
     * @tc.desc      Verify ten-step action sequence RSSSSRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100484',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100484 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100484 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100485
     * @tc.name      testManagingExternalStorageSequence100485
     * @tc.desc      Verify ten-step action sequence RSSSSRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100485',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100485 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100485 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100486
     * @tc.name      testManagingExternalStorageSequence100486
     * @tc.desc      Verify ten-step action sequence RSSSSRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100486',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100486 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100486 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100487
     * @tc.name      testManagingExternalStorageSequence100487
     * @tc.desc      Verify ten-step action sequence RSSSSRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100487',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100487 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100487 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100488
     * @tc.name      testManagingExternalStorageSequence100488
     * @tc.desc      Verify ten-step action sequence RSSSSRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100488',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100488 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100488 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100489
     * @tc.name      testManagingExternalStorageSequence100489
     * @tc.desc      Verify ten-step action sequence RSSSSRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100489',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100489 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100489 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100490
     * @tc.name      testManagingExternalStorageSequence100490
     * @tc.desc      Verify ten-step action sequence RSSSSRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100490',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100490 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100490 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100491
     * @tc.name      testManagingExternalStorageSequence100491
     * @tc.desc      Verify ten-step action sequence RSSSSRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100491',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100491 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100491 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100492
     * @tc.name      testManagingExternalStorageSequence100492
     * @tc.desc      Verify ten-step action sequence RSSSSRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100492',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100492 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100492 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100493
     * @tc.name      testManagingExternalStorageSequence100493
     * @tc.desc      Verify ten-step action sequence RSSSSRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100493',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100493 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100493 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100494
     * @tc.name      testManagingExternalStorageSequence100494
     * @tc.desc      Verify ten-step action sequence RSSSSRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100494',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100494 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100494 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100495
     * @tc.name      testManagingExternalStorageSequence100495
     * @tc.desc      Verify ten-step action sequence RSSSSRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100495',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100495 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100495 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100496
     * @tc.name      testManagingExternalStorageSequence100496
     * @tc.desc      Verify ten-step action sequence RSSSSRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100496',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100496 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100496 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100497
     * @tc.name      testManagingExternalStorageSequence100497
     * @tc.desc      Verify ten-step action sequence RSSSSSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100497',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100497 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100497 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100498
     * @tc.name      testManagingExternalStorageSequence100498
     * @tc.desc      Verify ten-step action sequence RSSSSSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100498',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100498 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100498 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100499
     * @tc.name      testManagingExternalStorageSequence100499
     * @tc.desc      Verify ten-step action sequence RSSSSSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100499',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100499 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100499 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100500
     * @tc.name      testManagingExternalStorageSequence100500
     * @tc.desc      Verify ten-step action sequence RSSSSSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100500 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100500 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100501
     * @tc.name      testManagingExternalStorageSequence100501
     * @tc.desc      Verify ten-step action sequence RSSSSSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100501 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100501 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100502
     * @tc.name      testManagingExternalStorageSequence100502
     * @tc.desc      Verify ten-step action sequence RSSSSSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100502 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100502 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100503
     * @tc.name      testManagingExternalStorageSequence100503
     * @tc.desc      Verify ten-step action sequence RSSSSSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100503',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100503 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100503 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100504
     * @tc.name      testManagingExternalStorageSequence100504
     * @tc.desc      Verify ten-step action sequence RSSSSSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100504',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100504 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100504 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100505
     * @tc.name      testManagingExternalStorageSequence100505
     * @tc.desc      Verify ten-step action sequence RSSSSSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100505',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100505 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100505 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100506
     * @tc.name      testManagingExternalStorageSequence100506
     * @tc.desc      Verify ten-step action sequence RSSSSSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100506',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100506 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100506 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100507
     * @tc.name      testManagingExternalStorageSequence100507
     * @tc.desc      Verify ten-step action sequence RSSSSSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100507',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100507 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100507 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100508
     * @tc.name      testManagingExternalStorageSequence100508
     * @tc.desc      Verify ten-step action sequence RSSSSSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100508',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100508 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100508 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100509
     * @tc.name      testManagingExternalStorageSequence100509
     * @tc.desc      Verify ten-step action sequence RSSSSSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100509',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100509 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100509 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100510
     * @tc.name      testManagingExternalStorageSequence100510
     * @tc.desc      Verify ten-step action sequence RSSSSSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100510 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100510 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100511
     * @tc.name      testManagingExternalStorageSequence100511
     * @tc.desc      Verify ten-step action sequence RSSSSSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100511',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100511 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100511 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100512
     * @tc.name      testManagingExternalStorageSequence100512
     * @tc.desc      Verify ten-step action sequence RSSSSSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100512',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100512 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RSSSSSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RSSSSSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100512 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100513
     * @tc.name      testManagingExternalStorageSequence100513
     * @tc.desc      Verify ten-step action sequence SRRRRRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100513',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100513 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100513 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100514
     * @tc.name      testManagingExternalStorageSequence100514
     * @tc.desc      Verify ten-step action sequence SRRRRRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100514',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100514 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100514 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100515
     * @tc.name      testManagingExternalStorageSequence100515
     * @tc.desc      Verify ten-step action sequence SRRRRRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100515',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100515 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100515 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100516
     * @tc.name      testManagingExternalStorageSequence100516
     * @tc.desc      Verify ten-step action sequence SRRRRRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100516',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100516 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100516 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100517
     * @tc.name      testManagingExternalStorageSequence100517
     * @tc.desc      Verify ten-step action sequence SRRRRRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100517',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100517 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100517 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100518
     * @tc.name      testManagingExternalStorageSequence100518
     * @tc.desc      Verify ten-step action sequence SRRRRRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100518',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100518 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100518 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100519
     * @tc.name      testManagingExternalStorageSequence100519
     * @tc.desc      Verify ten-step action sequence SRRRRRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100519',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100519 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100519 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100520
     * @tc.name      testManagingExternalStorageSequence100520
     * @tc.desc      Verify ten-step action sequence SRRRRRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100520',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100520 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100520 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100521
     * @tc.name      testManagingExternalStorageSequence100521
     * @tc.desc      Verify ten-step action sequence SRRRRRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100521',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100521 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100521 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100522
     * @tc.name      testManagingExternalStorageSequence100522
     * @tc.desc      Verify ten-step action sequence SRRRRRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100522',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100522 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100522 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100523
     * @tc.name      testManagingExternalStorageSequence100523
     * @tc.desc      Verify ten-step action sequence SRRRRRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100523',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100523 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100523 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100524
     * @tc.name      testManagingExternalStorageSequence100524
     * @tc.desc      Verify ten-step action sequence SRRRRRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100524',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100524 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100524 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100525
     * @tc.name      testManagingExternalStorageSequence100525
     * @tc.desc      Verify ten-step action sequence SRRRRRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100525',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100525 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100525 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100526
     * @tc.name      testManagingExternalStorageSequence100526
     * @tc.desc      Verify ten-step action sequence SRRRRRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100526',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100526 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100526 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100527
     * @tc.name      testManagingExternalStorageSequence100527
     * @tc.desc      Verify ten-step action sequence SRRRRRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100527',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100527 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100527 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100528
     * @tc.name      testManagingExternalStorageSequence100528
     * @tc.desc      Verify ten-step action sequence SRRRRRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100528',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100528 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100528 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100529
     * @tc.name      testManagingExternalStorageSequence100529
     * @tc.desc      Verify ten-step action sequence SRRRRSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100529',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100529 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100529 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100530
     * @tc.name      testManagingExternalStorageSequence100530
     * @tc.desc      Verify ten-step action sequence SRRRRSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100530',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100530 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100530 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100531
     * @tc.name      testManagingExternalStorageSequence100531
     * @tc.desc      Verify ten-step action sequence SRRRRSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100531',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100531 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100531 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100532
     * @tc.name      testManagingExternalStorageSequence100532
     * @tc.desc      Verify ten-step action sequence SRRRRSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100532',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100532 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100532 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100533
     * @tc.name      testManagingExternalStorageSequence100533
     * @tc.desc      Verify ten-step action sequence SRRRRSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100533',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100533 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100533 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100534
     * @tc.name      testManagingExternalStorageSequence100534
     * @tc.desc      Verify ten-step action sequence SRRRRSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100534',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100534 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100534 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100535
     * @tc.name      testManagingExternalStorageSequence100535
     * @tc.desc      Verify ten-step action sequence SRRRRSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100535',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100535 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100535 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE100536
     * @tc.name      testManagingExternalStorageSequence100536
     * @tc.desc      Verify ten-step action sequence SRRRRSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence100536',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100536 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('SRRRRSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence SRRRRSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence100536 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
