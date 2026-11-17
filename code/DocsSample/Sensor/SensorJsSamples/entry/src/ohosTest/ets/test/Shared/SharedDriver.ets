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
import { sensor } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { expect } from '@ohos/hypium';

const DOMAIN: number = 0x0000;
const TAG: string = 'SensorJsTest';
export const CALLBACK_TIMEOUT: number = 4000;
export const UI_TIMEOUT: number = 5000;
export const KEY_LEFT: number = 2014;
export const KEY_RIGHT: number = 2015;
export const KEY_UP: number = 2012;
export const KEY_DOWN: number = 2013;
export const KEY_ENTER: number = 2049;
export const KEY_BACK: number = 2;
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;

let sharedDriver: Driver | null = null;
let uiOperationQueue: Promise<void> = Promise.resolve();

/** Keep UiTest calls ordered while preserving errors for each caller. */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const result: Promise<T> = uiOperationQueue.then(action);
  uiOperationQueue = result.then(
    () => {},
    () => {},
  );
  return result;
}

/** @throws {BusinessError} Propagates UiTest driver initialization failures. */
export function getDriver(): Driver {
  if (sharedDriver === null || sharedDriver === undefined) {
    const driver: Driver = Driver.create();
    if (driver === null || driver === undefined) {
      throw new Error('UiTest driver is unavailable; load test suites from TestAbility after delegator registration');
    }
    sharedDriver = driver;
  }
  return sharedDriver;
}

export async function resetDriver(): Promise<void> {
  await uiOperationQueue;
  sharedDriver = null;
}

export async function delay(milliseconds: number): Promise<void> {
  await new Promise<void>((resolve) => {
    setTimeout(resolve, milliseconds);
  });
}

export async function serializedDelay(driver: Driver, milliseconds: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(milliseconds);
  });
}

export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
  });
}

export async function pressAndWait(
  driver: Driver,
  key: number,
  times: number = 1,
  waitMilliseconds: number = DELAY_KEY_NAVIGATION,
): Promise<void> {
  for (let index: number = 0; index < times; index++) {
    await triggerSerializedKey(driver, key);
    await serializedDelay(driver, waitMilliseconds);
  }
}

export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return runSerializedUiOperation(async () => {
    return driver.findComponents(ON.type(type));
  });
}

export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length > 0;
}

export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  return runSerializedUiOperation(async () => {
    const components: Component[] = (await driver.findComponents(ON.text(expectedText))) || [];
    return components.length > 0;
  });
}

export async function requireComponent(id: string): Promise<Component> {
  return runSerializedUiOperation(async () => {
    const component: Component = await getDriver().waitForComponent(ON.id(id), UI_TIMEOUT);
    expect(component !== null && component !== undefined)
      .message('Required component is missing: ' + id)
      .assertTrue();
    return component;
  });
}

export async function clickComponent(id: string): Promise<void> {
  const component: Component = await requireComponent(id);
  await runSerializedUiOperation(async () => {
    await component.click();
  });
}

export async function readComponentText(id: string): Promise<string> {
  const component: Component = await requireComponent(id);
  return runSerializedUiOperation(async () => {
    return component.getText();
  });
}

/** A fresh query each round avoids retaining stale UiTest component handles. */
export async function waitForText(id: string, expected: string): Promise<string> {
  const deadline: number = Date.now() + UI_TIMEOUT;
  let actual: string = '';
  while (Date.now() < deadline) {
    actual = await readComponentText(id);
    if (actual === expected) {
      return actual;
    }
    await delay(50);
  }
  expect(actual)
    .message('Unexpected text for component: ' + id)
    .assertEqual(expected);
  return actual;
}

/** @throws {BusinessError} Propagates EntryAbility launch failures to the runner. */
export async function launchSensorApp(): Promise<void> {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const argumentsValue = AbilityDelegatorRegistry.getArguments();
  await delegator.startAbility({
    bundleName: argumentsValue.bundleName,
    abilityName: 'EntryAbility',
  });
  await requireComponent('sensor_type_selector');
  hilog.info(DOMAIN, TAG, '%{public}s', 'Sensor sample page is ready');
}

export async function clearSensorResults(): Promise<void> {
  await clickComponent('cleanId');
  await waitForText('sensorApiText', '');
}

