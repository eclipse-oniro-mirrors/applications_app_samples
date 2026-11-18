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

export default function SubscriptionDeduplicationBurstsTest(): void {
  describe('SubscriptionDeduplicationBurstsTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting SubscriptionDeduplicationBurstsTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished SubscriptionDeduplicationBurstsTest');
    });

    /**
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_001
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_0100
     * @tc.desc Verify listenerReuse for request fixture 785, error 401, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 8; index++) {
          fixture.controller.start('tel:13800000785');
        }
        expect(fixture.service.capabilityChecks).assertEqual(8);
        expect(fixture.service.requests.length).assertEqual(8);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000785');
        expect(fixture.service.requests[7]).assertEqual('tel:13800000785');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 8; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(8);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_002
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_0200
     * @tc.desc Verify reverseCallbacks for request fixture 786, error 801, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000786');
        fixture.controller.start('tel:555000786');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000786');
        expect(fixture.service.requests[1]).assertEqual('tel:555000786');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 786'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(801);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_003
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_0300
     * @tc.desc Verify burst for request fixture 787, error 8300001, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('555-000787');
        }
        expect(fixture.service.requests.length).assertEqual(10);
        expect(fixture.service.capabilityChecks).assertEqual(10);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 9; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000787');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(10);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 788, error 8300002, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000788 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000788 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, ' 555000788 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual(' 555000788 ');
        fixture.service.emit(0, 5, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(5);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_005
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_0500
     * @tc.desc Verify listenerReuse for request fixture 789, error 8300003, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('13xxxx789');
        }
        expect(fixture.service.capabilityChecks).assertEqual(12);
        expect(fixture.service.requests.length).assertEqual(12);
        expect(fixture.service.requests[0]).assertEqual('13xxxx789');
        expect(fixture.service.requests[11]).assertEqual('13xxxx789');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 12; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(12);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_006
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_0600
     * @tc.desc Verify reverseCallbacks for request fixture 790, error 8300004, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;790');
        fixture.controller.start('tel:555000790');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;790');
        expect(fixture.service.requests[1]).assertEqual('tel:555000790');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 790'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_007
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_0700
     * @tc.desc Verify burst for request fixture 791, error 8300999, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 14; index++) {
          fixture.controller.start('\uff11\uff1300000791');
        }
        expect(fixture.service.requests.length).assertEqual(14);
        expect(fixture.service.capabilityChecks).assertEqual(14);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 13; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000791');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(14);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_008
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_0800
     * @tc.desc Verify stateEvents for request fixture 792, error 201, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000792');
        expect(fixture.service.requests[0]).assertEqual('13800000792');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '13800000792');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13800000792');
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
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_009
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_0900
     * @tc.desc Verify listenerReuse for request fixture 793, error 401, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 16; index++) {
          fixture.controller.start('tel:13800000793');
        }
        expect(fixture.service.capabilityChecks).assertEqual(16);
        expect(fixture.service.requests.length).assertEqual(16);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000793');
        expect(fixture.service.requests[15]).assertEqual('tel:13800000793');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 16; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(16);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_010
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_1000
     * @tc.desc Verify reverseCallbacks for request fixture 794, error 801, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000794');
        fixture.controller.start('tel:555000794');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000794');
        expect(fixture.service.requests[1]).assertEqual('tel:555000794');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 794'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(801);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_011
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_1100
     * @tc.desc Verify burst for request fixture 795, error 8300001, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 18; index++) {
          fixture.controller.start('555-000795');
        }
        expect(fixture.service.requests.length).assertEqual(18);
        expect(fixture.service.capabilityChecks).assertEqual(18);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 17; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000795');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(18);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_012
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_1200
     * @tc.desc Verify stateEvents for request fixture 796, error 8300002, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000796 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000796 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, ' 555000796 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual(' 555000796 ');
        fixture.service.emit(0, 6, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_013
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_1300
     * @tc.desc Verify listenerReuse for request fixture 797, error 8300003, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 20; index++) {
          fixture.controller.start('13xxxx797');
        }
        expect(fixture.service.capabilityChecks).assertEqual(20);
        expect(fixture.service.requests.length).assertEqual(20);
        expect(fixture.service.requests[0]).assertEqual('13xxxx797');
        expect(fixture.service.requests[19]).assertEqual('13xxxx797');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 20; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(20);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_014
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_1400
     * @tc.desc Verify reverseCallbacks for request fixture 798, error 8300004, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;798');
        fixture.controller.start('tel:555000798');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;798');
        expect(fixture.service.requests[1]).assertEqual('tel:555000798');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 798'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_015
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_1500
     * @tc.desc Verify burst for request fixture 799, error 8300999, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('\uff11\uff1300000799');
        }
        expect(fixture.service.requests.length).assertEqual(3);
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 2; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000799');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_016
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_1600
     * @tc.desc Verify stateEvents for request fixture 800, error 201, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000800');
        expect(fixture.service.requests[0]).assertEqual('13800000800');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, '13800000800');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('13800000800');
        fixture.service.emit(0, 3, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(3);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_017
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_1700
     * @tc.desc Verify listenerReuse for request fixture 801, error 401, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 5; index++) {
          fixture.controller.start('tel:13800000801');
        }
        expect(fixture.service.capabilityChecks).assertEqual(5);
        expect(fixture.service.requests.length).assertEqual(5);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000801');
        expect(fixture.service.requests[4]).assertEqual('tel:13800000801');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 5; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(5);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_018
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_1800
     * @tc.desc Verify reverseCallbacks for request fixture 802, error 801, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000802');
        fixture.controller.start('tel:555000802');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000802');
        expect(fixture.service.requests[1]).assertEqual('tel:555000802');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 802'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(801);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_019
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_1900
     * @tc.desc Verify burst for request fixture 803, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('555-000803');
        }
        expect(fixture.service.requests.length).assertEqual(7);
        expect(fixture.service.capabilityChecks).assertEqual(7);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 6; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000803');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(7);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_020
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_2000
     * @tc.desc Verify stateEvents for request fixture 804, error 8300002, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000804 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000804 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, ' 555000804 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual(' 555000804 ');
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
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_021
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_2100
     * @tc.desc Verify listenerReuse for request fixture 805, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 9; index++) {
          fixture.controller.start('13xxxx805');
        }
        expect(fixture.service.capabilityChecks).assertEqual(9);
        expect(fixture.service.requests.length).assertEqual(9);
        expect(fixture.service.requests[0]).assertEqual('13xxxx805');
        expect(fixture.service.requests[8]).assertEqual('13xxxx805');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 9; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(9);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_022
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_2200
     * @tc.desc Verify reverseCallbacks for request fixture 806, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;806');
        fixture.controller.start('tel:555000806');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;806');
        expect(fixture.service.requests[1]).assertEqual('tel:555000806');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 806'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_023
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_2300
     * @tc.desc Verify burst for request fixture 807, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 11; index++) {
          fixture.controller.start('\uff11\uff1300000807');
        }
        expect(fixture.service.requests.length).assertEqual(11);
        expect(fixture.service.capabilityChecks).assertEqual(11);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 10; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000807');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(11);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_024
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_2400
     * @tc.desc Verify stateEvents for request fixture 808, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000808');
        expect(fixture.service.requests[0]).assertEqual('13800000808');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 3, '13800000808');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        expect(fixture.logger.states[0].number).assertEqual('13800000808');
        fixture.service.emit(0, 4, '');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(4);
        expect(fixture.logger.states[1].number).assertEqual('');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_listenerReuse_025
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_listenerReuse_2500
     * @tc.desc Verify listenerReuse for request fixture 809, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_listenerReuse_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 13; index++) {
          fixture.controller.start('tel:13800000809');
        }
        expect(fixture.service.capabilityChecks).assertEqual(13);
        expect(fixture.service.requests.length).assertEqual(13);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000809');
        expect(fixture.service.requests[12]).assertEqual('tel:13800000809');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 13; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(13);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_reverseCallbacks_026
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_reverseCallbacks_2600
     * @tc.desc Verify reverseCallbacks for request fixture 810, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_reverseCallbacks_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000810');
        fixture.controller.start('tel:555000810');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000810');
        expect(fixture.service.requests[1]).assertEqual('tel:555000810');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 810'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(801);
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
     * @tc.name SubscriptionDeduplicationBursts_burst_027
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_burst_2700
     * @tc.desc Verify burst for request fixture 811, error 8300001, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_burst_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 15; index++) {
          fixture.controller.start('555-000811');
        }
        expect(fixture.service.requests.length).assertEqual(15);
        expect(fixture.service.capabilityChecks).assertEqual(15);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 14; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000811');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(15);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name SubscriptionDeduplicationBursts_stateEvents_028
     * @tc.number SUB_TELEPHONY_MAKECALL_SubscriptionDeduplicationBursts_stateEvents_2800
     * @tc.desc Verify stateEvents for request fixture 812, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'SubscriptionDeduplicationBursts_stateEvents_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000812 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000812 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, ' 555000812 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual(' 555000812 ');
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
  });
}
