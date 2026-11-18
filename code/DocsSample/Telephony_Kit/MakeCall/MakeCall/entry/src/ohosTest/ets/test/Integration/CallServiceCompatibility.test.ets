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

export default function CallServiceCompatibilityTest(): void {
  describe('CallServiceCompatibilityTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallServiceCompatibilityTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallServiceCompatibilityTest');
    });

    /**
     * @tc.name CallServiceCompatibility_unsupported_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_0100
     * @tc.desc Verify unsupported for request fixture 67, error 8300001, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('555-000067');
        }
        expect(fixture.service.capabilityChecks).assertEqual(12);
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
     * @tc.name CallServiceCompatibility_capabilityError_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_0200
     * @tc.desc Verify capabilityError for request fixture 68, error 8300002, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300002, 'fixture failure 68');
        fixture.controller.start(' 555000068 ');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300002);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 68');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_0300
     * @tc.desc Verify supportToggle for request fixture 69, error 8300003, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13xxxx69');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13xxxx69');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13xxxx69');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13xxxx69');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_0400
     * @tc.desc Verify unsupported for request fixture 70, error 8300004, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 15; index++) {
          fixture.controller.start('ext;70');
        }
        expect(fixture.service.capabilityChecks).assertEqual(15);
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
     * @tc.name CallServiceCompatibility_capabilityError_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_0500
     * @tc.desc Verify capabilityError for request fixture 71, error 8300999, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300999, 'fixture failure 71');
        fixture.controller.start('\uff11\uff1300000071');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300999);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 71');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_0600
     * @tc.desc Verify supportToggle for request fixture 72, error 201, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('13800000072');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('13800000072');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800000072');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('13800000072');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_0700
     * @tc.desc Verify unsupported for request fixture 73, error 401, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 18; index++) {
          fixture.controller.start('tel:13800000073');
        }
        expect(fixture.service.capabilityChecks).assertEqual(18);
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
     * @tc.name CallServiceCompatibility_capabilityError_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_0800
     * @tc.desc Verify capabilityError for request fixture 74, error 801, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(801, 'fixture failure 74');
        fixture.controller.start('+8613800000074');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(801);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 74');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_0900
     * @tc.desc Verify supportToggle for request fixture 75, error 8300001, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('555-000075');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('555-000075');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('555-000075');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('555-000075');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_1000
     * @tc.desc Verify unsupported for request fixture 76, error 8300002, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 2; index++) {
          fixture.controller.start(' 555000076 ');
        }
        expect(fixture.service.capabilityChecks).assertEqual(2);
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
     * @tc.name CallServiceCompatibility_capabilityError_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_1100
     * @tc.desc Verify capabilityError for request fixture 77, error 8300003, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300003, 'fixture failure 77');
        fixture.controller.start('13xxxx77');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 77');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_1200
     * @tc.desc Verify supportToggle for request fixture 78, error 8300004, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('ext;78');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('ext;78');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;78');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('ext;78');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_1300
     * @tc.desc Verify unsupported for request fixture 79, error 8300999, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 5; index++) {
          fixture.controller.start('\uff11\uff1300000079');
        }
        expect(fixture.service.capabilityChecks).assertEqual(5);
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
     * @tc.name CallServiceCompatibility_capabilityError_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_1400
     * @tc.desc Verify capabilityError for request fixture 80, error 201, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(201, 'fixture failure 80');
        fixture.controller.start('13800000080');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(201);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 80');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_1500
     * @tc.desc Verify supportToggle for request fixture 81, error 401, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('tel:13800000081');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('tel:13800000081');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000081');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('tel:13800000081');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_1600
     * @tc.desc Verify unsupported for request fixture 82, error 801, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 8; index++) {
          fixture.controller.start('+8613800000082');
        }
        expect(fixture.service.capabilityChecks).assertEqual(8);
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
     * @tc.name CallServiceCompatibility_capabilityError_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_1700
     * @tc.desc Verify capabilityError for request fixture 83, error 8300001, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300001, 'fixture failure 83');
        fixture.controller.start('555-000083');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 83');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_018
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_1800
     * @tc.desc Verify supportToggle for request fixture 84, error 8300002, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start(' 555000084 ');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start(' 555000084 ');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual(' 555000084 ');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start(' 555000084 ');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_019
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_1900
     * @tc.desc Verify unsupported for request fixture 85, error 8300003, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 11; index++) {
          fixture.controller.start('13xxxx85');
        }
        expect(fixture.service.capabilityChecks).assertEqual(11);
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
     * @tc.name CallServiceCompatibility_capabilityError_020
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_capabilityError_2000
     * @tc.desc Verify capabilityError for request fixture 86, error 8300004, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_capabilityError_020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.capabilityFailure = makeFailure(8300004, 'fixture failure 86');
        fixture.controller.start('ext;86');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.completions.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        expect(fixture.service.listeners.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('start');
        expect(fixture.logger.failures[0].code).assertEqual(8300004);
        expect(fixture.logger.failures[0].message).assertEqual('fixture failure 86');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        await Promise.resolve();
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_supportToggle_021
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_supportToggle_2100
     * @tc.desc Verify supportToggle for request fixture 87, error 8300999, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_supportToggle_021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        fixture.controller.start('\uff11\uff1300000087');
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(0);
        fixture.service.supported = true;
        fixture.controller.start('\uff11\uff1300000087');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000087');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        fixture.service.supported = false;
        fixture.controller.start('\uff11\uff1300000087');
        expect(fixture.service.capabilityChecks).assertEqual(3);
        expect(fixture.service.requests.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallServiceCompatibility_unsupported_022
     * @tc.number SUB_TELEPHONY_MAKECALL_CallServiceCompatibility_unsupported_2200
     * @tc.desc Verify unsupported for request fixture 88, error 201, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallServiceCompatibility_unsupported_022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 14; index++) {
          fixture.controller.start('13800000088');
        }
        expect(fixture.service.capabilityChecks).assertEqual(14);
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
  });
}