/** Bridge callback APIs without mixing Hypium done() and Promise completion. */
export async function awaitCallback<T>(
  invoke: (callback: (error: BusinessError, value: T) => void) => void,
  operation: string,
): Promise<T> {
  return new Promise<T>((resolve, reject) => {
    let settled: boolean = false;
    const timer: number = setTimeout(() => {
      if (!settled) {
        settled = true;
        reject(new Error(operation + ' callback timed out'));
      }
    }, CALLBACK_TIMEOUT);
    const callback = (error: BusinessError, value: T): void => {
      if (settled) {
        return;
      }
      settled = true;
      clearTimeout(timer);
      if (error && error.code !== 0) {
        reject(error);
        return;
      }
      resolve(value);
    };
    try {
      invoke(callback);
    } catch (error) {
      if (!settled) {
        settled = true;
        clearTimeout(timer);
        reject(error);
      }
    }
  });
}

export async function altitudeCallback(sea: number, current: number): Promise<number> {
  return awaitCallback<number>((callback) => {
    sensor.getDeviceAltitude(sea, current, callback);
  }, 'getDeviceAltitude');
}

export async function quaternionCallback(input: number[]): Promise<number[]> {
  return awaitCallback<number[]>((callback) => {
    sensor.getQuaternion(input, callback);
  }, 'getQuaternion');
}

export async function rotationCallback(input: number[]): Promise<number[]> {
  return awaitCallback<number[]>((callback) => {
    sensor.getRotationMatrix(input, callback);
  }, 'getRotationMatrix');
}

export async function orientationCallback(input: number[]): Promise<number[]> {
  return awaitCallback<number[]>((callback) => {
    sensor.getOrientation(input, callback);
  }, 'getOrientation');
}

export async function inclinationCallback(input: number[]): Promise<number> {
  return awaitCallback<number>((callback) => {
    sensor.getInclination(input, callback);
  }, 'getInclination');
}

export async function variationCallback(current: number[], previous: number[]): Promise<number[]> {
  return awaitCallback<number[]>((callback) => {
    sensor.getAngleVariation(current, previous, callback);
  }, 'getAngleVariation');
}

export async function transformCallback(input: number[], coordinates: sensor.CoordinatesOptions): Promise<number[]> {
  return awaitCallback<number[]>((callback) => {
    sensor.transformRotationMatrix(input, coordinates, callback);
  }, 'transformRotationMatrix');
}

export async function fusionCallback(gravity: number[], geomagnetic: number[]): Promise<sensor.RotationMatrixResponse> {
  return awaitCallback<sensor.RotationMatrixResponse>((callback) => {
    sensor.getRotationMatrix(gravity, geomagnetic, callback);
  }, 'getRotationMatrixFusion');
}

export async function geomagneticCallback(
  location: sensor.LocationOptions,
  time: number,
): Promise<sensor.GeomagneticResponse> {
  return awaitCallback<sensor.GeomagneticResponse>((callback) => {
    sensor.getGeomagneticInfo(location, time, callback);
  }, 'getGeomagneticInfo');
}

export async function inventoryCallback(): Promise<sensor.Sensor[]> {
  return awaitCallback<sensor.Sensor[]>((callback) => {
    sensor.getSensorList(callback);
  }, 'getSensorList');
}

export async function singleSensorCallback(type: sensor.SensorId): Promise<sensor.Sensor> {
  return awaitCallback<sensor.Sensor>((callback) => {
    sensor.getSingleSensor(type, callback);
  }, 'getSingleSensor');
}

export function assertNear(actual: number, expected: number, tolerance: number): void {
  const assertionActual1 = Number.isFinite(actual);
  expect(assertionActual1).message('Actual value must be finite').assertTrue();
  const assertionActual2 = Number.isFinite(expected);
  expect(assertionActual2).message('Expected value must be finite').assertTrue();
  expect(tolerance >= 0)
    .message('Tolerance must be nonnegative')
    .assertTrue();
  expect(Math.abs(actual - expected))
    .message('Numeric mismatch: actual=' + actual + ', expected=' + expected)
    .assertLessOrEqual(tolerance);
}

