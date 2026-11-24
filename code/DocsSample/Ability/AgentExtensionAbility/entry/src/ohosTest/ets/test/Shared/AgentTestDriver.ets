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

import { Driver, ON, Component } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_AgentExtension]';
export const BUNDLE_NAME: string = 'com.sample.agentextensionability';
export const MODULE_NAME: string = 'entry';
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';
export const AGENT_ABILITY_NAME: string = 'AgentExtAbility';
export const TEST_ABILITY_NAME: string = 'TestAbility';
export const HOME_PAGE_TEXT: string = 'Hello World';
export const HOME_PAGE_CLICKED_TEXT: string = 'Welcome';

export const AGENT_ID: string = 'weather_assistant_001';
export const AGENT_NAME: string = 'WeatherAssistant';
export const AGENT_DESCRIPTION: string = 'weather query and forecast assistant';
export const AGENT_ORGANIZATION: string = 'Example Weather Inc.';
export const AGENT_PROVIDER_URL: string = 'https://example.com';
export const AGENT_VERSION: string = '1.0.0';
export const AGENT_DOCUMENTATION_URL: string = 'https://example.com/docs/weather-agent';
export const AGENT_ICON_URL: string = 'common/weather_icon.png';
export const AGENT_CATEGORY: string = 'life service';
export const AGENT_MIN_APP_VERSION: string = '1.0.0';
export const AGENT_EXTENSION_PROTOCOL: string = 'custom_protocol_v1';
export const AGENT_EXTENSION_NAME: string = 'ohos.extension.agent';
export const AGENT_CONFIG_PROFILE: string = 'agent_config';

export const SKILL_GET_WEATHER: string = 'get_weather';
export const SKILL_WEATHER_FORECAST: string = 'weather_forecast';
export const SKILL_GET_WEATHER_NAME: string = 'Get Weather';
export const SKILL_WEATHER_FORECAST_NAME: string = 'Weather Forecast';
export const SKILL_GET_WEATHER_DESC: string = 'query real time weather of a city';
export const SKILL_WEATHER_FORECAST_DESC: string = 'query weather forecast of a city';
export const SKILL_TAG_WEATHER: string = 'weather';
export const SKILL_TAG_QUERY: string = 'query';
export const SKILL_TAG_FORECAST: string = 'forecast';

export const INPUT_MODE_TEXT: string = 'text/plain';
export const INPUT_MODE_AUDIO: string = 'audio/wav';
export const OUTPUT_MODE_TEXT: string = 'text/plain';
export const OUTPUT_MODE_JSON: string = 'application/json';

export const AUTH_SUCCESS_RESULT: string = 'auth success';
export const AUTH_FAILURE_RESULT: string = 'auth failure';
export const REPLY_DATA: string = 'reply message';
export const HANDSHAKE_DATA: string = 'handshake probe';
export const DEFAULT_DATA_PAYLOAD: string = 'weather query payload';
export const EMPTY_DATA_PAYLOAD: string = '';

export const TIMEOUT_PAGE_RENDER: number = 1000;
export const TIMEOUT_ABILITY_START: number = 3000;
export const TIMEOUT_CONNECT: number = 1000;
export const TIMEOUT_DATA_TRANSFER: number = 1500;
export const TIMEOUT_AUTH: number = 1500;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const TIMEOUT_TEXT_APPEAR: number = 2000;

export const DELAY_UI_STEP: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_OPERATION: number = 500;
export const DELAY_ABILITY_LAUNCH: number = 1000;

export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 3;
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_TAB: number = 4;
export const KEY_SPACE: number = 57;
export const KEY_ESCAPE: number = 1;
export const KEY_MENU: number = 18;
export const KEY_POWER: number = 26;

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue = _uiOperationQueue;
  const result = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult = await action();
        resolve(actionResult);
      } catch (error) {
        const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMsg);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
  return result;
}

export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export function getDriver(): Driver {
  if (_driver === null) {
    const created: Driver = Driver.create();
    if (created === null || created === undefined) {
      throw new Error('UiTest Driver.create returned no driver; verify AbilityDelegator and UiTest initialization');
    }
    _driver = created;
  }
  return _driver;
}

