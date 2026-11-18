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

export default function MakeCallOperationWorkflowTest(): void {
  describe('MakeCallOperationWorkflowTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting MakeCallOperationWorkflowTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished MakeCallOperationWorkflowTest');
    });

    /**
     * @tc.name MakeCallOperationWorkflow_makeRetry_001
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_makeRetry_0100
     * @tc.desc Verify makeRetry for request fixture 1170, error 801, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_makeRetry_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(801, 'fixture failure 1170');
        fixture.controller.start('+8613800001170');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('+8613800001170');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001170');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_subscribeRetry_002
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_subscribeRetry_0200
     * @tc.desc Verify subscribeRetry for request fixture 1171, error 8300001, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_subscribeRetry_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300001, 'fixture failure 1171');
        fixture.controller.start('555-001171');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('555-001171');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('555-001171');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 2, '555-001171');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('555-001171');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_unsubscribeRetry_003
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_unsubscribeRetry_0300
     * @tc.desc Verify unsubscribeRetry for request fixture 1172, error 8300002, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_unsubscribeRetry_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001172 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001172 ');
        fixture.service.unsubscribeFailure = makeFailure(8300002, 'fixture failure 1172');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.emit(0, 3, ' 555001172 ');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_supportToggle_004
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_supportToggle_0400
     * @tc.desc Verify supportToggle for request fixture 1173, error 8300003, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_supportToggle_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13xxxx1173');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13xxxx1173');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1173');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13xxxx1173');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_restart_005
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_restart_0500
     * @tc.desc Verify restart for request fixture 1174, error 8300004, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_restart_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1174');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('ext;1174');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1174');
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
     * @tc.name MakeCallOperationWorkflow_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 1175, error 8300999, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300999, 'fixture failure 1175');
        fixture.controller.start('\uff11\uff1300001175');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('\uff11\uff1300001175');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001175');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_subscribeRetry_007
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_subscribeRetry_0700
     * @tc.desc Verify subscribeRetry for request fixture 1176, error 201, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_subscribeRetry_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(201, 'fixture failure 1176');
        fixture.controller.start('13800001176');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('13800001176');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001176');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 0, '13800001176');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13800001176');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_unsubscribeRetry_008
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_unsubscribeRetry_0800
     * @tc.desc Verify unsubscribeRetry for request fixture 1177, error 401, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_unsubscribeRetry_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001177');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001177');
        fixture.service.unsubscribeFailure = makeFailure(401, 'fixture failure 1177');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.emit(0, 1, 'tel:13800001177');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_supportToggle_009
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_supportToggle_0900
     * @tc.desc Verify supportToggle for request fixture 1178, error 801, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_supportToggle_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('+8613800001178');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('+8613800001178');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001178');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('+8613800001178');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_restart_1000
     * @tc.desc Verify restart for request fixture 1179, error 8300001, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001179');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('555-001179');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('555-001179');
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
     * @tc.name MakeCallOperationWorkflow_makeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_makeRetry_1100
     * @tc.desc Verify makeRetry for request fixture 1180, error 8300002, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_makeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300002, 'fixture failure 1180');
        fixture.controller.start(' 555001180 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start(' 555001180 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001180 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_subscribeRetry_012
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_subscribeRetry_1200
     * @tc.desc Verify subscribeRetry for request fixture 1181, error 8300003, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_subscribeRetry_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1181');
        fixture.controller.start('13xxxx1181');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('13xxxx1181');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13xxxx1181');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 5, '13xxxx1181');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx1181');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_unsubscribeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_unsubscribeRetry_1300
     * @tc.desc Verify unsubscribeRetry for request fixture 1182, error 8300004, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_unsubscribeRetry_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1182');
        expect(fixture.service.requests[0]).assertEqual('ext;1182');
        fixture.service.unsubscribeFailure = makeFailure(8300004, 'fixture failure 1182');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.emit(0, 6, 'ext;1182');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_supportToggle_014
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_supportToggle_1400
     * @tc.desc Verify supportToggle for request fixture 1183, error 8300999, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_supportToggle_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('\uff11\uff1300001183');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('\uff11\uff1300001183');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001183');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('\uff11\uff1300001183');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_restart_015
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_restart_1500
     * @tc.desc Verify restart for request fixture 1184, error 201, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_restart_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001184');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13800001184');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001184');
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
     * @tc.name MakeCallOperationWorkflow_makeRetry_016
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_makeRetry_1600
     * @tc.desc Verify makeRetry for request fixture 1185, error 401, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_makeRetry_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(401, 'fixture failure 1185');
        fixture.controller.start('tel:13800001185');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('tel:13800001185');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001185');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_subscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_subscribeRetry_1700
     * @tc.desc Verify subscribeRetry for request fixture 1186, error 801, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_subscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1186');
        fixture.controller.start('+8613800001186');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001186');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001186');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 3, '+8613800001186');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001186');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_unsubscribeRetry_018
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_unsubscribeRetry_1800
     * @tc.desc Verify unsubscribeRetry for request fixture 1187, error 8300001, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_unsubscribeRetry_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001187');
        expect(fixture.service.requests[0]).assertEqual('555-001187');
        fixture.service.unsubscribeFailure = makeFailure(8300001, 'fixture failure 1187');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.emit(0, 4, '555-001187');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_supportToggle_019
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_supportToggle_1900
     * @tc.desc Verify supportToggle for request fixture 1188, error 8300002, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_supportToggle_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start(' 555001188 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start(' 555001188 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001188 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start(' 555001188 ');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_restart_020
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_restart_2000
     * @tc.desc Verify restart for request fixture 1189, error 8300003, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_restart_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1189');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('13xxxx1189');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13xxxx1189');
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
     * @tc.name MakeCallOperationWorkflow_makeRetry_021
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_makeRetry_2100
     * @tc.desc Verify makeRetry for request fixture 1190, error 8300004, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_makeRetry_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 1190');
        fixture.controller.start('ext;1190');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('ext;1190');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1190');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_subscribeRetry_022
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_subscribeRetry_2200
     * @tc.desc Verify subscribeRetry for request fixture 1191, error 8300999, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_subscribeRetry_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300999, 'fixture failure 1191');
        fixture.controller.start('\uff11\uff1300001191');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('\uff11\uff1300001191');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('\uff11\uff1300001191');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 1, '\uff11\uff1300001191');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001191');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name MakeCallOperationWorkflow_unsubscribeRetry_023
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallOperationWorkflow_unsubscribeRetry_2300
     * @tc.desc Verify unsubscribeRetry for request fixture 1192, error 201, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallOperationWorkflow_unsubscribeRetry_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001192');
        expect(fixture.service.requests[0]).assertEqual('13800001192');
        fixture.service.unsubscribeFailure = makeFailure(201, 'fixture failure 1192');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.emit(0, 2, '13800001192');
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