export function assertArrayNear(actual: number[], expected: number[], tolerance: number): void {
  const assertionActual3 = actual.length;
  expect(assertionActual3).message('Array shape mismatch').assertEqual(expected.length);
  for (let index: number = 0; index < expected.length; index++) {
    assertNear(actual[index], expected[index], tolerance);
  }
}

export function assertAngleArrayNear(actual: number[], expected: number[], tolerance: number): void {
  const assertionActual4 = actual.length;
  expect(assertionActual4).assertEqual(expected.length);
  for (let index: number = 0; index < expected.length; index++) {
    const assertionActual5 = Number.isFinite(actual[index]);
    expect(assertionActual5).assertTrue();
    const difference: number = actual[index] - expected[index];
    const wrapped: number = Math.atan2(Math.sin(difference), Math.cos(difference));
    assertNear(wrapped, 0, tolerance);
  }
}

export function assertUnitQuaternion(quaternion: number[]): void {
  const assertionActual6 = quaternion.length;
  expect(assertionActual6).assertEqual(4);
  let squaredNorm: number = 0;
  for (let index: number = 0; index < quaternion.length; index++) {
    const assertionActual7 = Number.isFinite(quaternion[index]);
    expect(assertionActual7).assertTrue();
    squaredNorm += quaternion[index] * quaternion[index];
  }
  assertNear(squaredNorm, 1, 0.0001);
}

export function assertRotationMatrix(rotation: number[]): void {
  const assertionActual8 = rotation.length;
  expect(assertionActual8).assertEqual(9);
  for (let index: number = 0; index < rotation.length; index++) {
    const assertionActual9 = Number.isFinite(rotation[index]);
    expect(assertionActual9).assertTrue();
  }
  for (let row: number = 0; row < 3; row++) {
    for (let other: number = 0; other < 3; other++) {
      let dot: number = 0;
      for (let column: number = 0; column < 3; column++) {
        dot += rotation[3 * row + column] * rotation[3 * other + column];
      }
      assertNear(dot, row === other ? 1 : 0, 0.0003);
    }
  }
  const determinant: number =
    rotation[0] * (rotation[4] * rotation[8] - rotation[5] * rotation[7]) -
    rotation[1] * (rotation[3] * rotation[8] - rotation[5] * rotation[6]) +
    rotation[2] * (rotation[3] * rotation[7] - rotation[4] * rotation[6]);
  assertNear(determinant, 1, 0.0003);
}

export function assertOrientationRange(angles: number[]): void {
  const assertionActual10 = angles.length;
  expect(assertionActual10).assertEqual(3);
  for (let index: number = 0; index < angles.length; index++) {
    const assertionActual11 = Number.isFinite(angles[index]);
    expect(assertionActual11).assertTrue();
    expect(Math.abs(angles[index])).assertLessOrEqual(Math.PI + 0.00001);
  }
  expect(Math.abs(angles[1])).assertLessOrEqual(Math.PI / 2 + 0.00001);
}

export function assertGeomagneticResponse(field: sensor.GeomagneticResponse): void {
  const horizontal: number = Math.sqrt(field.x * field.x + field.y * field.y);
  const total: number = Math.sqrt(horizontal * horizontal + field.z * field.z);
  const degrees: number = 180 / Math.PI;
  assertNear(field.levelIntensity, horizontal, 0.1);
  assertNear(field.totalIntensity, total, 0.1);
  assertNear(field.geomagneticDip, Math.atan2(field.z, horizontal) * degrees, 0.001);
  assertNear(field.deflectionAngle, Math.atan2(field.y, field.x) * degrees, 0.001);
  const assertionActual12 = field.totalIntensity > 0;
  expect(assertionActual12).assertTrue();
  const assertionActual13 = field.levelIntensity >= 0;
  expect(assertionActual13).assertTrue();
}