export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

export function isQueueLocked(): boolean {
  return _queueLock;
}

export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;
      hilog.info(DOMAIN, TAG, 'componentCount total: %{public}d', count);
      if (count > 0) {
        return count;
      }
      const textComponents = await driver.findComponents(ON.type('Text'));
      const buttonComponents = await driver.findComponents(ON.type('Button'));
      const textCount = textComponents ? textComponents.length : 0;
      const buttonCount = buttonComponents ? buttonComponents.length : 0;
      hilog.info(DOMAIN, TAG, 'componentCount fallback text: %{public}d button: %{public}d', textCount, buttonCount);
      return Math.max(textCount, buttonCount);
    });
  } catch (error) {
    const err = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'componentCount failed code: %{public}d message: %{public}s', err.code, err.message);
    return 0;
  }
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    const components: Component[] = await driver.findComponents(ON.type(type));
    return components ?? [];
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    const components = await findComponentsByType(driver, type);
    const exists = components.length > 0;
    hilog.info(DOMAIN, TAG, 'checkComponentExists type: %{public}s exists: %{public}s', type, String(exists));
    return exists;
  } catch (error) {
    const err = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'checkComponentExists failed code: %{public}d message: %{public}s', err.code,
      err.message);
    return false;
  }
}

export async function collectTextContents(driver: Driver): Promise<string[]> {
  const result: string[] = [];
  try {
    await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text'));
      const list: Component[] = texts ?? [];
      for (let index = 0; index < list.length; index++) {
        try {
          const content = await list[index].getText();
          result.push(content);
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'collectTextContents skip index: %{public}d code: %{public}d', index, err.code);
        }
      }
    });
  } catch (error) {
    const err = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'collectTextContents failed code: %{public}d message: %{public}s', err.code, err.message);
  }
  return result;
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  const contents = await collectTextContents(driver);
  let matched = false;
  for (let index = 0; index < contents.length; index++) {
    if (contents[index] === expectedText) {
      matched = true;
      break;
    }
  }
  hilog.info(DOMAIN, TAG, 'checkTextContent expected: %{public}s matched: %{public}s', expectedText, String(matched));
  return matched;
}

export async function checkTextContained(driver: Driver, expectedPart: string): Promise<boolean> {
  const contents = await collectTextContents(driver);
  let matched = false;
  for (let index = 0; index < contents.length; index++) {
    if (contents[index].includes(expectedPart)) {
      matched = true;
      break;
    }
  }
  return matched;
}

export async function waitForTextAppear(driver: Driver, expectedText: string,
  maxWaitMs: number = TIMEOUT_TEXT_APPEAR): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const visible = await checkTextContained(driver, expectedText);
    if (visible) {
      hilog.info(DOMAIN, TAG, 'waitForTextAppear observed: %{public}s', expectedText);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(DOMAIN, TAG, 'waitForTextAppear timeout: %{public}s', expectedText);
  return false;
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*'));
      if (!components || components.length === 0) {
        return -1;
      }
      for (let index = 0; index < components.length; index++) {
        try {
          const focused = await components[index].isFocused();
          if (focused) {
            hilog.info(DOMAIN, TAG, 'getCurrentFocusIndex found index: %{public}d', index);
            return index;
          }
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'getCurrentFocusIndex skip index: %{public}d code: %{public}d', index, err.code);
        }
      }
      return -1;
    });
  } catch (error) {
    const err = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'getCurrentFocusIndex failed code: %{public}d message: %{public}s', err.code, err.message);
    return -1;
  }
}

