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

export default function CallStateCodeValidationTest(): void {
  describe('CallStateCodeValidationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallStateCodeValidationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallStateCodeValidationTest');
    });

    /**
     * @tc.name CallStateCodeValidation_stateEvents_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_0100
     * @tc.desc Verify stateEvents for request fixture 1691, error 8300001, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001691');
        expect(fixture.service.requests[0]).assertEqual('555-001691');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, '555-001691');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual('555-001691');
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
     * @tc.name CallStateCodeValidation_listenerReuse_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_0200
     * @tc.desc Verify listenerReuse for request fixture 1692, error 8300002, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 3; index++) {
          fixture.controller.start(' 555001692 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(3);
        expect(fixture.service.requests[0]).assertEqual(' 555001692 ');
        expect(fixture.service.requests[2]).assertEqual(' 555001692 ');
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
     * @tc.name CallStateCodeValidation_subscribeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_0300
     * @tc.desc Verify subscribeError for request fixture 1693, error 8300003, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1693');
        fixture.controller.start('13xxxx1693');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1693');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1693');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_0400
     * @tc.desc Verify subscribeRetry for request fixture 1694, error 8300004, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1694');
        fixture.controller.start('ext;1694');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1694');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1694');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 0, 'ext;1694');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1694');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_0500
     * @tc.desc Verify stateEvents for request fixture 1695, error 8300999, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001695');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001695');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '\uff11\uff1300001695');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001695');
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
     * @tc.name CallStateCodeValidation_listenerReuse_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_0600
     * @tc.desc Verify listenerReuse for request fixture 1696, error 201, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('13800001696');
        }
        expect(fixture.service.capabilityChecks).assertEqual(7);
        expect(fixture.service.requests.length).assertEqual(7);
        expect(fixture.service.requests[0]).assertEqual('13800001696');
        expect(fixture.service.requests[6]).assertEqual('13800001696');
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
     * @tc.name CallStateCodeValidation_subscribeError_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_0700
     * @tc.desc Verify subscribeError for request fixture 1697, error 401, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1697');
        fixture.controller.start('tel:13800001697');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001697');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1697');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_0800
     * @tc.desc Verify subscribeRetry for request fixture 1698, error 801, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1698');
        fixture.controller.start('+8613800001698');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001698');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001698');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 4, '+8613800001698');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001698');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_0900
     * @tc.desc Verify stateEvents for request fixture 1699, error 8300001, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001699');
        expect(fixture.service.requests[0]).assertEqual('555-001699');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, '555-001699');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual('555-001699');
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
     * @tc.name CallStateCodeValidation_listenerReuse_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_1000
     * @tc.desc Verify listenerReuse for request fixture 1700, error 8300002, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 11; index++) {
          fixture.controller.start(' 555001700 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(11);
        expect(fixture.service.requests.length).assertEqual(11);
        expect(fixture.service.requests[0]).assertEqual(' 555001700 ');
        expect(fixture.service.requests[10]).assertEqual(' 555001700 ');
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
     * @tc.name CallStateCodeValidation_subscribeError_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_1100
     * @tc.desc Verify subscribeError for request fixture 1701, error 8300003, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1701');
        fixture.controller.start('13xxxx1701');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1701');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1701');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_1200
     * @tc.desc Verify subscribeRetry for request fixture 1702, error 8300004, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1702');
        fixture.controller.start('ext;1702');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1702');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1702');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 1, 'ext;1702');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1702');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_1300
     * @tc.desc Verify stateEvents for request fixture 1703, error 8300999, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001703');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001703');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, '\uff11\uff1300001703');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001703');
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
     * @tc.name CallStateCodeValidation_listenerReuse_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_1400
     * @tc.desc Verify listenerReuse for request fixture 1704, error 201, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 15; index++) {
          fixture.controller.start('13800001704');
        }
        expect(fixture.service.capabilityChecks).assertEqual(15);
        expect(fixture.service.requests.length).assertEqual(15);
        expect(fixture.service.requests[0]).assertEqual('13800001704');
        expect(fixture.service.requests[14]).assertEqual('13800001704');
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

    /**
     * @tc.name CallStateCodeValidation_subscribeError_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_1500
     * @tc.desc Verify subscribeError for request fixture 1705, error 401, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1705');
        fixture.controller.start('tel:13800001705');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001705');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1705');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_1600
     * @tc.desc Verify subscribeRetry for request fixture 1706, error 801, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1706');
        fixture.controller.start('+8613800001706');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001706');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001706');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 5, '+8613800001706');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001706');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_1700
     * @tc.desc Verify stateEvents for request fixture 1707, error 8300001, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001707');
        expect(fixture.service.requests[0]).assertEqual('555-001707');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '555-001707');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('555-001707');
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
     * @tc.name CallStateCodeValidation_listenerReuse_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_1800
     * @tc.desc Verify listenerReuse for request fixture 1708, error 8300002, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 19; index++) {
          fixture.controller.start(' 555001708 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(19);
        expect(fixture.service.requests.length).assertEqual(19);
        expect(fixture.service.requests[0]).assertEqual(' 555001708 ');
        expect(fixture.service.requests[18]).assertEqual(' 555001708 ');
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
     * @tc.name CallStateCodeValidation_subscribeError_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_1900
     * @tc.desc Verify subscribeError for request fixture 1709, error 8300003, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1709');
        fixture.controller.start('13xxxx1709');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1709');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1709');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_020
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_2000
     * @tc.desc Verify subscribeRetry for request fixture 1710, error 8300004, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1710');
        fixture.controller.start('ext;1710');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1710');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1710');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 2, 'ext;1710');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1710');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_021
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_2100
     * @tc.desc Verify stateEvents for request fixture 1711, error 8300999, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001711');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001711');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 3, '\uff11\uff1300001711');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001711');
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
     * @tc.name CallStateCodeValidation_listenerReuse_022
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_2200
     * @tc.desc Verify listenerReuse for request fixture 1712, error 201, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 4; index++) {
          fixture.controller.start('13800001712');
        }
        expect(fixture.service.capabilityChecks).assertEqual(4);
        expect(fixture.service.requests.length).assertEqual(4);
        expect(fixture.service.requests[0]).assertEqual('13800001712');
        expect(fixture.service.requests[3]).assertEqual('13800001712');
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
     * @tc.name CallStateCodeValidation_subscribeError_023
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_2300
     * @tc.desc Verify subscribeError for request fixture 1713, error 401, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1713');
        fixture.controller.start('tel:13800001713');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001713');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1713');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_024
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_2400
     * @tc.desc Verify subscribeRetry for request fixture 1714, error 801, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1714');
        fixture.controller.start('+8613800001714');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001714');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001714');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 6, '+8613800001714');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001714');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_025
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_2500
     * @tc.desc Verify stateEvents for request fixture 1715, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001715');
        expect(fixture.service.requests[0]).assertEqual('555-001715');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 0, '555-001715');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        expect(fixture.logger.states[0].number).assertEqual('555-001715');
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
     * @tc.name CallStateCodeValidation_listenerReuse_026
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_2600
     * @tc.desc Verify listenerReuse for request fixture 1716, error 8300002, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 8; index++) {
          fixture.controller.start(' 555001716 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(8);
        expect(fixture.service.requests.length).assertEqual(8);
        expect(fixture.service.requests[0]).assertEqual(' 555001716 ');
        expect(fixture.service.requests[7]).assertEqual(' 555001716 ');
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
     * @tc.name CallStateCodeValidation_subscribeError_027
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_2700
     * @tc.desc Verify subscribeError for request fixture 1717, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1717');
        fixture.controller.start('13xxxx1717');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1717');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1717');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_028
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_2800
     * @tc.desc Verify subscribeRetry for request fixture 1718, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1718');
        fixture.controller.start('ext;1718');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1718');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1718');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 3, 'ext;1718');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1718');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_029
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_2900
     * @tc.desc Verify stateEvents for request fixture 1719, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001719');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001719');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, '\uff11\uff1300001719');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001719');
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
     * @tc.name CallStateCodeValidation_listenerReuse_030
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_3000
     * @tc.desc Verify listenerReuse for request fixture 1720, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('13800001720');
        }
        expect(fixture.service.capabilityChecks).assertEqual(12);
        expect(fixture.service.requests.length).assertEqual(12);
        expect(fixture.service.requests[0]).assertEqual('13800001720');
        expect(fixture.service.requests[11]).assertEqual('13800001720');
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
     * @tc.name CallStateCodeValidation_subscribeError_031
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_3100
     * @tc.desc Verify subscribeError for request fixture 1721, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1721');
        fixture.controller.start('tel:13800001721');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001721');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1721');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_032
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_3200
     * @tc.desc Verify subscribeRetry for request fixture 1722, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1722');
        fixture.controller.start('+8613800001722');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001722');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001722');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 0, '+8613800001722');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001722');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_033
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_3300
     * @tc.desc Verify stateEvents for request fixture 1723, error 8300001, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001723');
        expect(fixture.service.requests[0]).assertEqual('555-001723');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '555-001723');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('555-001723');
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
     * @tc.name CallStateCodeValidation_listenerReuse_034
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_3400
     * @tc.desc Verify listenerReuse for request fixture 1724, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 16; index++) {
          fixture.controller.start(' 555001724 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(16);
        expect(fixture.service.requests.length).assertEqual(16);
        expect(fixture.service.requests[0]).assertEqual(' 555001724 ');
        expect(fixture.service.requests[15]).assertEqual(' 555001724 ');
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
     * @tc.name CallStateCodeValidation_subscribeError_035
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_3500
     * @tc.desc Verify subscribeError for request fixture 1725, error 8300003, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1725');
        fixture.controller.start('13xxxx1725');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1725');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1725');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_036
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_3600
     * @tc.desc Verify subscribeRetry for request fixture 1726, error 8300004, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1726');
        fixture.controller.start('ext;1726');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1726');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1726');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 4, 'ext;1726');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1726');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_037
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_3700
     * @tc.desc Verify stateEvents for request fixture 1727, error 8300999, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001727');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001727');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, '\uff11\uff1300001727');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001727');
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
     * @tc.name CallStateCodeValidation_listenerReuse_038
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_3800
     * @tc.desc Verify listenerReuse for request fixture 1728, error 201, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 20; index++) {
          fixture.controller.start('13800001728');
        }
        expect(fixture.service.capabilityChecks).assertEqual(20);
        expect(fixture.service.requests.length).assertEqual(20);
        expect(fixture.service.requests[0]).assertEqual('13800001728');
        expect(fixture.service.requests[19]).assertEqual('13800001728');
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
     * @tc.name CallStateCodeValidation_subscribeError_039
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_3900
     * @tc.desc Verify subscribeError for request fixture 1729, error 401, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1729');
        fixture.controller.start('tel:13800001729');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001729');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1729');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_040
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_4000
     * @tc.desc Verify subscribeRetry for request fixture 1730, error 801, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1730');
        fixture.controller.start('+8613800001730');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001730');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001730');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 1, '+8613800001730');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001730');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_041
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_4100
     * @tc.desc Verify stateEvents for request fixture 1731, error 8300001, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001731');
        expect(fixture.service.requests[0]).assertEqual('555-001731');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, '555-001731');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('555-001731');
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
     * @tc.name CallStateCodeValidation_listenerReuse_042
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_4200
     * @tc.desc Verify listenerReuse for request fixture 1732, error 8300002, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 5; index++) {
          fixture.controller.start(' 555001732 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(5);
        expect(fixture.service.requests.length).assertEqual(5);
        expect(fixture.service.requests[0]).assertEqual(' 555001732 ');
        expect(fixture.service.requests[4]).assertEqual(' 555001732 ');
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
     * @tc.name CallStateCodeValidation_subscribeError_043
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_4300
     * @tc.desc Verify subscribeError for request fixture 1733, error 8300003, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300003, 'fixture failure 1733');
        fixture.controller.start('13xxxx1733');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1733');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1733');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_044
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_4400
     * @tc.desc Verify subscribeRetry for request fixture 1734, error 8300004, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300004, 'fixture failure 1734');
        fixture.controller.start('ext;1734');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('ext;1734');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('ext;1734');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 5, 'ext;1734');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('ext;1734');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_045
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_4500
     * @tc.desc Verify stateEvents for request fixture 1735, error 8300999, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300001735');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001735');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, '\uff11\uff1300001735');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('\uff11\uff1300001735');
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
     * @tc.name CallStateCodeValidation_listenerReuse_046
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_listenerReuse_4600
     * @tc.desc Verify listenerReuse for request fixture 1736, error 201, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_listenerReuse_046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 9; index++) {
          fixture.controller.start('13800001736');
        }
        expect(fixture.service.capabilityChecks).assertEqual(9);
        expect(fixture.service.requests.length).assertEqual(9);
        expect(fixture.service.requests[0]).assertEqual('13800001736');
        expect(fixture.service.requests[8]).assertEqual('13800001736');
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
     * @tc.name CallStateCodeValidation_subscribeError_047
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeError_4700
     * @tc.desc Verify subscribeError for request fixture 1737, error 401, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeError_047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(401, 'fixture failure 1737');
        fixture.controller.start('tel:13800001737');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001737');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(401);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1737');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateCodeValidation_subscribeRetry_048
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_subscribeRetry_4800
     * @tc.desc Verify subscribeRetry for request fixture 1738, error 801, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_subscribeRetry_048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(801, 'fixture failure 1738');
        fixture.controller.start('+8613800001738');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('+8613800001738');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('+8613800001738');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 2, '+8613800001738');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('+8613800001738');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateCodeValidation_stateEvents_049
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateCodeValidation_stateEvents_4900
     * @tc.desc Verify stateEvents for request fixture 1739, error 8300001, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateCodeValidation_stateEvents_049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001739');
        expect(fixture.service.requests[0]).assertEqual('555-001739');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 3, '555-001739');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        expect(fixture.logger.states[0].number).assertEqual('555-001739');
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
  });
}
