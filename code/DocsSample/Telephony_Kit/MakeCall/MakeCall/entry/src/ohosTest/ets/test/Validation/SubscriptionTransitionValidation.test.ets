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

export default function SubscriptionTransitionValidationTest(): void {
  describe('SubscriptionTransitionValidationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting SubscriptionTransitionValidationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished SubscriptionTransitionValidationTest');
    });

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_0100
     * @tc.desc Verify dispose for request fixture 1583, error 8300999, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001583');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001583');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 1584, error 201, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001584');
        expect(fixture.service.requests[0]).assertEqual('13800001584');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 1584'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13800001584');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_0300
     * @tc.desc Verify staleState for request fixture 1585, error 401, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001585');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001585');
        fixture.service.emit(0, 3, 'tel:13800001585');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, 'tel:13800001585');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('tel:13800001585');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, 'tel:13800001585');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, 'tel:13800001585');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_0400
     * @tc.desc Verify restart for request fixture 1586, error 801, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001586');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('+8613800001586');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001586');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 1587, error 8300001, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001587');
        expect(fixture.service.requests[0]).assertEqual('555-001587');
        fixture.service.unsubscribeFailure = makeFailure(8300001, 'fixture failure 1587');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.emit(0, 5, '555-001587');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 1588, error 8300002, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start(' 555001588 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001588 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_007
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_0700
     * @tc.desc Verify dispose for request fixture 1589, error 8300003, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1589');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1589');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 1590, error 8300004, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1590');
        expect(fixture.service.requests[0]).assertEqual('ext;1590');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 1590'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('ext;1590');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_0900
     * @tc.desc Verify staleState for request fixture 1591, error 8300999, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001591');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001591');
        fixture.service.emit(0, 2, '\uff11\uff1300001591');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        fixture.controller.dispose();
        fixture.service.emit(0, 3, '\uff11\uff1300001591');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('\uff11\uff1300001591');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 4, '\uff11\uff1300001591');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 5, '\uff11\uff1300001591');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(5);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_1000
     * @tc.desc Verify restart for request fixture 1592, error 201, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001592');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13800001592');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001592');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_1100
     * @tc.desc Verify unsubscribeRetry for request fixture 1593, error 401, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001593');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001593');
        fixture.service.unsubscribeFailure = makeFailure(401, 'fixture failure 1593');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.emit(0, 4, 'tel:13800001593');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_disposeWithoutStart_012
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_disposeWithoutStart_1200
     * @tc.desc Verify disposeWithoutStart for request fixture 1594, error 801, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_disposeWithoutStart_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('+8613800001594');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001594');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_013
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_1300
     * @tc.desc Verify dispose for request fixture 1595, error 8300001, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001595');
        expect(fixture.service.requests[0]).assertEqual('555-001595');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_014
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_1400
     * @tc.desc Verify staleCompletion for request fixture 1596, error 8300002, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001596 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001596 ');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 1596'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start(' 555001596 ');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_015
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_1500
     * @tc.desc Verify staleState for request fixture 1597, error 8300003, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1597');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1597');
        fixture.service.emit(0, 1, '13xxxx1597');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        fixture.controller.dispose();
        fixture.service.emit(0, 2, '13xxxx1597');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13xxxx1597');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 3, '13xxxx1597');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 4, '13xxxx1597');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(4);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_016
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_1600
     * @tc.desc Verify restart for request fixture 1598, error 8300004, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1598');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('ext;1598');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1598');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_1700
     * @tc.desc Verify unsubscribeRetry for request fixture 1599, error 8300999, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001599');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001599');
        fixture.service.unsubscribeFailure = makeFailure(8300999, 'fixture failure 1599');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.emit(0, 3, '\uff11\uff1300001599');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_disposeWithoutStart_018
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_disposeWithoutStart_1800
     * @tc.desc Verify disposeWithoutStart for request fixture 1600, error 201, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_disposeWithoutStart_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('13800001600');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001600');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_1900
     * @tc.desc Verify dispose for request fixture 1601, error 401, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001601');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001601');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_020
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_2000
     * @tc.desc Verify staleCompletion for request fixture 1602, error 801, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001602');
        expect(fixture.service.requests[0]).assertEqual('+8613800001602');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 1602'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('+8613800001602');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_021
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_2100
     * @tc.desc Verify staleState for request fixture 1603, error 8300001, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001603');
        expect(fixture.service.requests[0]).assertEqual('555-001603');
        fixture.service.emit(0, 0, '555-001603');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        fixture.controller.dispose();
        fixture.service.emit(0, 1, '555-001603');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('555-001603');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 2, '555-001603');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 3, '555-001603');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_022
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_2200
     * @tc.desc Verify restart for request fixture 1604, error 8300002, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001604 ');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start(' 555001604 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001604 ');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_023
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_2300
     * @tc.desc Verify unsubscribeRetry for request fixture 1605, error 8300003, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1605');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1605');
        fixture.service.unsubscribeFailure = makeFailure(8300003, 'fixture failure 1605');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.emit(0, 2, '13xxxx1605');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_disposeWithoutStart_024
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_disposeWithoutStart_2400
     * @tc.desc Verify disposeWithoutStart for request fixture 1606, error 8300004, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_disposeWithoutStart_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('ext;1606');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1606');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_025
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_2500
     * @tc.desc Verify dispose for request fixture 1607, error 8300999, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001607');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001607');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_026
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_2600
     * @tc.desc Verify staleCompletion for request fixture 1608, error 201, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001608');
        expect(fixture.service.requests[0]).assertEqual('13800001608');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 1608'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13800001608');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_027
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_2700
     * @tc.desc Verify staleState for request fixture 1609, error 401, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001609');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001609');
        fixture.service.emit(0, 6, 'tel:13800001609');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        fixture.controller.dispose();
        fixture.service.emit(0, 0, 'tel:13800001609');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('tel:13800001609');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 1, 'tel:13800001609');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 2, 'tel:13800001609');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_028
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_2800
     * @tc.desc Verify restart for request fixture 1610, error 801, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001610');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('+8613800001610');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001610');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_029
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_2900
     * @tc.desc Verify unsubscribeRetry for request fixture 1611, error 8300001, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001611');
        expect(fixture.service.requests[0]).assertEqual('555-001611');
        fixture.service.unsubscribeFailure = makeFailure(8300001, 'fixture failure 1611');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.emit(0, 1, '555-001611');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_disposeWithoutStart_030
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_disposeWithoutStart_3000
     * @tc.desc Verify disposeWithoutStart for request fixture 1612, error 8300002, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_disposeWithoutStart_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start(' 555001612 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001612 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_031
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_3100
     * @tc.desc Verify dispose for request fixture 1613, error 8300003, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1613');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1613');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_032
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_3200
     * @tc.desc Verify staleCompletion for request fixture 1614, error 8300004, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1614');
        expect(fixture.service.requests[0]).assertEqual('ext;1614');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 1614'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('ext;1614');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_033
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_3300
     * @tc.desc Verify staleState for request fixture 1615, error 8300999, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001615');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001615');
        fixture.service.emit(0, 5, '\uff11\uff1300001615');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        fixture.controller.dispose();
        fixture.service.emit(0, 6, '\uff11\uff1300001615');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('\uff11\uff1300001615');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 0, '\uff11\uff1300001615');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 1, '\uff11\uff1300001615');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_034
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_3400
     * @tc.desc Verify restart for request fixture 1616, error 201, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001616');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13800001616');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001616');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_035
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_3500
     * @tc.desc Verify unsubscribeRetry for request fixture 1617, error 401, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001617');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001617');
        fixture.service.unsubscribeFailure = makeFailure(401, 'fixture failure 1617');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.emit(0, 0, 'tel:13800001617');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_disposeWithoutStart_036
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_disposeWithoutStart_3600
     * @tc.desc Verify disposeWithoutStart for request fixture 1618, error 801, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_disposeWithoutStart_036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('+8613800001618');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001618');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_dispose_037
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_dispose_3700
     * @tc.desc Verify dispose for request fixture 1619, error 8300001, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_dispose_037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001619');
        expect(fixture.service.requests[0]).assertEqual('555-001619');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleCompletion_038
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleCompletion_3800
     * @tc.desc Verify staleCompletion for request fixture 1620, error 8300002, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleCompletion_038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001620 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001620 ');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 1620'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start(' 555001620 ');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_staleState_039
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_staleState_3900
     * @tc.desc Verify staleState for request fixture 1621, error 8300003, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_staleState_039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1621');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1621');
        fixture.service.emit(0, 4, '13xxxx1621');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, '13xxxx1621');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13xxxx1621');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, '13xxxx1621');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, '13xxxx1621');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name SubscriptionTransitionValidation_restart_040
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_restart_4000
     * @tc.desc Verify restart for request fixture 1622, error 8300004, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_restart_040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1622');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('ext;1622');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1622');
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
     * @tc.name SubscriptionTransitionValidation_unsubscribeRetry_041
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionTransitionValidation_unsubscribeRetry_4100
     * @tc.desc Verify unsubscribeRetry for request fixture 1623, error 8300999, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionTransitionValidation_unsubscribeRetry_041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001623');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001623');
        fixture.service.unsubscribeFailure = makeFailure(8300999, 'fixture failure 1623');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.emit(0, 6, '\uff11\uff1300001623');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );
  });
}
