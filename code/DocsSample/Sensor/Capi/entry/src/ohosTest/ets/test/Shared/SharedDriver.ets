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

import { Driver, ON, Component, DisplayRotation } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { CompassController, CompassState, SensorEvent, SensorPort, SensorCallback,
  LayoutPort, LayoutCallback } from '../../../../main/ets/moudle/CompassController';

export const ORIENTATION_TYPE: number = 256;
export const TIMEOUT_SENSOR_RENDER: number = 5000;
export const POLL_INTERVAL_MS: number = 100;
export const KEY_BACK: number = 2;
export const KEY_HOME: number = 3;

let sharedDriver: Driver | undefined = undefined;
let uiOperationQueue: Promise<void> = Promise.resolve();

export function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const result: Promise<T> = uiOperationQueue.then(action);
  uiOperationQueue = result.then(() => {}, () => {});
  return result;
}

export async function resetDriver(): Promise<void> {
  await uiOperationQueue;
  sharedDriver = undefined;
}

export function getDriver(): Driver {
  if (sharedDriver === undefined) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

export async function serializedDelay(driver: Driver, milliseconds: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.delayMs(milliseconds);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await driver.triggerKey(key);
  });
}

export async function prepareSensorDisplay(): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    const driver: Driver = getDriver();
    await driver.wakeUpDisplay();
    await driver.delayMs(300);
    const unlockLabels: string[] = ['上滑解锁', 'Swipe up to unlock', 'Swipe to unlock'];
    for (let index: number = 0; index < unlockLabels.length; index++) {
      const unlockPrompt = await driver.findComponent(ON.text(unlockLabels[index]));
      if (unlockPrompt !== null) {
        hilog.info(0xF811, 'SensorTest', '%{public}s', 'Dismissing swipe lock before launching EntryAbility');
        const size = await driver.getDisplaySize();
        const centerX: number = Math.floor(size.x / 2);
        await driver.swipe(centerX, Math.floor(size.y * 0.8), centerX, Math.floor(size.y * 0.2), 600);
        await driver.delayMs(500);
        const remainingPrompt = await driver.findComponent(ON.text(unlockLabels[index]));
        if (remainingPrompt !== null) {
          throw new Error('Swipe lock remains visible; unlock the device before UI tests');
        }
        break;
      }
    }
    const usbTitles: string[] = ['USB 连接方式', 'USB connection mode', 'Use USB for'];
    for (let index: number = 0; index < usbTitles.length; index++) {
      const usbPrompt = await driver.findComponent(ON.text(usbTitles[index]));
      if (usbPrompt !== null) {
        hilog.info(0xF811, 'SensorTest', '%{public}s', 'Dismissing USB connection dialog before UI tests');
        const confirmButton = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (confirmButton === null) {
          throw new Error('USB connection dialog confirmation button is missing');
        }
        await confirmButton.click();
        await driver.delayMs(500);
        const remainingPrompt = await driver.findComponent(ON.text(usbTitles[index]));
        if (remainingPrompt !== null) {
          throw new Error('USB connection dialog remains visible');
        }
        break;
      }
    }
  });
}

