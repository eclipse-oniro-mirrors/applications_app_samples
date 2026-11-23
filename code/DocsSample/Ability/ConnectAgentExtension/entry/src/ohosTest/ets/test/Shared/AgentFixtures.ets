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

/**
 * Pure model fixtures for the ConnectAgentExtension sample.
 *
 * The model mirrors the connect / sendData / authorize / disconnect sequence
 * performed by pages/Index.ets and the onData / onAuth / onDisconnect
 * callbacks registered on common.AgentExtensionConnectCallback.
 */

export const AGENT_BUNDLE: string = 'com.sample.agentextensionability';
export const AGENT_ABILITY: string = 'AgentExtAbility';
export const AGENT_ID: string = 'weather_assistant_001';
export const AGENT_ID_MAX_LENGTH: number = 64;
export const PAYLOAD_MAX_LENGTH: number = 4096;
export const STATE_IDLE: number = 0;
export const STATE_CONNECTING: number = 1;
export const STATE_CONNECTED: number = 2;
export const STATE_DISCONNECTED: number = 3;
export const EVENT_DATA: string = 'onData';
export const EVENT_AUTH: string = 'onAuth';
export const EVENT_DISCONNECT: string = 'onDisconnect';
export const ERROR_SUCCESS: number = 0;
export const ERROR_INVALID_PARAM: number = 401;
export const ERROR_NOT_CONNECTED: number = 16000011;
export const ERROR_AUTH_FAILED: number = 16000012;
export const ERROR_PROXY_RELEASED: number = 16000013;

export interface AgentWant {
  bundleName: string;
  abilityName: string;
}

export interface AgentEvent {
  name: string;
  payload: string;
  accepted: boolean;
}

export class AgentModel {
  static isValidBundleName(name: string): boolean {
    return name.length > 0 && name.includes('.') && !name.includes(' ');
  }

  static isValidAbilityName(name: string): boolean {
    return name.length > 0 && !name.includes(' ') && !name.includes('.');
  }

  static isValidAgentId(agentId: string): boolean {
    if (agentId.length === 0 || agentId.length > AGENT_ID_MAX_LENGTH) {
      return false;
    }
    const allowed: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_';
    for (let index: number = 0; index < agentId.length; index++) {
      if (!allowed.includes(agentId.charAt(index))) {
        return false;
      }
    }
    return true;
  }

  static isValidPayload(payload: string): boolean {
    return payload.length > 0 && payload.length <= PAYLOAD_MAX_LENGTH;
  }

  static buildWant(bundleName: string, abilityName: string): AgentWant {
    const want: AgentWant = {
      bundleName: bundleName,
      abilityName: abilityName
    };
    return want;
  }

  static isValidWant(want: AgentWant): boolean {
    return AgentModel.isValidBundleName(want.bundleName) &&
      AgentModel.isValidAbilityName(want.abilityName);
  }

  static stateName(state: number): string {
    if (state === STATE_IDLE) {
      return 'IDLE';
    }
    if (state === STATE_CONNECTING) {
      return 'CONNECTING';
    }
    if (state === STATE_CONNECTED) {
      return 'CONNECTED';
    }
    if (state === STATE_DISCONNECTED) {
      return 'DISCONNECTED';
    }
    return 'UNKNOWN';
  }

  static canConnect(state: number): boolean {
    return state === STATE_IDLE || state === STATE_DISCONNECTED;
  }

  static canSend(state: number): boolean {
    return state === STATE_CONNECTED;
  }

  static canAuthorize(state: number): boolean {
    return state === STATE_CONNECTED;
  }

  static canDisconnect(state: number): boolean {
    return state === STATE_CONNECTED || state === STATE_CONNECTING;
  }

  static isConnected(state: number): boolean {
    return state === STATE_CONNECTED;
  }

  static nextState(state: number, event: string): number {
    if (event === 'connect' && AgentModel.canConnect(state)) {
      return STATE_CONNECTING;
    }
    if (event === 'connected' && state === STATE_CONNECTING) {
      return STATE_CONNECTED;
    }
    if (event === 'disconnect' && AgentModel.canDisconnect(state)) {
      return STATE_DISCONNECTED;
    }
    if (event === 'reset' && state === STATE_DISCONNECTED) {
      return STATE_IDLE;
    }
    return state;
  }

  static eventAccepted(event: string, state: number): boolean {
    if (event === EVENT_DATA) {
      return AgentModel.canSend(state);
    }
    if (event === EVENT_AUTH) {
      return AgentModel.canAuthorize(state);
    }
    if (event === EVENT_DISCONNECT) {
      return AgentModel.canDisconnect(state);
    }
    return false;
  }

  static eventName(code: number): string {
    if (code === 0) {
      return EVENT_DATA;
    }
    if (code === 1) {
      return EVENT_AUTH;
    }
    if (code === 2) {
      return EVENT_DISCONNECT;
    }
    return 'unknown';
  }

  static errorMessage(code: number): string {
    if (code === ERROR_SUCCESS) {
      return 'success';
    }
    if (code === ERROR_INVALID_PARAM) {
      return 'invalid parameter';
    }
    if (code === ERROR_NOT_CONNECTED) {
      return 'agent proxy not connected';
    }
    if (code === ERROR_AUTH_FAILED) {
      return 'agent authorize failed';
    }
    if (code === ERROR_PROXY_RELEASED) {
      return 'agent proxy released';
    }
    return 'unknown error';
  }

  static isSuccessCode(code: number): boolean {
    return code === ERROR_SUCCESS;
  }

  static normalizePayload(payload: string): string {
    return payload.trim();
  }

  static countEvents(events: Array<string>): number {
    return events.length;
  }

  static containsEvent(events: Array<string>, name: string): boolean {
    return events.includes(name);
  }

  static makeEvent(name: string, payload: string, state: number): AgentEvent {
    const event: AgentEvent = {
      name: name,
      payload: payload,
      accepted: AgentModel.eventAccepted(name, state)
    };
    return event;
  }

  static describeEvent(event: AgentEvent): string {
    return event.name + ':' + event.payload + ':' + event.accepted.toString();
  }

  static agentIdLength(agentId: string): number {
    return agentId.length;
  }

  static isValidConnectionSequence(events: Array<string>): boolean {
    let state: number = STATE_IDLE;
    for (let index: number = 0; index < events.length; index++) {
      state = AgentModel.nextState(state, events[index]);
    }
    return state === STATE_CONNECTED || state === STATE_DISCONNECTED;
  }
}
