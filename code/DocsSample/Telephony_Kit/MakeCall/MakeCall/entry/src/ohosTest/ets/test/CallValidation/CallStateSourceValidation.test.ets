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

export default function CallStateSourceValidationTest(): void {
  describe('CallStateSourceValidationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallStateSourceValidationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallStateSourceValidationTest');
    });

    /**
     * @tc.name CallStateSourceValidation_stateEvents_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_stateEvents_0100
     * @tc.desc Verify stateEvents for request fixture 1257, error 401, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_stateEvents_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001257');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001257');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 4, 'tel:13800001257');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800001257');
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
     * @tc.name CallStateSourceValidation_listenerReuse_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_listenerReuse_0200
     * @tc.desc Verify listenerReuse for request fixture 1258, error 801, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_listenerReuse_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 6; index++) {
          fixture.controller.start('+8613800001258');
        }
        expect(fixture.service.capabilityChecks).assertEqual(6);
        expect(fixture.service.requests.length).assertEqual(6);
        expect(fixture.service.requests[0]).assertEqual('+8613800001258');
        expect(fixture.service.requests[5]).assertEqual('+8613800001258');
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
     * @tc.name CallStateSourceValidation_subscribeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeError_0300
     * @tc.desc Verify subscribeError for request fixture 1259, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeError_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300001, 'fixture failure 1259');
        fixture.controller.start('555-001259');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001259');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1259');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateSourceValidation_subscribeRetry_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeRetry_0400
     * @tc.desc Verify subscribeRetry for request fixture 1260, error 8300002, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeRetry_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300002, 'fixture failure 1260');
        fixture.controller.start(' 555001260 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start(' 555001260 ');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001260 ');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 0, ' 555001260 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual(' 555001260 ');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateSourceValidation_stateEvents_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_stateEvents_0500
     * @tc.desc Verify stateEvents for request fixture 1261, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_stateEvents_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1261');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1261');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '13xxxx1261');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx1261');
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
     * @tc.name CallStateSourceValidation_listenerReuse_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_listenerReuse_0600
     * @tc.desc Verify listenerReuse for request fixture 1262, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_listenerReuse_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('ext;1262');
        }
        expect(fixture.service.capabilityChecks).assertEqual(10);
        expect(fixture.service.requests.length).assertEqual(10);
        expect(fixture.service.requests[0]).assertEqual('ext;1262');
        expect(fixture.service.requests[9]).assertEqual('ext;1262');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 0; index < 10; index++) {
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(10);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
      },
    );

    /**
     * @tc.name CallStateSourceValidation_subscribeError_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeError_0700
     * @tc.desc Verify subscribeError for request fixture 1263, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeError_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300999, 'fixture failure 1263');
        fixture.controller.start('\uff11\uff1300001263');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001263');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1263');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateSourceValidation_subscribeRetry_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeRetry_0800
     * @tc.desc Verify subscribeRetry for request fixture 1264, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeRetry_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(201, 'fixture failure 1264');
        fixture.controller.start('13800001264');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('13800001264');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001264');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 4, '13800001264');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13800001264');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateSourceValidation_stateEvents_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_stateEvents_0900
     * @tc.desc Verify stateEvents for request fixture 1265, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_stateEvents_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001265');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001265');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, 'tel:13800001265');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800001265');
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
     * @tc.name CallStateSourceValidation_listenerReuse_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_listenerReuse_1000
     * @tc.desc Verify listenerReuse for request fixture 1266, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_listenerReuse_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 14; index++) {
          fixture.controller.start('+8613800001266');
        }
        expect(fixture.service.capabilityChecks).assertEqual(14);
        expect(fixture.service.requests.length).assertEqual(14);
        expect(fixture.service.requests[0]).assertEqual('+8613800001266');
        expect(fixture.service.requests[13]).assertEqual('+8613800001266');
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
     * @tc.name CallStateSourceValidation_subscribeError_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeError_1100
     * @tc.desc Verify subscribeError for request fixture 1267, error 8300001, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeError_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300001, 'fixture failure 1267');
        fixture.controller.start('555-001267');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001267');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1267');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateSourceValidation_subscribeRetry_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeRetry_1200
     * @tc.desc Verify subscribeRetry for request fixture 1268, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeRetry_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300002, 'fixture failure 1268');
        fixture.controller.start(' 555001268 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start(' 555001268 ');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555001268 ');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 1, ' 555001268 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual(' 555001268 ');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateSourceValidation_stateEvents_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_stateEvents_1300
     * @tc.desc Verify stateEvents for request fixture 1269, error 8300003, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_stateEvents_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1269');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1269');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 2, '13xxxx1269');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx1269');
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
     * @tc.name CallStateSourceValidation_listenerReuse_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_listenerReuse_1400
     * @tc.desc Verify listenerReuse for request fixture 1270, error 8300004, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_listenerReuse_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 18; index++) {
          fixture.controller.start('ext;1270');
        }
        expect(fixture.service.capabilityChecks).assertEqual(18);
        expect(fixture.service.requests.length).assertEqual(18);
        expect(fixture.service.requests[0]).assertEqual('ext;1270');
        expect(fixture.service.requests[17]).assertEqual('ext;1270');
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
     * @tc.name CallStateSourceValidation_subscribeError_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeError_1500
     * @tc.desc Verify subscribeError for request fixture 1271, error 8300999, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeError_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300999, 'fixture failure 1271');
        fixture.controller.start('\uff11\uff1300001271');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001271');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1271');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );

    /**
     * @tc.name CallStateSourceValidation_subscribeRetry_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeRetry_1600
     * @tc.desc Verify subscribeRetry for request fixture 1272, error 201, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeRetry_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(201, 'fixture failure 1272');
        fixture.controller.start('13800001272');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        fixture.service.subscribeFailure = undefined;
        fixture.controller.start('13800001272');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual('13800001272');
        expect(fixture.service.subscribeAttempts).assertEqual(2);
        expect(fixture.service.listeners.length).assertEqual(1);
        fixture.service.emit(0, 5, '13800001272');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13800001272');
        await Promise.resolve();
      },
    );

    /**
     * @tc.name CallStateSourceValidation_stateEvents_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_stateEvents_1700
     * @tc.desc Verify stateEvents for request fixture 1273, error 401, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_stateEvents_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001273');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001273');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 6, 'tel:13800001273');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        expect(fixture.logger.states[0].number).assertEqual('tel:13800001273');
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
     * @tc.name CallStateSourceValidation_listenerReuse_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_listenerReuse_1800
     * @tc.desc Verify listenerReuse for request fixture 1274, error 801, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_listenerReuse_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('+8613800001274');
        }
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(3);
        expect(fixture.service.requests[0]).assertEqual('+8613800001274');
        expect(fixture.service.requests[2]).assertEqual('+8613800001274');
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
     * @tc.name CallStateSourceValidation_subscribeError_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CallStateSourceValidation_subscribeError_1900
     * @tc.desc Verify subscribeError for request fixture 1275, error 8300001, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallStateSourceValidation_subscribeError_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.subscribeFailure = makeFailure(8300001, 'fixture failure 1275');
        fixture.controller.start('555-001275');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001275');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('subscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1275');
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      },
    );
  });
}
