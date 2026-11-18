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

export default function RepeatedControllerReuseTest(): void {
  describe('RepeatedControllerReuseTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting RepeatedControllerReuseTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished RepeatedControllerReuseTest');
    });

    /**
     * @tc.name RepeatedControllerReuse_dispose_001
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedControllerReuse_dispose_0100
     * @tc.desc Verify dispose for request fixture 721, error 401, burst 20.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedControllerReuse_dispose_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('tel:13800000721');
        expect(fixture.service.requests[0]).assertEqual('tel:13800000721');
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
      },
    );

    /**
     * @tc.name RepeatedControllerReuse_staleCompletion_002
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedControllerReuse_staleCompletion_0200
     * @tc.desc Verify staleCompletion for request fixture 722, error 801, burst 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedControllerReuse_staleCompletion_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('+8613800000722');
        expect(fixture.service.requests[0]).assertEqual('+8613800000722');
        expect(fixture.service.completions.length).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(0);
        await fixture.service.completeLater(0, makeFailure(801, 'fixture failure 722'));
        expect(fixture.logger.failures.length).assertEqual(0);
        expect(fixture.logger.states.length).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        fixture.controller.start('+8613800000722');
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(1);
        expect(fixture.service.subscribeAttempts).assertEqual(2);
      },
    );

    /**
     * @tc.name RepeatedControllerReuse_staleState_003
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedControllerReuse_staleState_0300
     * @tc.desc Verify staleState for request fixture 723, error 8300001, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedControllerReuse_staleState_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000723');
        expect(fixture.service.requests[0]).assertEqual('555-000723');
        fixture.service.emit(0, 2, '555-000723');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(2);
        fixture.controller.dispose();
        fixture.service.emit(0, 3, '555-000723');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.controller.start('555-000723');
        expect(fixture.service.listeners.length).assertEqual(2);
        fixture.service.emit(0, 4, '555-000723');
        expect(fixture.logger.states.length).assertEqual(1);
        fixture.service.emit(1, 5, '555-000723');
        expect(fixture.logger.states.length).assertEqual(2);
        expect(fixture.logger.states[1].state).assertEqual(5);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name RepeatedControllerReuse_restart_004
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedControllerReuse_restart_0400
     * @tc.desc Verify restart for request fixture 724, error 8300002, burst 4.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedControllerReuse_restart_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start(' 555000724 ');
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        fixture.controller.start(' 555000724 ');
        expect(fixture.service.capabilityChecks).assertEqual(2);
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[1]).assertEqual(' 555000724 ');
        expect(fixture.service.listeners.length).assertEqual(2);
        await fixture.service.completeLater(1);
        expect(fixture.logger.successes).assertEqual(2);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[1]).assertEqual(fixture.service.listeners[1]);
        expect(fixture.logger.failures.length).assertEqual(0);
      },
    );

    /**
     * @tc.name RepeatedControllerReuse_unsubscribeRetry_005
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedControllerReuse_unsubscribeRetry_0500
     * @tc.desc Verify unsubscribeRetry for request fixture 725, error 8300003, burst 5.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedControllerReuse_unsubscribeRetry_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx725');
        expect(fixture.service.requests[0]).assertEqual('13xxxx725');
        fixture.service.unsubscribeFailure = makeFailure(8300003, 'fixture failure 725');
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].operation).assertEqual('unsubscribe');
        expect(fixture.logger.failures[0].code).assertEqual(8300003);
        fixture.service.emit(0, 4, '13xxxx725');
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.unsubscribeFailure = undefined;
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(2);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        await Promise.resolve();
      },
    );

    /**
     * @tc.name RepeatedControllerReuse_disposeWithoutStart_006
     * @tc.number SUB_TELEPHONY_MAKECALL_RepeatedControllerReuse_disposeWithoutStart_0600
     * @tc.desc Verify disposeWithoutStart for request fixture 726, error 8300004, burst 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'RepeatedControllerReuse_disposeWithoutStart_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(0);
        expect(fixture.service.removedListeners.length).assertEqual(0);
        expect(fixture.service.requests.length).assertEqual(0);
        expect(fixture.logger.successes).assertEqual(0);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.start('ext;726');
        expect(fixture.service.requests.length).assertEqual(1);
        expect(fixture.service.requests[0]).assertEqual('ext;726');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(0);
        expect(fixture.logger.successes).assertEqual(1);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
        expect(fixture.logger.states.length).assertEqual(0);
      },
    );
  });
}