export async function launchSensorApp(): Promise<void> {
  await prepareSensorDisplay();
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const argumentsValue = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: argumentsValue.bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

export async function findById(id: string): Promise<Component | null> {
  return runSerializedUiOperation(async (): Promise<Component | null> => {
    return getDriver().findComponent(ON.id(id));
  });
}

export async function requireById(id: string): Promise<Component> {
  const component = await findById(id);
  if (component === null) {
    throw new Error('Required component is missing: ' + id);
  }
  return component;
}

export async function waitForComponent(id: string, timeoutMs: number = TIMEOUT_SENSOR_RENDER): Promise<Component> {
  const deadline: number = Date.now() + timeoutMs;
  do {
    const component = await findById(id);
    if (component !== null) {
      return component;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL_MS);
  } while (Date.now() < deadline);
  throw new Error('Component wait timed out: ' + id);
}

export async function waitForCompassStable(): Promise<void> {
  await waitForComponent('directionMy');
  await waitForComponent('compassPointing');
  await waitForComponent('tiltAngle');
}

export async function readTextById(id: string): Promise<string> {
  return runSerializedUiOperation(async (): Promise<string> => {
    const component = await getDriver().findComponent(ON.id(id));
    if (component === null) {
      throw new Error('Cannot read missing component: ' + id);
    }
    return component.getText();
  });
}

export async function checkTextContent(id: string, expectedText: string): Promise<boolean> {
  const actualText: string = await readTextById(id);
  return actualText === expectedText;
}

export async function checkComponentExists(id: string): Promise<boolean> {
  const component = await findById(id);
  return component !== null;
}

export async function findComponentsByType(type: string): Promise<Component[]> {
  return runSerializedUiOperation(async (): Promise<Component[]> => {
    const components = await getDriver().findComponents(ON.type(type));
    return components === null ? [] : components;
  });
}

export async function compassComponentCount(): Promise<number> {
  let count: number = 0;
  const ids: string[] = ['directionMy', 'compassPointing', 'tiltAngle'];
  for (let index: number = 0; index < ids.length; index++) {
    if (await checkComponentExists(ids[index])) {
      count++;
    }
  }
  return count;
}

export async function isCompassVisible(): Promise<boolean> {
  const count: number = await compassComponentCount();
  return count === 3;
}

export async function simulateTouch(x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await getDriver().click(x, y);
  });
}

export async function pressAndWait(key: number, times: number = 1): Promise<void> {
  for (let index: number = 0; index < times; index++) {
    await triggerSerializedKey(getDriver(), key);
    await serializedDelay(getDriver(), POLL_INTERVAL_MS);
  }
}

export async function rotateDisplay(rotation: DisplayRotation): Promise<void> {
  await runSerializedUiOperation(async (): Promise<void> => {
    await getDriver().setDisplayRotation(rotation);
  });
}

export async function readDisplayRotation(): Promise<DisplayRotation> {
  return runSerializedUiOperation(async (): Promise<DisplayRotation> => {
    return getDriver().getDisplayRotation();
  });
}

export async function logCompassSnapshot(): Promise<void> {
  const label: string = await readTextById('directionMy');
  const heading: string = await readTextById('tiltAngle');
  hilog.info(0xF811, 'SensorTest', 'Direction=%{public}s heading=%{public}s', label, heading);
}

export class SensorSubscription {
  sensorType: number;
  interval: number;
  callback: SensorCallback;

  constructor(sensorType: number, interval: number, callback: SensorCallback) {
    this.sensorType = sensorType;
    this.interval = interval;
    this.callback = callback;
  }
}

export class RecordingSensorPort implements SensorPort {
  subscriptions: SensorSubscription[] = [];
  unsubscriptions: number[] = [];
  result: number = 0;
  subscribeError: Error | undefined = undefined;
  unsubscribeError: Error | undefined = undefined;
  callback: SensorCallback | undefined = undefined;

  subscribe(sensorType: number, interval: number, callback: SensorCallback): number {
    if (this.subscribeError !== undefined) {
      throw this.subscribeError;
    }
    this.subscriptions.push(new SensorSubscription(sensorType, interval, callback));
    this.callback = callback;
    return this.result;
  }

  unsubscribe(sensorType: number): void {
    this.unsubscriptions.push(sensorType);
    this.callback = undefined;
    if (this.unsubscribeError !== undefined) {
      throw this.unsubscribeError;
    }
  }

  emit(event: SensorEvent): void {
    const callback: SensorCallback | undefined = this.callback;
    if (callback === undefined) {
      throw new Error('Sensor callback is not registered');
    }
    callback(event);
  }

