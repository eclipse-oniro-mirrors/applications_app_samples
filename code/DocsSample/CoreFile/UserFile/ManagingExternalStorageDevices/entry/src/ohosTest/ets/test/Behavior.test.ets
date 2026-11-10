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
import { ON, Component } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DOMAIN, TAG, DELEGATOR, driver, launchEntry, click, readStatus } from './BehaviorRuntime';

export default function managingExternalStorageBehaviorTest(): void {
  describe('ManagingExternalStorageBehaviorTest', () => {
    beforeAll(async () => {
      await launchEntry();
    });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0100
     * @tc.name      testManagingExternalStorageBehavior0001
     * @tc.desc      Verify the application launches and exposes the status text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0001 begin');
          await launchEntry();
          const status: Component = await driver.waitForComponent(ON.id('statusText'), 3000);
          hilog.info(DOMAIN, TAG, 'status component resolved');
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0001 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0200
     * @tc.name      testManagingExternalStorageBehavior0002
     * @tc.desc      Verify both action buttons are exposed by stable ids.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0002 begin');
          await launchEntry();
          const subscribe: Component = await driver.waitForComponent(ON.id('subscribeButton'), 3000);
          const receive: Component = await driver.waitForComponent(ON.id('receiveButton'), 3000);
          hilog.info(DOMAIN, TAG, 'button components resolved');
          expect(await receive.getId()).assertEqual('receiveButton');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0002 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0300
     * @tc.name      testManagingExternalStorageBehavior0003
     * @tc.desc      Verify the localized button labels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0003 begin');
          await launchEntry();
          const subscribe: Component = await driver.waitForComponent(ON.id('subscribeButton'), 3000);
          const receive: Component = await driver.waitForComponent(ON.id('receiveButton'), 3000);
          hilog.info(DOMAIN, TAG, 'read button labels');
          expect(await receive.getText()).assertEqual('ReceiveBroadcastNotifications');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0003 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0400
     * @tc.name      testManagingExternalStorageBehavior0004
     * @tc.desc      Verify subscribing updates the status text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0004 begin');
          await launchEntry();
          await click('subscribeButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'subscribe status: %{public}s', text);
          expect(text).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0004 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0500
     * @tc.name      testManagingExternalStorageBehavior0005
     * @tc.desc      Verify subscribing twice remains successful.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0005 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('subscribeButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'repeat subscribe status: %{public}s', text);
          expect(text).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0005 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0600
     * @tc.name      testManagingExternalStorageBehavior0006
     * @tc.desc      Verify receive after subscribe enters listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0006 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'receive status: %{public}s', text);
          expect(text).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0006 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0700
     * @tc.name      testManagingExternalStorageBehavior0007
     * @tc.desc      Verify receiving twice keeps the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0007 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          await click('receiveButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'repeat receive status: %{public}s', text);
          expect(text).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0007 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0800
     * @tc.name      testManagingExternalStorageBehavior0008
     * @tc.desc      Verify subscribe recovers the success state after receiving.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0008 begin');
          await launchEntry();
          await click('receiveButton');
          await click('subscribeButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'recover subscribe status: %{public}s', text);
          expect(text).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0008 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_0900
     * @tc.name      testManagingExternalStorageBehavior0009
     * @tc.desc      Verify rapid subscribe clicks leave a successful state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0009 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('subscribeButton');
          await click('subscribeButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'rapid subscribe status: %{public}s', text);
          expect(text).assertEqual('Subscription succeeded');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0009 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_1000
     * @tc.name      testManagingExternalStorageBehavior0010
     * @tc.desc      Verify rapid receive clicks leave the listening state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0010 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          await click('receiveButton');
          await click('receiveButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'rapid receive status: %{public}s', text);
          expect(text).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0010 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_1100
     * @tc.name      testManagingExternalStorageBehavior0011
     * @tc.desc      Verify button labels remain stable after the interaction sequence.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0011 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const subscribe: Component = await driver.waitForComponent(ON.id('subscribeButton'), 3000);
          const receive: Component = await driver.waitForComponent(ON.id('receiveButton'), 3000);
          hilog.info(DOMAIN, TAG, 'recheck button labels');
          expect(await receive.getText()).assertEqual('ReceiveBroadcastNotifications');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0011 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_1200
     * @tc.name      testManagingExternalStorageBehavior0012
     * @tc.desc      Verify the entry ability stays on top after the interaction sequence.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0012 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
          hilog.info(DOMAIN, TAG, 'top ability: %{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0012 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_1300
     * @tc.name      testManagingExternalStorageBehavior0013
     * @tc.desc      Verify the status component remains queryable after the sequence.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0013 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          const status: Component = await driver.waitForComponent(ON.id('statusText'), 3000);
          hilog.info(DOMAIN, TAG, 'status component still queryable');
          expect(status !== null).assertTrue();
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0013 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_1400
     * @tc.name      testManagingExternalStorageBehavior0014
     * @tc.desc      Verify reception after subscription is repeatable across cycles.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0014 begin');
          await launchEntry();
          await click('subscribeButton');
          await click('receiveButton');
          await click('subscribeButton');
          await click('receiveButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'cycle status: %{public}s', text);
          expect(text).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0014 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_BEHAVIOR_1500
     * @tc.name      testManagingExternalStorageBehavior0015
     * @tc.desc      Verify subscription after a receive-only attempt succeeds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageBehavior0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0015 begin');
          await launchEntry();
          await click('receiveButton');
          await click('subscribeButton');
          await click('receiveButton');
          const text: string = await readStatus();
          hilog.info(DOMAIN, TAG, 'recover then receive status: %{public}s', text);
          expect(text).assertEqual('Listening for volume events');
          hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageBehavior0015 end');
        } catch (err) {
          hilog.error(DOMAIN, TAG, 'failed: %{public}s', String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
