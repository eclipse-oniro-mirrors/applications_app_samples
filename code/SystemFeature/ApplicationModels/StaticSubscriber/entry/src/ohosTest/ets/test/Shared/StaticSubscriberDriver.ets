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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

export const DOMAIN: number = 0xF811;
export const TAG: string = '[StaticSubscriberTest]';

export const BUNDLE_NAME: string = 'com.samples.staticsubscriber';
export const ABILITY_NAME: string = 'EntryAbility';
export const EXTENSION_NAME: string = 'StaticSubscriber';
export const TEST_ABILITY_NAME: string = 'TestAbility';

export const ENABLE_BUTTON_ID: string = 'btnEnable';
export const DISABLE_BUTTON_ID: string = 'btnDisable';

export const ENABLE_BUTTON_TEXT: string = 'Static subscribe enable';
export const DISABLE_BUTTON_TEXT: string = 'Static subscribe disable';
export const ENABLED_TOAST_TEXT: string = 'Static subscribe enabled';
export const DISABLED_TOAST_TEXT: string = 'Static subscribe disabled';

export const STATIC_EVENT_NAME: string = 'com.samples.staticsubscriber.event';
export const NOTIFICATION_ID: number = 1;
export const NOTIFICATION_CONTENT_TYPE_BASIC_TEXT: number = 0;
export const MAX_EVENT_DATA_LENGTH: number = 1024;
export const MAX_EVENT_NAME_LENGTH: number = 256;
export const MAX_NOTIFICATION_TITLE_LENGTH: number = 128;
export const MAX_NOTIFICATION_TEXT_LENGTH: number = 512;

export const TIMEOUT_PAGE_RENDER: number = 1000;
export const TIMEOUT_STATE_CHANGE: number = 1000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_OPERATION: number = 300;
export const STABLE_ROUNDS: number = 3;
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;
export const KEY_POWER: number = 26;

export const ERROR_CODE_NONE: number = 0;
export const ERROR_CODE_INVALID_STATE: number = 1001;
export const ERROR_CODE_INVALID_EVENT: number = 1002;
export const ERROR_CODE_INVALID_NOTIFICATION: number = 1003;
export const ERROR_CODE_INVALID_CONFIG: number = 1004;
export const ERROR_CODE_PERMISSION_DENIED: number = 1005;
export const ERROR_CODE_RESOURCE_LIMIT: number = 1006;

export enum SubscriberState {
  DISABLED = 0,
  ENABLING = 1,
  ENABLED = 2,
  DISABLING = 3,
  ERROR = 4
}

export enum SubscriberOperation {
  ENABLE = 0,
  DISABLE = 1,
  RECEIVE_EVENT = 2,
  PUBLISH_NOTIFICATION = 3,
  RESET = 4
}

export enum EventKind {
  NORMAL = 'normal',
  EMPTY = 'empty',
  LONG = 'long',
  UNICODE = 'unicode',
  SPECIAL = 'special'
}

export interface SubscriberEvent {
  event: string;
  data: string;
  code: number;
  timestamp: number;
}

export interface NotificationContent {
  id: number;
  title: string;
  text: string;
  additionalText: string;
  contentType: number;
}

export interface SubscriberConfig {
  bundleName: string;
  abilityName: string;
  extensionName: string;
  notificationId: number;
  eventName: string;
}

export interface OperationResult {
  success: boolean;
  code: number;
  message: string;
}

export interface SubscriberMetrics {
  enableCount: number;
  disableCount: number;
  receiveCount: number;
  publishCount: number;
  errorCount: number;
}

export interface LogEntry {
  level: number;
  tag: string;
  message: string;
  timestamp: number;
}

export interface SessionSnapshot {
  id: number;
  state: SubscriberState;
  operationCount: number;
  active: boolean;
}

export interface ResourceBudget {
  memoryKb: number;
  timerCount: number;
  fileHandleCount: number;
}

export interface SecurityDecision {
  allowed: boolean;
  code: number;
  reason: string;
}

export interface PerformanceSample {
  name: string;
  elapsedMs: number;
  iteration: number;
  success: boolean;
}

export interface BoundaryResult {
  accepted: boolean;
  normalized: string;
  length: number;
}

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();

export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
        resolve(actionResult);
      } catch (error) {
        const errorMessage: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMessage);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });
  return result;
}

export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
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

export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

export async function launchSubscriberApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: ABILITY_NAME
  };
  await delegator.startAbility(want);
}

export async function isSubscriberPageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const enableButtons: Component[] = await driver.findComponents(ON.id(ENABLE_BUTTON_ID)) ?? [];
      const disableButtons: Component[] = await driver.findComponents(ON.id(DISABLE_BUTTON_ID)) ?? [];
      const visible: boolean = enableButtons.length > 0 || disableButtons.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `isSubscriberPageVisible: ${visible}`);
      return visible;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `isSubscriberPageVisible error: ${error}`);
    return false;
  }
}

