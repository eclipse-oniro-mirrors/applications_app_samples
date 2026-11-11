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
import { DELEGATOR } from './BehaviorRuntime';
import { UIAbility } from '@kit.AbilityKit';

export default function managingExternalStorageUiStabilityTest(): void {
  describe('ManagingExternalStorageUiStabilityTest', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0001
     * @tc.name      testManagingExternalStorageUiStability0001
     * @tc.desc      Verify launch 1 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0001 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 1 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0001 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0002
     * @tc.name      testManagingExternalStorageUiStability0002
     * @tc.desc      Verify launch 2 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0002 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 2 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0002 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0003
     * @tc.name      testManagingExternalStorageUiStability0003
     * @tc.desc      Verify launch 3 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0003 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 3 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0003 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0004
     * @tc.name      testManagingExternalStorageUiStability0004
     * @tc.desc      Verify launch 4 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0004 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 4 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0004 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0005
     * @tc.name      testManagingExternalStorageUiStability0005
     * @tc.desc      Verify launch 5 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0005 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 5 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0005 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0006
     * @tc.name      testManagingExternalStorageUiStability0006
     * @tc.desc      Verify launch 6 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0006 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 6 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0006 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0007
     * @tc.name      testManagingExternalStorageUiStability0007
     * @tc.desc      Verify launch 7 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0007 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 7 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0007 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0008
     * @tc.name      testManagingExternalStorageUiStability0008
     * @tc.desc      Verify launch 8 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0008 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 8 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0008 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0009
     * @tc.name      testManagingExternalStorageUiStability0009
     * @tc.desc      Verify launch 9 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0009 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 9 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0009 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0010
     * @tc.name      testManagingExternalStorageUiStability0010
     * @tc.desc      Verify launch 10 keeps EntryAbility on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0010 begin');
          await launchEntry();
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'launch 10 top: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0010 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0011
     * @tc.name      testManagingExternalStorageUiStability0011
     * @tc.desc      Verify UI status remains visible in cycle 1.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0011 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'ui cycle 1 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0011 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0012
     * @tc.name      testManagingExternalStorageUiStability0012
     * @tc.desc      Verify UI status remains visible in cycle 2.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0012 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'ui cycle 2 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0012 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0013
     * @tc.name      testManagingExternalStorageUiStability0013
     * @tc.desc      Verify UI status remains visible in cycle 3.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0013 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'ui cycle 3 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0013 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0014
     * @tc.name      testManagingExternalStorageUiStability0014
     * @tc.desc      Verify UI status remains visible in cycle 4.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0014 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'ui cycle 4 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0014 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0015
     * @tc.name      testManagingExternalStorageUiStability0015
     * @tc.desc      Verify UI status remains visible in cycle 5.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0015 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'ui cycle 5 status: %{public}s', status);
          expect(status).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0015 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0016
     * @tc.name      testManagingExternalStorageUiStability0016
     * @tc.desc      Verify subscribe UI state 1.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0016 begin');
          await launchEntry();
          await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe ui 1 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0016 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0017
     * @tc.name      testManagingExternalStorageUiStability0017
     * @tc.desc      Verify subscribe UI state 2.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0017 begin');
          await launchEntry();
          await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe ui 2 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0017 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0018
     * @tc.name      testManagingExternalStorageUiStability0018
     * @tc.desc      Verify subscribe UI state 3.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0018 begin');
          await launchEntry();
          await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe ui 3 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0018 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0019
     * @tc.name      testManagingExternalStorageUiStability0019
     * @tc.desc      Verify subscribe UI state 4.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0019 begin');
          await launchEntry();
          await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe ui 4 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0019 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_UI2_0020
     * @tc.name      testManagingExternalStorageUiStability0020
     * @tc.desc      Verify subscribe UI state 5.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageUiStability0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0020 begin');
          await launchEntry();
          await click('subscribeButton');
          const status: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe ui 5 status: %{public}s', status);
          expect(status).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageUiStability0020 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
