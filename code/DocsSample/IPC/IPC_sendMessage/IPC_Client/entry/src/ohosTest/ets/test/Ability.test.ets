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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from './Shared/Support';
import {
  TARGET_BUNDLE,
  TARGET_ABILITY,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  createConnectedSession,
  expectedHandled
} from './Shared/SharedDriver';

export default function abilityTest(): void {
  describe('AbilityTest', () => {
    beforeAll(() => {
      logSuite('AbilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('AbilityTest', 'end');
    });

    /**
     * @tc.name   targetWantMatchesTheStubBundle
     * @tc.desc   The client connects to com.example.ipc_stub / ServiceAbility.
     * @tc.precondition  Shared driver is loaded.
     * @tc.steps         1. Read the target constants. 2. Build a WantModel.
     *                   3. Compare bundle and ability names.
     * @tc.expected      Both literals match the production want.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('targetWantMatchesTheStubBundle', 0, () => {
      const session = createConnectedSession();
      expect(session.want.bundleName).assertEqual(TARGET_BUNDLE);
      expect(session.want.abilityName).assertEqual(TARGET_ABILITY);
      expect(session.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name   connectedSessionCanSendTheSamplePayload
     * @tc.desc   A connected session sends 'hello world' with request code 1.
     * @tc.precondition  A proxy and stub double are attached.
     * @tc.steps         1. Build the session. 2. Send the default payload.
     *                   3. Read the reply.
     * @tc.expected      The reply is 'hello rpc' and the request succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('connectedSessionCanSendTheSamplePayload', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name   protocolAcceptsOnlyRequestCodeOne
     * @tc.desc   The production stub handles code 1 and rejects other codes.
     * @tc.precondition  Stub oracle is available.
     * @tc.steps         1. Evaluate code 1. 2. Evaluate code 2 and 0.
     *                   3. Compare with the oracle.
     * @tc.expected      Only code 1 is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('protocolAcceptsOnlyRequestCodeOne', 0, () => {
      expect(expectedHandled(1)).assertTrue();
      expect(expectedHandled(0)).assertFalse();
      expect(expectedHandled(2)).assertFalse();
      expect(expectedHandled(-1)).assertFalse();
    });
  });
}
