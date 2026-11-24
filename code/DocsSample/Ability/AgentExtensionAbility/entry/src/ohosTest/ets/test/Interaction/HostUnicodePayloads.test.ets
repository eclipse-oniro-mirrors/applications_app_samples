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
export default function hostUnicodePayloadsTest(): void {
  describe('Agent_HostUnicodePayloads', () => {
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
    it('twoHostIsolation_ascii_units1_000', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 1);
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

    it('reconnectRouting_ascii_units2_001', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 2);
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

    it('dualFailureRecovery_empty_units0_error16000050_002', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("", 0);
      fixture.connect();
      try {
        fixture.primary.failureCode = 16000050;
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

    it('orderedBatch_empty_units0_batch7_003', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("", 0);
      fixture.connect();
      try {
        for (let cycle = 0; cycle < 7; cycle++) {
          fixture.ability.onAuth(fixture.primary, input);
          fixture.ability.onData(fixture.primary, input);
        }
        expect(fixture.primary.authAttempts).assertEqual(7);
        expect(fixture.primary.sendAttempts).assertEqual(7);
        expect(fixture.primary.calls.length).assertEqual(14);
        expect(fixture.primary.authorizations.length).assertEqual(7);
        expect(fixture.primary.data.length).assertEqual(7);
        for (let cycle = 0; cycle < 7; cycle++) {
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

    it('callbackProxyWins_ascii_units7_004', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 7);
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

    it('twoAbilityIsolation_empty_units0_error16000011_005', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("", 0);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 16000011;
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

    it('destroyRecreate_ascii_units15_006', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 15);
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

    it('repeatedDelivery_ascii_units16_007', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 16);
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

    it('dataReply_ascii_units31_008', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 31);
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

    it('authReply_ascii_units32_009', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 32);
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

    it('dataFailureRecovery_empty_units0_error16000050_010', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("", 0);
      fixture.connect();
      try {
        fixture.primary.failureCode = 16000050;
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

    it('authFailureRecovery_empty_units0_error16000050_011', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("", 0);
      fixture.connect();
      try {
        fixture.primary.failureCode = 16000050;
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

    it('twoHostIsolation_ascii_units127_012', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 127);
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

    it('reconnectRouting_ascii_units128_013', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 128);
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

    it('dualFailureRecovery_ascii_units255_error35600002_014', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 255);
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

    it('orderedBatch_ascii_units256_batch1_015', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 256);
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

    it('callbackProxyWins_ascii_units511_016', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 511);
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

    it('twoAbilityIsolation_ascii_units512_error35600002_017', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 512);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 35600002;
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

    it('destroyRecreate_ascii_units1023_018', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 1023);
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

    it('repeatedDelivery_ascii_units1024_019', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 1024);
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

    it('dataReply_ascii_units2047_020', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 2047);
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

    it('authReply_ascii_units2048_021', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 2048);
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

    it('dataFailureRecovery_ascii_units4095_error35600002_022', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 4095);
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

    it('authFailureRecovery_ascii_units4096_error35600002_023', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("weather-query:", 4096);
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

    it('twoHostIsolation_unicode_units8191_024', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 8191);
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

    it('reconnectRouting_unicode_units8192_025', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 8192);
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

    it('dualFailureRecovery_unicode_units16383_error35600002_026', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 16383);
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

    it('orderedBatch_unicode_units16384_batch1_027', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 16384);
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

    it('callbackProxyWins_unicode_units1_028', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 1);
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

    it('twoAbilityIsolation_unicode_units2_error35600002_029', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 2);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 35600002;
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

    it('destroyRecreate_unicode_units3_030', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 3);
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

    it('repeatedDelivery_unicode_units4_031', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 4);
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

    it('dataReply_unicode_units7_032', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 7);
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

    it('authReply_unicode_units8_033', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 8);
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

    it('dataFailureRecovery_unicode_units15_error35600002_034', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 15);
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

    it('authFailureRecovery_unicode_units16_error35600002_035', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u5317\u4eac\u5929\u6c14\u9884\u62a5", 16);
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

    it('twoHostIsolation_emoji_units31_036', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 31);
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

    it('reconnectRouting_emoji_units32_037', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 32);
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

    it('dualFailureRecovery_emoji_units63_error35600002_038', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 63);
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

    it('orderedBatch_emoji_units64_batch1_039', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 64);
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

    it('callbackProxyWins_emoji_units127_040', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 127);
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

    it('twoAbilityIsolation_emoji_units128_error35600002_041', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 128);
      fixture.connect();
      try {
        const other = new AgentCallbackFixture();
        other.connect();
        try {
          fixture.primary.sendFailuresRemaining = 1;
          fixture.primary.failureCode = 35600002;
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

    it('destroyRecreate_emoji_units255_042', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 255);
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

    it('repeatedDelivery_emoji_units256_043', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 256);
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

    it('dataReply_emoji_units511_044', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 511);
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

    it('authReply_emoji_units512_045', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\ud83c\udf24\ufe0f\ud83c\udf27\ufe0f\ud83c\udf0d", 512);
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

  });
}
