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
export default function callbackEndToEndTest(): void {
  describe('Agent_CallbackEndToEnd', () => {
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
    it('dualFailureRecovery_rtl_units1_error35600002_000', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 1);
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

    it('orderedBatch_rtl_units2_batch1_001', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 2);
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

    it('callbackProxyWins_rtl_units3_002', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 3);
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

    it('twoAbilityIsolation_rtl_units4_error35600002_003', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 4);
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

    it('destroyRecreate_rtl_units7_004', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 7);
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

    it('repeatedDelivery_rtl_units8_005', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 8);
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

    it('dataReply_rtl_units15_006', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 15);
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

    it('authReply_rtl_units16_007', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 16);
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

    it('dataFailureRecovery_rtl_units31_error35600002_008', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 31);
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

    it('authFailureRecovery_rtl_units32_error35600002_009', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 32);
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

    it('twoHostIsolation_rtl_units63_010', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 63);
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

    it('reconnectRouting_rtl_units64_011', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("\u202eweather\u202c\u2066forecast\u2069", 64);
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

    it('dualFailureRecovery_numeric_units127_error35600002_012', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("-0+1.5e308NaNInfinity", 127);
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

    it('orderedBatch_numeric_units128_batch1_013', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("-0+1.5e308NaNInfinity", 128);
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

    it('callbackProxyWins_numeric_units255_014', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("-0+1.5e308NaNInfinity", 255);
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

    it('twoAbilityIsolation_numeric_units256_error35600002_015', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("-0+1.5e308NaNInfinity", 256);
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

    it('destroyRecreate_numeric_units511_016', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("-0+1.5e308NaNInfinity", 511);
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

    it('repeatedDelivery_numeric_units512_017', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("-0+1.5e308NaNInfinity", 512);
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

  });
}
