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
export default function proxyMethodValidationTest(): void {
  describe('Agent_ProxyMethodValidation', () => {
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
    it('twoHostIsolation_xml_units2_000', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 2);
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

    it('reconnectRouting_xml_units7_001', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 7);
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

    it('dualFailureRecovery_xml_units3_error401_002', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 3);
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

    it('orderedBatch_xml_units4_batch2_003', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 4);
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

    it('callbackProxyWins_xml_units8_004', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 8);
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

    it('twoAbilityIsolation_xml_units8_error401_005', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 8);
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

    it('destroyRecreate_xml_units16_006', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 16);
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

    it('repeatedDelivery_xml_units31_007', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 31);
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

    it('dataReply_xml_units32_008', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 32);
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

    it('authReply_xml_units64_009', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 64);
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

    it('dataFailureRecovery_xml_units63_error401_010', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 63);
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

    it('authFailureRecovery_xml_units64_error401_011', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("<?xml version=\"1.0\"?><city><![CDATA[Beijing]]></city>", 64);
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

    it('twoHostIsolation_audio_units255_012', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 255);
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

    it('reconnectRouting_audio_units255_013', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 255);
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

    it('dualFailureRecovery_audio_units255_error401_014', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 255);
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

    it('orderedBatch_audio_units256_batch2_015', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 256);
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

    it('callbackProxyWins_audio_units512_016', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 512);
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

    it('twoAbilityIsolation_audio_units512_error401_017', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 512);
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

    it('destroyRecreate_audio_units1024_018', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 1024);
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

    it('repeatedDelivery_audio_units2047_019', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 2047);
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

    it('dataReply_audio_units2048_020', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 2048);
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

    it('authReply_audio_units4095_021', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 4095);
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

    it('dataFailureRecovery_audio_units4095_error401_022', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 4095);
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

    it('authFailureRecovery_audio_units4096_error401_023', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("data:audio/wav;base64,UklGRgAAAABXQVZF", 4096);
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

    it('twoHostIsolation_protocol_units8192_024', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 8192);
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

    it('reconnectRouting_protocol_units16383_025', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 16383);
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

    it('dualFailureRecovery_protocol_units16383_error401_026', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 16383);
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

    it('orderedBatch_protocol_units16384_batch1_027', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 16384);
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

    it('callbackProxyWins_protocol_units1_028', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 1);
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

    it('twoAbilityIsolation_protocol_units2_error35600002_029', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 2);
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

    it('destroyRecreate_protocol_units3_030', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 3);
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

    it('repeatedDelivery_protocol_units4_031', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 4);
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

    it('dataReply_protocol_units7_032', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 7);
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

    it('authReply_protocol_units8_033', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 8);
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

    it('dataFailureRecovery_protocol_units15_error35600002_034', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 15);
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

    it('authFailureRecovery_protocol_units16_error35600002_035', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("custom_protocol_v1\r\nAuthorization: Bearer invalid", 16);
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

    it('twoHostIsolation_separators_units31_036', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 31);
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

    it('reconnectRouting_separators_units32_037', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 32);
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

    it('dualFailureRecovery_separators_units63_error35600002_038', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 63);
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

    it('orderedBatch_separators_units64_batch1_039', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 64);
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

    it('callbackProxyWins_separators_units127_040', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 127);
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

    it('twoAbilityIsolation_separators_units128_error35600002_041', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 128);
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

    it('destroyRecreate_separators_units255_042', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 255);
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

    it('repeatedDelivery_separators_units256_043', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 256);
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

    it('dataReply_separators_units511_044', 0, () => {
      const fixture = new AgentCallbackFixture();
      const input: string = repeatedPayload("|:;,=[]{}/\\!?@#$%^&*()", 511);
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

  });
}
