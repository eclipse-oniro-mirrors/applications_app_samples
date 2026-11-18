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
import { CallTestFixture, makeFailure } from './Shared/CallTestFixture';

export default function AbilityTest(): void {
  describe('AbilityTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting AbilityTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished AbilityTest');
    });

    /**
     * @tc.name Ability_deferredSuccess_001
     * @tc.number SUB_TELEPHONY_MAKECALL_Ability_deferredSuccess_0100
     * @tc.desc Verify deferredSuccess for request fixture 1, error 401, burst 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('Ability_deferredSuccess_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.controller.start('tel:13800000001');
      expect(fixture.service.capabilityChecks).assertEqual(1);
      expect(fixture.service.requests.length).assertEqual(1);
      expect(fixture.service.requests[0]).assertEqual('tel:13800000001');
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
    });
  });
}
