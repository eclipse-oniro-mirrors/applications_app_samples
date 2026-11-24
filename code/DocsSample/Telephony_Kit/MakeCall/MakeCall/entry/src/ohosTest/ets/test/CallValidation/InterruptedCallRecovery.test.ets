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

export default function InterruptedCallRecoveryTest(): void {
  describe('InterruptedCallRecoveryTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting InterruptedCallRecoveryTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished InterruptedCallRecoveryTest');
    });

    /**
     * @tc.name InterruptedCallRecovery_makeRetry_001
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_makeRetry_0100
     * @tc.desc Verify makeRetry for request fixture 1294, error 8300004, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_makeRetry_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 1294');
        fixture.controller.start('ext;1294');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('ext;1294');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1294');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_subscribeRetry_002
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_subscribeRetry_0200
     * @tc.desc Verify subscribeRetry for request fixture 1295, error 8300999, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_subscribeRetry_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300999, 'fixture failure 1295');
        fixture.controller.start('\uff11\uff1300001295');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('\uff11\uff1300001295');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('\uff11\uff1300001295');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 0, '\uff11\uff1300001295');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001295');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_unsubscribeRetry_003
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_unsubscribeRetry_0300
     * @tc.desc Verify unsubscribeRetry for request fixture 1296, error 201, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_unsubscribeRetry_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001296');
        expect(fixture.service.requests[0]).assertEqual('13800001296');
        fixture.service.unsubscribeFailure = makeFailure(201, 'fixture failure 1296');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.emit(0, 1, '13800001296');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_supportToggle_004
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_supportToggle_0400
     * @tc.desc Verify supportToggle for request fixture 1297, error 401, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_supportToggle_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('tel:13800001297');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('tel:13800001297');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001297');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('tel:13800001297');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_restart_005
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_restart_0500
     * @tc.desc Verify restart for request fixture 1298, error 801, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_restart_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001298');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('+8613800001298');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001298');
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
     * @tc.name InterruptedCallRecovery_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 1299, error 8300001, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_makeRetry_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300001, 'fixture failure 1299');
        fixture.controller.start('555-001299');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('555-001299');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001299');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_subscribeRetry_007
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_subscribeRetry_0700
     * @tc.desc Verify subscribeRetry for request fixture 1300, error 8300002, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_subscribeRetry_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300002, 'fixture failure 1300');
        fixture.controller.start(' 555001300 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start(' 555001300 ');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001300 ');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 5, ' 555001300 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual(' 555001300 ');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_unsubscribeRetry_008
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_unsubscribeRetry_0800
     * @tc.desc Verify unsubscribeRetry for request fixture 1301, error 8300003, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_unsubscribeRetry_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1301');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1301');
        fixture.service.unsubscribeFailure = makeFailure(8300003, 'fixture failure 1301');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.emit(0, 6, '13xxxx1301');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_supportToggle_009
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_supportToggle_0900
     * @tc.desc Verify supportToggle for request fixture 1302, error 8300004, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_supportToggle_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('ext;1302');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('ext;1302');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1302');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('ext;1302');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_restart_1000
     * @tc.desc Verify restart for request fixture 1303, error 8300999, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_restart_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001303');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('\uff11\uff1300001303');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('\uff11\uff1300001303');
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
     * @tc.name InterruptedCallRecovery_makeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_makeRetry_1100
     * @tc.desc Verify makeRetry for request fixture 1304, error 201, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_makeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(201, 'fixture failure 1304');
        fixture.controller.start('13800001304');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('13800001304');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001304');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_subscribeRetry_012
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_subscribeRetry_1200
     * @tc.desc Verify subscribeRetry for request fixture 1305, error 401, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_subscribeRetry_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1305');
        fixture.controller.start('tel:13800001305');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('tel:13800001305');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('tel:13800001305');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 3, 'tel:13800001305');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800001305');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_unsubscribeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_unsubscribeRetry_1300
     * @tc.desc Verify unsubscribeRetry for request fixture 1306, error 801, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_unsubscribeRetry_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800001306');
        expect(fixture.service.requests[0]).assertEqual('+8613800001306');
        fixture.service.unsubscribeFailure = makeFailure(801, 'fixture failure 1306');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.emit(0, 4, '+8613800001306');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_supportToggle_014
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_supportToggle_1400
     * @tc.desc Verify supportToggle for request fixture 1307, error 8300001, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_supportToggle_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('555-001307');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('555-001307');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001307');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('555-001307');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_restart_015
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_restart_1500
     * @tc.desc Verify restart for request fixture 1308, error 8300002, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_restart_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001308 ');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start(' 555001308 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001308 ');
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
     * @tc.name InterruptedCallRecovery_makeRetry_016
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_makeRetry_1600
     * @tc.desc Verify makeRetry for request fixture 1309, error 8300003, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_makeRetry_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(8300003, 'fixture failure 1309');
        fixture.controller.start('13xxxx1309');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('13xxxx1309');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1309');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_subscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_subscribeRetry_1700
     * @tc.desc Verify subscribeRetry for request fixture 1310, error 8300004, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_subscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1310');
        fixture.controller.start('ext;1310');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1310');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1310');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 1, 'ext;1310');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1310');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_unsubscribeRetry_018
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_unsubscribeRetry_1800
     * @tc.desc Verify unsubscribeRetry for request fixture 1311, error 8300999, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_unsubscribeRetry_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001311');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001311');
        fixture.service.unsubscribeFailure = makeFailure(8300999, 'fixture failure 1311');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        fixture.service.emit(0, 2, '\uff11\uff1300001311');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_supportToggle_019
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_supportToggle_1900
     * @tc.desc Verify supportToggle for request fixture 1312, error 201, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_supportToggle_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13800001312');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13800001312');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001312');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13800001312');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_restart_020
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_restart_2000
     * @tc.desc Verify restart for request fixture 1313, error 401, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_restart_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001313');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start('tel:13800001313');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('tel:13800001313');
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
     * @tc.name InterruptedCallRecovery_makeRetry_021
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_makeRetry_2100
     * @tc.desc Verify makeRetry for request fixture 1314, error 801, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_makeRetry_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.makeFailure = makeFailure(801, 'fixture failure 1314');
        fixture.controller.start('+8613800001314');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.makeFailure = undefined;
        fixture.controller.start('+8613800001314');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('+8613800001314');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_subscribeRetry_022
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_subscribeRetry_2200
     * @tc.desc Verify subscribeRetry for request fixture 1315, error 8300001, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_subscribeRetry_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300001, 'fixture failure 1315');
        fixture.controller.start('555-001315');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('555-001315');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('555-001315');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 6, '555-001315');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('555-001315');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_unsubscribeRetry_023
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_unsubscribeRetry_2300
     * @tc.desc Verify unsubscribeRetry for request fixture 1316, error 8300002, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_unsubscribeRetry_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001316 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001316 ');
        fixture.service.unsubscribeFailure = makeFailure(8300002, 'fixture failure 1316');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.emit(0, 0, ' 555001316 ');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name InterruptedCallRecovery_supportToggle_024
     * @tc.number SUB_TELEPHONY_MAKECALL_InterruptedCallRecovery_supportToggle_2400
     * @tc.desc Verify supportToggle for request fixture 1317, error 8300003, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'InterruptedCallRecovery_supportToggle_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13xxxx1317');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13xxxx1317');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1317');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13xxxx1317');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );
  });
}
