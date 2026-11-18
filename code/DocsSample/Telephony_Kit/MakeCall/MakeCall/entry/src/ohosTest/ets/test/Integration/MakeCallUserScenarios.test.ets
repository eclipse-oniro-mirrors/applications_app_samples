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

export default function MakeCallUserScenariosTest(): void {
  describe('MakeCallUserScenariosTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting MakeCallUserScenariosTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished MakeCallUserScenariosTest');
    });

    /**
     * @tc.name MakeCallUserScenarios_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 102, error 8300004, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_deferredSuccess_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;102');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;102');
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
     * @tc.name MakeCallUserScenarios_unsupported_002
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_unsupported_0200
     * @tc.desc Verify unsupported for request fixture 103, error 8300999, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_unsupported_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('\uff11\uff1300000103');
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
     * @tc.name MakeCallUserScenarios_makeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeError_0300
     * @tc.desc Verify makeError for request fixture 104, error 201, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeError_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(201, 'fixture failure 104');
        fixture.controller.start('13800000104');
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
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 104');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 105, error 401, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000105');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000105');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, 'tel:13800000105');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800000105');
        fixture.service.emit(0, 1, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_dispose_005
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_dispose_0500
     * @tc.desc Verify dispose for request fixture 106, error 801, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_dispose_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000106');
        expect(fixture.service.requests[0]).assertEqual('+8613800000106');
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
     * @tc.name MakeCallUserScenarios_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 107, error 8300001, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300001, 'fixture failure 107');
        fixture.controller.start('555-000107');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('555-000107');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-000107');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 108, error 8300002, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start(' 555000108 ');
          other.service.supported = false;
          other.controller.start(' 555000108 ');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual(' 555000108 ');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 108'));
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
     * @tc.name MakeCallUserScenarios_deferredSuccess_008
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_deferredSuccess_0800
     * @tc.desc Verify deferredSuccess for request fixture 109, error 8300003, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_deferredSuccess_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx109');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx109');
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
     * @tc.name MakeCallUserScenarios_unsupported_009
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_unsupported_0900
     * @tc.desc Verify unsupported for request fixture 110, error 8300004, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_unsupported_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 17; index++) {
          fixture.controller.start('ext;110');
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
     * @tc.name MakeCallUserScenarios_makeError_010
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeError_1000
     * @tc.desc Verify makeError for request fixture 111, error 8300999, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeError_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300999, 'fixture failure 111');
        fixture.controller.start('\uff11\uff1300000111');
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
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 111');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_stateEvents_011
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_stateEvents_1100
     * @tc.desc Verify stateEvents for request fixture 112, error 201, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_stateEvents_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000112');
        expect(fixture.service.requests[0]).assertEqual('13800000112');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, '13800000112');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('13800000112');
        fixture.service.emit(0, 1, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_dispose_012
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_dispose_1200
     * @tc.desc Verify dispose for request fixture 113, error 401, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_dispose_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000113');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000113');
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
     * @tc.name MakeCallUserScenarios_makeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeRetry_1300
     * @tc.desc Verify makeRetry for request fixture 114, error 801, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeRetry_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(801, 'fixture failure 114');
        fixture.controller.start('+8613800000114');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('+8613800000114');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800000114');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_independentControllers_014
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_independentControllers_1400
     * @tc.desc Verify independentControllers for request fixture 115, error 8300001, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_independentControllers_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('555-000115');
          other.service.supported = false;
          other.controller.start('555-000115');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('555-000115');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 115'));
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
     * @tc.name MakeCallUserScenarios_deferredSuccess_015
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_deferredSuccess_1500
     * @tc.desc Verify deferredSuccess for request fixture 116, error 8300002, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_deferredSuccess_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000116 ');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000116 ');
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
     * @tc.name MakeCallUserScenarios_unsupported_016
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_unsupported_1600
     * @tc.desc Verify unsupported for request fixture 117, error 8300003, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_unsupported_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 5; index++) {
          fixture.controller.start('13xxxx117');
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
     * @tc.name MakeCallUserScenarios_makeError_017
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeError_1700
     * @tc.desc Verify makeError for request fixture 118, error 8300004, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeError_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 118');
        fixture.controller.start('ext;118');
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
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 118');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_stateEvents_018
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_stateEvents_1800
     * @tc.desc Verify stateEvents for request fixture 119, error 8300999, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_stateEvents_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000119');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000119');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, '\uff11\uff1300000119');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300000119');
        fixture.service.emit(0, 1, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_dispose_1900
     * @tc.desc Verify dispose for request fixture 120, error 201, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_dispose_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000120');
        expect(fixture.service.requests[0]).assertEqual('13800000120');
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
     * @tc.name MakeCallUserScenarios_makeRetry_020
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeRetry_2000
     * @tc.desc Verify makeRetry for request fixture 121, error 401, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeRetry_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(401, 'fixture failure 121');
        fixture.controller.start('tel:13800000121');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('tel:13800000121');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000121');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_independentControllers_021
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_independentControllers_2100
     * @tc.desc Verify independentControllers for request fixture 122, error 801, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_independentControllers_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('+8613800000122');
          other.service.supported = false;
          other.controller.start('+8613800000122');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('+8613800000122');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 122'));
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
     * @tc.name MakeCallUserScenarios_deferredSuccess_022
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_deferredSuccess_2200
     * @tc.desc Verify deferredSuccess for request fixture 123, error 8300001, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_deferredSuccess_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000123');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-000123');
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
     * @tc.name MakeCallUserScenarios_unsupported_023
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_unsupported_2300
     * @tc.desc Verify unsupported for request fixture 124, error 8300002, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_unsupported_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 12; index++) {
          fixture.controller.start(' 555000124 ');
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
     * @tc.name MakeCallUserScenarios_makeError_024
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeError_2400
     * @tc.desc Verify makeError for request fixture 125, error 8300003, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeError_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300003, 'fixture failure 125');
        fixture.controller.start('13xxxx125');
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
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 125');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_stateEvents_025
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_stateEvents_2500
     * @tc.desc Verify stateEvents for request fixture 126, error 8300004, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_stateEvents_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;126');
        expect(fixture.service.requests[0]).assertEqual('ext;126');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, 'ext;126');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('ext;126');
        fixture.service.emit(0, 1, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallUserScenarios_dispose_026
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_dispose_2600
     * @tc.desc Verify dispose for request fixture 127, error 8300999, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_dispose_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000127');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000127');
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
     * @tc.name MakeCallUserScenarios_makeRetry_027
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallUserScenarios_makeRetry_2700
     * @tc.desc Verify makeRetry for request fixture 128, error 201, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallUserScenarios_makeRetry_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(201, 'fixture failure 128');
        fixture.controller.start('13800000128');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('13800000128');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800000128');
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
