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

export default function RepeatedMakeCallCommandsTest(): void {
  describe('RepeatedMakeCallCommandsTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting RepeatedMakeCallCommandsTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished RepeatedMakeCallCommandsTest');
    });

    /**
     * @tc.name RepeatedMakeCallCommands_listenerReuse_001
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_0100
     * @tc.desc Verify listenerReuse for request fixture 356, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 16; index++) {
          fixture.controller.start(' 555000356 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(16);
        expect(fixture.service.requests.length).assertEqual(16);
        expect(fixture.service.requests[0]).assertEqual(' 555000356 ');
        expect(fixture.service.requests[15]).assertEqual(' 555000356 ');
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
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_002
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_0200
     * @tc.desc Verify reverseCallbacks for request fixture 357, error 8300003, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx357');
        fixture.controller.start('tel:555000357');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('13xxxx357');
        expect(fixture.service.requests[1]).assertEqual('tel:555000357');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300003, 'fixture failure 357'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
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
     * @tc.name RepeatedMakeCallCommands_burst_003
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_0300
     * @tc.desc Verify burst for request fixture 358, error 8300004, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 18; index++) {
          fixture.controller.start('ext;358');
        }
        expect(fixture.service.requests.length).assertEqual(18);
        expect(fixture.service.capabilityChecks).assertEqual(18);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 17; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('ext;358');
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
     * @tc.name RepeatedMakeCallCommands_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 359, error 8300999, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000359');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000359');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, '\uff11\uff1300000359');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300000359');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_005
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_0500
     * @tc.desc Verify listenerReuse for request fixture 360, error 201, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 20; index++) {
          fixture.controller.start('13800000360');
        }
        expect(fixture.service.capabilityChecks).assertEqual(20);
        expect(fixture.service.requests.length).assertEqual(20);
        expect(fixture.service.requests[0]).assertEqual('13800000360');
        expect(fixture.service.requests[19]).assertEqual('13800000360');
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
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_006
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_0600
     * @tc.desc Verify reverseCallbacks for request fixture 361, error 401, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000361');
        fixture.controller.start('tel:555000361');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000361');
        expect(fixture.service.requests[1]).assertEqual('tel:555000361');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(401, 'fixture failure 361'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(401);
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
     * @tc.name RepeatedMakeCallCommands_burst_007
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_0700
     * @tc.desc Verify burst for request fixture 362, error 801, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('+8613800000362');
        }
        expect(fixture.service.requests.length).assertEqual(3);
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 2; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('+8613800000362');
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
     * @tc.name RepeatedMakeCallCommands_stateEvents_008
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_0800
     * @tc.desc Verify stateEvents for request fixture 363, error 8300001, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000363');
        expect(fixture.service.requests[0]).assertEqual('555-000363');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '555-000363');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('555-000363');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_009
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_0900
     * @tc.desc Verify listenerReuse for request fixture 364, error 8300002, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 5; index++) {
          fixture.controller.start(' 555000364 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(5);
        expect(fixture.service.requests.length).assertEqual(5);
        expect(fixture.service.requests[0]).assertEqual(' 555000364 ');
        expect(fixture.service.requests[4]).assertEqual(' 555000364 ');
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
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_010
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_1000
     * @tc.desc Verify reverseCallbacks for request fixture 365, error 8300003, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx365');
        fixture.controller.start('tel:555000365');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('13xxxx365');
        expect(fixture.service.requests[1]).assertEqual('tel:555000365');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300003, 'fixture failure 365'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
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
     * @tc.name RepeatedMakeCallCommands_burst_011
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_1100
     * @tc.desc Verify burst for request fixture 366, error 8300004, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('ext;366');
        }
        expect(fixture.service.requests.length).assertEqual(7);
        expect(fixture.service.capabilityChecks).assertEqual(7);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 6; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('ext;366');
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
     * @tc.name RepeatedMakeCallCommands_stateEvents_012
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_1200
     * @tc.desc Verify stateEvents for request fixture 367, error 8300999, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000367');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000367');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 3, '\uff11\uff1300000367');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300000367');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_013
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_1300
     * @tc.desc Verify listenerReuse for request fixture 368, error 201, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 9; index++) {
          fixture.controller.start('13800000368');
        }
        expect(fixture.service.capabilityChecks).assertEqual(9);
        expect(fixture.service.requests.length).assertEqual(9);
        expect(fixture.service.requests[0]).assertEqual('13800000368');
        expect(fixture.service.requests[8]).assertEqual('13800000368');
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
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_014
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_1400
     * @tc.desc Verify reverseCallbacks for request fixture 369, error 401, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000369');
        fixture.controller.start('tel:555000369');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000369');
        expect(fixture.service.requests[1]).assertEqual('tel:555000369');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(401, 'fixture failure 369'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(401);
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
     * @tc.name RepeatedMakeCallCommands_burst_015
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_1500
     * @tc.desc Verify burst for request fixture 370, error 801, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 11; index++) {
          fixture.controller.start('+8613800000370');
        }
        expect(fixture.service.requests.length).assertEqual(11);
        expect(fixture.service.capabilityChecks).assertEqual(11);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 10; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('+8613800000370');
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
     * @tc.name RepeatedMakeCallCommands_stateEvents_016
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_1600
     * @tc.desc Verify stateEvents for request fixture 371, error 8300001, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000371');
        expect(fixture.service.requests[0]).assertEqual('555-000371');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, '555-000371');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('555-000371');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_017
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_1700
     * @tc.desc Verify listenerReuse for request fixture 372, error 8300002, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 13; index++) {
          fixture.controller.start(' 555000372 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(13);
        expect(fixture.service.requests.length).assertEqual(13);
        expect(fixture.service.requests[0]).assertEqual(' 555000372 ');
        expect(fixture.service.requests[12]).assertEqual(' 555000372 ');
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
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_018
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_1800
     * @tc.desc Verify reverseCallbacks for request fixture 373, error 8300003, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx373');
        fixture.controller.start('tel:555000373');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('13xxxx373');
        expect(fixture.service.requests[1]).assertEqual('tel:555000373');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300003, 'fixture failure 373'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
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
     * @tc.name RepeatedMakeCallCommands_burst_019
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_1900
     * @tc.desc Verify burst for request fixture 374, error 8300004, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 15; index++) {
          fixture.controller.start('ext;374');
        }
        expect(fixture.service.requests.length).assertEqual(15);
        expect(fixture.service.capabilityChecks).assertEqual(15);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 14; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('ext;374');
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
     * @tc.name RepeatedMakeCallCommands_stateEvents_020
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_2000
     * @tc.desc Verify stateEvents for request fixture 375, error 8300999, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000375');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000375');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, '\uff11\uff1300000375');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300000375');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_021
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_2100
     * @tc.desc Verify listenerReuse for request fixture 376, error 201, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 17; index++) {
          fixture.controller.start('13800000376');
        }
        expect(fixture.service.capabilityChecks).assertEqual(17);
        expect(fixture.service.requests.length).assertEqual(17);
        expect(fixture.service.requests[0]).assertEqual('13800000376');
        expect(fixture.service.requests[16]).assertEqual('13800000376');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 17; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(17);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_022
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_2200
     * @tc.desc Verify reverseCallbacks for request fixture 377, error 401, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000377');
        fixture.controller.start('tel:555000377');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000377');
        expect(fixture.service.requests[1]).assertEqual('tel:555000377');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(401, 'fixture failure 377'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(401);
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
     * @tc.name RepeatedMakeCallCommands_burst_023
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_2300
     * @tc.desc Verify burst for request fixture 378, error 801, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 19; index++) {
          fixture.controller.start('+8613800000378');
        }
        expect(fixture.service.requests.length).assertEqual(19);
        expect(fixture.service.capabilityChecks).assertEqual(19);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 18; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('+8613800000378');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(19);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name RepeatedMakeCallCommands_stateEvents_024
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_2400
     * @tc.desc Verify stateEvents for request fixture 379, error 8300001, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000379');
        expect(fixture.service.requests[0]).assertEqual('555-000379');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '555-000379');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('555-000379');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_025
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_2500
     * @tc.desc Verify listenerReuse for request fixture 380, error 8300002, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 2; index++) {
          fixture.controller.start(' 555000380 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual(' 555000380 ');
        expect(fixture.service.requests[1]).assertEqual(' 555000380 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 2; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(2);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_026
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_2600
     * @tc.desc Verify reverseCallbacks for request fixture 381, error 8300003, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx381');
        fixture.controller.start('tel:555000381');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('13xxxx381');
        expect(fixture.service.requests[1]).assertEqual('tel:555000381');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300003, 'fixture failure 381'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
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
     * @tc.name RepeatedMakeCallCommands_burst_027
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_2700
     * @tc.desc Verify burst for request fixture 382, error 8300004, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 4; index++) {
          fixture.controller.start('ext;382');
        }
        expect(fixture.service.requests.length).assertEqual(4);
        expect(fixture.service.capabilityChecks).assertEqual(4);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 3; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('ext;382');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(4);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name RepeatedMakeCallCommands_stateEvents_028
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_stateEvents_2800
     * @tc.desc Verify stateEvents for request fixture 383, error 8300999, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_stateEvents_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000383');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000383');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, '\uff11\uff1300000383');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300000383');
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
     * @tc.name RepeatedMakeCallCommands_listenerReuse_029
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_listenerReuse_2900
     * @tc.desc Verify listenerReuse for request fixture 384, error 201, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_listenerReuse_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 6; index++) {
          fixture.controller.start('13800000384');
        }
        expect(fixture.service.capabilityChecks).assertEqual(6);
        expect(fixture.service.requests.length).assertEqual(6);
        expect(fixture.service.requests[0]).assertEqual('13800000384');
        expect(fixture.service.requests[5]).assertEqual('13800000384');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 6; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name RepeatedMakeCallCommands_reverseCallbacks_030
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_reverseCallbacks_3000
     * @tc.desc Verify reverseCallbacks for request fixture 385, error 401, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_reverseCallbacks_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000385');
        fixture.controller.start('tel:555000385');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000385');
        expect(fixture.service.requests[1]).assertEqual('tel:555000385');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(401, 'fixture failure 385'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(401);
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
     * @tc.name RepeatedMakeCallCommands_burst_031
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedMakeCallCommands_burst_3100
     * @tc.desc Verify burst for request fixture 386, error 801, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedMakeCallCommands_burst_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 8; index++) {
          fixture.controller.start('+8613800000386');
        }
        expect(fixture.service.requests.length).assertEqual(8);
        expect(fixture.service.capabilityChecks).assertEqual(8);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 7; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual('+8613800000386');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(8);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );
  });
}