export function assertSensorMetadata(metadata: sensor.Sensor): void {
  const assertionActual14 = typeof metadata.sensorName;
  expect(assertionActual14).assertEqual('string');
  const assertionActual15 = metadata.sensorName.length > 0;
  expect(assertionActual15).assertTrue();
  const assertionActual16 = typeof metadata.vendorName;
  expect(assertionActual16).assertEqual('string');
  const assertionActual17 = typeof metadata.firmwareVersion;
  expect(assertionActual17).assertEqual('string');
  const assertionActual18 = typeof metadata.hardwareVersion;
  expect(assertionActual18).assertEqual('string');
  const assertionActual19 = Number.isInteger(metadata.sensorId);
  expect(assertionActual19).assertTrue();
  const assertionActual20 = Number.isInteger(metadata.sensorId);
  expect(assertionActual20).assertTrue();

  expect(metadata.sensorId >= 0)
    .message('Sensor type ID must be nonnegative: ' + JSON.stringify(metadata))
    .assertTrue();
  const assertionActual21 = Number.isFinite(metadata.maxRange);
  expect(assertionActual21).assertTrue();
  const assertionActual22 = metadata.maxRange >= 0;
  expect(assertionActual22).assertTrue();
  const assertionActual23 = Number.isFinite(metadata.precision);
  expect(assertionActual23).assertTrue();
  const assertionActual24 = metadata.precision >= 0;
  expect(assertionActual24).assertTrue();
  const assertionActual25 = Number.isFinite(metadata.power);
  expect(assertionActual25).assertTrue();
  const assertionActual26 = metadata.power >= 0;
  expect(assertionActual26).assertTrue();
  const assertionActual27 = Number.isFinite(metadata.minSamplePeriod);
  expect(assertionActual27).assertTrue();
  const assertionActual28 = metadata.minSamplePeriod >= 0;
  expect(assertionActual28).assertTrue();
  const assertionActual29 = metadata.maxSamplePeriod >= metadata.minSamplePeriod;
  expect(assertionActual29).assertTrue();
}

export function sensorInventoryKeys(items: sensor.Sensor[]): string[] {
  const keys: string[] = [];
  for (let index: number = 0; index < items.length; index++) {
    const item: sensor.Sensor = items[index];
    keys.push([item.sensorId, item.deviceId, item.sensorIndex, item.sensorName].join(':'));
  }
  return keys.sort();
}

export function assertSensorInventory(items: sensor.Sensor[]): void {
  for (let index: number = 0; index < items.length; index++) {
    assertSensorMetadata(items[index]);
  }
  const keys: string[] = sensorInventoryKeys(items);
  for (let index: number = 1; index < keys.length; index++) {
    expect(keys[index] !== keys[index - 1])
      .message('Duplicate sensor inventory entry')
      .assertTrue();
  }
}

/** Unsupported hardware and permission errors never count as parameter validation. */
export async function assertParameterError(action: () => Promise<void>): Promise<void> {
  let observedCode: number = 0;
  try {
    await action();
  } catch (error) {
    observedCode = (error as BusinessError).code;
  }
  const assertionActual30 = observedCode;
  expect(assertionActual30).message('Expected a parameter error with code 401').assertEqual(401);
}

export function assertAcceleration(response: sensor.AccelerometerResponse): void {
  const assertionActual31 = Number.isFinite(response.x);
  expect(assertionActual31).assertTrue();
  const assertionActual32 = Number.isFinite(response.y);
  expect(assertionActual32).assertTrue();
  const assertionActual33 = Number.isFinite(response.z);
  expect(assertionActual33).assertTrue();
  const assertionActual34 = Number.isFinite(response.timestamp);
  expect(assertionActual34).assertTrue();
  const assertionActual35 = response.timestamp > 0;
  expect(assertionActual35).assertTrue();
}

/**
 * Subscribe to only our callback, always detach it, and bound the event wait.
 * @throws {BusinessError} Propagates subscription, permission and cleanup errors.
 */
