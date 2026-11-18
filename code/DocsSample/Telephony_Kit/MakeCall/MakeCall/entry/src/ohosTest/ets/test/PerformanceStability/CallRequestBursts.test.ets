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

export default function CallRequestBurstsTest(): void {
  describe('CallRequestBurstsTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallRequestBurstsTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallRequestBurstsTest');
    });

    /**
     * @tc.name CallRequestBursts_listenerReuse_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_listenerReuse_0100
     * @tc.desc Verify listenerReuse for request fixture 734, error 8300004, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_listenerReuse_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 14; index++) {
          fixture.controller.start('ext;734');
        }
        expect(fixture.service.capabilityChecks).assertEqual(14);
        expect(fixture.service.requests.length).assertEqual(14);
        expect(fixture.service.requests[0]).assertEqual('ext;734');
        expect(fixture.service.requests[13]).assertEqual('ext;734');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 14; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(14);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name CallRequestBursts_reverseCallbacks_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_reverseCallbacks_0200
     * @tc.desc Verify reverseCallbacks for request fixture 735, error 8300999, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_reverseCallbacks_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000735');
        fixture.controller.start('tel:555000735');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000735');
        expect(fixture.service.requests[1]).assertEqual('tel:555000735');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300999, 'fixture failure 735'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
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
     * @tc.name CallRequestBursts_burst_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_burst_0300
     * @tc.desc Verify burst for request fixture 736, error 201, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRequestBursts_burst_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index = 0; index < 16; index++) {
        fixture.controller.start('13800000736');
      }
      expect(fixture.service.requests.length).assertEqual(16);
      expect(fixture.service.capabilityChecks).assertEqual(16);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      expect(fixture.service.listeners.length).assertEqual(1);
      for (let index = 15; index >= 0; index--) {
        expect(fixture.service.requests[index]).assertEqual('13800000736');
        await fixture.service.completeLater(index);
      }
      expect(fixture.logger.successes).assertEqual(16);
      expect(fixture.logger.failures.length).assertEqual(0);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
    });

    /**
     * @tc.name CallRequestBursts_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 737, error 401, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000737');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000737');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, 'tel:13800000737');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800000737');
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
     * @tc.name CallRequestBursts_listenerReuse_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_listenerReuse_0500
     * @tc.desc Verify listenerReuse for request fixture 738, error 801, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_listenerReuse_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 18; index++) {
          fixture.controller.start('+8613800000738');
        }
        expect(fixture.service.capabilityChecks).assertEqual(18);
        expect(fixture.service.requests.length).assertEqual(18);
        expect(fixture.service.requests[0]).assertEqual('+8613800000738');
        expect(fixture.service.requests[17]).assertEqual('+8613800000738');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 18; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(18);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name CallRequestBursts_reverseCallbacks_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_reverseCallbacks_0600
     * @tc.desc Verify reverseCallbacks for request fixture 739, error 8300001, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_reverseCallbacks_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000739');
        fixture.controller.start('tel:555000739');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('555-000739');
        expect(fixture.service.requests[1]).assertEqual('tel:555000739');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300001, 'fixture failure 739'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
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
     * @tc.name CallRequestBursts_burst_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_burst_0700
     * @tc.desc Verify burst for request fixture 740, error 8300002, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRequestBursts_burst_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index = 0; index < 20; index++) {
        fixture.controller.start(' 555000740 ');
      }
      expect(fixture.service.requests.length).assertEqual(20);
      expect(fixture.service.capabilityChecks).assertEqual(20);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      expect(fixture.service.listeners.length).assertEqual(1);
      for (let index = 19; index >= 0; index--) {
        expect(fixture.service.requests[index]).assertEqual(' 555000740 ');
        await fixture.service.completeLater(index);
      }
      expect(fixture.logger.successes).assertEqual(20);
      expect(fixture.logger.failures.length).assertEqual(0);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
    });

    /**
     * @tc.name CallRequestBursts_stateEvents_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_stateEvents_0800
     * @tc.desc Verify stateEvents for request fixture 741, error 8300003, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_stateEvents_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx741');
        expect(fixture.service.requests[0]).assertEqual('13xxxx741');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '13xxxx741');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx741');
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
     * @tc.name CallRequestBursts_listenerReuse_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_listenerReuse_0900
     * @tc.desc Verify listenerReuse for request fixture 742, error 8300004, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_listenerReuse_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('ext;742');
        }
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(3);
        expect(fixture.service.requests[0]).assertEqual('ext;742');
        expect(fixture.service.requests[2]).assertEqual('ext;742');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 3; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name CallRequestBursts_reverseCallbacks_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_reverseCallbacks_1000
     * @tc.desc Verify reverseCallbacks for request fixture 743, error 8300999, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_reverseCallbacks_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000743');
        fixture.controller.start('tel:555000743');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000743');
        expect(fixture.service.requests[1]).assertEqual('tel:555000743');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300999, 'fixture failure 743'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
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
     * @tc.name CallRequestBursts_burst_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_burst_1100
     * @tc.desc Verify burst for request fixture 744, error 201, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRequestBursts_burst_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index = 0; index < 5; index++) {
        fixture.controller.start('13800000744');
      }
      expect(fixture.service.requests.length).assertEqual(5);
      expect(fixture.service.capabilityChecks).assertEqual(5);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      expect(fixture.service.listeners.length).assertEqual(1);
      for (let index = 4; index >= 0; index--) {
        expect(fixture.service.requests[index]).assertEqual('13800000744');
        await fixture.service.completeLater(index);
      }
      expect(fixture.logger.successes).assertEqual(5);
      expect(fixture.logger.failures.length).assertEqual(0);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
    });

    /**
     * @tc.name CallRequestBursts_stateEvents_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_stateEvents_1200
     * @tc.desc Verify stateEvents for request fixture 745, error 401, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_stateEvents_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000745');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000745');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 3, 'tel:13800000745');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800000745');
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
     * @tc.name CallRequestBursts_listenerReuse_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_listenerReuse_1300
     * @tc.desc Verify listenerReuse for request fixture 746, error 801, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_listenerReuse_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('+8613800000746');
        }
        expect(fixture.service.capabilityChecks).assertEqual(7);
        expect(fixture.service.requests.length).assertEqual(7);
        expect(fixture.service.requests[0]).assertEqual('+8613800000746');
        expect(fixture.service.requests[6]).assertEqual('+8613800000746');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 7; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(7);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name CallRequestBursts_reverseCallbacks_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_reverseCallbacks_1400
     * @tc.desc Verify reverseCallbacks for request fixture 747, error 8300001, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_reverseCallbacks_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000747');
        fixture.controller.start('tel:555000747');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('555-000747');
        expect(fixture.service.requests[1]).assertEqual('tel:555000747');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300001, 'fixture failure 747'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
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
     * @tc.name CallRequestBursts_burst_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_burst_1500
     * @tc.desc Verify burst for request fixture 748, error 8300002, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRequestBursts_burst_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index = 0; index < 9; index++) {
        fixture.controller.start(' 555000748 ');
      }
      expect(fixture.service.requests.length).assertEqual(9);
      expect(fixture.service.capabilityChecks).assertEqual(9);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      expect(fixture.service.listeners.length).assertEqual(1);
      for (let index = 8; index >= 0; index--) {
        expect(fixture.service.requests[index]).assertEqual(' 555000748 ');
        await fixture.service.completeLater(index);
      }
      expect(fixture.logger.successes).assertEqual(9);
      expect(fixture.logger.failures.length).assertEqual(0);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
    });

    /**
     * @tc.name CallRequestBursts_stateEvents_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_stateEvents_1600
     * @tc.desc Verify stateEvents for request fixture 749, error 8300003, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_stateEvents_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx749');
        expect(fixture.service.requests[0]).assertEqual('13xxxx749');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, '13xxxx749');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx749');
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
     * @tc.name CallRequestBursts_listenerReuse_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_listenerReuse_1700
     * @tc.desc Verify listenerReuse for request fixture 750, error 8300004, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_listenerReuse_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 11; index++) {
          fixture.controller.start('ext;750');
        }
        expect(fixture.service.capabilityChecks).assertEqual(11);
        expect(fixture.service.requests.length).assertEqual(11);
        expect(fixture.service.requests[0]).assertEqual('ext;750');
        expect(fixture.service.requests[10]).assertEqual('ext;750');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 11; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(11);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name CallRequestBursts_reverseCallbacks_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_reverseCallbacks_1800
     * @tc.desc Verify reverseCallbacks for request fixture 751, error 8300999, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_reverseCallbacks_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000751');
        fixture.controller.start('tel:555000751');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000751');
        expect(fixture.service.requests[1]).assertEqual('tel:555000751');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300999, 'fixture failure 751'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
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
     * @tc.name CallRequestBursts_burst_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_burst_1900
     * @tc.desc Verify burst for request fixture 752, error 201, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRequestBursts_burst_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index = 0; index < 13; index++) {
        fixture.controller.start('13800000752');
      }
      expect(fixture.service.requests.length).assertEqual(13);
      expect(fixture.service.capabilityChecks).assertEqual(13);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      expect(fixture.service.listeners.length).assertEqual(1);
      for (let index = 12; index >= 0; index--) {
        expect(fixture.service.requests[index]).assertEqual('13800000752');
        await fixture.service.completeLater(index);
      }
      expect(fixture.logger.successes).assertEqual(13);
      expect(fixture.logger.failures.length).assertEqual(0);
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
    });

    /**
     * @tc.name CallRequestBursts_stateEvents_020
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_stateEvents_2000
     * @tc.desc Verify stateEvents for request fixture 753, error 401, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_stateEvents_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000753');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000753');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, 'tel:13800000753');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800000753');
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
     * @tc.name CallRequestBursts_listenerReuse_021
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRequestBursts_listenerReuse_2100
     * @tc.desc Verify listenerReuse for request fixture 754, error 801, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRequestBursts_listenerReuse_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 15; index++) {
          fixture.controller.start('+8613800000754');
        }
        expect(fixture.service.capabilityChecks).assertEqual(15);
        expect(fixture.service.requests.length).assertEqual(15);
        expect(fixture.service.requests[0]).assertEqual('+8613800000754');
        expect(fixture.service.requests[14]).assertEqual('+8613800000754');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 15; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(15);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );
  });
}
