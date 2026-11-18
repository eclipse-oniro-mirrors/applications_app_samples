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

export default function CallServiceIntegrationTest(): void {
  describe('CallServiceIntegrationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallServiceIntegrationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallServiceIntegrationTest');
    });

    /**
     * @tc.name CallServiceIntegration_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 89, error 401, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_deferredSuccess_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000089');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000089');
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
     * @tc.name CallServiceIntegration_unsupported_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_unsupported_0200
     * @tc.desc Verify unsupported for request fixture 90, error 801, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_unsupported_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 16; index++) {
          fixture.controller.start('+8613800000090');
        }
        expect(fixture.service.capabilityChecks).assertEqual(16);
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
     * @tc.name CallServiceIntegration_makeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_makeError_0300
     * @tc.desc Verify makeError for request fixture 91, error 8300001, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_makeError_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300001, 'fixture failure 91');
        fixture.controller.start('555-000091');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 91');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallServiceIntegration_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 92, error 8300002, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000092 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000092 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, ' 555000092 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual(' 555000092 ');
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
     * @tc.name CallServiceIntegration_dispose_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_dispose_0500
     * @tc.desc Verify dispose for request fixture 93, error 8300003, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_dispose_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx93');
        expect(fixture.service.requests[0]).assertEqual('13xxxx93');
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
     * @tc.name CallServiceIntegration_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 94, error 8300004, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 94');
        fixture.controller.start('ext;94');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('ext;94');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;94');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceIntegration_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 95, error 8300999, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('\uff11\uff1300000095');
          other.service.supported = false;
          other.controller.start('\uff11\uff1300000095');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000095');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 95'));
          expect(fixture.logger.failures[0].code).assertEqual(8300999);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name CallServiceIntegration_deferredSuccess_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_deferredSuccess_0800
     * @tc.desc Verify deferredSuccess for request fixture 96, error 201, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_deferredSuccess_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000096');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800000096');
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
     * @tc.name CallServiceIntegration_unsupported_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_unsupported_0900
     * @tc.desc Verify unsupported for request fixture 97, error 401, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_unsupported_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 4; index++) {
          fixture.controller.start('tel:13800000097');
        }
        expect(fixture.service.capabilityChecks).assertEqual(4);
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
     * @tc.name CallServiceIntegration_makeError_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_makeError_1000
     * @tc.desc Verify makeError for request fixture 98, error 801, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_makeError_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(801, 'fixture failure 98');
        fixture.controller.start('+8613800000098');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 98');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallServiceIntegration_stateEvents_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_stateEvents_1100
     * @tc.desc Verify stateEvents for request fixture 99, error 8300001, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_stateEvents_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000099');
        expect(fixture.service.requests[0]).assertEqual('555-000099');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '555-000099');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('555-000099');
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
     * @tc.name CallServiceIntegration_dispose_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_dispose_1200
     * @tc.desc Verify dispose for request fixture 100, error 8300002, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_dispose_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000100 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000100 ');
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
     * @tc.name CallServiceIntegration_makeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceIntegration_makeRetry_1300
     * @tc.desc Verify makeRetry for request fixture 101, error 8300003, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceIntegration_makeRetry_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300003, 'fixture failure 101');
        fixture.controller.start('13xxxx101');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('13xxxx101');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx101');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );
  });
}
