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

export default function managingExternalStorageSequence10TestPart2(): void {
  describe('ManagingExternalStorageSequence10TestPart2', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0069
     * @tc.name      testManagingExternalStorageSequence10_0069
     * @tc.desc      Verify ten-step action sequence RRRSRRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0069 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0069 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0070
     * @tc.name      testManagingExternalStorageSequence10_0070
     * @tc.desc      Verify ten-step action sequence RRRSRRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0070 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0070 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0071
     * @tc.name      testManagingExternalStorageSequence10_0071
     * @tc.desc      Verify ten-step action sequence RRRSRRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0071 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0071 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0072
     * @tc.name      testManagingExternalStorageSequence10_0072
     * @tc.desc      Verify ten-step action sequence RRRSRRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0072 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0072 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0073
     * @tc.name      testManagingExternalStorageSequence10_0073
     * @tc.desc      Verify ten-step action sequence RRRSRRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0073 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0073 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0074
     * @tc.name      testManagingExternalStorageSequence10_0074
     * @tc.desc      Verify ten-step action sequence RRRSRRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0074 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0074 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0075
     * @tc.name      testManagingExternalStorageSequence10_0075
     * @tc.desc      Verify ten-step action sequence RRRSRRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0075 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0075 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0076
     * @tc.name      testManagingExternalStorageSequence10_0076
     * @tc.desc      Verify ten-step action sequence RRRSRRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0076 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0076 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0077
     * @tc.name      testManagingExternalStorageSequence10_0077
     * @tc.desc      Verify ten-step action sequence RRRSRRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0077 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0077 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0078
     * @tc.name      testManagingExternalStorageSequence10_0078
     * @tc.desc      Verify ten-step action sequence RRRSRRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0078 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0078 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0079
     * @tc.name      testManagingExternalStorageSequence10_0079
     * @tc.desc      Verify ten-step action sequence RRRSRRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0079 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0079 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0080
     * @tc.name      testManagingExternalStorageSequence10_0080
     * @tc.desc      Verify ten-step action sequence RRRSRRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0080 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0080 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0081
     * @tc.name      testManagingExternalStorageSequence10_0081
     * @tc.desc      Verify ten-step action sequence RRRSRSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0081 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0081 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0082
     * @tc.name      testManagingExternalStorageSequence10_0082
     * @tc.desc      Verify ten-step action sequence RRRSRSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0082 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0082 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0083
     * @tc.name      testManagingExternalStorageSequence10_0083
     * @tc.desc      Verify ten-step action sequence RRRSRSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0083 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0083 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0084
     * @tc.name      testManagingExternalStorageSequence10_0084
     * @tc.desc      Verify ten-step action sequence RRRSRSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0084 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0084 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0085
     * @tc.name      testManagingExternalStorageSequence10_0085
     * @tc.desc      Verify ten-step action sequence RRRSRSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0085 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0085 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0086
     * @tc.name      testManagingExternalStorageSequence10_0086
     * @tc.desc      Verify ten-step action sequence RRRSRSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0086 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0086 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0087
     * @tc.name      testManagingExternalStorageSequence10_0087
     * @tc.desc      Verify ten-step action sequence RRRSRSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0087 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0087 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0088
     * @tc.name      testManagingExternalStorageSequence10_0088
     * @tc.desc      Verify ten-step action sequence RRRSRSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0088 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0088 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0089
     * @tc.name      testManagingExternalStorageSequence10_0089
     * @tc.desc      Verify ten-step action sequence RRRSRSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0089 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0089 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0090
     * @tc.name      testManagingExternalStorageSequence10_0090
     * @tc.desc      Verify ten-step action sequence RRRSRSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0090 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0090 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0091
     * @tc.name      testManagingExternalStorageSequence10_0091
     * @tc.desc      Verify ten-step action sequence RRRSRSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0091 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0091 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0092
     * @tc.name      testManagingExternalStorageSequence10_0092
     * @tc.desc      Verify ten-step action sequence RRRSRSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0092 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0092 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0093
     * @tc.name      testManagingExternalStorageSequence10_0093
     * @tc.desc      Verify ten-step action sequence RRRSRSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0093 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0093 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0094
     * @tc.name      testManagingExternalStorageSequence10_0094
     * @tc.desc      Verify ten-step action sequence RRRSRSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0094 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0094 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0095
     * @tc.name      testManagingExternalStorageSequence10_0095
     * @tc.desc      Verify ten-step action sequence RRRSRSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0095 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0095 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0096
     * @tc.name      testManagingExternalStorageSequence10_0096
     * @tc.desc      Verify ten-step action sequence RRRSRSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0096 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSRSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSRSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0096 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0097
     * @tc.name      testManagingExternalStorageSequence10_0097
     * @tc.desc      Verify ten-step action sequence RRRSSRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0097 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0097 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0098
     * @tc.name      testManagingExternalStorageSequence10_0098
     * @tc.desc      Verify ten-step action sequence RRRSSRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0098 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0098 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0099
     * @tc.name      testManagingExternalStorageSequence10_0099
     * @tc.desc      Verify ten-step action sequence RRRSSRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0099 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0099 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0100
     * @tc.name      testManagingExternalStorageSequence10_0100
     * @tc.desc      Verify ten-step action sequence RRRSSRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0100 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0100 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0101
     * @tc.name      testManagingExternalStorageSequence10_0101
     * @tc.desc      Verify ten-step action sequence RRRSSRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0101 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0101 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0102
     * @tc.name      testManagingExternalStorageSequence10_0102
     * @tc.desc      Verify ten-step action sequence RRRSSRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0102 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0102 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0103
     * @tc.name      testManagingExternalStorageSequence10_0103
     * @tc.desc      Verify ten-step action sequence RRRSSRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0103 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0103 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0104
     * @tc.name      testManagingExternalStorageSequence10_0104
     * @tc.desc      Verify ten-step action sequence RRRSSRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0104 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0104 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0105
     * @tc.name      testManagingExternalStorageSequence10_0105
     * @tc.desc      Verify ten-step action sequence RRRSSRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0105 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0105 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0106
     * @tc.name      testManagingExternalStorageSequence10_0106
     * @tc.desc      Verify ten-step action sequence RRRSSRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0106 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0106 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0107
     * @tc.name      testManagingExternalStorageSequence10_0107
     * @tc.desc      Verify ten-step action sequence RRRSSRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0107 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0107 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0108
     * @tc.name      testManagingExternalStorageSequence10_0108
     * @tc.desc      Verify ten-step action sequence RRRSSRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0108 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0108 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0109
     * @tc.name      testManagingExternalStorageSequence10_0109
     * @tc.desc      Verify ten-step action sequence RRRSSRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0109 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0109 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0110
     * @tc.name      testManagingExternalStorageSequence10_0110
     * @tc.desc      Verify ten-step action sequence RRRSSRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0110 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0110 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0111
     * @tc.name      testManagingExternalStorageSequence10_0111
     * @tc.desc      Verify ten-step action sequence RRRSSRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0111 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0111 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0112
     * @tc.name      testManagingExternalStorageSequence10_0112
     * @tc.desc      Verify ten-step action sequence RRRSSRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0112 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0112 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0113
     * @tc.name      testManagingExternalStorageSequence10_0113
     * @tc.desc      Verify ten-step action sequence RRRSSSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0113 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0113 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0114
     * @tc.name      testManagingExternalStorageSequence10_0114
     * @tc.desc      Verify ten-step action sequence RRRSSSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0114 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0114 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0115
     * @tc.name      testManagingExternalStorageSequence10_0115
     * @tc.desc      Verify ten-step action sequence RRRSSSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0115 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0115 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0116
     * @tc.name      testManagingExternalStorageSequence10_0116
     * @tc.desc      Verify ten-step action sequence RRRSSSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0116 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0116 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0117
     * @tc.name      testManagingExternalStorageSequence10_0117
     * @tc.desc      Verify ten-step action sequence RRRSSSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0117 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0117 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0118
     * @tc.name      testManagingExternalStorageSequence10_0118
     * @tc.desc      Verify ten-step action sequence RRRSSSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0118 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0118 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0119
     * @tc.name      testManagingExternalStorageSequence10_0119
     * @tc.desc      Verify ten-step action sequence RRRSSSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0119 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0119 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0120
     * @tc.name      testManagingExternalStorageSequence10_0120
     * @tc.desc      Verify ten-step action sequence RRRSSSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0120 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0120 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0121
     * @tc.name      testManagingExternalStorageSequence10_0121
     * @tc.desc      Verify ten-step action sequence RRRSSSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0121 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0121 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0122
     * @tc.name      testManagingExternalStorageSequence10_0122
     * @tc.desc      Verify ten-step action sequence RRRSSSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0122 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0122 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0123
     * @tc.name      testManagingExternalStorageSequence10_0123
     * @tc.desc      Verify ten-step action sequence RRRSSSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0123 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0123 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0124
     * @tc.name      testManagingExternalStorageSequence10_0124
     * @tc.desc      Verify ten-step action sequence RRRSSSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0124 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0124 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0125
     * @tc.name      testManagingExternalStorageSequence10_0125
     * @tc.desc      Verify ten-step action sequence RRRSSSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0125 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0125 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0126
     * @tc.name      testManagingExternalStorageSequence10_0126
     * @tc.desc      Verify ten-step action sequence RRRSSSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0126 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0126 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0127
     * @tc.name      testManagingExternalStorageSequence10_0127
     * @tc.desc      Verify ten-step action sequence RRRSSSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0127 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0127 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0128
     * @tc.name      testManagingExternalStorageSequence10_0128
     * @tc.desc      Verify ten-step action sequence RRRSSSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0128 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRRSSSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRRSSSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0128 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0129
     * @tc.name      testManagingExternalStorageSequence10_0129
     * @tc.desc      Verify ten-step action sequence RRSRRRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0129 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0129 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0130
     * @tc.name      testManagingExternalStorageSequence10_0130
     * @tc.desc      Verify ten-step action sequence RRSRRRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0130 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0130 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0131
     * @tc.name      testManagingExternalStorageSequence10_0131
     * @tc.desc      Verify ten-step action sequence RRSRRRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0131 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0131 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0132
     * @tc.name      testManagingExternalStorageSequence10_0132
     * @tc.desc      Verify ten-step action sequence RRSRRRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0132 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0132 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0133
     * @tc.name      testManagingExternalStorageSequence10_0133
     * @tc.desc      Verify ten-step action sequence RRSRRRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0133 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0133 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0134
     * @tc.name      testManagingExternalStorageSequence10_0134
     * @tc.desc      Verify ten-step action sequence RRSRRRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0134 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0134 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0135
     * @tc.name      testManagingExternalStorageSequence10_0135
     * @tc.desc      Verify ten-step action sequence RRSRRRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0135 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0135 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0136
     * @tc.name      testManagingExternalStorageSequence10_0136
     * @tc.desc      Verify ten-step action sequence RRSRRRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0136 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0136 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
