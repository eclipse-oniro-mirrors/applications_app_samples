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

import { describe, it, expect, beforeEach, afterEach } from '@ohos/hypium';
import { AgentCallbackFixture, repeatedPayload } from '../Shared/AgentCallbackFixture';

// Real AgentExtAbility callbacks; typed spies replace only AgentHostProxy IPC.
// Input is intentionally opaque: this sample always replies with fixed strings.
export default function offlinePayloadDeliveryTest(): void {
  describe('Agent_OfflinePayloadDelivery', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    it('reconnectRouting_whitespace_units1_000', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 1);
      fixture.connect();
      try {
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        expect(fixture.primary.calls.length).assertEqual(0);
        fixture.ability.onConnect(fixture.want, fixture.secondary);
        expect(fixture.secondary.calls.length).assertEqual(0);
        fixture.ability.onAuth(fixture.secondary, input);
        fixture.ability.onData(fixture.secondary, input);
        expect(fixture.primary.calls.length).assertEqual(0);
        expect(fixture.secondary.calls.length).assertEqual(2);
        expect(fixture.secondary.order()).assertEqual('authorize>sendData');
        expect(fixture.secondary.authorizations[0]).assertEqual('auth success');
        expect(fixture.secondary.data[0]).assertEqual('reply message');
        fixture.ability.onDisconnect(fixture.want, fixture.secondary);
        fixture.ability.onConnect(fixture.want, fixture.primary);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.data.length).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.secondary.calls.length).assertEqual(2);
      } finally {
        fixture.dispose();
      }
    });

    it('dualFailureRecovery_whitespace_units2_error35600002_001', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 2);
      fixture.connect();
      try {
        fixture.primary.failureCode = 35600002;
        fixture.primary.sendFailuresRemaining = 2;
        fixture.primary.authFailuresRemaining = 2;
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.data.length).assertEqual(0);
        expect(fixture.primary.authorizations.length).assertEqual(0);
        expect(fixture.primary.authAttempts).assertEqual(2);
        expect(fixture.primary.sendAttempts).assertEqual(2);
        fixture.ability.onAuth(fixture.secondary, input);
        fixture.ability.onData(fixture.secondary, input);
        expect(fixture.secondary.authorizations[0]).assertEqual('auth success');
        expect(fixture.secondary.data[0]).assertEqual('reply message');
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.authAttempts).assertEqual(3);
        expect(fixture.primary.sendAttempts).assertEqual(3);
        expect(fixture.primary.order()).assertEqual('authorize>sendData>authorize>sendData>authorize>sendData');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.primary.data[0]).assertEqual('reply message');
      } finally {
        fixture.dispose();
      }
    });

    it('orderedBatch_whitespace_units3_batch1_002', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 3);
      fixture.connect();
      try {
        for (let cycle = 0; cycle < 1; cycle++) {
          fixture.ability.onAuth(fixture.primary, input);
          fixture.ability.onData(fixture.primary, input);
        }
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.primary.calls.length).assertEqual(2);
        expect(fixture.primary.authorizations.length).assertEqual(1);
        expect(fixture.primary.data.length).assertEqual(1);
        for (let cycle = 0; cycle < 1; cycle++) {
          expect(fixture.primary.authorizations[cycle]).assertEqual('auth success');
          expect(fixture.primary.data[cycle]).assertEqual('reply message');
          expect(fixture.primary.calls[cycle * 2].kind).assertEqual('authorize');
          expect(fixture.primary.calls[cycle * 2 + 1].kind).assertEqual('sendData');
        }
        expect(fixture.secondary.calls.length).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });

  });
}
