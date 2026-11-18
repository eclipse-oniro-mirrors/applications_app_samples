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

export default function CallFlowRequestBurstsTest(): void {
  describe('CallFlowRequestBurstsTest', () => {
    let fixture: CallTestFixture;

    beforeAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Starting CallFlowRequestBurstsTest');
    });

    beforeEach(async () => {
      fixture = new CallTestFixture();
      await fixture.yieldToEventLoop();
    });

    afterEach(() => {
      fixture.dispose();
    });

    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished CallFlowRequestBurstsTest');
    });

    /**
     * @tc.name CallFlowRequestBursts_listenerReuse_001
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowRequestBursts_listenerReuse_0100
     * @tc.desc Verify listenerReuse for request fixture 922, error 801, burst 12.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowRequestBursts_listenerReuse_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 12; index++) {
          fixture.controller.start('+8613800000922');
        }
        expect(fixture.service.capabilityChecks).assertEqual(12);
        expect(fixture.service.requests.length).assertEqual(12);
        expect(fixture.service.requests[0]).assertEqual('+8613800000922');
        expect(fixture.service.requests[11]).assertEqual('+8613800000922');
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
     * @tc.name CallFlowRequestBursts_reverseCallbacks_002
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowRequestBursts_reverseCallbacks_0200
     * @tc.desc Verify reverseCallbacks for request fixture 923, error 8300001, burst 13.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowRequestBursts_reverseCallbacks_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('555-000923');
        fixture.controller.start('tel:555000923');
        expect(fixture.service.requests.length).assertEqual(2);
        expect(fixture.service.requests[0]).assertEqual('555-000923');
        expect(fixture.service.requests[1]).assertEqual('tel:555000923');
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        await fixture.service.completeLater(1, makeFailure(8300001, 'fixture failure 923'));
        expect(fixture.logger.failures.length).assertEqual(1);
        expect(fixture.logger.failures[0].code).assertEqual(8300001);
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
     * @tc.name CallFlowRequestBursts_burst_003
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowRequestBursts_burst_0300
     * @tc.desc Verify burst for request fixture 924, error 8300002, burst 14.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowRequestBursts_burst_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        for (let index = 0; index < 14; index++) {
          fixture.controller.start(' 555000924 ');
        }
        expect(fixture.service.requests.length).assertEqual(14);
        expect(fixture.service.capabilityChecks).assertEqual(14);
        expect(fixture.service.subscribeAttempts).assertEqual(1);
        expect(fixture.service.listeners.length).assertEqual(1);
        for (let index = 13; index >= 0; index--) {
          expect(fixture.service.requests[index]).assertEqual(' 555000924 ');
          await fixture.service.completeLater(index);
        }
        expect(fixture.logger.successes).assertEqual(14);
        expect(fixture.logger.failures.length).assertEqual(0);
        fixture.controller.dispose();
        expect(fixture.service.unsubscribeAttempts).assertEqual(1);
        expect(fixture.service.removedListeners[0]).assertEqual(fixture.service.listeners[0]);
      },
    );

    /**
     * @tc.name CallFlowRequestBursts_stateEvents_004
     * @tc.number SUB_TELEPHONY_MAKECALL_CallFlowRequestBursts_stateEvents_0400
     * @tc.desc Verify stateEvents for request fixture 925, error 8300003, burst 15.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'CallFlowRequestBursts_stateEvents_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        fixture.controller.start('13xxxx925');
        expect(fixture.service.requests[0]).assertEqual('13xxxx925');
        expect(fixture.service.listeners.length).assertEqual(1);
        expect(fixture.logger.states.length).assertEqual(0);
        fixture.service.emit(0, 1, '13xxxx925');
        expect(fixture.logger.states.length).assertEqual(1);
        expect(fixture.logger.states[0].state).assertEqual(1);
        expect(fixture.logger.states[0].number).assertEqual('13xxxx925');
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
  });
}
