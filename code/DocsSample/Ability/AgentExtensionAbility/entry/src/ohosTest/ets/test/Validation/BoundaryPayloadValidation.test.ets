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
export default function boundaryPayloadValidationTest(): void {
  describe('Agent_BoundaryPayloadValidation', () => {
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
    it('callbackProxyWins_controls_units2_000', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 2);
      fixture.connect();
      try {
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.calls.length).assertEqual(2);
        expect(fixture.primary.order()).assertEqual('sendData>authorize');
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        fixture.ability.onConnect(fixture.want, fixture.secondary);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.data.length).assertEqual(2);
        expect(fixture.secondary.data.length).assertEqual(0);
        expect(fixture.secondary.authorizations.length).assertEqual(0);
        expect(fixture.primary.data[1]).assertEqual('reply message');
      } finally {
        fixture.dispose();
      }
    });

    it('twoAbilityIsolation_controls_units2_error401_001', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 2);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 401;
          fixture.ability.onData(fixture.primary, input);
          other.ability.onData(other.primary, input);
          other.ability.onAuth(other.primary, input);
          expect(fixture.primary.data.length).assertEqual(0);
          expect(fixture.primary.authAttempts).assertEqual(0);
          expect(other.primary.data.length).assertEqual(1);
          expect(other.primary.data[0]).assertEqual('reply message');
          expect(other.primary.authorizations[0]).assertEqual('auth success');
          fixture.ability.onData(fixture.primary, input);
          expect(fixture.primary.data.length).assertEqual(1);
          expect(other.primary.calls.length).assertEqual(2);
          expect(other.secondary.calls.length).assertEqual(0);
        } finally {
          other.dispose();
        }
      } finally {
        fixture.dispose();
      }
    });

    it('destroyRecreate_controls_units4_002', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 4);
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

    it('repeatedDelivery_controls_units7_003', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 7);
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

    it('dataReply_controls_units8_004', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 8);
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

    it('authReply_controls_units15_005', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 15);
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

    it('dataFailureRecovery_controls_units15_error401_006', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 15);
      fixture.connect();
      try {
        fixture.primary.failureCode = 401;
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

    it('authFailureRecovery_controls_units16_error401_007', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 16);
      fixture.connect();
      try {
        fixture.primary.failureCode = 401;
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

    it('twoHostIsolation_controls_units32_008', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 32);
      fixture.connect();
      try {
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.secondary, input);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onAuth(fixture.secondary, input);
        expect(fixture.primary.order()).assertEqual('authorize>sendData');
        expect(fixture.secondary.order()).assertEqual('sendData>authorize');
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.secondary.sendAttempts).assertEqual(1);
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.secondary.authAttempts).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.secondary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.secondary.authorizations[0]).assertEqual('auth success');
        fixture.ability.onDisconnect(fixture.want, fixture.secondary);
        expect(fixture.primary.calls.length).assertEqual(2);
        expect(fixture.secondary.calls.length).assertEqual(2);
      } finally {
        fixture.dispose();
      }
    });

    it('reconnectRouting_controls_units63_009', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 63);
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

    it('dualFailureRecovery_controls_units63_error401_010', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 63);
      fixture.connect();
      try {
        fixture.primary.failureCode = 401;
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

    it('orderedBatch_controls_units64_batch2_011', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u0000\r\n\t\b\f", 64);
      fixture.connect();
      try {
        for (let cycle = 0; cycle < 2; cycle++) {
          fixture.ability.onAuth(fixture.primary, input);
          fixture.ability.onData(fixture.primary, input);
        }
        expect(fixture.primary.authAttempts).assertEqual(2);
        expect(fixture.primary.sendAttempts).assertEqual(2);
        expect(fixture.primary.calls.length).assertEqual(4);
        expect(fixture.primary.authorizations.length).assertEqual(2);
        expect(fixture.primary.data.length).assertEqual(2);
        for (let cycle = 0; cycle < 2; cycle++) {
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

    it('callbackProxyWins_whitespace_units128_012', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 128);
      fixture.connect();
      try {
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.calls.length).assertEqual(2);
        expect(fixture.primary.order()).assertEqual('sendData>authorize');
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        fixture.ability.onConnect(fixture.want, fixture.secondary);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.data.length).assertEqual(2);
        expect(fixture.secondary.data.length).assertEqual(0);
        expect(fixture.secondary.authorizations.length).assertEqual(0);
        expect(fixture.primary.data[1]).assertEqual('reply message');
      } finally {
        fixture.dispose();
      }
    });

    it('twoAbilityIsolation_whitespace_units128_error401_013', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 128);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 401;
          fixture.ability.onData(fixture.primary, input);
          other.ability.onData(other.primary, input);
          other.ability.onAuth(other.primary, input);
          expect(fixture.primary.data.length).assertEqual(0);
          expect(fixture.primary.authAttempts).assertEqual(0);
          expect(other.primary.data.length).assertEqual(1);
          expect(other.primary.data[0]).assertEqual('reply message');
          expect(other.primary.authorizations[0]).assertEqual('auth success');
          fixture.ability.onData(fixture.primary, input);
          expect(fixture.primary.data.length).assertEqual(1);
          expect(other.primary.calls.length).assertEqual(2);
          expect(other.secondary.calls.length).assertEqual(0);
        } finally {
          other.dispose();
        }
      } finally {
        fixture.dispose();
      }
    });

    it('destroyRecreate_whitespace_units256_014', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 256);
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

    it('repeatedDelivery_whitespace_units511_015', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 511);
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

    it('dataReply_whitespace_units512_016', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 512);
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

    it('authReply_whitespace_units1023_017', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 1023);
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

    it('dataFailureRecovery_whitespace_units1023_error401_018', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 1023);
      fixture.connect();
      try {
        fixture.primary.failureCode = 401;
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

    it('authFailureRecovery_whitespace_units1024_error401_019', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 1024);
      fixture.connect();
      try {
        fixture.primary.failureCode = 401;
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

    it('twoHostIsolation_whitespace_units2048_020', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 2048);
      fixture.connect();
      try {
        fixture.ability.onAuth(fixture.primary, input);
        fixture.ability.onData(fixture.secondary, input);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onAuth(fixture.secondary, input);
        expect(fixture.primary.order()).assertEqual('authorize>sendData');
        expect(fixture.secondary.order()).assertEqual('sendData>authorize');
        expect(fixture.primary.sendAttempts).assertEqual(1);
        expect(fixture.secondary.sendAttempts).assertEqual(1);
        expect(fixture.primary.authAttempts).assertEqual(1);
        expect(fixture.secondary.authAttempts).assertEqual(1);
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.secondary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        expect(fixture.secondary.authorizations[0]).assertEqual('auth success');
        fixture.ability.onDisconnect(fixture.want, fixture.secondary);
        expect(fixture.primary.calls.length).assertEqual(2);
        expect(fixture.secondary.calls.length).assertEqual(2);
      } finally {
        fixture.dispose();
      }
    });

    it('reconnectRouting_whitespace_units4095_021', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 4095);
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

    it('dualFailureRecovery_whitespace_units4095_error401_022', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 4095);
      fixture.connect();
      try {
        fixture.primary.failureCode = 401;
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

    it('orderedBatch_whitespace_units4096_batch2_023', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload(" \t\n\r", 4096);
      fixture.connect();
      try {
        for (let cycle = 0; cycle < 2; cycle++) {
          fixture.ability.onAuth(fixture.primary, input);
          fixture.ability.onData(fixture.primary, input);
        }
        expect(fixture.primary.authAttempts).assertEqual(2);
        expect(fixture.primary.sendAttempts).assertEqual(2);
        expect(fixture.primary.calls.length).assertEqual(4);
        expect(fixture.primary.authorizations.length).assertEqual(2);
        expect(fixture.primary.data.length).assertEqual(2);
        for (let cycle = 0; cycle < 2; cycle++) {
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

    it('callbackProxyWins_json_units8192_024', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("{\"skill\":\"get_weather\",\"city\":\"Shanghai\",\"days\":3}", 8192);
      fixture.connect();
      try {
        fixture.ability.onDisconnect(fixture.want, fixture.primary);
        fixture.ability.onData(fixture.primary, input);
        fixture.ability.onAuth(fixture.primary, input);
        expect(fixture.primary.calls.length).assertEqual(2);
        expect(fixture.primary.order()).assertEqual('sendData>authorize');
        expect(fixture.primary.data[0]).assertEqual('reply message');
        expect(fixture.primary.authorizations[0]).assertEqual('auth success');
        fixture.ability.onConnect(fixture.want, fixture.secondary);
        fixture.ability.onData(fixture.primary, input);
        expect(fixture.primary.data.length).assertEqual(2);
        expect(fixture.secondary.data.length).assertEqual(0);
        expect(fixture.secondary.authorizations.length).assertEqual(0);
        expect(fixture.primary.data[1]).assertEqual('reply message');
      } finally {
        fixture.dispose();
      }
    });

    it('twoAbilityIsolation_json_units8192_error401_025', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("{\"skill\":\"get_weather\",\"city\":\"Shanghai\",\"days\":3}", 8192);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 401;
          fixture.ability.onData(fixture.primary, input);
          other.ability.onData(other.primary, input);
          other.ability.onAuth(other.primary, input);
          expect(fixture.primary.data.length).assertEqual(0);
          expect(fixture.primary.authAttempts).assertEqual(0);
          expect(other.primary.data.length).assertEqual(1);
          expect(other.primary.data[0]).assertEqual('reply message');
          expect(other.primary.authorizations[0]).assertEqual('auth success');
          fixture.ability.onData(fixture.primary, input);
          expect(fixture.primary.data.length).assertEqual(1);
          expect(other.primary.calls.length).assertEqual(2);
          expect(other.secondary.calls.length).assertEqual(0);
        } finally {
          other.dispose();
        }
      } finally {
        fixture.dispose();
      }
    });

    it('destroyRecreate_json_units16384_026', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("{\"skill\":\"get_weather\",\"city\":\"Shanghai\",\"days\":3}", 16384);
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

  });
}
