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

export default function CapabilityTransitionValidationTest(): void {
  describe('CapabilityTransitionValidationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CapabilityTransitionValidationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CapabilityTransitionValidationTest');
    });

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_0100
     * @tc.desc Verify unsupported for request fixture 1563, error 8300001, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('555-001563');
        }
        expect(fixture.service.capabilityChecks).assertEqual(7);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_0200
     * @tc.desc Verify capabilityError for request fixture 1564, error 8300002, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300002, 'fixture failure 1564');
        fixture.controller.start(' 555001564 ');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1564');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_supportToggle_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_supportToggle_0300
     * @tc.desc Verify supportToggle for request fixture 1565, error 8300003, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_supportToggle_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13xxxx1565');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13xxxx1565');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx1565');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13xxxx1565');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_0400
     * @tc.desc Verify unsupported for request fixture 1566, error 8300004, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 10; index++) {
          fixture.controller.start('ext;1566');
        }
        expect(fixture.service.capabilityChecks).assertEqual(10);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_0500
     * @tc.desc Verify capabilityError for request fixture 1567, error 8300999, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300999, 'fixture failure 1567');
        fixture.controller.start('\uff11\uff1300001567');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1567');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_supportToggle_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_supportToggle_0600
     * @tc.desc Verify supportToggle for request fixture 1568, error 201, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_supportToggle_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13800001568');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13800001568');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800001568');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13800001568');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_0700
     * @tc.desc Verify unsupported for request fixture 1569, error 401, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 13; index++) {
          fixture.controller.start('tel:13800001569');
        }
        expect(fixture.service.capabilityChecks).assertEqual(13);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_0800
     * @tc.desc Verify capabilityError for request fixture 1570, error 801, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(801, 'fixture failure 1570');
        fixture.controller.start('+8613800001570');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1570');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_supportToggle_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_supportToggle_0900
     * @tc.desc Verify supportToggle for request fixture 1571, error 8300001, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_supportToggle_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('555-001571');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('555-001571');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-001571');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('555-001571');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_1000
     * @tc.desc Verify unsupported for request fixture 1572, error 8300002, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 16; index++) {
          fixture.controller.start(' 555001572 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(16);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_1100
     * @tc.desc Verify capabilityError for request fixture 1573, error 8300003, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300003, 'fixture failure 1573');
        fixture.controller.start('13xxxx1573');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1573');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_supportToggle_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_supportToggle_1200
     * @tc.desc Verify supportToggle for request fixture 1574, error 8300004, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_supportToggle_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('ext;1574');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('ext;1574');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;1574');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('ext;1574');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_1300
     * @tc.desc Verify unsupported for request fixture 1575, error 8300999, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 19; index++) {
          fixture.controller.start('\uff11\uff1300001575');
        }
        expect(fixture.service.capabilityChecks).assertEqual(19);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_1400
     * @tc.desc Verify capabilityError for request fixture 1576, error 201, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(201, 'fixture failure 1576');
        fixture.controller.start('13800001576');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1576');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_supportToggle_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_supportToggle_1500
     * @tc.desc Verify supportToggle for request fixture 1577, error 401, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_supportToggle_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('tel:13800001577');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('tel:13800001577');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800001577');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('tel:13800001577');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_1600
     * @tc.desc Verify unsupported for request fixture 1578, error 801, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 3; index++) {
          fixture.controller.start('+8613800001578');
        }
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_1700
     * @tc.desc Verify capabilityError for request fixture 1579, error 8300001, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300001, 'fixture failure 1579');
        fixture.controller.start('555-001579');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1579');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_supportToggle_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_supportToggle_1800
     * @tc.desc Verify supportToggle for request fixture 1580, error 8300002, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_supportToggle_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start(' 555001580 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start(' 555001580 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555001580 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start(' 555001580 ');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_unsupported_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_unsupported_1900
     * @tc.desc Verify unsupported for request fixture 1581, error 8300003, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_unsupported_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 6; index++) {
          fixture.controller.start('13xxxx1581');
        }
        expect(fixture.service.capabilityChecks).assertEqual(6);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CapabilityTransitionValidation_capabilityError_020
     * @tc.number SUB_TELEPHONY_MAKECALL_CapabilityTransitionValidation_capabilityError_2000
     * @tc.desc Verify capabilityError for request fixture 1582, error 8300004, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CapabilityTransitionValidation_capabilityError_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300004, 'fixture failure 1582');
        fixture.controller.start('ext;1582');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 1582');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );
  });
}
