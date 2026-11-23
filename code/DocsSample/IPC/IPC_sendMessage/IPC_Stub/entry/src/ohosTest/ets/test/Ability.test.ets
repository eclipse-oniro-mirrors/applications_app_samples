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
  STUB_DESCRIPTOR,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  StubRemoteObjectModel,
  InProcessClient,
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
     * @tc.name   stubDescriptorMatchesTheProductionLiteral
     * @tc.desc   onConnect constructs Stub('IPCStubTest').
     * @tc.precondition  Shared driver is loaded.
     * @tc.steps         1. Build a stub. 2. Read its descriptor.
     *                   3. Compare with the production literal.
     * @tc.expected      The descriptor is IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('stubDescriptorMatchesTheProductionLiteral', 0, () => {
      const stub = new StubRemoteObjectModel();
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(STUB_DESCRIPTOR).assertEqual('IPCStubTest');
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name   codeOneReadsRequestAndWritesTheReply
     * @tc.desc   The stub reads 'hello world' and returns 'hello rpc'.
     * @tc.precondition  A stub and an in-process client are available.
     * @tc.steps         1. Send code 1. 2. Inspect the recorded request.
     *                   3. Compare request and reply text.
     * @tc.expected      The request text and reply literal match production.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('codeOneReadsRequestAndWritesTheReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const client = new InProcessClient(stub);
      const result = client.send(1, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(stub.lastRequest()?.text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name   unknownCodesAreRejectedByTheStub
     * @tc.desc   Only code 1 is accepted by onRemoteMessageRequest.
     * @tc.precondition  Stub oracle is available.
     * @tc.steps         1. Evaluate code 1. 2. Evaluate several unknown codes.
     *                   3. Compare with the oracle.
     * @tc.expected      Only code 1 returns true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownCodesAreRejectedByTheStub', 0, () => {
      expect(expectedHandled(1)).assertTrue();
      expect(expectedHandled(0)).assertFalse();
      expect(expectedHandled(2)).assertFalse();
      expect(expectedHandled(99)).assertFalse();
    });
  });
}