export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100;
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt = 1;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
        if (expectedFocusedIndex === -1) {
          const focusedComponent = await driver.findComponent(ON.focused(true));
          if (focusedComponent !== null && focusedComponent !== undefined) {
            return true;
          }
          for (let index = 0; index < allComponents.length; index++) {
            try {
              if (await allComponents[index].isFocused()) {
                return true;
              }
            } catch (error) {
              const err = error as BusinessError;
              hilog.info(DOMAIN, TAG, 'checkFocusState skip index: %{public}d code: %{public}d', index, err.code);
            }
          }
          return false;
        }
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          return false;
        }
        try {
          return await allComponents[expectedFocusedIndex].isFocused();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'checkFocusState index failed: %{public}d code: %{public}d',
            expectedFocusedIndex, err.code);
          return false;
        }
      });
      if (result) {
        return true;
      }
    } catch (error) {
      const err = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'checkFocusState failed attempt: %{public}d code: %{public}d', attempt, err.code);
    }
    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_UI_STEP): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function pressBackUntilHome(driver: Driver, maxTimes: number = 3): Promise<void> {
  for (let index = 0; index < maxTimes; index++) {
    await pressAndWait(driver, KEY_BACK, 1, DELAY_UI_STEP);
  }
}

export function buildEntryWant(): Want {
  const want: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: ENTRY_ABILITY_NAME,
    moduleName: MODULE_NAME
  };
  return want;
}

export function buildAgentWant(): Want {
  const want: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: AGENT_ABILITY_NAME,
    moduleName: MODULE_NAME
  };
  return want;
}

export async function launchEntryAbility(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: ENTRY_ABILITY_NAME
  };
  hilog.info(DOMAIN, TAG, 'launchEntryAbility bundle: %{public}s', args.bundleName);
  await delegator.startAbility(want);
}

export async function launchAgentExtension(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: AGENT_ABILITY_NAME
  };
  hilog.info(DOMAIN, TAG, 'launchAgentExtension bundle: %{public}s', args.bundleName);
  await delegator.startAbility(want);
}

export async function getTopAbilityName(): Promise<string> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const ability = await delegator.getCurrentTopAbility();
    const name = ability !== null && ability !== undefined ? ability.context.abilityInfo.name : '';
    hilog.info(DOMAIN, TAG, 'getTopAbilityName: %{public}s', name);
    return name;
  } catch (error) {
    const err = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'getTopAbilityName failed code: %{public}d message: %{public}s', err.code, err.message);
    return '';
  }
}

export async function getBundleNameFromArgs(): Promise<string> {
  const args = abilityDelegatorRegistry.getArguments();
  return args.bundleName ?? BUNDLE_NAME;
}

export interface TimingSample {
  name: string;
  durationMs: number;
  timestamp: number;
}

export class TimingRecorder {
  private samples: TimingSample[] = [];

  public record(name: string, durationMs: number): void {
    const sample: TimingSample = {
      name: name,
      durationMs: durationMs,
      timestamp: Date.now()
    };
    this.samples.push(sample);
  }

  public async measure<T>(name: string, action: () => Promise<T>): Promise<T> {
    const start = Date.now();
    const result = await action();
    this.record(name, Date.now() - start);
    return result;
  }

  public getSamples(): TimingSample[] {
    return this.samples;
  }

  public getCount(): number {
    return this.samples.length;
  }

  public getTotalDuration(): number {
    let total = 0;
    for (let index = 0; index < this.samples.length; index++) {
      total += this.samples[index].durationMs;
    }
    return total;
  }

  public getAverageDuration(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.getTotalDuration() / this.samples.length;
  }

  public getMaxDuration(): number {
    let max = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].durationMs > max) {
        max = this.samples[index].durationMs;
      }
    }
    return max;
  }

  public getMinDuration(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min = this.samples[0].durationMs;
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index].durationMs < min) {
        min = this.samples[index].durationMs;
      }
    }
    return min;
  }

  public clear(): void {
    this.samples = [];
  }
}

export class SequenceRecorder {
  private events: string[] = [];

  public append(event: string): void {
    this.events.push(event);
  }

  public getEvents(): string[] {
    return this.events;
  }

  public getCount(): number {
    return this.events.length;
  }

  public indexOf(event: string): number {
    return this.events.indexOf(event);
  }

  public isOrdered(first: string, second: string): boolean {
    const firstIndex = this.indexOf(first);
    const secondIndex = this.indexOf(second);
    return firstIndex >= 0 && secondIndex >= 0 && firstIndex < secondIndex;
  }

