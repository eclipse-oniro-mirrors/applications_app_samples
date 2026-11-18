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

export default function MakeCallRequestDispatchTest(): void {
  describe('MakeCallRequestDispatchTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting MakeCallRequestDispatchTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished MakeCallRequestDispatchTest');
    });

    /**
     * @tc.name MakeCallRequestDispatch_listenerReuse_001
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_0100
     * @tc.desc Verify listenerReuse for request fixture 397, error 8300003, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 19; index++) {
          fixture.controller.start('13xxxx397');
        }
        expect(fixture.service.capabilityChecks).assertEqual(19);
        expect(fixture.service.requests.length).assertEqual(19);
        expect(fixture.service.requests[0]).assertEqual('13xxxx397');
        expect(fixture.service.requests[18]).assertEqual('13xxxx397');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 19; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(19);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_002
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_0200
     * @tc.desc Verify reverseCallbacks for request fixture 398, error 8300004, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;398');
        fixture.controller.start('tel:555000398');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;398');
        expect(fixture.service.requests[1]).assertEqual('tel:555000398');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 398'));
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
     * @tc.name MakeCallRequestDispatch_burst_003
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_0300
     * @tc.desc Verify burst for request fixture 399, error 8300999, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 2; index++) {
          fixture.controller.start('\uff11\uff1300000399');
        }
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 1; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000399');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(2);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name MakeCallRequestDispatch_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 400, error 201, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000400');
        expect(fixture.service.requests[0]).assertEqual('13800000400');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '13800000400');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13800000400');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_005
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_0500
     * @tc.desc Verify listenerReuse for request fixture 401, error 401, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 4; index++) {
          fixture.controller.start('tel:13800000401');
        }
        expect(fixture.service.capabilityChecks).assertEqual(4);
        expect(fixture.service.requests.length).assertEqual(4);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000401');
        expect(fixture.service.requests[3]).assertEqual('tel:13800000401');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 4; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(4);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_006
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_0600
     * @tc.desc Verify reverseCallbacks for request fixture 402, error 801, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000402');
        fixture.controller.start('tel:555000402');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000402');
        expect(fixture.service.requests[1]).assertEqual('tel:555000402');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 402'));
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
     * @tc.name MakeCallRequestDispatch_burst_007
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_0700
     * @tc.desc Verify burst for request fixture 403, error 8300001, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 6; index++) {
          fixture.controller.start('555-000403');
        }
        expect(fixture.service.requests.length).assertEqual(6);
        expect(fixture.service.capabilityChecks).assertEqual(6);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 5; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000403');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name MakeCallRequestDispatch_stateEvents_008
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_0800
     * @tc.desc Verify stateEvents for request fixture 404, error 8300002, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000404 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000404 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, ' 555000404 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual(' 555000404 ');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_009
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_0900
     * @tc.desc Verify listenerReuse for request fixture 405, error 8300003, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 8; index++) {
          fixture.controller.start('13xxxx405');
        }
        expect(fixture.service.capabilityChecks).assertEqual(8);
        expect(fixture.service.requests.length).assertEqual(8);
        expect(fixture.service.requests[0]).assertEqual('13xxxx405');
        expect(fixture.service.requests[7]).assertEqual('13xxxx405');
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
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_010
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_1000
     * @tc.desc Verify reverseCallbacks for request fixture 406, error 8300004, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;406');
        fixture.controller.start('tel:555000406');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;406');
        expect(fixture.service.requests[1]).assertEqual('tel:555000406');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 406'));
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
     * @tc.name MakeCallRequestDispatch_burst_011
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_1100
     * @tc.desc Verify burst for request fixture 407, error 8300999, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('\uff11\uff1300000407');
        }
        expect(fixture.service.requests.length).assertEqual(10);
        expect(fixture.service.capabilityChecks).assertEqual(10);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 9; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000407');
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
     * @tc.name MakeCallRequestDispatch_stateEvents_012
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_1200
     * @tc.desc Verify stateEvents for request fixture 408, error 201, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000408');
        expect(fixture.service.requests[0]).assertEqual('13800000408');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, '13800000408');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('13800000408');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_013
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_1300
     * @tc.desc Verify listenerReuse for request fixture 409, error 401, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('tel:13800000409');
        }
        expect(fixture.service.capabilityChecks).assertEqual(12);
        expect(fixture.service.requests.length).assertEqual(12);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000409');
        expect(fixture.service.requests[11]).assertEqual('tel:13800000409');
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
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_014
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_1400
     * @tc.desc Verify reverseCallbacks for request fixture 410, error 801, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000410');
        fixture.controller.start('tel:555000410');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000410');
        expect(fixture.service.requests[1]).assertEqual('tel:555000410');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 410'));
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
     * @tc.name MakeCallRequestDispatch_burst_015
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_1500
     * @tc.desc Verify burst for request fixture 411, error 8300001, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 14; index++) {
          fixture.controller.start('555-000411');
        }
        expect(fixture.service.requests.length).assertEqual(14);
        expect(fixture.service.capabilityChecks).assertEqual(14);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 13; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000411');
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
     * @tc.name MakeCallRequestDispatch_stateEvents_016
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_1600
     * @tc.desc Verify stateEvents for request fixture 412, error 8300002, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000412 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000412 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, ' 555000412 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual(' 555000412 ');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_017
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_1700
     * @tc.desc Verify listenerReuse for request fixture 413, error 8300003, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 16; index++) {
          fixture.controller.start('13xxxx413');
        }
        expect(fixture.service.capabilityChecks).assertEqual(16);
        expect(fixture.service.requests.length).assertEqual(16);
        expect(fixture.service.requests[0]).assertEqual('13xxxx413');
        expect(fixture.service.requests[15]).assertEqual('13xxxx413');
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
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_018
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_1800
     * @tc.desc Verify reverseCallbacks for request fixture 414, error 8300004, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;414');
        fixture.controller.start('tel:555000414');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;414');
        expect(fixture.service.requests[1]).assertEqual('tel:555000414');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 414'));
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
     * @tc.name MakeCallRequestDispatch_burst_019
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_1900
     * @tc.desc Verify burst for request fixture 415, error 8300999, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 18; index++) {
          fixture.controller.start('\uff11\uff1300000415');
        }
        expect(fixture.service.requests.length).assertEqual(18);
        expect(fixture.service.capabilityChecks).assertEqual(18);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 17; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000415');
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
     * @tc.name MakeCallRequestDispatch_stateEvents_020
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_2000
     * @tc.desc Verify stateEvents for request fixture 416, error 201, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000416');
        expect(fixture.service.requests[0]).assertEqual('13800000416');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 3, '13800000416');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        expect(fixture.logger.states[0].number).assertEqual('13800000416');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_021
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_2100
     * @tc.desc Verify listenerReuse for request fixture 417, error 401, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 20; index++) {
          fixture.controller.start('tel:13800000417');
        }
        expect(fixture.service.capabilityChecks).assertEqual(20);
        expect(fixture.service.requests.length).assertEqual(20);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000417');
        expect(fixture.service.requests[19]).assertEqual('tel:13800000417');
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
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_022
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_2200
     * @tc.desc Verify reverseCallbacks for request fixture 418, error 801, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000418');
        fixture.controller.start('tel:555000418');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000418');
        expect(fixture.service.requests[1]).assertEqual('tel:555000418');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 418'));
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
     * @tc.name MakeCallRequestDispatch_burst_023
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_2300
     * @tc.desc Verify burst for request fixture 419, error 8300001, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('555-000419');
        }
        expect(fixture.service.requests.length).assertEqual(3);
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 2; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000419');
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
     * @tc.name MakeCallRequestDispatch_stateEvents_024
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_2400
     * @tc.desc Verify stateEvents for request fixture 420, error 8300002, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000420 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000420 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, ' 555000420 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual(' 555000420 ');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_025
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_2500
     * @tc.desc Verify listenerReuse for request fixture 421, error 8300003, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 5; index++) {
          fixture.controller.start('13xxxx421');
        }
        expect(fixture.service.capabilityChecks).assertEqual(5);
        expect(fixture.service.requests.length).assertEqual(5);
        expect(fixture.service.requests[0]).assertEqual('13xxxx421');
        expect(fixture.service.requests[4]).assertEqual('13xxxx421');
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
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_026
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_2600
     * @tc.desc Verify reverseCallbacks for request fixture 422, error 8300004, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;422');
        fixture.controller.start('tel:555000422');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('ext;422');
        expect(fixture.service.requests[1]).assertEqual('tel:555000422');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300004, 'fixture failure 422'));
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
     * @tc.name MakeCallRequestDispatch_burst_027
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_2700
     * @tc.desc Verify burst for request fixture 423, error 8300999, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('\uff11\uff1300000423');
        }
        expect(fixture.service.requests.length).assertEqual(7);
        expect(fixture.service.capabilityChecks).assertEqual(7);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 6; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('\uff11\uff1300000423');
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
     * @tc.name MakeCallRequestDispatch_stateEvents_028
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_2800
     * @tc.desc Verify stateEvents for request fixture 424, error 201, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000424');
        expect(fixture.service.requests[0]).assertEqual('13800000424');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, '13800000424');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual('13800000424');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_029
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_2900
     * @tc.desc Verify listenerReuse for request fixture 425, error 401, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 9; index++) {
          fixture.controller.start('tel:13800000425');
        }
        expect(fixture.service.capabilityChecks).assertEqual(9);
        expect(fixture.service.requests.length).assertEqual(9);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000425');
        expect(fixture.service.requests[8]).assertEqual('tel:13800000425');
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
     * @tc.name MakeCallRequestDispatch_reverseCallbacks_030
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_reverseCallbacks_3000
     * @tc.desc Verify reverseCallbacks for request fixture 426, error 801, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_reverseCallbacks_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000426');
        fixture.controller.start('tel:555000426');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('+8613800000426');
        expect(fixture.service.requests[1]).assertEqual('tel:555000426');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(801, 'fixture failure 426'));
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
     * @tc.name MakeCallRequestDispatch_burst_031
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_burst_3100
     * @tc.desc Verify burst for request fixture 427, error 8300001, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_burst_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 11; index++) {
          fixture.controller.start('555-000427');
        }
        expect(fixture.service.requests.length).assertEqual(11);
        expect(fixture.service.capabilityChecks).assertEqual(11);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 10; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('555-000427');
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
     * @tc.name MakeCallRequestDispatch_stateEvents_032
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_stateEvents_3200
     * @tc.desc Verify stateEvents for request fixture 428, error 8300002, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_stateEvents_032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000428 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000428 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, ' 555000428 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual(' 555000428 ');
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
     * @tc.name MakeCallRequestDispatch_listenerReuse_033
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallRequestDispatch_listenerReuse_3300
     * @tc.desc Verify listenerReuse for request fixture 429, error 8300003, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallRequestDispatch_listenerReuse_033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 13; index++) {
          fixture.controller.start('13xxxx429');
        }
        expect(fixture.service.capabilityChecks).assertEqual(13);
        expect(fixture.service.requests.length).assertEqual(13);
        expect(fixture.service.requests[0]).assertEqual('13xxxx429');
        expect(fixture.service.requests[12]).assertEqual('13xxxx429');
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
  });
}
