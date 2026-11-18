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

// Import the random utility under test through the library facade.
import { RandomUtils } from 'library';
// Import hilog directly for device side case logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag shared by every case of this suite.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const CASE_PREFIX: string = 'FontAndResource_';

// The degenerate range bounds that force int to return a constant value.
const FIXED_MIN: number = 5;
// The degenerate range upper bound equal to the lower bound.
const FIXED_MAX: number = 5;
// The number of draws used to prove the degenerate range is stable.
const FIXED_DRAWS: number = 10;
// The inclusive lower bound used by the bounded int sampling loop.
const INT_MIN: number = 2;
// The inclusive upper bound used by the bounded int sampling loop.
const INT_MAX: number = 7;
// The number of draws used by the bounded int sampling loop.
const INT_DRAWS: number = 50;
// The half-open lower bound used by the float sampling loop.
const FLOAT_MIN: number = 1;
// The exclusive upper bound used by the float sampling loop.
const FLOAT_MAX: number = 2;
// The number of draws used by the float sampling loop.
const FLOAT_DRAWS: number = 50;
// The number of draws used by each deterministic chance check.
const CHANCE_DRAWS: number = 10;
// The pool exercised by the non empty pick sampling loop.
const PICK_POOL: string[] = ['alpha', 'beta', 'gamma'];
// The fallback returned by pick when the pool is empty.
const PICK_FALLBACK: string = 'fallback';
// The number of draws used by the pick sampling loop.
const PICK_DRAWS: number = 50;
// The text length required by the lowerText and mixedText matrix.
const TEXT_LENGTH: number = 12;
// The alphabet pattern matched by lowerText output.
const LOWER_PATTERN: RegExp = /^[a-z0-9]{12}$/;
// The alphabet pattern matched by mixedText output.
const MIXED_PATTERN: RegExp = /^[A-Za-z0-9]{12}$/;
// The uniqueId prefix required by the matrix.
const ID_PREFIX: string = 't';
// The separator joined between the prefix and the random suffix.
const ID_SEPARATOR: string = '_';
// The total length expected for the prefixed unique id.
const ID_TOTAL_LENGTH: number = 10;
// The pattern matched by hexColor output.
const COLOR_PATTERN: RegExp = /^#[0-9A-Fa-f]{6}$/;
// The exact length of a hexColor string, the hash plus six hex digits.
const COLOR_LENGTH: number = 7;
// The number of draws used by the hexColor sampling loop.
const COLOR_DRAWS: number = 20;
// The strong random byte length required by the matrix.
const SECURE_LENGTH: number = 32;
// The zero length requested from secureBytes for the empty buffer check.
const SECURE_ZERO_LENGTH: number = 0;

// Logs one structured case progress line into hilog under the case tag.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', CASE_PREFIX + tag + ', ' + detail);
}