  public join(separator: string): string {
    return this.events.join(separator);
  }

  public clear(): void {
    this.events = [];
  }
}

export interface ProxyCallRecord {
  method: string;
  payload: string;
  timestamp: number;
}

export class MockAgentHostProxy {
  private calls: ProxyCallRecord[] = [];
  private connected: boolean = false;
  private authorized: boolean = false;
  private replyPayload: string = REPLY_DATA;
  private authPayload: string = AUTH_SUCCESS_RESULT;
  private throwOnSend: boolean = false;
  private throwOnAuthorize: boolean = false;

  public connect(): void {
    this.connected = true;
  }

  public disconnect(): void {
    this.connected = false;
    this.authorized = false;
  }

  public isConnected(): boolean {
    return this.connected;
  }

  public isAuthorized(): boolean {
    return this.authorized;
  }

  public setReplyPayload(payload: string): void {
    this.replyPayload = payload;
  }

  public setAuthPayload(payload: string): void {
    this.authPayload = payload;
  }

  public setThrowOnSend(enable: boolean): void {
    this.throwOnSend = enable;
  }

  public setThrowOnAuthorize(enable: boolean): void {
    this.throwOnAuthorize = enable;
  }

  public sendData(payload: string): boolean {
    this.calls.push({
      method: 'sendData',
      payload: payload,
      timestamp: Date.now()
    });
    if (this.throwOnSend) {
      throw new Error('sendData failed for test');
    }
    return this.connected;
  }

  public authorize(payload: string): boolean {
    this.calls.push({
      method: 'authorize',
      payload: payload,
      timestamp: Date.now()
    });
    if (this.throwOnAuthorize) {
      throw new Error('authorize failed for test');
    }
    this.authorized = this.connected;
    return this.authorized;
  }

  public getCalls(): ProxyCallRecord[] {
    return this.calls;
  }

  public getCallCount(): number {
    return this.calls.length;
  }

  public getCallCountByMethod(method: string): number {
    let count = 0;
    for (let index = 0; index < this.calls.length; index++) {
      if (this.calls[index].method === method) {
        count++;
      }
    }
    return count;
  }

  public getLastPayload(): string {
    if (this.calls.length === 0) {
      return '';
    }
    return this.calls[this.calls.length - 1].payload;
  }

  public getLastMethod(): string {
    if (this.calls.length === 0) {
      return '';
    }
    return this.calls[this.calls.length - 1].method;
  }

  public clearCalls(): void {
    this.calls = [];
  }

  public getReplyPayload(): string {
    return this.replyPayload;
  }

  public getAuthPayload(): string {
    return this.authPayload;
  }

  public clone(): MockAgentHostProxy {
    const copy = new MockAgentHostProxy();
    copy.connected = this.connected;
    copy.authorized = this.authorized;
    copy.replyPayload = this.replyPayload;
    copy.authPayload = this.authPayload;
    copy.calls = this.calls.slice();
    return copy;
  }
}

export class AgentSkillMirror {
  public id: string;
  public name: string;
  public description: string;
  public tags: string[];
  public examples: string[];
  public inputModes: string[];
  public outputModes: string[];
  public extension: string;

