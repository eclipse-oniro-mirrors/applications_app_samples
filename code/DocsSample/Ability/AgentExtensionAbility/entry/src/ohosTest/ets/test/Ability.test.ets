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

import { describe, it, expect, beforeAll, afterAll, beforeEach, afterEach } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AgentCallbackFixture } from './Shared/AgentCallbackFixture';

export default function abilityTest(): void {
  describe('AgentCoreCallbacks', () => {
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
    beforeAll(() => {
      hilog.info(0xF811, 'AgentCore', 'Starting real production callback tests');
    });
    afterAll(() => {
      hilog.info(0xF811, 'AgentCore', 'Completed real production callback tests');
    });
    it('authorizesTheHostWithTheSampleFixedResult', 0, () => {
      const fixture = new AgentCallbackFixture();
      fixture.connect();
      try {
        fixture.ability.onAuth(fixture.primary, 'weather handshake');
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.primary.sendAttempts).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });
    it('sendsTheSampleReplyWithoutEchoingTheInput', 0, () => {
      const fixture = new AgentCallbackFixture();
      fixture.connect();
      try {
        fixture.ability.onData(fixture.primary, 'private weather request');
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authAttempts).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });
    it('recoversAfterHostSendThrowsBusinessError', 0, () => {
      const fixture = new AgentCallbackFixture();
      fixture.connect();
      try {
        fixture.primary.sendFailuresRemaining = 1;
        fixture.ability.onData(fixture.primary, 'first');
        expect(fixture.primary.data.length).assertEqual(0);
        fixture.ability.onData(fixture.primary, 'retry');
        expect(fixture.primary.sendAttempts).assertEqual(2);
        expect(fixture.primary.data[0]).assertEqual('reply message');
      } finally {
        fixture.dispose();
      }
    });
    it('recoversAfterHostAuthorizeThrowsBusinessError', 0, () => {
      const fixture = new AgentCallbackFixture();
      fixture.connect();
      try {
        fixture.primary.authFailuresRemaining = 1;
        fixture.ability.onAuth(fixture.primary, 'first');
        expect(fixture.primary.authorizations.length).assertEqual(0);
        fixture.ability.onAuth(fixture.primary, 'retry');
        expect(fixture.primary.authAttempts).assertEqual(2);
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
      } finally {
        fixture.dispose();
      }
    });
    it('routesResponsesToTheCallbackArgumentProxy', 0, () => {
      const fixture = new AgentCallbackFixture();
      fixture.connect();
      try {
        fixture.ability.onAuth(fixture.secondary, 'alternate host');
        fixture.ability.onData(fixture.secondary, 'alternate request');
        expect(fixture.primary.calls.length).assertEqual(0);
        expect(fixture.secondary.order()).assertEqual('authorize>sendData');
        expect(fixture.secondary.authorizations[0]).assertEqual('auth success');
        expect(fixture.secondary.data[0]).assertEqual('reply message');
      } finally {
        fixture.dispose();
      }
    });
    it('doesNotEmitHostRepliesDuringConnectionCallbacks', 0, () => {
      const fixture = new AgentCallbackFixture();
      fixture.connect();
      try {
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        fixture.ability.onConnect(fixture.want, fixture.secondary);
        expect(fixture.primary.calls.length).assertEqual(0);
        expect(fixture.secondary.calls.length).assertEqual(0);
      } finally {
        fixture.dispose();
      }
    });
  });
}