export async function waitForPageStable(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const visible: boolean = await isSubscriberPageVisible(driver);
    if (visible) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: page is ready');
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: launching application again');
  await launchSubscriberApp();
  const secondDeadline: number = Date.now() + maxWaitMs;
  while (Date.now() < secondDeadline) {
    const visible: boolean = await isSubscriberPageVisible(driver);
    if (visible) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: page is ready after relaunch');
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

export async function triggerSubscriberPage(driver: Driver): Promise<void> {
  await serializedDelay(driver, DELAY_AFTER_OPERATION);
  const visible: boolean = await isSubscriberPageVisible(driver);
  if (!visible) {
    await launchSubscriberApp();
  }
  await waitForPageStable(driver);
  hilog.info(DOMAIN, TAG, '%{public}s', 'triggerSubscriberPage: completed');
}

export async function clickComponentById(driver: Driver, componentId: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.id(componentId)) ?? [];
      if (components.length === 0) {
        hilog.info(DOMAIN, TAG, '%{public}s', `clickComponentById: component not found: ${componentId}`);
        return false;
      }
      await components[0].click();
      await driver.delayMs(DELAY_AFTER_OPERATION);
      hilog.info(DOMAIN, TAG, '%{public}s', `clickComponentById: clicked: ${componentId}`);
      return true;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `clickComponentById error: ${error}`);
    return false;
  }
}

export async function clickEnableButton(driver: Driver): Promise<boolean> {
  return await clickComponentById(driver, ENABLE_BUTTON_ID);
}

export async function clickDisableButton(driver: Driver): Promise<boolean> {
  return await clickComponentById(driver, DISABLE_BUTTON_ID);
}

export async function componentExistsById(driver: Driver, componentId: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.id(componentId)) ?? [];
      return components.length > 0;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `componentExistsById error: ${error}`);
    return false;
  }
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

export async function countComponents(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      return components.length;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `countComponents error: ${error}`);
    return 0;
  }
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content: string = await text.getText();
          if (content === expectedText) {
            return true;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `checkTextContent: skipped one component: ${error}`);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

export async function hasNonEmptyText(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      for (const text of texts) {
        try {
          const content: string = await text.getText();
          if (content.length > 0) {
            return true;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `hasNonEmptyText: skipped one component: ${error}`);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `hasNonEmptyText error: ${error}`);
    return false;
  }
}

