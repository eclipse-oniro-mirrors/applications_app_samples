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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { CallTestFixture, makeFailure } from '../Shared/CallTestFixture';

export default function SubscriptionRecoveryTest(): void {
  describe('SubscriptionRecoveryTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting SubscriptionRecoveryTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished SubscriptionRecoveryTest');
    });

    /**
     * @tc.name SubscriptionRecovery_makeRetry_001
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_makeRetry_0100
     * @tc.desc Verify makeRetry for request fixture 676, error 8300002, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_makeRetry_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300002, 'fixture failure 676');
        fixture.controller.start(' 555000676 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start(' 555000676 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000676 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionRecovery_subscribeRetry_002
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_subscribeRetry_0200
     * @tc.desc Verify subscribeRetry for request fixture 677, error 8300003, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_subscribeRetry_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 677');
        fixture.controller.start('13xxxx677');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('13xxxx677');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13xxxx677');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 5, '13xxxx677');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx677');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionRecovery_unsubscribeRetry_003
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_unsubscribeRetry_0300
     * @tc.desc Verify unsubscribeRetry for request fixture 678, error 8300004, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_unsubscribeRetry_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;678');
        expect(fixture.service.requests[0]).assertEqual('ext;678');
        fixture.service.unsubscribeFailure = makeFailure(8300004, 'fixture failure 678');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.emit(0, 6, 'ext;678');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionRecovery_supportToggle_004
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_supportToggle_0400
     * @tc.desc Verify supportToggle for request fixture 679, error 8300999, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_supportToggle_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('\uff11\uff1300000679');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('\uff11\uff1300000679');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000679');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('\uff11\uff1300000679');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionRecovery_restart_005
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_restart_0500
     * @tc.desc Verify restart for request fixture 680, error 201, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_restart_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000680');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13800000680');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800000680');
        expect(fixture.service.listeners.length).assertEqual(2);
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(2);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionRecovery_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 681, error 401, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(401, 'fixture failure 681');
        fixture.controller.start('tel:13800000681');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('tel:13800000681');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000681');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionRecovery_subscribeRetry_007
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_subscribeRetry_0700
     * @tc.desc Verify subscribeRetry for request fixture 682, error 801, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_subscribeRetry_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 682');
        fixture.controller.start('+8613800000682');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800000682');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800000682');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 3, '+8613800000682');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800000682');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionRecovery_unsubscribeRetry_008
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_unsubscribeRetry_0800
     * @tc.desc Verify unsubscribeRetry for request fixture 683, error 8300001, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_unsubscribeRetry_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000683');
        expect(fixture.service.requests[0]).assertEqual('555-000683');
        fixture.service.unsubscribeFailure = makeFailure(8300001, 'fixture failure 683');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.emit(0, 4, '555-000683');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionRecovery_supportToggle_009
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_supportToggle_0900
     * @tc.desc Verify supportToggle for request fixture 684, error 8300002, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_supportToggle_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start(' 555000684 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start(' 555000684 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000684 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start(' 555000684 ');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionRecovery_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionRecovery_restart_1000
     * @tc.desc Verify restart for request fixture 685, error 8300003, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionRecovery_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx685');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13xxxx685');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13xxxx685');
        expect(fixture.service.listeners.length).assertEqual(2);
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(2);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );
  });
}
