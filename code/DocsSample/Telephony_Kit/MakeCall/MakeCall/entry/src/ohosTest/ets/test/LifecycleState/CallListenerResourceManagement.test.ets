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

export default function CallListenerResourceManagementTest(): void {
  describe('CallListenerResourceManagementTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallListenerResourceManagementTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallListenerResourceManagementTest');
    });

    /**
     * @tc.name CallListenerResourceManagement_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_dispose_0100
     * @tc.desc Verify dispose for request fixture 639, error 8300999, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_dispose_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000639');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000639');
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
     * @tc.name CallListenerResourceManagement_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 640, error 201, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000640');
        expect(fixture.service.requests[0]).assertEqual('13800000640');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 640'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13800000640');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallListenerResourceManagement_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_staleState_0300
     * @tc.desc Verify staleState for request fixture 641, error 401, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000641');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000641');
        fixture.service.emit(0, 4, 'tel:13800000641');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, 'tel:13800000641');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('tel:13800000641');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, 'tel:13800000641');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, 'tel:13800000641');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallListenerResourceManagement_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_restart_0400
     * @tc.desc Verify restart for request fixture 642, error 801, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_restart_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000642');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('+8613800000642');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800000642');
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
     * @tc.name CallListenerResourceManagement_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 643, error 8300001, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000643');
        expect(fixture.service.requests[0]).assertEqual('555-000643');
        fixture.service.unsubscribeFailure = makeFailure(8300001, 'fixture failure 643');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.emit(0, 6, '555-000643');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallListenerResourceManagement_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 644, error 8300002, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start(' 555000644 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000644 ');
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
     * @tc.name CallListenerResourceManagement_dispose_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_dispose_0700
     * @tc.desc Verify dispose for request fixture 645, error 8300003, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_dispose_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx645');
        expect(fixture.service.requests[0]).assertEqual('13xxxx645');
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
     * @tc.name CallListenerResourceManagement_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 646, error 8300004, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;646');
        expect(fixture.service.requests[0]).assertEqual('ext;646');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 646'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('ext;646');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallListenerResourceManagement_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_staleState_0900
     * @tc.desc Verify staleState for request fixture 647, error 8300999, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000647');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000647');
        fixture.service.emit(0, 3, '\uff11\uff1300000647');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, '\uff11\uff1300000647');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('\uff11\uff1300000647');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, '\uff11\uff1300000647');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, '\uff11\uff1300000647');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallListenerResourceManagement_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_restart_1000
     * @tc.desc Verify restart for request fixture 648, error 201, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000648');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13800000648');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800000648');
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
     * @tc.name CallListenerResourceManagement_unsubscribeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_unsubscribeRetry_1100
     * @tc.desc Verify unsubscribeRetry for request fixture 649, error 401, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_unsubscribeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000649');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000649');
        fixture.service.unsubscribeFailure = makeFailure(401, 'fixture failure 649');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.emit(0, 5, 'tel:13800000649');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallListenerResourceManagement_disposeWithoutStart_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_disposeWithoutStart_1200
     * @tc.desc Verify disposeWithoutStart for request fixture 650, error 801, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_disposeWithoutStart_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('+8613800000650');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800000650');
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
     * @tc.name CallListenerResourceManagement_dispose_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallListenerResourceManagement_dispose_1300
     * @tc.desc Verify dispose for request fixture 651, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallListenerResourceManagement_dispose_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000651');
        expect(fixture.service.requests[0]).assertEqual('555-000651');
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