  async emitAsync(event: SensorEvent): Promise<void> {
    await Promise.resolve();
    this.emit(event);
  }
}

export class RecordingLayoutPort implements LayoutPort {
  onEvents: string[] = [];
  offEvents: string[] = [];
  onCallbacks: LayoutCallback[] = [];
  offCallbacks: LayoutCallback[] = [];
  callback: LayoutCallback | undefined = undefined;

  on(event: 'change', callback: LayoutCallback): void {
    this.onEvents.push(event);
    this.onCallbacks.push(callback);
    this.callback = callback;
  }

  off(event: 'change', callback: LayoutCallback): void {
    this.offEvents.push(event);
    this.offCallbacks.push(callback);
    if (callback === this.callback) {
      this.callback = undefined;
    }
  }

  emit(matches: boolean): void {
    const callback: LayoutCallback | undefined = this.callback;
    if (callback === undefined) {
      throw new Error('Layout callback is not registered');
    }
    callback({ matches: matches });
  }
}

export class MutableCompassState implements CompassState {
  angle: number = 0;
  angleTest: string = '0°';
  isLand: boolean = false;
}

export class CompassFixture {
  state: MutableCompassState = new MutableCompassState();
  sensor: RecordingSensorPort = new RecordingSensorPort();
  layout: RecordingLayoutPort = new RecordingLayoutPort();
  controller: CompassController;
  sensorType: number;

  constructor(sensorType: number = ORIENTATION_TYPE) {
    this.sensorType = sensorType;
    this.controller = new CompassController(this.state, this.sensor, this.layout, sensorType);
  }

  event(yaw: number, pitch: number, roll: number, timestamp: number = 1, accuracy: number = 3): SensorEvent {
    return {
      sensorType: this.sensorType,
      timestamp: timestamp,
      accuracy: accuracy,
      data: [yaw, pitch, roll]
    };
  }

  start(): number {
    return this.controller.start();
  }

  stop(): void {
    this.controller.stop();
  }

  emit(yaw: number, pitch: number, roll: number): void {
    this.sensor.emit(this.event(yaw, pitch, roll));
  }

  async emitAsync(yaw: number, pitch: number, roll: number): Promise<void> {
    await this.sensor.emitAsync(this.event(yaw, pitch, roll));
  }
}

export interface CompassSnapshot {
  angle: number;
  text: string;
  landscape: boolean;
}

export interface TimedSensorFrame {
  yaw: number;
  pitch: number;
  roll: number;
  timestamp: number;
  accuracy: number;
}

export function snapshotState(state: CompassState): CompassSnapshot {
  return {
    angle: state.angle,
    text: state.angleTest,
    landscape: state.isLand
  };
}

export function replayFrames(fixture: CompassFixture, frames: TimedSensorFrame[]): CompassSnapshot[] {
  const snapshots: CompassSnapshot[] = [];
  for (let index: number = 0; index < frames.length; index++) {
    const frame: TimedSensorFrame = frames[index];
    const event: SensorEvent = fixture.event(frame.yaw, frame.pitch, frame.roll,
      frame.timestamp, frame.accuracy);
    fixture.sensor.emit(event);
    snapshots.push(snapshotState(fixture.state));
  }
  return snapshots;
}

export async function replayFramesAsync(fixture: CompassFixture,
  frames: TimedSensorFrame[]): Promise<CompassSnapshot[]> {
  const snapshots: CompassSnapshot[] = [];
  for (let index: number = 0; index < frames.length; index++) {
    const frame: TimedSensorFrame = frames[index];
    const event: SensorEvent = fixture.event(frame.yaw, frame.pitch, frame.roll,
      frame.timestamp, frame.accuracy);
    await fixture.sensor.emitAsync(event);
    snapshots.push(snapshotState(fixture.state));
  }
  return snapshots;
}

