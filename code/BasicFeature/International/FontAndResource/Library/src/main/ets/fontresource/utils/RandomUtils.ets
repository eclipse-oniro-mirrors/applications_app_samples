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

// Import the crypto framework for cryptographically strong random bytes.
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
// Import the in-house logger so random generation failures are observable.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'RandomUtils';
// The alphabet used when generating lowercase alphanumerical identifiers.
const LOWER_ALPHANUMERIC: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
// The alphabet used when generating mixed-case alphanumerical identifiers.
const MIXED_ALPHANUMERIC: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

// Random value helpers: strong random bytes plus light-weight id and color generators.
export class RandomUtils {
  // Returns cryptographically strong random bytes of the requested length.
  static async secureBytes(length: number): Promise<Uint8Array> {
    try {
      // Create the platform random generator instance.
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      // Request the random bytes wrapped in a DataBlob synchronously.
      const blob: cryptoFramework.DataBlob = random.generateRandomSync(length);
      // Return the raw byte array to the caller.
      return blob.data;
    } catch (error) {
      // Crypto failures land here; report them without crashing.
      Logger.error(TAG, 'secureBytes failed');
      // Return an empty buffer so callers can detect the failure.
      return new Uint8Array(0);
    }
  }

  // Returns a random integer in the inclusive [min, max] range using Math.random.
  static int(min: number, max: number): number {
    // Compute the inclusive span size.
    const span: number = max - min + 1;
    // Scale a uniform sample into the span and shift it into range.
    return min + Math.floor(Math.random() * span);
  }

  // Returns a random float in the half-open [min, max) range.
  static float(min: number, max: number): number {
    // Interpolate a uniform sample between the bounds.
    return min + Math.random() * (max - min);
  }

  // Returns true with the given probability between 0 and 1.
  static chance(probability: number): boolean {
    // Compare one uniform sample against the requested probability.
    return Math.random() < probability;
  }

  // Picks one element from the array at random, or the fallback when the array is empty.
  static pick<T>(items: T[], fallback: T): T {
    // Guard against empty arrays.
    if (items.length === 0) {
      // Return the caller provided fallback.
      return fallback;
    }
    // Sample a uniform index inside the array bounds.
    return items[RandomUtils.int(0, items.length - 1)];
  }

  // Returns a random lowercase alphanumeric string of the requested length.
  static lowerText(length: number): string {
    // Accumulate the generated characters.
    let text: string = '';
    // Append one random character per position.
    for (let i: number = 0; i < length; i++) {
      // Sample the next character from the lowercase alphabet.
      text += LOWER_ALPHANUMERIC.charAt(RandomUtils.int(0, LOWER_ALPHANUMERIC.length - 1));
    }
    // Return the assembled text.
    return text;
  }

  // Returns a random mixed-case alphanumeric string of the requested length.
  static mixedText(length: number): string {
    // Accumulate the generated characters.
    let text: string = '';
    // Append one random character per position.
    for (let i: number = 0; i < length; i++) {
      // Sample the next character from the mixed alphabet.
      text += MIXED_ALPHANUMERIC.charAt(RandomUtils.int(0, MIXED_ALPHANUMERIC.length - 1));
    }
    // Return the assembled text.
    return text;
  }

  // Builds a readable unique id such as "id_1a2b3c4d" with a prefix and random suffix.
  static uniqueId(prefix: string): string {
    // Compose the id from the caller prefix and eight random lowercase characters.
    return prefix + '_' + RandomUtils.lowerText(8);
  }

  // Returns a random fully saturated hex color string such as "#3FA92C".
  static hexColor(): string {
    // Compose the color from three random channel values.
    const r: number = RandomUtils.int(0, 255);
    // Sample the green channel.
    const g: number = RandomUtils.int(0, 255);
    // Sample the blue channel.
    const b: number = RandomUtils.int(0, 255);
    // Convert each channel into two hex digits and join them behind a hash.
    return '#' + RandomUtils.hex2(r) + RandomUtils.hex2(g) + RandomUtils.hex2(b);
  }

  // Converts one byte value into exactly two hexadecimal characters.
  private static hex2(value: number): string {
    // Take the high nibble and map it into a hex digit.
    const high: string = (value >> 4).toString(16);
    // Take the low nibble and map it into a hex digit.
    const low: string = (value & 0x0F).toString(16);
    // Join both nibbles into one byte of hex text.
    return high + low;
  }
}
