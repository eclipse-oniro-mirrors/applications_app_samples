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

export default function CallRegressionTest(): void {
  describe('CallRegressionTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallRegressionTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallRegressionTest');
    });

    /**
     * @tc.name CallRegression_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 9, error 401, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_deferredSuccess_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000009');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('tel:13800000009');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name CallRegression_unsupported_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_unsupported_0200
     * @tc.desc Verify unsupported for request fixture 10, error 801, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_unsupported_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('+8613800000010');
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
     * @tc.name CallRegression_makeError_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_makeError_0300
     * @tc.desc Verify makeError for request fixture 11, error 8300001, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_makeError_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.service.makeFailure = makeFailure(8300001, 'fixture failure 11');
      fixture.controller.start('555-000011');
      expect(fixture.service.capabilityChecks).assertEqual(1);
      expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
      expect(fixture.service.requests.length).assertEqual(0);
      expect(fixture.service.completions.length).assertEqual(0);
      expect(fixture.service.subscribeAttempts).assertEqual(0);
      expect(fixture.service.listeners.length).assertEqual(0);
      expect(fixture.logger.successes).assertEqual(0);
      expect(fixture.logger.failures.length).assertEqual(1);
      expect(fixture.logger.failures[0].operation).assertEqual('start');
      expect(fixture.logger.failures[0].code).assertEqual(8300001);
      expect(fixture.logger.failures[0].message).assertEqual('fixture failure 11');
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      await Promise.resolve();
    });

    /**
     * @tc.name CallRegression_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 12, error 8300002, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000012 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000012 ');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, ' 555000012 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual(' 555000012 ');
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
     * @tc.name CallRegression_dispose_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_dispose_0500
     * @tc.desc Verify dispose for request fixture 13, error 8300003, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_dispose_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('13xxxx13');
      expect(fixture.service.requests[0]).assertEqual('13xxxx13');
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
     * @tc.name CallRegression_makeRetry_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_makeRetry_0600
     * @tc.desc Verify makeRetry for request fixture 14, error 8300004, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_makeRetry_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.service.makeFailure = makeFailure(8300004, 'fixture failure 14');
      fixture.controller.start('ext;14');
      expect(fixture.service.requests.length).assertEqual(0);
      expect(fixture.logger.failures[0].operation).assertEqual('start');
      expect(fixture.logger.failures[0].code).assertEqual(8300004);
      expect(fixture.service.subscribeAttempts).assertEqual(0);
      fixture.service.makeFailure = undefined;
      fixture.controller.start('ext;14');
      expect(fixture.service.requests.length).assertEqual(1);
      expect(fixture.service.requests[0]).assertEqual('ext;14');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      expect(fixture.logger.failures.length).assertEqual(1);
      expect(fixture.logger.states.length).assertEqual(0);
    });

    /**
     * @tc.name CallRegression_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 15, error 8300999, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('\uff11\uff1300000015');
          other.service.supported = false;
          other.controller.start('\uff11\uff1300000015');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000015');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 15'));
          expect(fixture.logger.failures[0].code).assertEqual(8300999);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name CallRegression_deferredSuccess_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_deferredSuccess_0800
     * @tc.desc Verify deferredSuccess for request fixture 16, error 201, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_deferredSuccess_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000016');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('13800000016');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name CallRegression_unsupported_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_unsupported_0900
     * @tc.desc Verify unsupported for request fixture 17, error 401, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_unsupported_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 19; index++) {
          fixture.controller.start('tel:13800000017');
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
     * @tc.name CallRegression_makeError_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_makeError_1000
     * @tc.desc Verify makeError for request fixture 18, error 801, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_makeError_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.service.makeFailure = makeFailure(801, 'fixture failure 18');
      fixture.controller.start('+8613800000018');
      expect(fixture.service.capabilityChecks).assertEqual(1);
      expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
      expect(fixture.service.requests.length).assertEqual(0);
      expect(fixture.service.completions.length).assertEqual(0);
      expect(fixture.service.subscribeAttempts).assertEqual(0);
      expect(fixture.service.listeners.length).assertEqual(0);
      expect(fixture.logger.successes).assertEqual(0);
      expect(fixture.logger.failures.length).assertEqual(1);
      expect(fixture.logger.failures[0].operation).assertEqual('start');
      expect(fixture.logger.failures[0].code).assertEqual(801);
      expect(fixture.logger.failures[0].message).assertEqual('fixture failure 18');
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      await Promise.resolve();
    });

    /**
     * @tc.name CallRegression_stateEvents_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_stateEvents_1100
     * @tc.desc Verify stateEvents for request fixture 19, error 8300001, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_stateEvents_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000019');
        expect(fixture.service.requests[0]).assertEqual('555-000019');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 5, '555-000019');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(5);
        expect(fixture.logger.states[0].number).assertEqual('555-000019');
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
     * @tc.name CallRegression_dispose_012
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_dispose_1200
     * @tc.desc Verify dispose for request fixture 20, error 8300002, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_dispose_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start(' 555000020 ');
      expect(fixture.service.requests[0]).assertEqual(' 555000020 ');
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
     * @tc.name CallRegression_makeRetry_013
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_makeRetry_1300
     * @tc.desc Verify makeRetry for request fixture 21, error 8300003, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_makeRetry_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.service.makeFailure = makeFailure(8300003, 'fixture failure 21');
      fixture.controller.start('13xxxx21');
      expect(fixture.service.requests.length).assertEqual(0);
      expect(fixture.logger.failures[0].operation).assertEqual('start');
      expect(fixture.logger.failures[0].code).assertEqual(8300003);
      expect(fixture.service.subscribeAttempts).assertEqual(0);
      fixture.service.makeFailure = undefined;
      fixture.controller.start('13xxxx21');
      expect(fixture.service.requests.length).assertEqual(1);
      expect(fixture.service.requests[0]).assertEqual('13xxxx21');
      expect(fixture.service.capabilityChecks).assertEqual(2);
      expect(fixture.service.subscribeAttempts).assertEqual(1);
      await fixture.service.completeLater(0);
      expect(fixture.logger.successes).assertEqual(1);
      expect(fixture.logger.failures.length).assertEqual(1);
      expect(fixture.logger.states.length).assertEqual(0);
    });

    /**
     * @tc.name CallRegression_independentControllers_014
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_independentControllers_1400
     * @tc.desc Verify independentControllers for request fixture 22, error 8300004, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_independentControllers_014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('ext;22');
          other.service.supported = false;
          other.controller.start('ext;22');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('ext;22');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 22'));
          expect(fixture.logger.failures[0].code).assertEqual(8300004);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name CallRegression_deferredSuccess_015
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_deferredSuccess_1500
     * @tc.desc Verify deferredSuccess for request fixture 23, error 8300999, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_deferredSuccess_015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000023');
        expect(fixture.service.capabilityChecks).assertEqual(1);
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000023');
        expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall,subscribe');
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name CallRegression_unsupported_016
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_unsupported_1600
     * @tc.desc Verify unsupported for request fixture 24, error 201, burst 7.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallRegression_unsupported_016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.service.supported = false;
        for (let index = 0; index < 7; index++) {
          fixture.controller.start('13800000024');
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
     * @tc.name CallRegression_makeError_017
     * @tc.number SUB_TELEPHONY_MAKECALL_CallRegression_makeError_1700
     * @tc.desc Verify makeError for request fixture 25, error 401, burst 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('CallRegression_makeError_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.service.makeFailure = makeFailure(401, 'fixture failure 25');
      fixture.controller.start('tel:13800000025');
      expect(fixture.service.capabilityChecks).assertEqual(1);
      expect(fixture.service.operations.join(',')).assertEqual('capability,makeCall');
      expect(fixture.service.requests.length).assertEqual(0);
      expect(fixture.service.completions.length).assertEqual(0);
      expect(fixture.service.subscribeAttempts).assertEqual(0);
      expect(fixture.service.listeners.length).assertEqual(0);
      expect(fixture.logger.successes).assertEqual(0);
      expect(fixture.logger.failures.length).assertEqual(1);
      expect(fixture.logger.failures[0].operation).assertEqual('start');
      expect(fixture.logger.failures[0].code).assertEqual(401);
      expect(fixture.logger.failures[0].message).assertEqual('fixture failure 25');
      fixture.controller.dispose();
      expect(fixture.service.unsubscribeAttempts).assertEqual(0);
      await Promise.resolve();
    });
  });
}