  constructor(id: string, name: string, description: string, tags: string[] = [],
    examples: string[] = [], inputModes: string[] = [], outputModes: string[] = [],
    extension: string = AGENT_EXTENSION_PROTOCOL) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.tags = tags;
    this.examples = examples;
    this.inputModes = inputModes;
    this.outputModes = outputModes;
    this.extension = extension;
  }

  public static createGetWeatherSkill(): AgentSkillMirror {
    return new AgentSkillMirror(SKILL_GET_WEATHER, SKILL_GET_WEATHER_NAME, SKILL_GET_WEATHER_DESC,
      [SKILL_TAG_WEATHER, SKILL_TAG_QUERY], ['today weather of beijing'],
      [INPUT_MODE_TEXT], [OUTPUT_MODE_TEXT, OUTPUT_MODE_JSON], AGENT_EXTENSION_PROTOCOL);
  }

  public static createForecastSkill(): AgentSkillMirror {
    return new AgentSkillMirror(SKILL_WEATHER_FORECAST, SKILL_WEATHER_FORECAST_NAME, SKILL_WEATHER_FORECAST_DESC,
      [SKILL_TAG_WEATHER, SKILL_TAG_FORECAST], ['forecast of guangzhou'], [INPUT_MODE_TEXT],
      [OUTPUT_MODE_TEXT, OUTPUT_MODE_JSON], '');
  }

  public hasTag(tag: string): boolean {
    return this.tags.indexOf(tag) >= 0;
  }

  public supportsInput(mode: string): boolean {
    return this.inputModes.indexOf(mode) >= 0;
  }

  public supportsOutput(mode: string): boolean {
    return this.outputModes.indexOf(mode) >= 0;
  }

  public getExampleCount(): number {
    return this.examples.length;
  }

  public hasExtension(): boolean {
    return this.extension.length > 0;
  }

  public isValid(): boolean {
    return this.id.length > 0 && this.name.length > 0 && this.inputModes.length > 0;
  }

  public equals(other: AgentSkillMirror): boolean {
    return this.id === other.id && this.name === other.name && this.description === other.description &&
      this.tags.join(',') === other.tags.join(',') && this.inputModes.join(',') === other.inputModes.join(',') &&
      this.outputModes.join(',') === other.outputModes.join(',');
  }

  public clone(): AgentSkillMirror {
    return new AgentSkillMirror(this.id, this.name, this.description, this.tags.slice(), this.examples.slice(),
      this.inputModes.slice(), this.outputModes.slice(), this.extension);
  }
}

export class AgentCapabilitiesMirror {
  public streaming: boolean;
  public pushNotifications: boolean;
  public stateTransitionHistory: boolean;
  public extendedAgentCard: boolean;
  public extension: string;

  constructor(streaming: boolean = true, pushNotifications: boolean = true,
    stateTransitionHistory: boolean = true, extendedAgentCard: boolean = false,
    extension: string = AGENT_EXTENSION_PROTOCOL) {
    this.streaming = streaming;
    this.pushNotifications = pushNotifications;
    this.stateTransitionHistory = stateTransitionHistory;
    this.extendedAgentCard = extendedAgentCard;
    this.extension = extension;
  }

  public static createDefault(): AgentCapabilitiesMirror {
    return new AgentCapabilitiesMirror(true, true, true, false, AGENT_EXTENSION_PROTOCOL);
  }

  public countEnabled(): number {
    const flags: boolean[] = [this.streaming, this.pushNotifications, this.stateTransitionHistory,
      this.extendedAgentCard];
    let count = 0;
    for (let index = 0; index < flags.length; index++) {
      if (flags[index]) {
        count++;
      }
    }
    return count;
  }

  public isStreamingEnabled(): boolean {
    return this.streaming;
  }

  public isPushEnabled(): boolean {
    return this.pushNotifications;
  }

  public isHistoryEnabled(): boolean {
    return this.stateTransitionHistory;
  }

  public isExtendedCardEnabled(): boolean {
    return this.extendedAgentCard;
  }

  public hasExtension(): boolean {
    return this.extension.length > 0;
  }

  public equals(other: AgentCapabilitiesMirror): boolean {
    return this.streaming === other.streaming && this.pushNotifications === other.pushNotifications &&
      this.stateTransitionHistory === other.stateTransitionHistory &&
      this.extendedAgentCard === other.extendedAgentCard && this.extension === other.extension;
  }

  public toDescriptor(): string {
    return `streaming:${this.streaming},push:${this.pushNotifications},history:${this.stateTransitionHistory},` +
      `extended:${this.extendedAgentCard}`;
  }
}

export class AgentAppInfoMirror {
  public deviceTypes: string[];
  public minAppVersion: string;

  constructor(deviceTypes: string[] = [], minAppVersion: string = AGENT_MIN_APP_VERSION) {
    this.deviceTypes = deviceTypes;
    this.minAppVersion = minAppVersion;
  }

