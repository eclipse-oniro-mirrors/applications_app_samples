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

export default function ListenerOwnershipValidationTest(): void {
  describe('ListenerOwnershipValidationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting ListenerOwnershipValidationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished ListenerOwnershipValidationTest');
    });

    /**
     * @tc.name ListenerOwnershipValidation_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_0100
     * @tc.desc Verify dispose for request fixture 1624, error 201, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001624');
        expect(fixture.service.requests[0]).assertEqual('13800001624');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 1625, error 401, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001625');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001625');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(401, 'fixture failure 1625'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('tel:13800001625');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_0300
     * @tc.desc Verify staleState for request fixture 1626, error 801, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001626');
        expect(fixture.service.requests[0]).assertEqual('+8613800001626');
        fixture.service.emit(0, 2, '+8613800001626');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        fixture.controller.dispose();
        fixture.service.emit(0, 3, '+8613800001626');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('+8613800001626');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 4, '+8613800001626');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 5, '+8613800001626');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(5);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_0400
     * @tc.desc Verify restart for request fixture 1627, error 8300001, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001627');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('555-001627');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('555-001627');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 1628, error 8300002, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001628 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001628 ');
        fixture.service.unsubscribeFailure = makeFailure(8300002, 'fixture failure 1628');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.emit(0, 4, ' 555001628 ');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 1629, error 8300003, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('13xxxx1629');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1629');
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
     * @tc.name ListenerOwnershipValidation_dispose_007
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_0700
     * @tc.desc Verify dispose for request fixture 1630, error 8300004, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1630');
        expect(fixture.service.requests[0]).assertEqual('ext;1630');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 1631, error 8300999, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001631');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001631');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 1631'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('\uff11\uff1300001631');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_0900
     * @tc.desc Verify staleState for request fixture 1632, error 201, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001632');
        expect(fixture.service.requests[0]).assertEqual('13800001632');
        fixture.service.emit(0, 1, '13800001632');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        fixture.controller.dispose();
        fixture.service.emit(0, 2, '13800001632');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13800001632');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 3, '13800001632');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 4, '13800001632');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(4);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_1000
     * @tc.desc Verify restart for request fixture 1633, error 401, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001633');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('tel:13800001633');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('tel:13800001633');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_1100
     * @tc.desc Verify unsubscribeRetry for request fixture 1634, error 801, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001634');
        expect(fixture.service.requests[0]).assertEqual('+8613800001634');
        fixture.service.unsubscribeFailure = makeFailure(801, 'fixture failure 1634');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.emit(0, 3, '+8613800001634');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_012
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_1200
     * @tc.desc Verify disposeWithoutStart for request fixture 1635, error 8300001, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('555-001635');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001635');
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
     * @tc.name ListenerOwnershipValidation_dispose_013
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_1300
     * @tc.desc Verify dispose for request fixture 1636, error 8300002, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001636 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001636 ');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_014
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_1400
     * @tc.desc Verify staleCompletion for request fixture 1637, error 8300003, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1637');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1637');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300003, 'fixture failure 1637'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13xxxx1637');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_015
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_1500
     * @tc.desc Verify staleState for request fixture 1638, error 8300004, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1638');
        expect(fixture.service.requests[0]).assertEqual('ext;1638');
        fixture.service.emit(0, 0, 'ext;1638');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        fixture.controller.dispose();
        fixture.service.emit(0, 1, 'ext;1638');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('ext;1638');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 2, 'ext;1638');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 3, 'ext;1638');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_016
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_1600
     * @tc.desc Verify restart for request fixture 1639, error 8300999, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001639');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('\uff11\uff1300001639');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('\uff11\uff1300001639');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_1700
     * @tc.desc Verify unsubscribeRetry for request fixture 1640, error 201, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001640');
        expect(fixture.service.requests[0]).assertEqual('13800001640');
        fixture.service.unsubscribeFailure = makeFailure(201, 'fixture failure 1640');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.emit(0, 2, '13800001640');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_018
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_1800
     * @tc.desc Verify disposeWithoutStart for request fixture 1641, error 401, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('tel:13800001641');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001641');
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
     * @tc.name ListenerOwnershipValidation_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_1900
     * @tc.desc Verify dispose for request fixture 1642, error 801, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001642');
        expect(fixture.service.requests[0]).assertEqual('+8613800001642');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_020
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_2000
     * @tc.desc Verify staleCompletion for request fixture 1643, error 8300001, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001643');
        expect(fixture.service.requests[0]).assertEqual('555-001643');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 1643'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('555-001643');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_021
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_2100
     * @tc.desc Verify staleState for request fixture 1644, error 8300002, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001644 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001644 ');
        fixture.service.emit(0, 6, ' 555001644 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        fixture.controller.dispose();
        fixture.service.emit(0, 0, ' 555001644 ');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start(' 555001644 ');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 1, ' 555001644 ');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 2, ' 555001644 ');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_022
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_2200
     * @tc.desc Verify restart for request fixture 1645, error 8300003, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1645');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13xxxx1645');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13xxxx1645');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_023
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_2300
     * @tc.desc Verify unsubscribeRetry for request fixture 1646, error 8300004, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1646');
        expect(fixture.service.requests[0]).assertEqual('ext;1646');
        fixture.service.unsubscribeFailure = makeFailure(8300004, 'fixture failure 1646');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.emit(0, 1, 'ext;1646');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_024
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_2400
     * @tc.desc Verify disposeWithoutStart for request fixture 1647, error 8300999, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('\uff11\uff1300001647');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001647');
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
     * @tc.name ListenerOwnershipValidation_dispose_025
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_2500
     * @tc.desc Verify dispose for request fixture 1648, error 201, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001648');
        expect(fixture.service.requests[0]).assertEqual('13800001648');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_026
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_2600
     * @tc.desc Verify staleCompletion for request fixture 1649, error 401, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001649');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001649');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(401, 'fixture failure 1649'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('tel:13800001649');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_027
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_2700
     * @tc.desc Verify staleState for request fixture 1650, error 801, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001650');
        expect(fixture.service.requests[0]).assertEqual('+8613800001650');
        fixture.service.emit(0, 5, '+8613800001650');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        fixture.controller.dispose();
        fixture.service.emit(0, 6, '+8613800001650');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('+8613800001650');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 0, '+8613800001650');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 1, '+8613800001650');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_028
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_2800
     * @tc.desc Verify restart for request fixture 1651, error 8300001, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001651');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('555-001651');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('555-001651');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_029
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_2900
     * @tc.desc Verify unsubscribeRetry for request fixture 1652, error 8300002, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001652 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001652 ');
        fixture.service.unsubscribeFailure = makeFailure(8300002, 'fixture failure 1652');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.emit(0, 0, ' 555001652 ');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_030
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_3000
     * @tc.desc Verify disposeWithoutStart for request fixture 1653, error 8300003, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('13xxxx1653');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1653');
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
     * @tc.name ListenerOwnershipValidation_dispose_031
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_3100
     * @tc.desc Verify dispose for request fixture 1654, error 8300004, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1654');
        expect(fixture.service.requests[0]).assertEqual('ext;1654');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_032
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_3200
     * @tc.desc Verify staleCompletion for request fixture 1655, error 8300999, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001655');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001655');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 1655'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('\uff11\uff1300001655');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_033
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_3300
     * @tc.desc Verify staleState for request fixture 1656, error 201, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001656');
        expect(fixture.service.requests[0]).assertEqual('13800001656');
        fixture.service.emit(0, 4, '13800001656');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, '13800001656');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13800001656');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, '13800001656');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, '13800001656');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_034
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_3400
     * @tc.desc Verify restart for request fixture 1657, error 401, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001657');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('tel:13800001657');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('tel:13800001657');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_035
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_3500
     * @tc.desc Verify unsubscribeRetry for request fixture 1658, error 801, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001658');
        expect(fixture.service.requests[0]).assertEqual('+8613800001658');
        fixture.service.unsubscribeFailure = makeFailure(801, 'fixture failure 1658');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.emit(0, 6, '+8613800001658');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_036
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_3600
     * @tc.desc Verify disposeWithoutStart for request fixture 1659, error 8300001, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('555-001659');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001659');
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
     * @tc.name ListenerOwnershipValidation_dispose_037
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_3700
     * @tc.desc Verify dispose for request fixture 1660, error 8300002, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001660 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001660 ');
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
     * @tc.name ListenerOwnershipValidation_staleCompletion_038
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleCompletion_3800
     * @tc.desc Verify staleCompletion for request fixture 1661, error 8300003, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleCompletion_038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1661');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1661');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300003, 'fixture failure 1661'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13xxxx1661');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_staleState_039
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_staleState_3900
     * @tc.desc Verify staleState for request fixture 1662, error 8300004, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_staleState_039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1662');
        expect(fixture.service.requests[0]).assertEqual('ext;1662');
        fixture.service.emit(0, 3, 'ext;1662');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, 'ext;1662');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('ext;1662');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, 'ext;1662');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, 'ext;1662');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_restart_040
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_restart_4000
     * @tc.desc Verify restart for request fixture 1663, error 8300999, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_restart_040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001663');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('\uff11\uff1300001663');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('\uff11\uff1300001663');
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
     * @tc.name ListenerOwnershipValidation_unsubscribeRetry_041
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_unsubscribeRetry_4100
     * @tc.desc Verify unsubscribeRetry for request fixture 1664, error 201, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_unsubscribeRetry_041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001664');
        expect(fixture.service.requests[0]).assertEqual('13800001664');
        fixture.service.unsubscribeFailure = makeFailure(201, 'fixture failure 1664');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.emit(0, 5, '13800001664');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ListenerOwnershipValidation_disposeWithoutStart_042
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_disposeWithoutStart_4200
     * @tc.desc Verify disposeWithoutStart for request fixture 1665, error 401, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_disposeWithoutStart_042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('tel:13800001665');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001665');
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
     * @tc.name ListenerOwnershipValidation_dispose_043
     * @tc.number SUB_TELEPHONY_MAKECALL_ListenerOwnershipValidation_dispose_4300
     * @tc.desc Verify dispose for request fixture 1666, error 801, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ListenerOwnershipValidation_dispose_043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001666');
        expect(fixture.service.requests[0]).assertEqual('+8613800001666');
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
  });
}
