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

import { expect } from '@ohos/hypium';

/** Asserts that a string is neither empty nor whitespace only. */
export function expectNonEmptyString(value: string): void {
  expect(value !== undefined).assertTrue();
  expect(value !== null).assertTrue();
  expect(value.length > 0).assertTrue();
}

/** Asserts that a number is inside an inclusive range. */
export function expectInRange(value: number, min: number, max: number): void {
  expect(value >= min).assertTrue();
  expect(value <= max).assertTrue();
}

/** Asserts that an array is not undefined and has the expected size. */
export function expectArraySize(value: Object[], expected: number): void {
  expect(value !== undefined).assertTrue();
  expect(value.length).assertEqual(expected);
}

/** Asserts that an array contains a value. */
export function expectArrayContains(value: string[], expected: string): void {
  expect(value.indexOf(expected) >= 0).assertTrue();
}

/** Asserts that two arrays have the same content order. */
export function expectArrayEquals(actual: string[], expected: string[]): void {
  expect(actual.length).assertEqual(expected.length);
  for (let index = 0; index < expected.length; index++) {
    expect(actual[index]).assertEqual(expected[index]);
  }
}

/** Runs a sync action and returns true when it throws. */
export function throwsSync(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    return true;
  }
}

/** Runs an async action and returns true when it rejects. */
export async function throwsAsync(action: () => Promise<void>): Promise<boolean> {
  try {
    await action();
    return false;
  } catch (error) {
    return true;
  }
}

/** Asserts that a boolean value is exactly true. */
export function expectTrue(value: boolean): void {
  expect(value).assertTrue();
}

/** Asserts that a boolean value is exactly false. */
export function expectFalse(value: boolean): void {
  expect(value).assertFalse();
}
