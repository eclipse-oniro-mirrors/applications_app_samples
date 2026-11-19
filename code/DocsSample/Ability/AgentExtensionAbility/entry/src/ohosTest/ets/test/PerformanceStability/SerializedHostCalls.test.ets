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
export default function serializedHostCallsTest(): void {
  describe('Agent_SerializedHostCalls', () => {
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
    it('destroyRecreate_unicode_units1_000', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 1);
      fixture.connect();
      try {
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        fixture.ability.onDestroy();
        fixture.ability.onCreate(fixture.want);
        fixture.ability.onConnect(fixture.want, fixture.primary);
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.calls.length).assertEqual(3);
        expect(fixture.primary.order()).assertEqual('sendData>authorize>sendData');
        expect(fixture.primary.data.length).assertEqual(2);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.data[1]).assertEqual('reply message');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.secondary.calls.length).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });

    it('repeatedDelivery_unicode_units2_001', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 2);
      fixture.connect();
      try {
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.authAttempts).assertEqual(2);
        expect(fixture.primary.sendAttempts).assertEqual(2);
        expect(fixture.primary.order()).assertEqual('authorize>authorize>sendData>sendData');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.primary.authorizations[1]).assertEqual('auth success');
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.data[1]).assertEqual('reply message');
        expect(fixture.secondary.calls.length).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });

    it('dataReply_unicode_units3_002', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 3);
      fixture.connect();
      try {
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.primary.data.length).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authAttempts).assertEqual(0);
        expect(fixture.primary.authorizations.length).assertEqual(0);
        expect(fixture.primary.calls.length).assertEqual(1);
        expect(fixture.primary.calls[0].kind).assertEqual('sendData');
        expect(fixture.primary.calls[0].payload).assertEqual('reply message');
        expect(fixture.secondary.calls.length).assertEqual(0);
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        expect(fixture.primary.calls.length).assertEqual(1);
        expect(fixture.want.abilityName).assertEqual('AgentExtAbility');
      } finally {
        fixture.dispose();
      }
    });

    it('authReply_unicode_units4_003', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 4);
      fixture.connect();
      try {
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.primary.authorizations.length).assertEqual(1);
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.primary.sendAttempts).assertEqual(0);
        expect(fixture.primary.data.length).assertEqual(0);
        expect(fixture.primary.calls.length).assertEqual(1);
        expect(fixture.primary.calls[0].kind).assertEqual('authorize');
        expect(fixture.primary.calls[0].payload).assertEqual('auth success');
        expect(fixture.secondary.calls.length).assertEqual(0);
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        expect(fixture.primary.authAttempts).assertEqual(1);
      } finally {
        fixture.dispose();
      }
    });

    it('dataFailureRecovery_unicode_units7_error35600002_004', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 7);
      fixture.connect();
      try {
        fixture.primary.failureCode = 35600002;
        fixture.primary.sendFailuresRemaining = 1;
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.primary.data.length).assertEqual(0);
        expect(fixture.primary.sendFailuresRemaining).assertEqual(0);
        expect(fixture.primary.calls.length).assertEqual(1);
        expect(fixture.primary.authAttempts).assertEqual(0);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.sendAttempts).assertEqual(2);
        expect(fixture.primary.data.length).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.order()).assertEqual('sendData>sendData');
        expect(fixture.secondary.calls.length).assertEqual(0);
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
      } finally {
        fixture.dispose();
      }
    });

    it('authFailureRecovery_unicode_units8_error35600002_005', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 8);
      fixture.connect();
      try {
        fixture.primary.failureCode = 35600002;
        fixture.primary.authFailuresRemaining = 1;
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.primary.authorizations.length).assertEqual(0);
        expect(fixture.primary.authFailuresRemaining).assertEqual(0);
        expect(fixture.primary.calls.length).assertEqual(1);
        expect(fixture.primary.sendAttempts).assertEqual(0);
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.authAttempts).assertEqual(2);
        expect(fixture.primary.authorizations.length).assertEqual(1);
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.primary.order()).assertEqual('authorize>authorize');
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.secondary.calls.length).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });

  });
}