  public static createDefault(): AgentAppInfoMirror {
    return new AgentAppInfoMirror(['phone', 'tablet'], AGENT_MIN_APP_VERSION);
  }

  public supportsDevice(deviceType: string): boolean {
    return this.deviceTypes.indexOf(deviceType) >= 0;
  }

  public getDeviceCount(): number {
    return this.deviceTypes.length;
  }

  public isVersionAccepted(version: string): boolean {
    return compareVersion(version, this.minAppVersion) >= 0;
  }
}

export class AgentCardMirror {
  public agentId: string;
  public name: string;
  public description: string;
  public organization: string;
  public providerUrl: string;
  public version: string;
  public documentationUrl: string;
  public capabilities: AgentCapabilitiesMirror;
  public defaultInputModes: string[];
  public defaultOutputModes: string[];
  public skills: AgentSkillMirror[];
  public iconUrl: string;
  public category: string;
  public extension: string;
  public appInfo: AgentAppInfoMirror;

  constructor(agentId: string, name: string, description: string, organization: string, providerUrl: string,
    version: string, documentationUrl: string, capabilities: AgentCapabilitiesMirror, defaultInputModes: string[],
    defaultOutputModes: string[], skills: AgentSkillMirror[], iconUrl: string, category: string, extension: string,
    appInfo: AgentAppInfoMirror) {
    this.agentId = agentId;
    this.name = name;
    this.description = description;
    this.organization = organization;
    this.providerUrl = providerUrl;
    this.version = version;
    this.documentationUrl = documentationUrl;
    this.capabilities = capabilities;
    this.defaultInputModes = defaultInputModes;
    this.defaultOutputModes = defaultOutputModes;
    this.skills = skills;
    this.iconUrl = iconUrl;
    this.category = category;
    this.extension = extension;
    this.appInfo = appInfo;
  }

  public static createDefault(): AgentCardMirror {
    return new AgentCardMirror(AGENT_ID, AGENT_NAME, AGENT_DESCRIPTION, AGENT_ORGANIZATION, AGENT_PROVIDER_URL,
      AGENT_VERSION, AGENT_DOCUMENTATION_URL, AgentCapabilitiesMirror.createDefault(),
      [INPUT_MODE_TEXT, INPUT_MODE_AUDIO], [OUTPUT_MODE_TEXT, OUTPUT_MODE_JSON],
      [AgentSkillMirror.createGetWeatherSkill(), AgentSkillMirror.createForecastSkill()],
      AGENT_ICON_URL, AGENT_CATEGORY, AGENT_EXTENSION_PROTOCOL, AgentAppInfoMirror.createDefault());
  }

  public getSkillCount(): number {
    return this.skills.length;
  }

  public getSkillIds(): string[] {
    const ids: string[] = [];
    for (let index = 0; index < this.skills.length; index++) {
      ids.push(this.skills[index].id);
    }
    return ids;
  }

  public findSkill(skillId: string): AgentSkillMirror | null {
    for (let index = 0; index < this.skills.length; index++) {
      if (this.skills[index].id === skillId) {
        return this.skills[index];
      }
    }
    return null;
  }

  public hasSkill(skillId: string): boolean {
    return this.findSkill(skillId) !== null;
  }

  public getSkillIdsJoined(): string {
    return this.getSkillIds().join(',');
  }

  public totalExamples(): number {
    let total = 0;
    for (let index = 0; index < this.skills.length; index++) {
      total += this.skills[index].getExampleCount();
    }
    return total;
  }

  public allTags(): string[] {
    const tags: string[] = [];
    for (let index = 0; index < this.skills.length; index++) {
      const skillTags = this.skills[index].tags;
      for (let tagIndex = 0; tagIndex < skillTags.length; tagIndex++) {
        if (tags.indexOf(skillTags[tagIndex]) < 0) {
          tags.push(skillTags[tagIndex]);
        }
      }
    }
    return tags;
  }

