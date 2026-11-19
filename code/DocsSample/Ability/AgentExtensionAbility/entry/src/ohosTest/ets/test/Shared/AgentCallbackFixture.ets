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

import { common, Want } from '@kit.AbilityKit';
import AgentExtAbility from '../../../../main/ets/agentextability/AgentExtAbility';

// The system IPC endpoint alone is replaced; every callback executes production code.
export class ProxyCall {
  kind: string;
  payload: string;
  constructor(kind: string, payload: string) {
    this.kind = kind;
    this.payload = payload;
  }
}

export class ProxyBusinessError extends Error {
  code: number;
  constructor(code: number) {
    super('Injected agent host IPC failure');
    this.name = 'BusinessError';
    this.code = code;
  }
}

export class RecordingAgentHostProxy implements common.AgentHostProxy {
  calls: ProxyCall[] = [];
  data: string[] = [];
  authorizations: string[] = [];
  sendAttempts: number = 0;
  authAttempts: number = 0;
  sendFailuresRemaining: number = 0;
  authFailuresRemaining: number = 0;
  failureCode: number = 35600002;

  sendData(data: string): void {
    this.sendAttempts++;
    this.calls.push(new ProxyCall('sendData', data));
    if (this.sendFailuresRemaining > 0) {
      this.sendFailuresRemaining--;
      throw new ProxyBusinessError(this.failureCode);
    }
    this.data.push(data);
  }

  authorize(handshakeData: string): void {
    this.authAttempts++;
    this.calls.push(new ProxyCall('authorize', handshakeData));
    if (this.authFailuresRemaining > 0) {
      this.authFailuresRemaining--;
      throw new ProxyBusinessError(this.failureCode);
    }
    this.authorizations.push(handshakeData);
  }

  order(): string {
    const result: string[] = [];
    for (let index = 0; index < this.calls.length; index++) {
      result.push(this.calls[index].kind);
    }
    return result.join('>');
  }

  clear(): void {
    this.calls = [];
    this.data = [];
    this.authorizations = [];
    this.sendAttempts = 0;
    this.authAttempts = 0;
    this.sendFailuresRemaining = 0;
    this.authFailuresRemaining = 0;
  }
}

export class AgentCallbackFixture {
  ability: AgentExtAbility = new AgentExtAbility();
  primary: RecordingAgentHostProxy = new RecordingAgentHostProxy();
  secondary: RecordingAgentHostProxy = new RecordingAgentHostProxy();
  want: Want = {
    bundleName: 'com.sample.agentextensionability',
    moduleName: 'entry',
    abilityName: 'AgentExtAbility'
  };

  connect(): void {
    this.ability.onCreate(this.want);
    this.ability.onConnect(this.want, this.primary);
  }

  dispose(): void {
    this.ability.onDisconnect(this.want, this.primary);
    this.ability.onDisconnect(this.want, this.secondary);
    this.ability.onDestroy();
    this.primary.clear();
    this.secondary.clear();
  }
}

export function repeatedPayload(seed: string, units: number): string {
  if (units === 0 || seed.length === 0) {
    return '';
  }
  return seed.repeat(Math.ceil(units / seed.length)).substring(0, units);
}