// Registers every logic test case of the RandomUtils suite.
export default function randomUtilsTest(): void {
  // Group the cases under the RandomUtilsSuite describe block.
  describe('RandomUtilsSuite', () => {
    /**
     * @tc.number    SUB_FONTRESOURCE_LT_RANDOM_0100
     * @tc.name      testRandom0001
     * @tc.desc      Verify int(5,5) stays constant at 5 and fifty draws from a wider range all land inside [min,max].
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRandom0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testRandom0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Draw from the degenerate range repeatedly so constancy is proven.
      for (let i: number = 0; i < FIXED_DRAWS; i++) {
        // Sample one integer from the degenerate [5, 5] range.
        const fixed: number = RandomUtils.int(FIXED_MIN, FIXED_MAX);
        // Expect every degenerate draw to return exactly 5.
        expect(fixed).assertEqual(FIXED_MIN);
      }
      // Log the degenerate range outcome.
      logCase(TAG, 'int(' + FIXED_MIN + ',' + FIXED_MAX + ') constant over ' + FIXED_DRAWS + ' draws');

      // Draw from the wider range the matrix number of times.
      for (let i: number = 0; i < INT_DRAWS; i++) {
        // Sample one integer from the inclusive [2, 7] range.
        const drawn: number = RandomUtils.int(INT_MIN, INT_MAX);
        // Expect every draw to stay at or above the inclusive lower bound.
        expect(drawn >= INT_MIN).assertTrue();
        // Expect every draw to stay at or below the inclusive upper bound.
        expect(drawn <= INT_MAX).assertTrue();
      }
      // Log the bounded range outcome.
      logCase(TAG, 'int(' + INT_MIN + ',' + INT_MAX + ') bounded over ' + INT_DRAWS + ' draws');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_RANDOM_0200
     * @tc.name      testRandom0002
     * @tc.desc      Verify float(1,2) lands inside [1,2), chance(0) is always false and chance(1) is always true.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRandom0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testRandom0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Draw from the half-open float range the matrix number of times.
      for (let i: number = 0; i < FLOAT_DRAWS; i++) {
        // Sample one float from the half-open [1, 2) range.
        const drawn: number = RandomUtils.float(FLOAT_MIN, FLOAT_MAX);
        // Expect every draw to stay at or above the lower bound.
        expect(drawn >= FLOAT_MIN).assertTrue();
        // Expect every draw to stay strictly below the exclusive upper bound.
        expect(drawn < FLOAT_MAX).assertTrue();
      }
      // Log the float range outcome.
      logCase(TAG, 'float(' + FLOAT_MIN + ',' + FLOAT_MAX + ') half-open over ' + FLOAT_DRAWS + ' draws');

      // Probe chance with probability zero repeatedly.
      for (let i: number = 0; i < CHANCE_DRAWS; i++) {
        // Expect chance(0) to be false on every draw.
        expect(RandomUtils.chance(0)).assertFalse();
      }
      // Log the deterministic zero probability outcome.
      logCase(TAG, 'chance(0) false over ' + CHANCE_DRAWS + ' draws');

      // Probe chance with probability one repeatedly.
      for (let i: number = 0; i < CHANCE_DRAWS; i++) {
        // Expect chance(1) to be true on every draw.
        expect(RandomUtils.chance(1)).assertTrue();
      }
      // Log the deterministic full probability outcome.
      logCase(TAG, 'chance(1) true over ' + CHANCE_DRAWS + ' draws');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_RANDOM_0300
     * @tc.name      testRandom0003
     * @tc.desc      Verify pick honors the empty pool fallback and stays inside a non empty pool, lowerText and mixedText match their alphabets and uniqueId uses the prefix with total length 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandom0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testRandom0003';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Pick from an empty pool so the fallback path runs.
      const pickedFallback: string = RandomUtils.pick<string>([], PICK_FALLBACK);
      // Log the empty pool pick result.
      logCase(TAG, 'pick empty pool: ' + pickedFallback);
      // Expect the empty pool pick to return the caller fallback.
      expect(pickedFallback).assertEqual(PICK_FALLBACK);

      // Pick from the non empty pool the matrix number of times.
      for (let i: number = 0; i < PICK_DRAWS; i++) {
        // Sample one element from the non empty pool.
        const picked: string = RandomUtils.pick<string>(PICK_POOL, PICK_FALLBACK);
        // Expect every pick to be one of the pooled elements.
        expect(picked === 'alpha' || picked === 'beta' || picked === 'gamma').assertTrue();
      }
      // Log the non empty pool outcome.
      logCase(TAG, 'pick non empty pool bounded over ' + PICK_DRAWS + ' draws');

      // Generate one lowercase alphanumeric text of the matrix length.
      const lower: string = RandomUtils.lowerText(TEXT_LENGTH);
      // Log the generated lowercase text.
      logCase(TAG, 'lowerText: ' + lower);
      // Expect the lowercase text to carry exactly twelve characters.
      expect(lower.length).assertEqual(TEXT_LENGTH);
      // Expect the lowercase text to match the lowercase alphanumeric alphabet.
      expect(LOWER_PATTERN.test(lower)).assertTrue();

      // Generate one mixed-case alphanumeric text of the matrix length.
      const mixed: string = RandomUtils.mixedText(TEXT_LENGTH);
      // Log the generated mixed-case text.
      logCase(TAG, 'mixedText: ' + mixed);
      // Expect the mixed-case text to carry exactly twelve characters.
      expect(mixed.length).assertEqual(TEXT_LENGTH);
      // Expect the mixed-case text to match the mixed alphanumeric alphabet.
      expect(MIXED_PATTERN.test(mixed)).assertTrue();

      // Build one unique id behind the matrix prefix.
      const uniqueId: string = RandomUtils.uniqueId(ID_PREFIX);
      // Log the generated unique id.
      logCase(TAG, 'uniqueId: ' + uniqueId);
      // Expect the unique id to start with the prefix and separator.
      expect(uniqueId.startsWith(ID_PREFIX + ID_SEPARATOR)).assertTrue();
      // Expect the unique id to carry the total length of ten.
      expect(uniqueId.length).assertEqual(ID_TOTAL_LENGTH);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_RANDOM_0400
     * @tc.name      testRandom0004
     * @tc.desc      Verify hexColor always matches the six digit hex pattern and secureBytes returns the requested byte length including the zero length edge.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandom0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testRandom0004';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sample the hex color generator the matrix number of times.
      for (let i: number = 0; i < COLOR_DRAWS; i++) {
        // Generate one random saturated hex color.
        const color: string = RandomUtils.hexColor();
        // Expect every color to match the hash plus six hex digits pattern.
        expect(COLOR_PATTERN.test(color)).assertTrue();
        // Expect every color to carry the hash plus six digit length.
        expect(color.length).assertEqual(COLOR_LENGTH);
      }
      // Log the hex color outcome.
      logCase(TAG, 'hexColor matched over ' + COLOR_DRAWS + ' draws');

      // Request the strong random bytes of the matrix length.
      const bytes: Uint8Array = await RandomUtils.secureBytes(SECURE_LENGTH);
      // Log the returned byte length.
      logCase(TAG, 'secureBytes(' + SECURE_LENGTH + ') length: ' + bytes.length);
      // Expect the result to be a real Uint8Array instance.
      expect(bytes instanceof Uint8Array).assertTrue();
      // Expect the returned buffer to carry exactly thirty two bytes.
      expect(bytes.length).assertEqual(SECURE_LENGTH);

      // Request the zero length strong random bytes edge case.
      const empty: Uint8Array = await RandomUtils.secureBytes(SECURE_ZERO_LENGTH);
      // Log the returned byte length.
      logCase(TAG, 'secureBytes(' + SECURE_ZERO_LENGTH + ') length: ' + empty.length);
      // Expect the zero length request to return an empty buffer.
      expect(empty.length).assertEqual(SECURE_ZERO_LENGTH);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