export function replayLayout(fixture: CompassFixture, layouts: boolean[]): CompassSnapshot[] {
  const snapshots: CompassSnapshot[] = [];
  for (let index: number = 0; index < layouts.length; index++) {
    fixture.layout.emit(layouts[index]);
    snapshots.push(snapshotState(fixture.state));
  }
  return snapshots;
}

export function copySensorEvent(event: SensorEvent): SensorEvent {
  return {
    sensorType: event.sensorType,
    timestamp: event.timestamp,
    accuracy: event.accuracy,
    data: event.data.slice()
  };
}

export function makeFrame(yaw: number, pitch: number, roll: number,
  timestamp: number, accuracy: number): TimedSensorFrame {
  return {
    yaw: yaw,
    pitch: pitch,
    roll: roll,
    timestamp: timestamp,
    accuracy: accuracy
  };
}

export function subscriptionCount(fixture: CompassFixture): number {
  return fixture.sensor.subscriptions.length;
}

export function unsubscriptionCount(fixture: CompassFixture): number {
  return fixture.sensor.unsubscriptions.length;
}

export function activeCallbackCount(fixture: CompassFixture): number {
  let count: number = 0;
  if (fixture.sensor.callback !== undefined) {
    count++;
  }
  if (fixture.layout.callback !== undefined) {
    count++;
  }
  return count;
}

export function hasBalancedSubscriptions(fixture: CompassFixture): boolean {
  return subscriptionCount(fixture) === unsubscriptionCount(fixture) &&
    fixture.layout.onEvents.length === fixture.layout.offEvents.length &&
    activeCallbackCount(fixture) === 0;
}

export function requireSubscription(fixture: CompassFixture, index: number): SensorSubscription {
  if (index < 0 || index >= fixture.sensor.subscriptions.length) {
    throw new RangeError('Subscription index is out of range');
  }
  return fixture.sensor.subscriptions[index];
}

export function isHeadingText(text: string): boolean {
  if (!/^(0|[1-9][0-9]{0,2})°$/.test(text)) {
    return false;
  }
  const value: number = Number(text.slice(0, text.length - 1));
  return value >= 0 && value < 360;
}

export function parseHeadingText(text: string): number {
  if (!isHeadingText(text)) {
    throw new Error('Heading text is outside the compass display contract: ' + text);
  }
  return Number(text.slice(0, text.length - 1));
}

export async function readHeading(): Promise<number> {
  const text: string = await readTextById('tiltAngle');
  return parseHeadingText(text);
}

export async function waitForHeadingText(expectedText: string,
  timeoutMs: number = TIMEOUT_SENSOR_RENDER): Promise<void> {
  const deadline: number = Date.now() + timeoutMs;
  do {
    const text: string = await readTextById('tiltAngle');
    if (text === expectedText) {
      return;
    }
    await serializedDelay(getDriver(), POLL_INTERVAL_MS);
  } while (Date.now() < deadline);
  throw new Error('Heading text wait timed out: ' + expectedText);
}

export async function readDirection(): Promise<string> {
  const text: string = await readTextById('directionMy');
  if (text.length === 0) {
    throw new Error('Direction label is empty');
  }
  return text;
}

export async function relaunchAndWait(): Promise<void> {
  await launchSensorApp();
  await waitForCompassStable();
}

export async function backgroundAndRestore(): Promise<void> {
  await triggerSerializedKey(getDriver(), KEY_HOME);
  await relaunchAndWait();
}

export async function sampleVisibleHeadings(count: number): Promise<number[]> {
  const headings: number[] = [];
  for (let index: number = 0; index < count; index++) {
    headings.push(await readHeading());
    await serializedDelay(getDriver(), POLL_INTERVAL_MS);
  }
  return headings;
}

export async function verifyRequiredComponents(): Promise<void> {
  const ids: string[] = ['directionMy', 'compassPointing', 'tiltAngle'];
  for (let index: number = 0; index < ids.length; index++) {
    await requireById(ids[index]);
  }
}
