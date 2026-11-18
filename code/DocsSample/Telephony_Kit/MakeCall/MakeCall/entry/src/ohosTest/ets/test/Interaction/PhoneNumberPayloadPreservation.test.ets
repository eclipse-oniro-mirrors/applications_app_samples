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

export default function PhoneNumberPayloadPreservationTest(): void {
  describe('PhoneNumberPayloadPreservationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting PhoneNumberPayloadPreservationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished PhoneNumberPayloadPreservationTest');
    });

    /**
     * @tc.name PhoneNumberPayloadPreservation_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 193, error 401, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_deferredSuccess_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000193');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000193');
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
     * @tc.name PhoneNumberPayloadPreservation_deferredFailure_002
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_deferredFailure_0200
     * @tc.desc Verify deferredFailure for request fixture 194, error 801, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_deferredFailure_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000194');
        expect(fixture.service.requests[0]).assertEqual('+8613800000194');
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 194'));
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('makeCall');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 194');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_immediateFailure_003
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_immediateFailure_0300
     * @tc.desc Verify immediateFailure for request fixture 195, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_immediateFailure_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.immediateCompletion = true;
        fixture.service.completionFailure = makeFailure(8300001, 'fixture failure 195');
        fixture.controller.start('555-000195');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-000195');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('makeCall');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 195');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_reverseCallbacks_004
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_reverseCallbacks_0400
     * @tc.desc Verify reverseCallbacks for request fixture 196, error 8300002, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_reverseCallbacks_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000196 ');
        fixture.controller.start('tel:555000196');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual(' 555000196 ');
        expect(fixture.service.requests[1]).assertEqual('tel:555000196');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300002, 'fixture failure 196'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.logger.failures[0].operation).assertEqual('makeCall');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_immediateSuccess_005
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_immediateSuccess_0500
     * @tc.desc Verify immediateSuccess for request fixture 197, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_immediateSuccess_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.immediateCompletion = true;
        fixture.controller.start('13xxxx197');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx197');
        expect(fixture.service.completions.length).assertEqual(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 1, '13xxxx197');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx197');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_deferredSuccess_006
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_deferredSuccess_0600
     * @tc.desc Verify deferredSuccess for request fixture 198, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_deferredSuccess_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;198');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;198');
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
     * @tc.name PhoneNumberPayloadPreservation_deferredFailure_007
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_deferredFailure_0700
     * @tc.desc Verify deferredFailure for request fixture 199, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_deferredFailure_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000199');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000199');
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 199'));
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('makeCall');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 199');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_immediateFailure_008
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_immediateFailure_0800
     * @tc.desc Verify immediateFailure for request fixture 200, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_immediateFailure_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.immediateCompletion = true;
        fixture.service.completionFailure = makeFailure(201, 'fixture failure 200');
        fixture.controller.start('13800000200');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800000200');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('makeCall');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 200');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_reverseCallbacks_009
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_reverseCallbacks_0900
     * @tc.desc Verify reverseCallbacks for request fixture 201, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_reverseCallbacks_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000201');
        fixture.controller.start('tel:555000201');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000201');
        expect(fixture.service.requests[1]).assertEqual('tel:555000201');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(401, 'fixture failure 201'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].operation).assertEqual('makeCall');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name PhoneNumberPayloadPreservation_immediateSuccess_010
     * @tc.number SUB_TELEPHONY_MAKECALL_PhoneNumberPayloadPreservation_immediateSuccess_1000
     * @tc.desc Verify immediateSuccess for request fixture 202, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'PhoneNumberPayloadPreservation_immediateSuccess_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.immediateCompletion = true;
        fixture.controller.start('+8613800000202');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800000202');
        expect(fixture.service.completions.length).assertEqual(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 6, '+8613800000202');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('+8613800000202');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );
  });
}
