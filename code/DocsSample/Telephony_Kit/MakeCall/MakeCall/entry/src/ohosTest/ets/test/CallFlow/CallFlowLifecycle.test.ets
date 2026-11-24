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

export default function CallFlowLifecycleTest(): void {
  describe('CallFlowLifecycleTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallFlowLifecycleTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallFlowLifecycleTest');
    });

    /**
     * @tc.name CallFlowLifecycle_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_dispose_0100
     * @tc.desc Verify dispose for request fixture 885, error 8300003, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_dispose_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('13xxxx885');
      expect(fixture.service.requests[0]).assertEqual('13xxxx885');
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
    });

    /**
     * @tc.name CallFlowLifecycle_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 886, error 8300004, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;886');
        expect(fixture.service.requests[0]).assertEqual('ext;886');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 886'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('ext;886');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallFlowLifecycle_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_staleState_0300
     * @tc.desc Verify staleState for request fixture 887, error 8300999, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000887');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000887');
        fixture.service.emit(0, 5, '\uff11\uff1300000887');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        fixture.controller.dispose();
        fixture.service.emit(0, 6, '\uff11\uff1300000887');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('\uff11\uff1300000887');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 0, '\uff11\uff1300000887');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 1, '\uff11\uff1300000887');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallFlowLifecycle_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_restart_0400
     * @tc.desc Verify restart for request fixture 888, error 201, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_restart_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('13800000888');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start('13800000888');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual('13800000888');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name CallFlowLifecycle_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 889, error 401, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000889');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000889');
        fixture.service.unsubscribeFailure = makeFailure(401, 'fixture failure 889');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.emit(0, 0, 'tel:13800000889');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallFlowLifecycle_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 890, error 801, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('+8613800000890');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800000890');
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
     * @tc.name CallFlowLifecycle_dispose_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_dispose_0700
     * @tc.desc Verify dispose for request fixture 891, error 8300001, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_dispose_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('555-000891');
      expect(fixture.service.requests[0]).assertEqual('555-000891');
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
    });

    /**
     * @tc.name CallFlowLifecycle_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 892, error 8300002, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000892 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000892 ');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 892'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start(' 555000892 ');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallFlowLifecycle_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_staleState_0900
     * @tc.desc Verify staleState for request fixture 893, error 8300003, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx893');
        expect(fixture.service.requests[0]).assertEqual('13xxxx893');
        fixture.service.emit(0, 4, '13xxxx893');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, '13xxxx893');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13xxxx893');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, '13xxxx893');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, '13xxxx893');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallFlowLifecycle_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_restart_1000
     * @tc.desc Verify restart for request fixture 894, error 8300004, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_restart_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('ext;894');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start('ext;894');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual('ext;894');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name CallFlowLifecycle_unsubscribeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_unsubscribeRetry_1100
     * @tc.desc Verify unsubscribeRetry for request fixture 895, error 8300999, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_unsubscribeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000895');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000895');
        fixture.service.unsubscribeFailure = makeFailure(8300999, 'fixture failure 895');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.emit(0, 6, '\uff11\uff1300000895');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallFlowLifecycle_disposeWithoutStart_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_disposeWithoutStart_1200
     * @tc.desc Verify disposeWithoutStart for request fixture 896, error 201, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_disposeWithoutStart_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('13800000896');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800000896');
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
     * @tc.name CallFlowLifecycle_dispose_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_dispose_1300
     * @tc.desc Verify dispose for request fixture 897, error 401, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_dispose_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('tel:13800000897');
      expect(fixture.service.requests[0]).assertEqual('tel:13800000897');
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
    });

    /**
     * @tc.name CallFlowLifecycle_staleCompletion_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_staleCompletion_1400
     * @tc.desc Verify staleCompletion for request fixture 898, error 801, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_staleCompletion_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000898');
        expect(fixture.service.requests[0]).assertEqual('+8613800000898');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 898'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('+8613800000898');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallFlowLifecycle_staleState_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_staleState_1500
     * @tc.desc Verify staleState for request fixture 899, error 8300001, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_staleState_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000899');
        expect(fixture.service.requests[0]).assertEqual('555-000899');
        fixture.service.emit(0, 3, '555-000899');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, '555-000899');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('555-000899');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, '555-000899');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, '555-000899');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallFlowLifecycle_restart_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_restart_1600
     * @tc.desc Verify restart for request fixture 900, error 8300002, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_restart_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start(' 555000900 ');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start(' 555000900 ');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual(' 555000900 ');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name CallFlowLifecycle_unsubscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_unsubscribeRetry_1700
     * @tc.desc Verify unsubscribeRetry for request fixture 901, error 8300003, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_unsubscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx901');
        expect(fixture.service.requests[0]).assertEqual('13xxxx901');
        fixture.service.unsubscribeFailure = makeFailure(8300003, 'fixture failure 901');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.emit(0, 5, '13xxxx901');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallFlowLifecycle_disposeWithoutStart_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_disposeWithoutStart_1800
     * @tc.desc Verify disposeWithoutStart for request fixture 902, error 8300004, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowLifecycle_disposeWithoutStart_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('ext;902');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;902');
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
     * @tc.name CallFlowLifecycle_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowLifecycle_dispose_1900
     * @tc.desc Verify dispose for request fixture 903, error 8300999, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallFlowLifecycle_dispose_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('\uff11\uff1300000903');
      expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000903');
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
    });
  });
}
