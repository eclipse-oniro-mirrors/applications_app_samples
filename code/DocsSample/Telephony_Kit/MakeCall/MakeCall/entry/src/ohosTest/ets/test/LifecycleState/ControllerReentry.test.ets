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

export default function ControllerReentryTest(): void {
  describe('ControllerReentryTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting ControllerReentryTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished ControllerReentryTest');
    });

    /**
     * @tc.name ControllerReentry_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_dispose_0100
     * @tc.desc Verify dispose for request fixture 614, error 8300004, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_dispose_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('ext;614');
      expect(fixture.service.requests[0]).assertEqual('ext;614');
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
     * @tc.name ControllerReentry_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 615, error 8300999, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000615');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000615');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 615'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('\uff11\uff1300000615');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerReentry_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleState_0300
     * @tc.desc Verify staleState for request fixture 616, error 201, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000616');
        expect(fixture.service.requests[0]).assertEqual('13800000616');
        fixture.service.emit(0, 0, '13800000616');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        fixture.controller.dispose();
        fixture.service.emit(0, 1, '13800000616');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13800000616');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 2, '13800000616');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 3, '13800000616');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerReentry_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_restart_0400
     * @tc.desc Verify restart for request fixture 617, error 401, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_restart_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('tel:13800000617');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start('tel:13800000617');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual('tel:13800000617');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name ControllerReentry_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 618, error 801, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000618');
        expect(fixture.service.requests[0]).assertEqual('+8613800000618');
        fixture.service.unsubscribeFailure = makeFailure(801, 'fixture failure 618');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.emit(0, 2, '+8613800000618');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ControllerReentry_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 619, error 8300001, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('555-000619');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-000619');
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
     * @tc.name ControllerReentry_dispose_007
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_dispose_0700
     * @tc.desc Verify dispose for request fixture 620, error 8300002, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_dispose_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start(' 555000620 ');
      expect(fixture.service.requests[0]).assertEqual(' 555000620 ');
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
     * @tc.name ControllerReentry_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 621, error 8300003, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx621');
        expect(fixture.service.requests[0]).assertEqual('13xxxx621');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300003, 'fixture failure 621'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13xxxx621');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerReentry_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleState_0900
     * @tc.desc Verify staleState for request fixture 622, error 8300004, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;622');
        expect(fixture.service.requests[0]).assertEqual('ext;622');
        fixture.service.emit(0, 6, 'ext;622');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        fixture.controller.dispose();
        fixture.service.emit(0, 0, 'ext;622');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('ext;622');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 1, 'ext;622');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 2, 'ext;622');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerReentry_restart_010
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_restart_1000
     * @tc.desc Verify restart for request fixture 623, error 8300999, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_restart_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('\uff11\uff1300000623');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start('\uff11\uff1300000623');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual('\uff11\uff1300000623');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name ControllerReentry_unsubscribeRetry_011
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_unsubscribeRetry_1100
     * @tc.desc Verify unsubscribeRetry for request fixture 624, error 201, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_unsubscribeRetry_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000624');
        expect(fixture.service.requests[0]).assertEqual('13800000624');
        fixture.service.unsubscribeFailure = makeFailure(201, 'fixture failure 624');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.emit(0, 1, '13800000624');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ControllerReentry_disposeWithoutStart_012
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_disposeWithoutStart_1200
     * @tc.desc Verify disposeWithoutStart for request fixture 625, error 401, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_disposeWithoutStart_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('tel:13800000625');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000625');
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
     * @tc.name ControllerReentry_dispose_013
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_dispose_1300
     * @tc.desc Verify dispose for request fixture 626, error 801, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_dispose_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('+8613800000626');
      expect(fixture.service.requests[0]).assertEqual('+8613800000626');
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
     * @tc.name ControllerReentry_staleCompletion_014
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleCompletion_1400
     * @tc.desc Verify staleCompletion for request fixture 627, error 8300001, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleCompletion_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000627');
        expect(fixture.service.requests[0]).assertEqual('555-000627');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 627'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('555-000627');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerReentry_staleState_015
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleState_1500
     * @tc.desc Verify staleState for request fixture 628, error 8300002, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleState_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000628 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000628 ');
        fixture.service.emit(0, 5, ' 555000628 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        fixture.controller.dispose();
        fixture.service.emit(0, 6, ' 555000628 ');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start(' 555000628 ');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 0, ' 555000628 ');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 1, ' 555000628 ');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerReentry_restart_016
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_restart_1600
     * @tc.desc Verify restart for request fixture 629, error 8300003, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_restart_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('13xxxx629');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start('13xxxx629');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual('13xxxx629');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name ControllerReentry_unsubscribeRetry_017
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_unsubscribeRetry_1700
     * @tc.desc Verify unsubscribeRetry for request fixture 630, error 8300004, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_unsubscribeRetry_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;630');
        expect(fixture.service.requests[0]).assertEqual('ext;630');
        fixture.service.unsubscribeFailure = makeFailure(8300004, 'fixture failure 630');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.emit(0, 0, 'ext;630');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ControllerReentry_disposeWithoutStart_018
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_disposeWithoutStart_1800
     * @tc.desc Verify disposeWithoutStart for request fixture 631, error 8300999, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_disposeWithoutStart_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('\uff11\uff1300000631');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000631');
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
     * @tc.name ControllerReentry_dispose_019
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_dispose_1900
     * @tc.desc Verify dispose for request fixture 632, error 201, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_dispose_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('13800000632');
      expect(fixture.service.requests[0]).assertEqual('13800000632');
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
     * @tc.name ControllerReentry_staleCompletion_020
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleCompletion_2000
     * @tc.desc Verify staleCompletion for request fixture 633, error 401, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleCompletion_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000633');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000633');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(401, 'fixture failure 633'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('tel:13800000633');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerReentry_staleState_021
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_staleState_2100
     * @tc.desc Verify staleState for request fixture 634, error 801, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_staleState_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000634');
        expect(fixture.service.requests[0]).assertEqual('+8613800000634');
        fixture.service.emit(0, 4, '+8613800000634');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, '+8613800000634');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('+8613800000634');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, '+8613800000634');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, '+8613800000634');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerReentry_restart_022
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_restart_2200
     * @tc.desc Verify restart for request fixture 635, error 8300001, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_restart_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('555-000635');
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      fixture.controller.start('555-000635');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.requests.length).assertEqual(2);
      expect(fixture.service.requests[1]).assertEqual('555-000635');
      expect(fixture.service.listeners.length).assertEqual(2);
      await fixture.service.completeLater(1);
      expect(fixture.logger.successes).assertEqual(2);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(2);
      expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
      expect(fixture.logger.failures.length).assertEqual(0);
    });

    /**
     * @tc.name ControllerReentry_unsubscribeRetry_023
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_unsubscribeRetry_2300
     * @tc.desc Verify unsubscribeRetry for request fixture 636, error 8300002, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_unsubscribeRetry_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000636 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000636 ');
        fixture.service.unsubscribeFailure = makeFailure(8300002, 'fixture failure 636');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.emit(0, 6, ' 555000636 ');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name ControllerReentry_disposeWithoutStart_024
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_disposeWithoutStart_2400
     * @tc.desc Verify disposeWithoutStart for request fixture 637, error 8300003, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerReentry_disposeWithoutStart_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('13xxxx637');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx637');
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
     * @tc.name ControllerReentry_dispose_025
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerReentry_dispose_2500
     * @tc.desc Verify dispose for request fixture 638, error 8300004, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('ControllerReentry_dispose_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('ext;638');
      expect(fixture.service.requests[0]).assertEqual('ext;638');
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
