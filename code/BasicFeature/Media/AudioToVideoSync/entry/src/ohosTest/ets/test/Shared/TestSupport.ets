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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';

const TEXT_ENCODING: string = 'utf-8';

export function appContext(): common.Context {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

export function assertFiniteNumber(value: number, label: string): void {
  expect(Number.isFinite(value)).assertTrue();
  expect(Number.isNaN(value)).assertFalse();
  expect(Math.abs(value)).assertLargerOrEqual(0);
  console.info(`${label}: ${value}`);
}

export function assertIntegerInRange(value: number, min: number, max: number, label: string): void {
  assertFiniteNumber(value, label);
  expect(Number.isInteger(value)).assertTrue();
  expect(value).assertLargerOrEqual(min);
  expect(value).assertLessOrEqual(max);
}

export function assertWithinRelative(actual: number, expected: number, relativeTolerance: number,
  label: string): void {
  assertFiniteNumber(actual, label);
  assertFiniteNumber(expected, label);
  expect(relativeTolerance).assertLargerOrEqual(0);
  const delta: number = Math.abs(actual - expected);
  const limit: number = Math.max(1, Math.abs(expected)) * relativeTolerance;
  expect(delta).assertLessOrEqual(limit);
}

export function assertNonDecreasing(values: number[], label: string): void {
  expect(values.length).assertLarger(0);
  for (let i = 1; i < values.length; i++) {
    console.info(`${label}[${i}] = ${values[i]}`);
    expect(values[i]).assertLargerOrEqual(values[i - 1]);
  }
}

export function assertStrictlyPositive(values: number[], label: string): void {
  expect(values.length).assertLarger(0);
  for (let i = 0; i < values.length; i++) {
    assertFiniteNumber(values[i], `${label}[${i}]`);
    expect(values[i]).assertLarger(0);
  }
}

export function assertSameLength(left: string, right: string, label: string): void {
  console.info(`${label}: left=${left.length}, right=${right.length}`);
  expect(left.length).assertEqual(right.length);
  expect(left.length > 0 || right.length === 0).assertTrue();
}

export function encodeText(text: string): ArrayBuffer {
  if (text.length === 0) {
    return new ArrayBuffer(0);
  }
  const encoder: util.TextEncoder = util.TextEncoder.create(TEXT_ENCODING);
  const bytes: Uint8Array = encoder.encodeInto(text);
  const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
  const view: Uint8Array = new Uint8Array(buffer);
  view.set(bytes);
  return buffer;
}

export function decodeBuffer(buffer: ArrayBuffer, length: number): string {
  expect(length).assertLargerOrEqual(0);
  expect(length).assertLessOrEqual(buffer.byteLength);
  const decoder: util.TextDecoder = util.TextDecoder.create(TEXT_ENCODING);
  return decoder.decodeToString(new Uint8Array(buffer.slice(0, length)));
}

export function uniqueName(prefix: string, suffix: string): string {
  const stamp: number = Date.now();
  const tail: number = Math.floor(Math.random() * 1000000);
  expect(prefix.length).assertLarger(0);
  return `${prefix}_${stamp}_${tail}${suffix}`;
}

export function pathInFiles(name: string): string {
  expect(name.length).assertLarger(0);
  expect(name.indexOf('/') < 0).assertTrue();
  return `${appContext().filesDir}/${name}`;
}

export function removeQuietly(path: string): void {
  try {
    fileIo.unlinkSync(path);
  } catch (error) {
    console.info(`removeQuietly skipped: ${path}`);
  }
}

export function removeDirQuietly(path: string): void {
  try {
    fileIo.rmdirSync(path);
  } catch (error) {
    console.info(`removeDirQuietly skipped: ${path}`);
  }
}

export function writeTextFile(path: string, text: string): number {
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE |
    fileIo.OpenMode.TRUNC);
  const buffer: ArrayBuffer = encodeText(text);
  let written: number = 0;
  if (buffer.byteLength > 0) {
    written = fileIo.writeSync(file.fd, buffer);
  }
  fileIo.fsyncSync(file.fd);
  fileIo.closeSync(file);
  return written;
}

export function pathExists(path: string): boolean {
  try {
    return fileIo.accessSync(path);
  } catch (error) {
    return false;
  }
}

export function readTextFile(path: string, size: number): string {
  expect(size).assertLargerOrEqual(0);
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
  if (size === 0) {
    fileIo.closeSync(file);
    return '';
  }
  const buffer: ArrayBuffer = new ArrayBuffer(size);
  const readLength: number = fileIo.readSync(file.fd, buffer);
  fileIo.closeSync(file);
  return decodeBuffer(buffer, readLength);
}

export function repeatPayload(length: number, seed: string): string {
  if (length <= 0 || seed.length === 0) {
    return '';
  }
  let text: string = '';
  let index: number = 0;
  while (text.length < length) {
    text += seed.charAt(index % seed.length);
    index++;
  }
  return text.substring(0, length);
}

export function countDistinct(values: number[]): number {
  const seen: Set<number> = new Set<number>();
  for (let i = 0; i < values.length; i++) {
    seen.add(values[i]);
  }
  return seen.size;
}
