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
import { PixelSnapshot } from './ImageEffectFixture';

export function assertBytesEqual(actual: ArrayBuffer, expected: ArrayBuffer): void {
  expect(actual.byteLength).assertEqual(expected.byteLength);
  const actualBytes = new Uint8Array(actual);
  const expectedBytes = new Uint8Array(expected);
  let different: number = 0;
  for (let offset = 0; offset < expectedBytes.length; offset++) {
    if (actualBytes[offset] !== expectedBytes[offset]) {
      different++;
    }
  }
  expect(different).assertEqual(0);
}
export function assertOpaque(snapshot: PixelSnapshot): void {
  let nonOpaque: number = 0;
  for (let offset = 3; offset < snapshot.rgba.length; offset += 4) {
    if (snapshot.rgba[offset] !== 255) {
      nonOpaque++;
    }
  }
  expect(nonOpaque).assertEqual(0);
}
export function assertAlphaPopulation(snapshot: PixelSnapshot, expectedLevels: number[]): void {
  const counts: number[] = [];
  for (let level of expectedLevels) {
    counts.push(0);
  }
  let unexpected: number = 0;
  for (let offset = 3; offset < snapshot.rgba.length; offset += 4) {
    const index = expectedLevels.indexOf(snapshot.rgba[offset]);
    if (index < 0) {
      unexpected++;
    } else {
      counts[index]++;
    }
  }
  expect(unexpected).assertEqual(0);
  for (let count of counts) {
    expect(count > 0).assertTrue();
  }
}
