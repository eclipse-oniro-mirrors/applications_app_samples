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

export default function managingExternalStorageSequence10TestPart3(): void {
  describe('ManagingExternalStorageSequence10TestPart3', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0137
     * @tc.name      testManagingExternalStorageSequence10_0137
     * @tc.desc      Verify ten-step action sequence RRSRRRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0137 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0137 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0138
     * @tc.name      testManagingExternalStorageSequence10_0138
     * @tc.desc      Verify ten-step action sequence RRSRRRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0138 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0138 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0139
     * @tc.name      testManagingExternalStorageSequence10_0139
     * @tc.desc      Verify ten-step action sequence RRSRRRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0139 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0139 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0140
     * @tc.name      testManagingExternalStorageSequence10_0140
     * @tc.desc      Verify ten-step action sequence RRSRRRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0140 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0140 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0141
     * @tc.name      testManagingExternalStorageSequence10_0141
     * @tc.desc      Verify ten-step action sequence RRSRRRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0141 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0141 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0142
     * @tc.name      testManagingExternalStorageSequence10_0142
     * @tc.desc      Verify ten-step action sequence RRSRRRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0142 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0142 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0143
     * @tc.name      testManagingExternalStorageSequence10_0143
     * @tc.desc      Verify ten-step action sequence RRSRRRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0143 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0143 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0144
     * @tc.name      testManagingExternalStorageSequence10_0144
     * @tc.desc      Verify ten-step action sequence RRSRRRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0144 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0144 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0145
     * @tc.name      testManagingExternalStorageSequence10_0145
     * @tc.desc      Verify ten-step action sequence RRSRRSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0145 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0145 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0146
     * @tc.name      testManagingExternalStorageSequence10_0146
     * @tc.desc      Verify ten-step action sequence RRSRRSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0146 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0146 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0147
     * @tc.name      testManagingExternalStorageSequence10_0147
     * @tc.desc      Verify ten-step action sequence RRSRRSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0147 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0147 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0148
     * @tc.name      testManagingExternalStorageSequence10_0148
     * @tc.desc      Verify ten-step action sequence RRSRRSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0148 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0148 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0149
     * @tc.name      testManagingExternalStorageSequence10_0149
     * @tc.desc      Verify ten-step action sequence RRSRRSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0149 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0149 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0150
     * @tc.name      testManagingExternalStorageSequence10_0150
     * @tc.desc      Verify ten-step action sequence RRSRRSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0150 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0150 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0151
     * @tc.name      testManagingExternalStorageSequence10_0151
     * @tc.desc      Verify ten-step action sequence RRSRRSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0151',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0151 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0151 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0152
     * @tc.name      testManagingExternalStorageSequence10_0152
     * @tc.desc      Verify ten-step action sequence RRSRRSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0152',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0152 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0152 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0153
     * @tc.name      testManagingExternalStorageSequence10_0153
     * @tc.desc      Verify ten-step action sequence RRSRRSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0153',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0153 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0153 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0154
     * @tc.name      testManagingExternalStorageSequence10_0154
     * @tc.desc      Verify ten-step action sequence RRSRRSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0154',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0154 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0154 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0155
     * @tc.name      testManagingExternalStorageSequence10_0155
     * @tc.desc      Verify ten-step action sequence RRSRRSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0155',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0155 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0155 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0156
     * @tc.name      testManagingExternalStorageSequence10_0156
     * @tc.desc      Verify ten-step action sequence RRSRRSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0156',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0156 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0156 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0157
     * @tc.name      testManagingExternalStorageSequence10_0157
     * @tc.desc      Verify ten-step action sequence RRSRRSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0157',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0157 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0157 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0158
     * @tc.name      testManagingExternalStorageSequence10_0158
     * @tc.desc      Verify ten-step action sequence RRSRRSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0158',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0158 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0158 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0159
     * @tc.name      testManagingExternalStorageSequence10_0159
     * @tc.desc      Verify ten-step action sequence RRSRRSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0159',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0159 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0159 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0160
     * @tc.name      testManagingExternalStorageSequence10_0160
     * @tc.desc      Verify ten-step action sequence RRSRRSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0160 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRRSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRRSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0160 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0161
     * @tc.name      testManagingExternalStorageSequence10_0161
     * @tc.desc      Verify ten-step action sequence RRSRSRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0161',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0161 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0161 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0162
     * @tc.name      testManagingExternalStorageSequence10_0162
     * @tc.desc      Verify ten-step action sequence RRSRSRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0162',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0162 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0162 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0163
     * @tc.name      testManagingExternalStorageSequence10_0163
     * @tc.desc      Verify ten-step action sequence RRSRSRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0163',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0163 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0163 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0164
     * @tc.name      testManagingExternalStorageSequence10_0164
     * @tc.desc      Verify ten-step action sequence RRSRSRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0164',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0164 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0164 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0165
     * @tc.name      testManagingExternalStorageSequence10_0165
     * @tc.desc      Verify ten-step action sequence RRSRSRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0165',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0165 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0165 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0166
     * @tc.name      testManagingExternalStorageSequence10_0166
     * @tc.desc      Verify ten-step action sequence RRSRSRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0166',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0166 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0166 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0167
     * @tc.name      testManagingExternalStorageSequence10_0167
     * @tc.desc      Verify ten-step action sequence RRSRSRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0167',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0167 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0167 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0168
     * @tc.name      testManagingExternalStorageSequence10_0168
     * @tc.desc      Verify ten-step action sequence RRSRSRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0168',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0168 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0168 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0169
     * @tc.name      testManagingExternalStorageSequence10_0169
     * @tc.desc      Verify ten-step action sequence RRSRSRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0169',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0169 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0169 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0170
     * @tc.name      testManagingExternalStorageSequence10_0170
     * @tc.desc      Verify ten-step action sequence RRSRSRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0170',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0170 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0170 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0171
     * @tc.name      testManagingExternalStorageSequence10_0171
     * @tc.desc      Verify ten-step action sequence RRSRSRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0171',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0171 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0171 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0172
     * @tc.name      testManagingExternalStorageSequence10_0172
     * @tc.desc      Verify ten-step action sequence RRSRSRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0172',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0172 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0172 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0173
     * @tc.name      testManagingExternalStorageSequence10_0173
     * @tc.desc      Verify ten-step action sequence RRSRSRSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0173',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0173 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0173 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0174
     * @tc.name      testManagingExternalStorageSequence10_0174
     * @tc.desc      Verify ten-step action sequence RRSRSRSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0174',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0174 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0174 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0175
     * @tc.name      testManagingExternalStorageSequence10_0175
     * @tc.desc      Verify ten-step action sequence RRSRSRSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0175',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0175 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0175 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0176
     * @tc.name      testManagingExternalStorageSequence10_0176
     * @tc.desc      Verify ten-step action sequence RRSRSRSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0176',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0176 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSRSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSRSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0176 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0177
     * @tc.name      testManagingExternalStorageSequence10_0177
     * @tc.desc      Verify ten-step action sequence RRSRSSRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0177',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0177 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0177 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0178
     * @tc.name      testManagingExternalStorageSequence10_0178
     * @tc.desc      Verify ten-step action sequence RRSRSSRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0178',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0178 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0178 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0179
     * @tc.name      testManagingExternalStorageSequence10_0179
     * @tc.desc      Verify ten-step action sequence RRSRSSRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0179',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0179 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0179 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0180
     * @tc.name      testManagingExternalStorageSequence10_0180
     * @tc.desc      Verify ten-step action sequence RRSRSSRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0180 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0180 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0181
     * @tc.name      testManagingExternalStorageSequence10_0181
     * @tc.desc      Verify ten-step action sequence RRSRSSRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0181',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0181 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0181 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0182
     * @tc.name      testManagingExternalStorageSequence10_0182
     * @tc.desc      Verify ten-step action sequence RRSRSSRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0182',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0182 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0182 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0183
     * @tc.name      testManagingExternalStorageSequence10_0183
     * @tc.desc      Verify ten-step action sequence RRSRSSRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0183',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0183 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0183 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0184
     * @tc.name      testManagingExternalStorageSequence10_0184
     * @tc.desc      Verify ten-step action sequence RRSRSSRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0184',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0184 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0184 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0185
     * @tc.name      testManagingExternalStorageSequence10_0185
     * @tc.desc      Verify ten-step action sequence RRSRSSSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0185',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0185 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0185 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0186
     * @tc.name      testManagingExternalStorageSequence10_0186
     * @tc.desc      Verify ten-step action sequence RRSRSSSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0186',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0186 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0186 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0187
     * @tc.name      testManagingExternalStorageSequence10_0187
     * @tc.desc      Verify ten-step action sequence RRSRSSSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0187',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0187 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0187 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0188
     * @tc.name      testManagingExternalStorageSequence10_0188
     * @tc.desc      Verify ten-step action sequence RRSRSSSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0188',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0188 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0188 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0189
     * @tc.name      testManagingExternalStorageSequence10_0189
     * @tc.desc      Verify ten-step action sequence RRSRSSSSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0189',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0189 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0189 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0190
     * @tc.name      testManagingExternalStorageSequence10_0190
     * @tc.desc      Verify ten-step action sequence RRSRSSSSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0190 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0190 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0191
     * @tc.name      testManagingExternalStorageSequence10_0191
     * @tc.desc      Verify ten-step action sequence RRSRSSSSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0191',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0191 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0191 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0192
     * @tc.name      testManagingExternalStorageSequence10_0192
     * @tc.desc      Verify ten-step action sequence RRSRSSSSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0192',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0192 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSRSSSSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSRSSSSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0192 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0193
     * @tc.name      testManagingExternalStorageSequence10_0193
     * @tc.desc      Verify ten-step action sequence RRSSRRRRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0193',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0193 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0193 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0194
     * @tc.name      testManagingExternalStorageSequence10_0194
     * @tc.desc      Verify ten-step action sequence RRSSRRRRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0194',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0194 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0194 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0195
     * @tc.name      testManagingExternalStorageSequence10_0195
     * @tc.desc      Verify ten-step action sequence RRSSRRRRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0195',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0195 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0195 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0196
     * @tc.name      testManagingExternalStorageSequence10_0196
     * @tc.desc      Verify ten-step action sequence RRSSRRRRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0196',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0196 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0196 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0197
     * @tc.name      testManagingExternalStorageSequence10_0197
     * @tc.desc      Verify ten-step action sequence RRSSRRRSRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0197',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0197 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRSRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRSRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0197 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0198
     * @tc.name      testManagingExternalStorageSequence10_0198
     * @tc.desc      Verify ten-step action sequence RRSSRRRSRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0198',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0198 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRSRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRSRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0198 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0199
     * @tc.name      testManagingExternalStorageSequence10_0199
     * @tc.desc      Verify ten-step action sequence RRSSRRRSSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0199',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0199 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRSSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRSSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0199 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0200
     * @tc.name      testManagingExternalStorageSequence10_0200
     * @tc.desc      Verify ten-step action sequence RRSSRRRSSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0200 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRRSSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRRSSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0200 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0201
     * @tc.name      testManagingExternalStorageSequence10_0201
     * @tc.desc      Verify ten-step action sequence RRSSRRSRRR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0201 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRSRRR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRSRRR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0201 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0202
     * @tc.name      testManagingExternalStorageSequence10_0202
     * @tc.desc      Verify ten-step action sequence RRSSRRSRRS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0202 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRSRRS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRSRRS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0202 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0203
     * @tc.name      testManagingExternalStorageSequence10_0203
     * @tc.desc      Verify ten-step action sequence RRSSRRSRSR.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0203 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRSRSR');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRSRSR status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0203 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_SEQUENCE10_0204
     * @tc.name      testManagingExternalStorageSequence10_0204
     * @tc.desc      Verify ten-step action sequence RRSSRRSRSS.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSequence10_0204',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0204 begin');
          await launchEntry();
          await click('subscribeButton');
          await clickSequence('RRSSRRSRSS');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'sequence RRSSRRSRSS status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSequence10_0204 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