  public isValid(): boolean {
    if (this.agentId.length === 0 || this.name.length === 0) {
      return false;
    }
    if (this.version.length === 0 || this.skills.length === 0) {
      return false;
    }
    for (let index = 0; index < this.skills.length; index++) {
      if (!this.skills[index].isValid()) {
        return false;
      }
    }
    return true;
  }

  public toDescriptor(): string {
    return `${this.agentId}|${this.name}|${this.version}|${this.getSkillIdsJoined()}|` +
      `${this.capabilities.toDescriptor()}`;
  }

  public clone(): AgentCardMirror {
    const skills: AgentSkillMirror[] = [];
    for (let index = 0; index < this.skills.length; index++) {
      skills.push(this.skills[index].clone());
    }
    return new AgentCardMirror(this.agentId, this.name, this.description, this.organization, this.providerUrl,
      this.version, this.documentationUrl, this.capabilities, this.defaultInputModes.slice(),
      this.defaultOutputModes.slice(), skills, this.iconUrl, this.category, this.extension, this.appInfo);
  }
}

export class AgentCardValidator {
  public static isAgentIdValid(agentId: string): boolean {
    if (agentId.length === 0) {
      return false;
    }
    return agentId.indexOf(' ') < 0;
  }

  public static isVersionValid(version: string): boolean {
    const parts = version.split('.');
    if (parts.length !== 3) {
      return false;
    }
    for (let index = 0; index < parts.length; index++) {
      if (parts[index].length === 0 || isNaN(Number(parts[index]))) {
        return false;
      }
    }
    return true;
  }

  public static isUrlValid(url: string): boolean {
    return url.startsWith('https://') || url.startsWith('http://');
  }

  public static isModeValid(mode: string): boolean {
    return mode.indexOf('/') > 0;
  }

  public static validateCard(card: AgentCardMirror): string[] {
    const errors: string[] = [];
    if (!AgentCardValidator.isAgentIdValid(card.agentId)) {
      errors.push('invalid agent id');
    }
    if (!AgentCardValidator.isVersionValid(card.version)) {
      errors.push('invalid version');
    }
    if (!AgentCardValidator.isUrlValid(card.providerUrl)) {
      errors.push('invalid provider url');
    }
    if (card.skills.length === 0) {
      errors.push('empty skill list');
    }
    for (let index = 0; index < card.defaultInputModes.length; index++) {
      if (!AgentCardValidator.isModeValid(card.defaultInputModes[index])) {
        errors.push('invalid input mode');
      }
    }
    for (let index = 0; index < card.defaultOutputModes.length; index++) {
      if (!AgentCardValidator.isModeValid(card.defaultOutputModes[index])) {
        errors.push('invalid output mode');
      }
    }
    return errors;
  }

  public static countErrors(card: AgentCardMirror): number {
    return AgentCardValidator.validateCard(card).length;
  }
}

export function compareVersion(left: string, right: string): number {
  const leftParts = left.split('.');
  const rightParts = right.split('.');
  const maxLength = Math.max(leftParts.length, rightParts.length);
  for (let index = 0; index < maxLength; index++) {
    const leftValue = index < leftParts.length ? Number(leftParts[index]) : 0;
    const rightValue = index < rightParts.length ? Number(rightParts[index]) : 0;
    if (isNaN(leftValue) || isNaN(rightValue)) {
      return 0;
    }
    if (leftValue > rightValue) {
      return 1;
    }
    if (leftValue < rightValue) {
      return -1;
    }
  }
  return 0;
}

export function buildDataPayload(skillId: string, query: string, index: number): string {
  return `${skillId}:${query}:${index}`;
}

export function buildRepeatedPayload(base: string, repeat: number): string {
  let payload = base;
  for (let index = 1; index < repeat; index++) {
    payload = `${payload}-${base}`;
  }
  return payload;
}

export function payloadLength(payload: string): number {
  return payload.length;
}

export function isPayloadEmpty(payload: string): boolean {
  return payload.length === 0;
}

export function clampValue(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

export function formatDuration(durationMs: number): string {
  return `${durationMs}ms`;
}