export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      for (let index: number = 0; index < components.length; index++) {
        try {
          const focused: boolean = await components[index].isFocused();
          if (focused) {
            return index;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `getCurrentFocusIndex: skipped index ${index}`);
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

export async function checkFocusExists(driver: Driver): Promise<boolean> {
  const index: number = await getCurrentFocusIndex(driver);
  return index >= 0;
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

export function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export function createEvent(data: string, code: number = 0, eventName: string = STATIC_EVENT_NAME): SubscriberEvent {
  return {
    event: eventName,
    data: data,
    code: code,
    timestamp: Date.now()
  };
}

export function createEmptyEvent(): SubscriberEvent {
  return {
    event: '',
    data: '',
    code: 0,
    timestamp: 0
  };
}

export function createEventByKind(kind: EventKind, seed: number = 0): SubscriberEvent {
  switch (kind) {
    case EventKind.EMPTY:
      return createEvent('', 0);
    case EventKind.LONG:
      return createEvent(repeatText('A', MAX_EVENT_DATA_LENGTH + seed + 1), seed);
    case EventKind.UNICODE:
      return createEvent(`event-data-${seed}-unicode-\u00A9`, seed);
    case EventKind.SPECIAL:
      return createEvent(`event-data-${seed}-<>[]{}`, seed);
    default:
      return createEvent(`event-data-${seed}`, seed);
  }
}

export function repeatText(value: string, count: number): string {
  let result: string = '';
  for (let index: number = 0; index < count; index++) {
    result += value;
  }
  return result;
}

export function createNotification(title: string): NotificationContent {
  return {
    id: NOTIFICATION_ID,
    title: title,
    text: 'content',
    additionalText: '',
    contentType: NOTIFICATION_CONTENT_TYPE_BASIC_TEXT
  };
}

export function createDefaultConfig(): SubscriberConfig {
  return {
    bundleName: BUNDLE_NAME,
    abilityName: ABILITY_NAME,
    extensionName: EXTENSION_NAME,
    notificationId: NOTIFICATION_ID,
    eventName: STATIC_EVENT_NAME
  };
}

export function isSupportedEventName(eventName: string): boolean {
  return eventName.length > 0 && eventName.length <= MAX_EVENT_NAME_LENGTH;
}

export function normalizeEventData(data: string): string {
  return data.trim();
}

export function isSubscriberStateValid(state: SubscriberState): boolean {
  return state === SubscriberState.DISABLED || state === SubscriberState.ENABLING ||
    state === SubscriberState.ENABLED || state === SubscriberState.DISABLING ||
    state === SubscriberState.ERROR;
}

export function isValidOperation(operation: SubscriberOperation): boolean {
  return operation === SubscriberOperation.ENABLE || operation === SubscriberOperation.DISABLE ||
    operation === SubscriberOperation.RECEIVE_EVENT || operation === SubscriberOperation.PUBLISH_NOTIFICATION ||
    operation === SubscriberOperation.RESET;
}

export function getOperationName(operation: SubscriberOperation): string {
  switch (operation) {
    case SubscriberOperation.ENABLE:
      return 'enable';
    case SubscriberOperation.DISABLE:
      return 'disable';
    case SubscriberOperation.RECEIVE_EVENT:
      return 'receive-event';
    case SubscriberOperation.PUBLISH_NOTIFICATION:
      return 'publish-notification';
    case SubscriberOperation.RESET:
      return 'reset';
    default:
      return 'unknown';
  }
}

export function getStateName(state: SubscriberState): string {
  switch (state) {
    case SubscriberState.DISABLED:
      return 'disabled';
    case SubscriberState.ENABLING:
      return 'enabling';
    case SubscriberState.ENABLED:
      return 'enabled';
    case SubscriberState.DISABLING:
      return 'disabling';
    case SubscriberState.ERROR:
      return 'error';
    default:
      return 'unknown';
  }
}

export function countOccurrences(source: string, target: string): number {
  if (target.length === 0) {
    return 0;
  }
  let count: number = 0;
  let position: number = source.indexOf(target);
  while (position >= 0) {
    count++;
    position = source.indexOf(target, position + target.length);
  }
  return count;
}

export function containsAsciiOnly(value: string): boolean {
  for (let index: number = 0; index < value.length; index++) {
    if (value.charCodeAt(index) > 127) {
      return false;
    }
  }
  return true;
}

export class SubscriberStateMachine {
  private state: SubscriberState = SubscriberState.DISABLED;
  private transitionCount: number = 0;
  private errorCount: number = 0;
  private lastOperation: SubscriberOperation = SubscriberOperation.RESET;
  private lastMessage: string = 'initialized';

  public getState(): SubscriberState {
    return this.state;
  }

  public isEnabled(): boolean {
    return this.state === SubscriberState.ENABLED;
  }

  public isDisabled(): boolean {
    return this.state === SubscriberState.DISABLED;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public getErrorCount(): number {
    return this.errorCount;
  }

  public getLastOperation(): SubscriberOperation {
    return this.lastOperation;
  }

  public getLastMessage(): string {
    return this.lastMessage;
  }

  public enable(): OperationResult {
    this.lastOperation = SubscriberOperation.ENABLE;
    if (this.state === SubscriberState.ENABLED) {
      this.errorCount++;
      this.lastMessage = 'already enabled';
      return { success: false, code: ERROR_CODE_INVALID_STATE, message: this.lastMessage };
    }
    this.state = SubscriberState.ENABLING;
    this.state = SubscriberState.ENABLED;
    this.transitionCount++;
    this.lastMessage = 'enabled';
    return { success: true, code: ERROR_CODE_NONE, message: this.lastMessage };
  }

  public disable(): OperationResult {
    this.lastOperation = SubscriberOperation.DISABLE;
    if (this.state === SubscriberState.DISABLED) {
      this.errorCount++;
      this.lastMessage = 'already disabled';
      return { success: false, code: ERROR_CODE_INVALID_STATE, message: this.lastMessage };
    }
    this.state = SubscriberState.DISABLING;
    this.state = SubscriberState.DISABLED;
    this.transitionCount++;
    this.lastMessage = 'disabled';
    return { success: true, code: ERROR_CODE_NONE, message: this.lastMessage };
  }

  public toggle(): OperationResult {
    if (this.state === SubscriberState.ENABLED) {
      return this.disable();
    }
    return this.enable();
  }

  public reset(): OperationResult {
    this.lastOperation = SubscriberOperation.RESET;
    this.state = SubscriberState.DISABLED;
    this.transitionCount++;
    this.lastMessage = 'reset';
    return { success: true, code: ERROR_CODE_NONE, message: this.lastMessage };
  }

  public fail(message: string): OperationResult {
    this.state = SubscriberState.ERROR;
    this.errorCount++;
    this.lastMessage = message;
    return { success: false, code: ERROR_CODE_INVALID_STATE, message: message };
  }
}

export class SubscriberEventValidator {
  private acceptedCount: number = 0;
  private rejectedCount: number = 0;

  public isValidEvent(event: SubscriberEvent): boolean {
    const valid: boolean = event.event.length > 0 && event.event.length <= MAX_EVENT_NAME_LENGTH &&
      event.data.length <= MAX_EVENT_DATA_LENGTH && event.code >= 0 && event.timestamp >= 0;
    if (valid) {
      this.acceptedCount++;
    } else {
      this.rejectedCount++;
    }
    return valid;
  }

  public getEventName(event: SubscriberEvent): string {
    return event.event;
  }

  public countPayloadLength(event: SubscriberEvent): number {
    return event.data.length;
  }

  public isEmpty(event: SubscriberEvent): boolean {
    return event.data.length === 0;
  }

  public isTooLong(event: SubscriberEvent, limit: number = MAX_EVENT_DATA_LENGTH): boolean {
    return event.data.length > limit;
  }

  public containsUnicode(event: SubscriberEvent): boolean {
    return !containsAsciiOnly(event.data);
  }

  public sanitize(event: SubscriberEvent): SubscriberEvent {
    return {
      event: event.event.trim(),
      data: event.data.trim(),
      code: event.code,
      timestamp: event.timestamp
    };
  }

  public getAcceptedCount(): number {
    return this.acceptedCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public reset(): void {
    this.acceptedCount = 0;
    this.rejectedCount = 0;
  }
}

export class NotificationRequestBuilder {
  private id: number = NOTIFICATION_ID;
  private title: string = '';
  private text: string = 'content';
  private additionalText: string = '';
  private contentType: number = NOTIFICATION_CONTENT_TYPE_BASIC_TEXT;

  public withId(id: number): NotificationRequestBuilder {
    this.id = id;
    return this;
  }

  public withTitle(title: string): NotificationRequestBuilder {
    this.title = title;
    return this;
  }

  public withText(text: string): NotificationRequestBuilder {
    this.text = text;
    return this;
  }

  public withAdditionalText(additionalText: string): NotificationRequestBuilder {
    this.additionalText = additionalText;
    return this;
  }

  public withContentType(contentType: number): NotificationRequestBuilder {
    this.contentType = contentType;
    return this;
  }

  public build(): NotificationContent {
    return {
      id: this.id,
      title: this.title,
      text: this.text,
      additionalText: this.additionalText,
      contentType: this.contentType
    };
  }

  public isValid(): boolean {
    return this.id > 0 && this.title.length > 0 && this.title.length <= MAX_NOTIFICATION_TITLE_LENGTH &&
      this.text.length <= MAX_NOTIFICATION_TEXT_LENGTH &&
      this.contentType === NOTIFICATION_CONTENT_TYPE_BASIC_TEXT;
  }

  public reset(): NotificationRequestBuilder {
    this.id = NOTIFICATION_ID;
    this.title = '';
    this.text = 'content';
    this.additionalText = '';
    this.contentType = NOTIFICATION_CONTENT_TYPE_BASIC_TEXT;
    return this;
  }
}

export class SubscriberConfigManager {
  private config: SubscriberConfig = createDefaultConfig();
  private updateCount: number = 0;
  private invalidCount: number = 0;

  public getConfig(): SubscriberConfig {
    return {
      bundleName: this.config.bundleName,
      abilityName: this.config.abilityName,
      extensionName: this.config.extensionName,
      notificationId: this.config.notificationId,
      eventName: this.config.eventName
    };
  }

  public setConfig(config: SubscriberConfig): OperationResult {
    if (!this.isValidConfig(config)) {
      this.invalidCount++;
      return { success: false, code: ERROR_CODE_INVALID_CONFIG, message: 'invalid config' };
    }
    this.config = {
      bundleName: config.bundleName,
      abilityName: config.abilityName,
      extensionName: config.extensionName,
      notificationId: config.notificationId,
      eventName: config.eventName
    };
    this.updateCount++;
    return { success: true, code: ERROR_CODE_NONE, message: 'config updated' };
  }

  public isValidConfig(config: SubscriberConfig): boolean {
    return config.bundleName.length > 0 && config.abilityName.length > 0 &&
      config.extensionName.length > 0 && config.notificationId > 0 &&
      isSupportedEventName(config.eventName);
  }

  public getUpdateCount(): number {
    return this.updateCount;
  }

  public getInvalidCount(): number {
    return this.invalidCount;
  }

  public reset(): void {
    this.config = createDefaultConfig();
    this.updateCount = 0;
    this.invalidCount = 0;
  }
}

export class NotificationPublisherModel {
  private published: NotificationContent[] = [];
  private failedCount: number = 0;

  public publish(content: NotificationContent): OperationResult {
    const builder: NotificationRequestBuilder = new NotificationRequestBuilder()
      .withId(content.id)
      .withTitle(content.title)
      .withText(content.text)
      .withAdditionalText(content.additionalText)
      .withContentType(content.contentType);
    if (!builder.isValid()) {
      this.failedCount++;
      return { success: false, code: ERROR_CODE_INVALID_NOTIFICATION, message: 'invalid notification' };
    }
    this.published.push(content);
    return { success: true, code: ERROR_CODE_NONE, message: 'published' };
  }

  public getPublishedCount(): number {
    return this.published.length;
  }

  public getFailedCount(): number {
    return this.failedCount;
  }

  public getPublished(): NotificationContent[] {
    return [...this.published];
  }

  public clear(): void {
    this.published = [];
    this.failedCount = 0;
  }
}

export class SubscriberSession {
  private readonly id: number;
  private state: SubscriberState = SubscriberState.DISABLED;
  private operations: SubscriberOperation[] = [];
  private createdAt: number = Date.now();
  private closed: boolean = false;

  constructor(id: number) {
    this.id = id;
  }

  public getId(): number {
    return this.id;
  }

  public getState(): SubscriberState {
    return this.state;
  }

  public isClosed(): boolean {
    return this.closed;
  }

  public activate(): OperationResult {
    if (this.closed) {
      return { success: false, code: ERROR_CODE_INVALID_STATE, message: 'session closed' };
    }
    this.state = SubscriberState.ENABLED;
    this.record(SubscriberOperation.ENABLE);
    return { success: true, code: ERROR_CODE_NONE, message: 'session activated' };
  }

  public deactivate(): OperationResult {
    if (this.closed) {
      return { success: false, code: ERROR_CODE_INVALID_STATE, message: 'session closed' };
    }
    this.state = SubscriberState.DISABLED;
    this.record(SubscriberOperation.DISABLE);
    return { success: true, code: ERROR_CODE_NONE, message: 'session deactivated' };
  }

  public record(operation: SubscriberOperation): void {
    this.operations.push(operation);
  }

  public getOperationCount(): number {
    return this.operations.length;
  }

  public getOperations(): SubscriberOperation[] {
    return [...this.operations];
  }

  public hasOperation(operation: SubscriberOperation): boolean {
    return this.operations.some((item: SubscriberOperation) => item === operation);
  }

  public close(): OperationResult {
    if (this.closed) {
      return { success: false, code: ERROR_CODE_INVALID_STATE, message: 'already closed' };
    }
    this.closed = true;
    this.state = SubscriberState.DISABLED;
    this.record(SubscriberOperation.RESET);
    return { success: true, code: ERROR_CODE_NONE, message: 'session closed' };
  }

  public getAge(now: number = Date.now()): number {
    return now - this.createdAt;
  }

  public snapshot(): SessionSnapshot {
    return {
      id: this.id,
      state: this.state,
      operationCount: this.operations.length,
      active: !this.closed && this.state === SubscriberState.ENABLED
    };
  }
}

export class SubscriberSessionManager {
  private sessions: Map<number, SubscriberSession> = new Map<number, SubscriberSession>();
  private nextId: number = 1;

  public createSession(): SubscriberSession {
    const session: SubscriberSession = new SubscriberSession(this.nextId);
    this.sessions.set(this.nextId, session);
    this.nextId++;
    return session;
  }

  public getSession(id: number): SubscriberSession | null {
    const session: SubscriberSession | undefined = this.sessions.get(id);
    return session === undefined ? null : session;
  }

  public closeSession(id: number): OperationResult {
    const session: SubscriberSession | null = this.getSession(id);
    if (session === null) {
      return { success: false, code: ERROR_CODE_INVALID_STATE, message: 'session not found' };
    }
    return session.close();
  }

  public getSessionCount(): number {
    return this.sessions.size;
  }

  public getActiveCount(): number {
    let count: number = 0;
    this.sessions.forEach((session: SubscriberSession) => {
      if (!session.isClosed()) {
        count++;
      }
    });
    return count;
  }

  public getSnapshots(): SessionSnapshot[] {
    const snapshots: SessionSnapshot[] = [];
    this.sessions.forEach((session: SubscriberSession) => {
      snapshots.push(session.snapshot());
    });
    return snapshots;
  }

  public clear(): void {
    this.sessions.clear();
    this.nextId = 1;
  }
}

export class OperationCatalog {
  private static readonly OPERATIONS: SubscriberOperation[] = [
    SubscriberOperation.ENABLE,
    SubscriberOperation.DISABLE,
    SubscriberOperation.RECEIVE_EVENT,
    SubscriberOperation.PUBLISH_NOTIFICATION,
    SubscriberOperation.RESET
  ];

  public static getOperations(): SubscriberOperation[] {
    return [...OperationCatalog.OPERATIONS];
  }

  public static getOperationCount(): number {
    return OperationCatalog.OPERATIONS.length;
  }

  public static contains(operation: SubscriberOperation): boolean {
    return OperationCatalog.OPERATIONS.some((item: SubscriberOperation) => item === operation);
  }

  public static getOperationAt(index: number): SubscriberOperation {
    if (index < 0 || index >= OperationCatalog.OPERATIONS.length) {
      return SubscriberOperation.RESET;
    }
    return OperationCatalog.OPERATIONS[index];
  }

  public static getOperationNames(): string[] {
    const names: string[] = [];
    OperationCatalog.OPERATIONS.forEach((operation: SubscriberOperation) => {
      names.push(getOperationName(operation));
    });
    return names;
  }
}

export class OperationMetricsCollector {
  private metrics: SubscriberMetrics = {
    enableCount: 0,
    disableCount: 0,
    receiveCount: 0,
    publishCount: 0,
    errorCount: 0
  };

  public record(operation: SubscriberOperation): void {
    switch (operation) {
      case SubscriberOperation.ENABLE:
        this.metrics.enableCount++;
        break;
      case SubscriberOperation.DISABLE:
        this.metrics.disableCount++;
        break;
      case SubscriberOperation.RECEIVE_EVENT:
        this.metrics.receiveCount++;
        break;
      case SubscriberOperation.PUBLISH_NOTIFICATION:
        this.metrics.publishCount++;
        break;
      default:
        break;
    }
  }

  public recordError(): void {
    this.metrics.errorCount++;
  }

  public getMetrics(): SubscriberMetrics {
    return {
      enableCount: this.metrics.enableCount,
      disableCount: this.metrics.disableCount,
      receiveCount: this.metrics.receiveCount,
      publishCount: this.metrics.publishCount,
      errorCount: this.metrics.errorCount
    };
  }

  public getTotalCount(): number {
    return this.metrics.enableCount + this.metrics.disableCount + this.metrics.receiveCount +
      this.metrics.publishCount + this.metrics.errorCount;
  }

  public recordAll(operations: SubscriberOperation[]): void {
    operations.forEach((operation: SubscriberOperation) => this.record(operation));
  }

  public reset(): void {
    this.metrics = {
      enableCount: 0,
      disableCount: 0,
      receiveCount: 0,
      publishCount: 0,
      errorCount: 0
    };
  }
}

export class LoggerBuffer {
  private entries: LogEntry[] = [];
  private maxEntries: number;

  constructor(maxEntries: number = 1000) {
    this.maxEntries = maxEntries;
  }

  public log(level: number, tag: string, message: string): void {
    if (this.entries.length >= this.maxEntries) {
      this.entries.shift();
    }
    this.entries.push({ level: level, tag: tag, message: message, timestamp: Date.now() });
  }

  public info(tag: string, message: string): void {
    this.log(1, tag, message);
  }

  public warn(tag: string, message: string): void {
    this.log(2, tag, message);
  }

  public error(tag: string, message: string): void {
    this.log(3, tag, message);
  }

  public getEntries(): LogEntry[] {
    return [...this.entries];
  }

  public getCount(): number {
    return this.entries.length;
  }

  public filterByLevel(level: number): LogEntry[] {
    return this.entries.filter((entry: LogEntry) => entry.level === level);
  }

  public filterByTag(tag: string): LogEntry[] {
    return this.entries.filter((entry: LogEntry) => entry.tag === tag);
  }

  public contains(message: string): boolean {
    return this.entries.some((entry: LogEntry) => entry.message.indexOf(message) >= 0);
  }

  public clear(): void {
    this.entries = [];
  }

  public getLatest(): LogEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }
}

export class KeyCodeModel {
  public static readonly NAVIGATION_KEYS: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN];
  public static readonly SYSTEM_KEYS: number[] = [KEY_BACK, KEY_HOME, KEY_POWER];

  public static isNavigationKey(keyCode: number): boolean {
    return KeyCodeModel.NAVIGATION_KEYS.some((key: number) => key === keyCode);
  }

  public static isSystemKey(keyCode: number): boolean {
    return KeyCodeModel.SYSTEM_KEYS.some((key: number) => key === keyCode);
  }

  public static isConfirmKey(keyCode: number): boolean {
    return keyCode === KEY_ENTER;
  }

  public static getKeyName(keyCode: number): string {
    switch (keyCode) {
      case KEY_LEFT:
        return 'DPAD_LEFT';
      case KEY_RIGHT:
        return 'DPAD_RIGHT';
      case KEY_UP:
        return 'DPAD_UP';
      case KEY_DOWN:
        return 'DPAD_DOWN';
      case KEY_ENTER:
        return 'ENTER';
      case KEY_BACK:
        return 'BACK';
      case KEY_HOME:
        return 'HOME';
      case KEY_POWER:
        return 'POWER';
      default:
        return 'UNKNOWN';
    }
  }

  public static getNavigationKeyCount(): number {
    return KeyCodeModel.NAVIGATION_KEYS.length;
  }
}

export class InputSanitizer {
  private sanitizedCount: number = 0;
  private rejectedCount: number = 0;

  public sanitize(value: string): string {
    const normalized: string = value.trim();
    this.sanitizedCount++;
    return normalized;
  }

  public isValid(value: string, maxLength: number = MAX_EVENT_DATA_LENGTH): boolean {
    const valid: boolean = value.length <= maxLength;
    if (!valid) {
      this.rejectedCount++;
    }
    return valid;
  }

  public removeControlCharacters(value: string): string {
    let result: string = '';
    for (let index: number = 0; index < value.length; index++) {
      const code: number = value.charCodeAt(index);
      if (code >= 32 || code === 9 || code === 10 || code === 13) {
        result += value.charAt(index);
      }
    }
    return result;
  }

  public escapeQuotes(value: string): string {
    return value.split('"').join('\'').split('\\').join('/');
  }

  public getSanitizedCount(): number {
    return this.sanitizedCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public reset(): void {
    this.sanitizedCount = 0;
    this.rejectedCount = 0;
  }
}

export class ResourceBudgetModel {
  private budget: ResourceBudget = {
    memoryKb: 0,
    timerCount: 0,
    fileHandleCount: 0
  };

  public allocate(memoryKb: number, timerCount: number, fileHandleCount: number): OperationResult {
    if (memoryKb < 0 || timerCount < 0 || fileHandleCount < 0) {
      return { success: false, code: ERROR_CODE_RESOURCE_LIMIT, message: 'negative resource request' };
    }
    if (memoryKb > 4096 || timerCount > 64 || fileHandleCount > 32) {
      return { success: false, code: ERROR_CODE_RESOURCE_LIMIT, message: 'resource limit exceeded' };
    }
    this.budget.memoryKb += memoryKb;
    this.budget.timerCount += timerCount;
    this.budget.fileHandleCount += fileHandleCount;
    return { success: true, code: ERROR_CODE_NONE, message: 'resource allocated' };
  }

  public release(memoryKb: number, timerCount: number, fileHandleCount: number): void {
    this.budget.memoryKb = Math.max(0, this.budget.memoryKb - memoryKb);
    this.budget.timerCount = Math.max(0, this.budget.timerCount - timerCount);
    this.budget.fileHandleCount = Math.max(0, this.budget.fileHandleCount - fileHandleCount);
  }

  public getBudget(): ResourceBudget {
    return {
      memoryKb: this.budget.memoryKb,
      timerCount: this.budget.timerCount,
      fileHandleCount: this.budget.fileHandleCount
    };
  }

  public isWithinLimit(): boolean {
    return this.budget.memoryKb <= 4096 && this.budget.timerCount <= 64 && this.budget.fileHandleCount <= 32;
  }

  public reset(): void {
    this.budget = { memoryKb: 0, timerCount: 0, fileHandleCount: 0 };
  }
}

export class SecurityPolicyModel {
  private requiredPermission: string = 'ohos.permission.NOTIFICATION_CONTROLLER';
  private grantedPermissions: Set<string> = new Set<string>();

  public grant(permission: string): void {
    this.grantedPermissions.add(permission);
  }

  public revoke(permission: string): void {
    this.grantedPermissions.delete(permission);
  }

  public hasPermission(permission: string): boolean {
    return this.grantedPermissions.has(permission);
  }

  public checkNotificationPermission(): SecurityDecision {
    if (this.grantedPermissions.has(this.requiredPermission)) {
      return { allowed: true, code: ERROR_CODE_NONE, reason: 'permission granted' };
    }
    return { allowed: false, code: ERROR_CODE_PERMISSION_DENIED, reason: 'permission denied' };
  }

  public checkEventSource(source: string): SecurityDecision {
    if (source.length === 0) {
      return { allowed: false, code: ERROR_CODE_INVALID_EVENT, reason: 'empty source' };
    }
    if (source.indexOf('..') >= 0 || source.indexOf('/') >= 0) {
      return { allowed: false, code: ERROR_CODE_INVALID_EVENT, reason: 'invalid source' };
    }
    return { allowed: true, code: ERROR_CODE_NONE, reason: 'source accepted' };
  }

  public checkBundleName(bundleName: string): SecurityDecision {
    if (bundleName === BUNDLE_NAME) {
      return { allowed: true, code: ERROR_CODE_NONE, reason: 'bundle matched' };
    }
    return { allowed: false, code: ERROR_CODE_PERMISSION_DENIED, reason: 'bundle mismatch' };
  }

  public getRequiredPermission(): string {
    return this.requiredPermission;
  }

  public getGrantedCount(): number {
    return this.grantedPermissions.size;
  }

  public clear(): void {
    this.grantedPermissions.clear();
  }
}

export class PerformanceProfiler {
  private samples: PerformanceSample[] = [];

  public record(name: string, elapsedMs: number, iteration: number, success: boolean): void {
    this.samples.push({ name: name, elapsedMs: elapsedMs, iteration: iteration, success: success });
  }

  public getSamples(): PerformanceSample[] {
    return [...this.samples];
  }

  public getCount(): number {
    return this.samples.length;
  }

  public getSuccessCount(): number {
    return this.samples.filter((sample: PerformanceSample) => sample.success).length;
  }

  public getFailureCount(): number {
    return this.samples.filter((sample: PerformanceSample) => !sample.success).length;
  }

  public getAverageElapsed(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    this.samples.forEach((sample: PerformanceSample) => {
      total += sample.elapsedMs;
    });
    return total / this.samples.length;
  }

  public getMaxElapsed(): number {
    let max: number = 0;
    this.samples.forEach((sample: PerformanceSample) => {
      if (sample.elapsedMs > max) {
        max = sample.elapsedMs;
      }
    });
    return max;
  }

  public getMinElapsed(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min: number = this.samples[0].elapsedMs;
    this.samples.forEach((sample: PerformanceSample) => {
      if (sample.elapsedMs < min) {
        min = sample.elapsedMs;
      }
    });
    return min;
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.samples.every((sample: PerformanceSample) => sample.elapsedMs <= budgetMs);
  }

  public reset(): void {
    this.samples = [];
  }
}

export class BoundaryChecker {
  public checkLength(value: string, minLength: number, maxLength: number): BoundaryResult {
    const normalized: string = value.trim();
    const length: number = normalized.length;
    return {
      accepted: length >= minLength && length <= maxLength,
      normalized: normalized,
      length: length
    };
  }

  public checkNumber(value: number, minValue: number, maxValue: number): boolean {
    return value >= minValue && value <= maxValue;
  }

  public checkId(value: number): boolean {
    return value > 0;
  }

  public checkRange(start: number, end: number): boolean {
    return start >= 0 && end > start;
  }

  public clamp(value: number, minValue: number, maxValue: number): number {
    if (value < minValue) {
      return minValue;
    }
    if (value > maxValue) {
      return maxValue;
    }
    return value;
  }
}

export class SubscriberWorkflowModel {
  private stateMachine: SubscriberStateMachine = new SubscriberStateMachine();
  private publisher: NotificationPublisherModel = new NotificationPublisherModel();
  private metrics: OperationMetricsCollector = new OperationMetricsCollector();
  private validator: SubscriberEventValidator = new SubscriberEventValidator();

  public runEnableWorkflow(title: string): OperationResult {
    const enableResult: OperationResult = this.stateMachine.enable();
    this.metrics.record(SubscriberOperation.ENABLE);
    if (!enableResult.success) {
      this.metrics.recordError();
      return enableResult;
    }
    const notification: NotificationContent = new NotificationRequestBuilder().withTitle(title).build();
    const publishResult: OperationResult = this.publisher.publish(notification);
    this.metrics.record(SubscriberOperation.PUBLISH_NOTIFICATION);
    if (!publishResult.success) {
      this.metrics.recordError();
    }
    return publishResult;
  }

  public runReceiveWorkflow(data: string): OperationResult {
    const event: SubscriberEvent = createEvent(data);
    if (!this.validator.isValidEvent(event)) {
      this.metrics.recordError();
      return { success: false, code: ERROR_CODE_INVALID_EVENT, message: 'invalid event' };
    }
    this.metrics.record(SubscriberOperation.RECEIVE_EVENT);
    const notification: NotificationContent = new NotificationRequestBuilder().withTitle(event.data).build();
    const publishResult: OperationResult = this.publisher.publish(notification);
    this.metrics.record(SubscriberOperation.PUBLISH_NOTIFICATION);
    return publishResult;
  }

  public runDisableWorkflow(): OperationResult {
    const disableResult: OperationResult = this.stateMachine.disable();
    this.metrics.record(SubscriberOperation.DISABLE);
    if (!disableResult.success) {
      this.metrics.recordError();
    }
    return disableResult;
  }

  public getMetrics(): SubscriberMetrics {
    return this.metrics.getMetrics();
  }

  public getPublishedCount(): number {
    return this.publisher.getPublishedCount();
  }

  public getState(): SubscriberState {
    return this.stateMachine.getState();
  }
}

export function createEventMatrix(count: number): SubscriberEvent[] {
  const events: SubscriberEvent[] = [];
  for (let index: number = 0; index < count; index++) {
    events.push(createEvent(`matrix-event-data-${index}`, index, STATIC_EVENT_NAME));
  }
  return events;
}

export function createNotificationMatrix(count: number): NotificationContent[] {
  const notifications: NotificationContent[] = [];
  for (let index: number = 0; index < count; index++) {
    notifications.push(createNotification(`notification-title-${index}`));
  }
  return notifications;
}

export function sumNumbers(values: number[]): number {
  let total: number = 0;
  values.forEach((value: number) => {
    total += value;
  });
  return total;
}

export function averageNumbers(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  return sumNumbers(values) / values.length;
}

