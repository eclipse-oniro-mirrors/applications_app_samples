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

export default function CallCallbackGenerationTest(): void {
  describe('CallCallbackGenerationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallCallbackGenerationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallCallbackGenerationTest');
    });

    /**
     * @tc.name CallCallbackGeneration_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_dispose_0100
     * @tc.desc Verify dispose for request fixture 1193, error 401, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_dispose_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001193');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001193');
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
     * @tc.name CallCallbackGeneration_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 1194, error 801, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001194');
        expect(fixture.service.requests[0]).assertEqual('+8613800001194');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 1194'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('+8613800001194');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleState_0300
     * @tc.desc Verify staleState for request fixture 1195, error 8300001, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001195');
        expect(fixture.service.requests[0]).assertEqual('555-001195');
        fixture.service.emit(0, 5, '555-001195');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        fixture.controller.dispose();
        fixture.service.emit(0, 6, '555-001195');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('555-001195');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 0, '555-001195');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 1, '555-001195');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_restart_0400
     * @tc.desc Verify restart for request fixture 1196, error 8300002, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_restart_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001196 ');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start(' 555001196 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001196 ');
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
     * @tc.name CallCallbackGeneration_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 1197, error 8300003, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1197');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1197');
        fixture.service.unsubscribeFailure = makeFailure(8300003, 'fixture failure 1197');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.emit(0, 0, '13xxxx1197');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallCallbackGeneration_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 1198, error 8300004, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('ext;1198');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1198');
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
     * @tc.name CallCallbackGeneration_dispose_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_dispose_0700
     * @tc.desc Verify dispose for request fixture 1199, error 8300999, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_dispose_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001199');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001199');
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
     * @tc.name CallCallbackGeneration_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 1200, error 201, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001200');
        expect(fixture.service.requests[0]).assertEqual('13800001200');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 1200'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13800001200');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleState_0900
     * @tc.desc Verify staleState for request fixture 1201, error 401, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001201');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001201');
        fixture.service.emit(0, 4, 'tel:13800001201');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, 'tel:13800001201');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('tel:13800001201');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, 'tel:13800001201');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, 'tel:13800001201');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_restart_1000
     * @tc.desc Verify restart for request fixture 1202, error 801, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001202');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('+8613800001202');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001202');
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
     * @tc.name CallCallbackGeneration_unsubscribeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_unsubscribeRetry_1100
     * @tc.desc Verify unsubscribeRetry for request fixture 1203, error 8300001, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_unsubscribeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001203');
        expect(fixture.service.requests[0]).assertEqual('555-001203');
        fixture.service.unsubscribeFailure = makeFailure(8300001, 'fixture failure 1203');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.emit(0, 6, '555-001203');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallCallbackGeneration_disposeWithoutStart_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_disposeWithoutStart_1200
     * @tc.desc Verify disposeWithoutStart for request fixture 1204, error 8300002, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_disposeWithoutStart_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start(' 555001204 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001204 ');
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
     * @tc.name CallCallbackGeneration_dispose_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_dispose_1300
     * @tc.desc Verify dispose for request fixture 1205, error 8300003, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_dispose_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1205');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1205');
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
     * @tc.name CallCallbackGeneration_staleCompletion_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleCompletion_1400
     * @tc.desc Verify staleCompletion for request fixture 1206, error 8300004, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleCompletion_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1206');
        expect(fixture.service.requests[0]).assertEqual('ext;1206');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 1206'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('ext;1206');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_staleState_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleState_1500
     * @tc.desc Verify staleState for request fixture 1207, error 8300999, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleState_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001207');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001207');
        fixture.service.emit(0, 3, '\uff11\uff1300001207');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, '\uff11\uff1300001207');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('\uff11\uff1300001207');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, '\uff11\uff1300001207');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, '\uff11\uff1300001207');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_restart_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_restart_1600
     * @tc.desc Verify restart for request fixture 1208, error 201, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_restart_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001208');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13800001208');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001208');
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
     * @tc.name CallCallbackGeneration_unsubscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_unsubscribeRetry_1700
     * @tc.desc Verify unsubscribeRetry for request fixture 1209, error 401, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_unsubscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001209');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001209');
        fixture.service.unsubscribeFailure = makeFailure(401, 'fixture failure 1209');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.emit(0, 5, 'tel:13800001209');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallCallbackGeneration_disposeWithoutStart_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_disposeWithoutStart_1800
     * @tc.desc Verify disposeWithoutStart for request fixture 1210, error 801, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_disposeWithoutStart_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('+8613800001210');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001210');
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
     * @tc.name CallCallbackGeneration_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_dispose_1900
     * @tc.desc Verify dispose for request fixture 1211, error 8300001, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_dispose_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001211');
        expect(fixture.service.requests[0]).assertEqual('555-001211');
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
     * @tc.name CallCallbackGeneration_staleCompletion_020
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleCompletion_2000
     * @tc.desc Verify staleCompletion for request fixture 1212, error 8300002, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleCompletion_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001212 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001212 ');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 1212'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start(' 555001212 ');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_staleState_021
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleState_2100
     * @tc.desc Verify staleState for request fixture 1213, error 8300003, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleState_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1213');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1213');
        fixture.service.emit(0, 2, '13xxxx1213');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        fixture.controller.dispose();
        fixture.service.emit(0, 3, '13xxxx1213');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13xxxx1213');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 4, '13xxxx1213');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 5, '13xxxx1213');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(5);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_restart_022
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_restart_2200
     * @tc.desc Verify restart for request fixture 1214, error 8300004, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_restart_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1214');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('ext;1214');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1214');
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
     * @tc.name CallCallbackGeneration_unsubscribeRetry_023
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_unsubscribeRetry_2300
     * @tc.desc Verify unsubscribeRetry for request fixture 1215, error 8300999, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_unsubscribeRetry_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001215');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001215');
        fixture.service.unsubscribeFailure = makeFailure(8300999, 'fixture failure 1215');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.emit(0, 4, '\uff11\uff1300001215');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallCallbackGeneration_disposeWithoutStart_024
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_disposeWithoutStart_2400
     * @tc.desc Verify disposeWithoutStart for request fixture 1216, error 201, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_disposeWithoutStart_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('13800001216');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001216');
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
     * @tc.name CallCallbackGeneration_dispose_025
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_dispose_2500
     * @tc.desc Verify dispose for request fixture 1217, error 401, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_dispose_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001217');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001217');
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
     * @tc.name CallCallbackGeneration_staleCompletion_026
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleCompletion_2600
     * @tc.desc Verify staleCompletion for request fixture 1218, error 801, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleCompletion_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001218');
        expect(fixture.service.requests[0]).assertEqual('+8613800001218');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 1218'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('+8613800001218');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_staleState_027
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleState_2700
     * @tc.desc Verify staleState for request fixture 1219, error 8300001, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleState_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001219');
        expect(fixture.service.requests[0]).assertEqual('555-001219');
        fixture.service.emit(0, 1, '555-001219');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        fixture.controller.dispose();
        fixture.service.emit(0, 2, '555-001219');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('555-001219');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 3, '555-001219');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 4, '555-001219');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(4);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_restart_028
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_restart_2800
     * @tc.desc Verify restart for request fixture 1220, error 8300002, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_restart_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001220 ');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start(' 555001220 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001220 ');
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
     * @tc.name CallCallbackGeneration_unsubscribeRetry_029
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_unsubscribeRetry_2900
     * @tc.desc Verify unsubscribeRetry for request fixture 1221, error 8300003, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_unsubscribeRetry_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1221');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1221');
        fixture.service.unsubscribeFailure = makeFailure(8300003, 'fixture failure 1221');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.emit(0, 3, '13xxxx1221');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallCallbackGeneration_disposeWithoutStart_030
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_disposeWithoutStart_3000
     * @tc.desc Verify disposeWithoutStart for request fixture 1222, error 8300004, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_disposeWithoutStart_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('ext;1222');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1222');
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
     * @tc.name CallCallbackGeneration_dispose_031
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_dispose_3100
     * @tc.desc Verify dispose for request fixture 1223, error 8300999, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_dispose_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001223');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001223');
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
     * @tc.name CallCallbackGeneration_staleCompletion_032
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleCompletion_3200
     * @tc.desc Verify staleCompletion for request fixture 1224, error 201, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleCompletion_032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001224');
        expect(fixture.service.requests[0]).assertEqual('13800001224');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 1224'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13800001224');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallCallbackGeneration_staleState_033
     * @tc.number SUB_TELEPHONY_MAKECALL_CallCallbackGeneration_staleState_3300
     * @tc.desc Verify staleState for request fixture 1225, error 401, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallCallbackGeneration_staleState_033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001225');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001225');
        fixture.service.emit(0, 0, 'tel:13800001225');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        fixture.controller.dispose();
        fixture.service.emit(0, 1, 'tel:13800001225');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('tel:13800001225');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 2, 'tel:13800001225');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 3, 'tel:13800001225');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );
  });
}
