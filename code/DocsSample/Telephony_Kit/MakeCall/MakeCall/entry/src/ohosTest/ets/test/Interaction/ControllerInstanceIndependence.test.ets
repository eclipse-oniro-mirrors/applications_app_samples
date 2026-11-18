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

export default function ControllerInstanceIndependenceTest(): void {
  describe('ControllerInstanceIndependenceTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting ControllerInstanceIndependenceTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished ControllerInstanceIndependenceTest');
    });

    /**
     * @tc.name ControllerInstanceIndependence_independentControllers_001
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_independentControllers_0100
     * @tc.desc Verify independentControllers for request fixture 387, error 8300001, burst 9.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_independentControllers_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('555-000387');
          other.service.supported = false;
          other.controller.start('555-000387');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('555-000387');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300001, 'fixture failure 387'));
          expect(fixture.logger.failures[0].code).assertEqual(8300001);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 388, error 8300002, burst 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000388 ');
        expect(fixture.service.requests[0]).assertEqual(' 555000388 ');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 388'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start(' 555000388 ');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_staleState_0300
     * @tc.desc Verify staleState for request fixture 389, error 8300003, burst 11.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx389');
        expect(fixture.service.requests[0]).assertEqual('13xxxx389');
        fixture.service.emit(0, 4, '13xxxx389');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(4);
        fixture.controller.dispose();
        fixture.service.emit(0, 5, '13xxxx389');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13xxxx389');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 6, '13xxxx389');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 0, '13xxxx389');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_independentControllers_004
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_independentControllers_0400
     * @tc.desc Verify independentControllers for request fixture 390, error 8300004, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_independentControllers_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('ext;390');
          other.service.supported = false;
          other.controller.start('ext;390');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('ext;390');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300004, 'fixture failure 390'));
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
     * @tc.name ControllerInstanceIndependence_staleCompletion_005
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_staleCompletion_0500
     * @tc.desc Verify staleCompletion for request fixture 391, error 8300999, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_staleCompletion_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('\uff11\uff1300000391');
        expect(fixture.service.requests[0]).assertEqual('\uff11\uff1300000391');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(8300999, 'fixture failure 391'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('\uff11\uff1300000391');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_staleState_006
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_staleState_0600
     * @tc.desc Verify staleState for request fixture 392, error 201, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_staleState_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13800000392');
        expect(fixture.service.requests[0]).assertEqual('13800000392');
        fixture.service.emit(0, 0, '13800000392');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(0);
        fixture.controller.dispose();
        fixture.service.emit(0, 1, '13800000392');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('13800000392');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 2, '13800000392');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 3, '13800000392');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(3);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_independentControllers_007
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_independentControllers_0700
     * @tc.desc Verify independentControllers for request fixture 393, error 401, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_independentControllers_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start('tel:13800000393');
          other.service.supported = false;
          other.controller.start('tel:13800000393');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual('tel:13800000393');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(401, 'fixture failure 393'));
          expect(fixture.logger.failures[0].code).assertEqual(401);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_staleCompletion_008
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_staleCompletion_0800
     * @tc.desc Verify staleCompletion for request fixture 394, error 801, burst 16.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_staleCompletion_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000394');
        expect(fixture.service.requests[0]).assertEqual('+8613800000394');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 394'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('+8613800000394');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_staleState_009
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_staleState_0900
     * @tc.desc Verify staleState for request fixture 395, error 8300001, burst 17.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_staleState_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000395');
        expect(fixture.service.requests[0]).assertEqual('555-000395');
        fixture.service.emit(0, 3, '555-000395');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(3);
        fixture.controller.dispose();
        fixture.service.emit(0, 4, '555-000395');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('555-000395');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 5, '555-000395');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 6, '555-000395');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(6);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name ControllerInstanceIndependence_independentControllers_010
     * @tc.number SUB_TELEPHONY_MAKECALL_ControllerInstanceIndependence_independentControllers_1000
     * @tc.desc Verify independentControllers for request fixture 396, error 8300002, burst 18.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'ControllerInstanceIndependence_independentControllers_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const other = new CallTestFixture();
        try {
          fixture.controller.start(' 555000396 ');
          other.service.supported = false;
          other.controller.start(' 555000396 ');
          expect(fixture.service.requests.length).assertEqual(1);
          expect(fixture.service.requests[0]).assertEqual(' 555000396 ');
          expect(other.service.requests.length).assertEqual(0);
          expect(other.service.subscribeAttempts).assertEqual(0);
          await fixture.service.completeLater(0, makeFailure(8300002, 'fixture failure 396'));
          expect(fixture.logger.failures[0].code).assertEqual(8300002);
          expect(other.logger.failures.length).assertEqual(0);
          expect(other.logger.successes).assertEqual(0);
          expect(fixture.service.listeners.length).assertEqual(1);
        } finally {
          other.dispose();
        }
      },
    );
  });
}
