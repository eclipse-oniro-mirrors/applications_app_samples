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

export default function MakeCallOperationFlowTest(): void {
  describe('MakeCallOperationFlowTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting MakeCallOperationFlowTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished MakeCallOperationFlowTest');
    });

    /**
     * @tc.name MakeCallOperationFlow_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 1109, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_deferredSuccess_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1109');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1109');
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
     * @tc.name MakeCallOperationFlow_unsupported_002
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_unsupported_0200
     * @tc.desc Verify unsupported for request fixture 1110, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_unsupported_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('ext;1110');
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
     * @tc.name MakeCallOperationFlow_makeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeError_0300
     * @tc.desc Verify makeError for request fixture 1111, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeError_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300999, 'fixture failure 1111');
        fixture.controller.start('\uff11\uff1300001111');
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
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1111');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 1112, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001112');
        expect(fixture.service.requests[0]).assertEqual('13800001112');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '13800001112');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('13800001112');
        fixture.service.emit(0, 0, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_dispose_005
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_dispose_0500
     * @tc.desc Verify dispose for request fixture 1113, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_dispose_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001113');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001113');
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
     * @tc.name MakeCallOperationFlow_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 1114, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(801, 'fixture failure 1114');
        fixture.controller.start('+8613800001114');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('+8613800001114');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001114');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 1115, error 8300001, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('555-001115');
          other.service.supported = false;
          other.controller.start('555-001115');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('555-001115');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 1115'));
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
     * @tc.name MakeCallOperationFlow_deferredSuccess_008
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_deferredSuccess_0800
     * @tc.desc Verify deferredSuccess for request fixture 1116, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_deferredSuccess_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001116 ');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001116 ');
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
     * @tc.name MakeCallOperationFlow_unsupported_009
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_unsupported_0900
     * @tc.desc Verify unsupported for request fixture 1117, error 8300003, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_unsupported_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 17; index++) {
          fixture.controller.start('13xxxx1117');
        }
        expect(fixture.service.capabilityChecks).assertEqual(17);
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
     * @tc.name MakeCallOperationFlow_makeError_010
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeError_1000
     * @tc.desc Verify makeError for request fixture 1118, error 8300004, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeError_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 1118');
        fixture.controller.start('ext;1118');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1118');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_stateEvents_011
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_stateEvents_1100
     * @tc.desc Verify stateEvents for request fixture 1119, error 8300999, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_stateEvents_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001119');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001119');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '\uff11\uff1300001119');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001119');
        fixture.service.emit(0, 0, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_dispose_012
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_dispose_1200
     * @tc.desc Verify dispose for request fixture 1120, error 201, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_dispose_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001120');
        expect(fixture.service.requests[0]).assertEqual('13800001120');
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
     * @tc.name MakeCallOperationFlow_makeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeRetry_1300
     * @tc.desc Verify makeRetry for request fixture 1121, error 401, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeRetry_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(401, 'fixture failure 1121');
        fixture.controller.start('tel:13800001121');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('tel:13800001121');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001121');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_independentControllers_014
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_independentControllers_1400
     * @tc.desc Verify independentControllers for request fixture 1122, error 801, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_independentControllers_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('+8613800001122');
          other.service.supported = false;
          other.controller.start('+8613800001122');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('+8613800001122');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 1122'));
          expect(fixture.logger.failures[0].code).assertEqual(801);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_deferredSuccess_015
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_deferredSuccess_1500
     * @tc.desc Verify deferredSuccess for request fixture 1123, error 8300001, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_deferredSuccess_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001123');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001123');
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
     * @tc.name MakeCallOperationFlow_unsupported_016
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_unsupported_1600
     * @tc.desc Verify unsupported for request fixture 1124, error 8300002, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_unsupported_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 5; index++) {
          fixture.controller.start(' 555001124 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(5);
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
     * @tc.name MakeCallOperationFlow_makeError_017
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeError_1700
     * @tc.desc Verify makeError for request fixture 1125, error 8300003, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeError_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300003, 'fixture failure 1125');
        fixture.controller.start('13xxxx1125');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1125');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_stateEvents_018
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_stateEvents_1800
     * @tc.desc Verify stateEvents for request fixture 1126, error 8300004, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_stateEvents_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1126');
        expect(fixture.service.requests[0]).assertEqual('ext;1126');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, 'ext;1126');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('ext;1126');
        fixture.service.emit(0, 0, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_dispose_1900
     * @tc.desc Verify dispose for request fixture 1127, error 8300999, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_dispose_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001127');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001127');
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
     * @tc.name MakeCallOperationFlow_makeRetry_020
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeRetry_2000
     * @tc.desc Verify makeRetry for request fixture 1128, error 201, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeRetry_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(201, 'fixture failure 1128');
        fixture.controller.start('13800001128');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('13800001128');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001128');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_independentControllers_021
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_independentControllers_2100
     * @tc.desc Verify independentControllers for request fixture 1129, error 401, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_independentControllers_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('tel:13800001129');
          other.service.supported = false;
          other.controller.start('tel:13800001129');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('tel:13800001129');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(401, 'fixture failure 1129'));
          expect(fixture.logger.failures[0].code).assertEqual(401);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_deferredSuccess_022
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_deferredSuccess_2200
     * @tc.desc Verify deferredSuccess for request fixture 1130, error 801, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_deferredSuccess_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001130');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001130');
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
     * @tc.name MakeCallOperationFlow_unsupported_023
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_unsupported_2300
     * @tc.desc Verify unsupported for request fixture 1131, error 8300001, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_unsupported_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('555-001131');
        }
        expect(fixture.service.capabilityChecks).assertEqual(12);
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
     * @tc.name MakeCallOperationFlow_makeError_024
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeError_2400
     * @tc.desc Verify makeError for request fixture 1132, error 8300002, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeError_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300002, 'fixture failure 1132');
        fixture.controller.start(' 555001132 ');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1132');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_stateEvents_025
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_stateEvents_2500
     * @tc.desc Verify stateEvents for request fixture 1133, error 8300003, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_stateEvents_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1133');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1133');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '13xxxx1133');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx1133');
        fixture.service.emit(0, 0, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_dispose_026
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_dispose_2600
     * @tc.desc Verify dispose for request fixture 1134, error 8300004, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_dispose_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1134');
        expect(fixture.service.requests[0]).assertEqual('ext;1134');
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
     * @tc.name MakeCallOperationFlow_makeRetry_027
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeRetry_2700
     * @tc.desc Verify makeRetry for request fixture 1135, error 8300999, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeRetry_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300999, 'fixture failure 1135');
        fixture.controller.start('\uff11\uff1300001135');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('\uff11\uff1300001135');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001135');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_independentControllers_028
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_independentControllers_2800
     * @tc.desc Verify independentControllers for request fixture 1136, error 201, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_independentControllers_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('13800001136');
          other.service.supported = false;
          other.controller.start('13800001136');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('13800001136');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 1136'));
          expect(fixture.logger.failures[0].code).assertEqual(201);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_deferredSuccess_029
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_deferredSuccess_2900
     * @tc.desc Verify deferredSuccess for request fixture 1137, error 401, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_deferredSuccess_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001137');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001137');
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
     * @tc.name MakeCallOperationFlow_unsupported_030
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_unsupported_3000
     * @tc.desc Verify unsupported for request fixture 1138, error 801, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_unsupported_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 19; index++) {
          fixture.controller.start('+8613800001138');
        }
        expect(fixture.service.capabilityChecks).assertEqual(19);
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
     * @tc.name MakeCallOperationFlow_makeError_031
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeError_3100
     * @tc.desc Verify makeError for request fixture 1139, error 8300001, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeError_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300001, 'fixture failure 1139');
        fixture.controller.start('555-001139');
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
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1139');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_stateEvents_032
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_stateEvents_3200
     * @tc.desc Verify stateEvents for request fixture 1140, error 8300002, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_stateEvents_032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001140 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001140 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, ' 555001140 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual(' 555001140 ');
        fixture.service.emit(0, 0, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_dispose_033
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_dispose_3300
     * @tc.desc Verify dispose for request fixture 1141, error 8300003, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_dispose_033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1141');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1141');
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
     * @tc.name MakeCallOperationFlow_makeRetry_034
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_makeRetry_3400
     * @tc.desc Verify makeRetry for request fixture 1142, error 8300004, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_makeRetry_034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 1142');
        fixture.controller.start('ext;1142');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('ext;1142');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1142');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationFlow_independentControllers_035
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_independentControllers_3500
     * @tc.desc Verify independentControllers for request fixture 1143, error 8300999, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_independentControllers_035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('\uff11\uff1300001143');
          other.service.supported = false;
          other.controller.start('\uff11\uff1300001143');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001143');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 1143'));
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
     * @tc.name MakeCallOperationFlow_deferredSuccess_036
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationFlow_deferredSuccess_3600
     * @tc.desc Verify deferredSuccess for request fixture 1144, error 201, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationFlow_deferredSuccess_036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001144');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001144');
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