export async function captureAcceleration(
  once: boolean,
  interval: number = 200000000,
  sensorInfoParam?: sensor.SensorInfoParam,
): Promise<sensor.AccelerometerResponse> {
  let count: number = 0;
  let subscribed: boolean = false;
  let stopped: boolean = false;
  let postStopCount: number = 0;
  let resolveFirst: (value: sensor.AccelerometerResponse) => void = () => {};
  const firstEvent: Promise<sensor.AccelerometerResponse> = new Promise((resolve) => {
    resolveFirst = resolve;
  });
  const listener = (response: sensor.AccelerometerResponse): void => {
    count++;
    if (stopped) {
      postStopCount++;
    }
    if (count === 1) {
      resolveFirst(response);
    }
  };
  let timer: number = 0;
  const timeout: Promise<sensor.AccelerometerResponse> = new Promise((resolve, reject) => {
    timer = setTimeout(() => {
      reject(new Error('Accelerometer did not deliver an event'));
    }, CALLBACK_TIMEOUT);
  });
  try {
    if (once) {
      sensor.once(sensor.SensorId.ACCELEROMETER, listener);
    } else {
      sensor.on(sensor.SensorId.ACCELEROMETER, listener, {
        interval: interval,
        sensorInfoParam: sensorInfoParam,
      });
    }
    subscribed = true;
    const response: sensor.AccelerometerResponse = await Promise.race([firstEvent, timeout]);
    clearTimeout(timer);
    assertAcceleration(response);
    if (once) {
      await delay(250);
      const assertionActual36 = count;
      expect(assertionActual36).message('A once listener must receive exactly one event').assertEqual(1);
    }
    if (sensorInfoParam === undefined) {
      sensor.off(sensor.SensorId.ACCELEROMETER, listener);
    } else {
      sensor.off(sensor.SensorId.ACCELEROMETER, sensorInfoParam, listener);
    }
    subscribed = false;

    await delay(100);
    stopped = true;
    await delay(250);
    const assertionActual37 = postStopCount;
    expect(assertionActual37).message('Detached listener received an event').assertEqual(0);
    return response;
  } finally {
    clearTimeout(timer);
    if (subscribed) {
      if (sensorInfoParam === undefined) {
        sensor.off(sensor.SensorId.ACCELEROMETER, listener);
      } else {
        sensor.off(sensor.SensorId.ACCELEROMETER, sensorInfoParam, listener);
      }
    }
  }
}

export function assertStatusEvent(event: sensor.SensorStatusEvent): void {
  const assertionActual38 = Number.isFinite(event.timestamp);
  expect(assertionActual38).assertTrue();
  const assertionActual39 = event.timestamp > 0;
  expect(assertionActual39).assertTrue();
  const assertionActual40 = Number.isInteger(event.sensorId);
  expect(assertionActual40).assertTrue();
  const assertionActual41 = Number.isInteger(event.sensorIndex);
  expect(assertionActual41).assertTrue();
  const assertionActual42 = Number.isInteger(event.deviceId);
  expect(assertionActual42).assertTrue();
  const assertionActual43 = typeof event.deviceName;
  expect(assertionActual43).assertEqual('string');
  const assertionActual44 = typeof event.isSensorOnline;
  expect(assertionActual44).assertEqual('boolean');
}

export function assertSameSensor(actual: sensor.Sensor, expected: sensor.Sensor): void {
  assertSensorMetadata(actual);
  assertSensorMetadata(expected);
  const assertionActual45 = actual.sensorId;
  expect(assertionActual45).assertEqual(expected.sensorId);
  const assertionActual46 = actual.sensorName;
  expect(assertionActual46).assertEqual(expected.sensorName);
  const assertionActual47 = actual.vendorName;
  expect(assertionActual47).assertEqual(expected.vendorName);
  const assertionActual48 = actual.hardwareVersion;
  expect(assertionActual48).assertEqual(expected.hardwareVersion);
  const assertionActual49 = actual.firmwareVersion;
  expect(assertionActual49).assertEqual(expected.firmwareVersion);
  assertNear(actual.maxRange, expected.maxRange, 0.00001);
  assertNear(actual.precision, expected.precision, 0.00001);
  assertNear(actual.power, expected.power, 0.00001);
  const assertionActual50 = actual.minSamplePeriod;
  expect(assertionActual50).assertEqual(expected.minSamplePeriod);
  const assertionActual51 = actual.maxSamplePeriod;
  expect(assertionActual51).assertEqual(expected.maxSamplePeriod);
}

export async function waitForTextPrefix(id: string, prefix: string): Promise<string> {
  const deadline: number = Date.now() + UI_TIMEOUT;
  let actual: string = '';
  while (Date.now() < deadline) {
    actual = await readComponentText(id);
    if (actual.startsWith(prefix)) {
      return actual;
    }
    await delay(50);
  }
  expect(actual.startsWith(prefix))
    .message('Missing result prefix: ' + prefix)
    .assertTrue();
  return actual;
}
