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

export default function CallFailureIsolationTest(): void {
  describe('CallFailureIsolationTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallFailureIsolationTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallFailureIsolationTest');
    });

    /**
     * @tc.name CallFailureIsolation_independentControllers_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_independentControllers_0100
     * @tc.desc Verify independentControllers for request fixture 1436, error 8300002, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_independentControllers_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start(' 555001436 ');
          other.service.supported = false;
          other.controller.start(' 555001436 ');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual(' 555001436 ');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 1436'));
          expect(fixture.logger.failures[0].code).assertEqual(8300002);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name CallFailureIsolation_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 1437, error 8300003, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx1437');
        expect(fixture.service.requests[0]).assertEqual('13xxxx1437');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300003, 'fixture failure 1437'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13xxxx1437');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallFailureIsolation_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleState_0300
     * @tc.desc Verify staleState for request fixture 1438, error 8300004, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1438');
        expect(fixture.service.requests[0]).assertEqual('ext;1438');
        fixture.service.emit(0, 3, 'ext;1438');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, 'ext;1438');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('ext;1438');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, 'ext;1438');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, 'ext;1438');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallFailureIsolation_independentControllers_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_independentControllers_0400
     * @tc.desc Verify independentControllers for request fixture 1439, error 8300999, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_independentControllers_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('\uff11\uff1300001439');
          other.service.supported = false;
          other.controller.start('\uff11\uff1300001439');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300001439');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 1439'));
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
     * @tc.name CallFailureIsolation_staleCompletion_005
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleCompletion_0500
     * @tc.desc Verify staleCompletion for request fixture 1440, error 201, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleCompletion_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800001440');
        expect(fixture.service.requests[0]).assertEqual('13800001440');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(201, 'fixture failure 1440'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('13800001440');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallFailureIsolation_staleState_006
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleState_0600
     * @tc.desc Verify staleState for request fixture 1441, error 401, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleState_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800001441');
        expect(fixture.service.requests[0]).assertEqual('tel:13800001441');
        fixture.service.emit(0, 6, 'tel:13800001441');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(6);
        fixture.controller.dispose();
        fixture.service.emit(0, 0, 'tel:13800001441');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('tel:13800001441');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 1, 'tel:13800001441');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 2, 'tel:13800001441');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(2);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallFailureIsolation_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 1442, error 801, burst 19.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('+8613800001442');
          other.service.supported = false;
          other.controller.start('+8613800001442');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('+8613800001442');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 1442'));
          expect(fixture.logger.failures[0].code).assertEqual(801);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name CallFailureIsolation_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 1443, error 8300001, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-001443');
        expect(fixture.service.requests[0]).assertEqual('555-001443');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 1443'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('555-001443');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name CallFailureIsolation_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleState_0900
     * @tc.desc Verify staleState for request fixture 1444, error 8300002, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555001444 ');
        expect(fixture.service.requests[0]).assertEqual(' 555001444 ');
        fixture.service.emit(0, 2, ' 555001444 ');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        fixture.controller.dispose();
        fixture.service.emit(0, 3, ' 555001444 ');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start(' 555001444 ');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 4, ' 555001444 ');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 5, ' 555001444 ');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(5);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name CallFailureIsolation_independentControllers_010
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_independentControllers_1000
     * @tc.desc Verify independentControllers for request fixture 1445, error 8300003, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_independentControllers_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('13xxxx1445');
          other.service.supported = false;
          other.controller.start('13xxxx1445');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('13xxxx1445');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300003, 'fixture failure 1445'));
          expect(fixture.logger.failures[0].code).assertEqual(8300003);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name CallFailureIsolation_staleCompletion_011
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFailureIsolation_staleCompletion_1100
     * @tc.desc Verify staleCompletion for request fixture 1446, error 8300004, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFailureIsolation_staleCompletion_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('ext;1446');
        expect(fixture.service.requests[0]).assertEqual('ext;1446');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 1446'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('ext;1446');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );
  });
}
