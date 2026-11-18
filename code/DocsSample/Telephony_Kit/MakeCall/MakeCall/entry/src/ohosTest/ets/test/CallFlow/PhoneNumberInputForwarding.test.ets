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

export default function PhoneNumberInputForwardingTest(): void {
  describe('PhoneNumberInputForwardingTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting PhoneNumberInputForwardingTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished PhoneNumberInputForwardingTest');
    });

    /**
     * @tc.name PhoneNumberInputForwarding_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 943, error 8300999, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_deferredSuccess_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000943');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000943');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_unsupported_002
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_unsupported_0200
     * @tc.desc Verify unsupported for request fixture 944, error 201, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_unsupported_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 15; index++) {
          fixture.controller.start('13800000944');
        }
        expect(fixture.service.capabilityChecks).assertEqual(15);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_makeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_makeError_0300
     * @tc.desc Verify makeError for request fixture 945, error 401, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_makeError_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(401, 'fixture failure 945');
        fixture.controller.start('tel:13800000945');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 945');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 946, error 801, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000946');
        expect(fixture.service.requests[0]).assertEqual('+8613800000946');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '+8613800000946');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800000946');
        fixture.service.emit(0, 2, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_dispose_005
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_dispose_0500
     * @tc.desc Verify dispose for request fixture 947, error 8300001, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_dispose_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000947');
        expect(fixture.service.requests[0]).assertEqual('555-000947');
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
     * @tc.name PhoneNumberInputForwarding_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 948, error 8300002, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300002, 'fixture failure 948');
        fixture.controller.start(' 555000948 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start(' 555000948 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000948 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 949, error 8300003, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('13xxxx949');
          other.service.supported = false;
          other.controller.start('13xxxx949');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('13xxxx949');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300003, 'fixture failure 949'));
          expect(fixture.logger.failures[0].code).assertEqual(8300003);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_deferredSuccess_008
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_deferredSuccess_0800
     * @tc.desc Verify deferredSuccess for request fixture 950, error 8300004, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_deferredSuccess_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;950');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;950');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_unsupported_009
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_unsupported_0900
     * @tc.desc Verify unsupported for request fixture 951, error 8300999, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_unsupported_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('\uff11\uff1300000951');
        }
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_makeError_010
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_makeError_1000
     * @tc.desc Verify makeError for request fixture 952, error 201, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_makeError_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(201, 'fixture failure 952');
        fixture.controller.start('13800000952');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 952');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_stateEvents_011
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_stateEvents_1100
     * @tc.desc Verify stateEvents for request fixture 953, error 401, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_stateEvents_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000953');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000953');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, 'tel:13800000953');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800000953');
        fixture.service.emit(0, 2, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_dispose_012
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_dispose_1200
     * @tc.desc Verify dispose for request fixture 954, error 801, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_dispose_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000954');
        expect(fixture.service.requests[0]).assertEqual('+8613800000954');
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
     * @tc.name PhoneNumberInputForwarding_makeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_makeRetry_1300
     * @tc.desc Verify makeRetry for request fixture 955, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_makeRetry_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300001, 'fixture failure 955');
        fixture.controller.start('555-000955');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('555-000955');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-000955');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_independentControllers_014
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_independentControllers_1400
     * @tc.desc Verify independentControllers for request fixture 956, error 8300002, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_independentControllers_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start(' 555000956 ');
          other.service.supported = false;
          other.controller.start(' 555000956 ');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual(' 555000956 ');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 956'));
          expect(fixture.logger.failures[0].code).assertEqual(8300002);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_deferredSuccess_015
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_deferredSuccess_1500
     * @tc.desc Verify deferredSuccess for request fixture 957, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_deferredSuccess_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx957');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx957');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_unsupported_016
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_unsupported_1600
     * @tc.desc Verify unsupported for request fixture 958, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_unsupported_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('ext;958');
        }
        expect(fixture.service.capabilityChecks).assertEqual(10);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_makeError_017
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_makeError_1700
     * @tc.desc Verify makeError for request fixture 959, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_makeError_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300999, 'fixture failure 959');
        fixture.controller.start('\uff11\uff1300000959');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 959');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_stateEvents_018
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_stateEvents_1800
     * @tc.desc Verify stateEvents for request fixture 960, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_stateEvents_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000960');
        expect(fixture.service.requests[0]).assertEqual('13800000960');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '13800000960');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13800000960');
        fixture.service.emit(0, 2, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_dispose_1900
     * @tc.desc Verify dispose for request fixture 961, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_dispose_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000961');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000961');
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
     * @tc.name PhoneNumberInputForwarding_makeRetry_020
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_makeRetry_2000
     * @tc.desc Verify makeRetry for request fixture 962, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_makeRetry_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(801, 'fixture failure 962');
        fixture.controller.start('+8613800000962');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('+8613800000962');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800000962');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_independentControllers_021
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_independentControllers_2100
     * @tc.desc Verify independentControllers for request fixture 963, error 8300001, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_independentControllers_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('555-000963');
          other.service.supported = false;
          other.controller.start('555-000963');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('555-000963');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 963'));
          expect(fixture.logger.failures[0].code).assertEqual(8300001);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name PhoneNumberInputForwarding_deferredSuccess_022
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberInputForwarding_deferredSuccess_2200
     * @tc.desc Verify deferredSuccess for request fixture 964, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberInputForwarding_deferredSuccess_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000964 ');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000964 ');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );
  });
}
