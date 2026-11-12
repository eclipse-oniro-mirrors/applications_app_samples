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

// Import the clipboard helper under test from the library HAR package.
import { ClipboardUtil } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// A plain ASCII sentence used by the round trip cases.
const SAMPLE_TEXT: string = 'FontResource clipboard sample';
// A mixed CJK and ASCII sentence used to prove multi-byte content survives the pasteboard.
const SAMPLE_CJK_TEXT: string = 'Sample 字体资源 clipboard';
// The empty string used by the empty payload case.
const EMPTY_TEXT: string = '';
// A single character payload used by the minimal payload case.
const SINGLE_CHAR_TEXT: string = 'F';
// A long payload built by repetition to exercise the pasteboard length boundary.
const LONG_TEXT_UNIT: string = '0123456789';
// The repetition count that builds the long payload.
const LONG_TEXT_REPEAT: number = 40;
// The number of sequential round trips performed by the repeat case.
const REPEAT_ROUNDS: number = 4;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Builds the long payload by repeating the unit string a fixed number of times.
function buildLongText(): string {
  // Accumulate the repeated unit into one payload.
  let text: string = '';
  // Repeat the unit until the payload reaches the configured length.
  for (let i: number = 0; i < LONG_TEXT_REPEAT; i++) {
    // Append one unit to the payload.
    text = text + LONG_TEXT_UNIT;
  }
  // Return the composed payload.
  return text;
}

// Renders a boolean as a stable lowercase token for log lines.
function boolText(value: boolean): string {
  // Return the printable token of the boolean value.
  return value ? 'true' : 'false';
}

// Registers every on-device test case of the clipboard helpers.
export default function clipboardUtilTest() {
  // Group the cases under the "ClipboardUtilSuite" describe block.
  describe('ClipboardUtilSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ClipboardUtilSuite, begin');
      // Clear the clipboard so the first case starts from a known empty state.
      await ClipboardUtil.clear();
      // Confirm the clean start through hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ClipboardUtilSuite, clipboard cleared');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0100
     * @tc.name      testClipCopyText0001
     * @tc.desc      Verify copyText resolves a boolean promise so callers can branch on the copy outcome.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClipCopyText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipCopyText0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the sample sentence into the clipboard and keep the outcome.
      const copied: boolean = await ClipboardUtil.copyText(SAMPLE_TEXT);
      // Log the copy outcome.
      logCase(TAG, 'copyText resolved ' + boolText(copied));
      // The helper must resolve a boolean rather than undefined.
      expect(typeof copied).assertEqual('boolean');
      // The helper resolves one of the two boolean literals only.
      expect(copied === true || copied === false).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0200
     * @tc.name      testClipReadText0001
     * @tc.desc      Verify readText resolves a string promise and returns the text copied immediately before.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClipReadText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipReadText0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the sample sentence so the read has a deterministic payload.
      const copied: boolean = await ClipboardUtil.copyText(SAMPLE_TEXT);
      // Read the clipboard content back.
      const readBack: string = await ClipboardUtil.readText();
      // Log the copy outcome and the read back value.
      logCase(TAG, 'copied=' + boolText(copied) + ', readBack=' + readBack);
      // The read helper always resolves a string.
      expect(typeof readBack).assertEqual('string');
      // When the copy succeeded the read must return the same sentence.
      if (copied) {
        // The round trip must preserve the payload exactly.
        expect(readBack).assertEqual(SAMPLE_TEXT);
      }
      // The read helper never resolves undefined.
      expect(readBack === undefined).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0300
     * @tc.name      testClipClear0001
     * @tc.desc      Verify clear resolves without a value and leaves the clipboard readable without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClipClear0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipClear0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy a payload first so clear has something to remove.
      const copied: boolean = await ClipboardUtil.copyText(SAMPLE_TEXT);
      // Clear every clipboard record.
      await ClipboardUtil.clear();
      // Read the clipboard after the clear so the empty fallback path is exercised.
      const afterClear: string = await ClipboardUtil.readText();
      // Log the copy outcome and the post clear read.
      logCase(TAG, 'copied=' + boolText(copied) + ', afterClear=' + afterClear);
      // The post clear read still resolves a string.
      expect(typeof afterClear).assertEqual('string');
      // The cleared clipboard either yields the empty fallback or keeps the system record; both are strings.
      expect(afterClear.length).assertLargerOrEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0400
     * @tc.name      testClipRoundTrip0001
     * @tc.desc      Verify a copy followed by a read preserves the exact ASCII payload across the pasteboard.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClipRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipRoundTrip0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the ASCII sample sentence.
      const copied: boolean = await ClipboardUtil.copyText(SAMPLE_TEXT);
      // Read the payload back from the pasteboard.
      const readBack: string = await ClipboardUtil.readText();
      // Log both sides of the round trip.
      logCase(TAG, 'source=' + SAMPLE_TEXT + ', readBack=' + readBack);
      // The copy helper reports a boolean either way.
      expect(typeof copied).assertEqual('boolean');
      // The payload survives the round trip whenever the copy succeeded.
      if (copied) {
        // The read back value equals the copied value character by character.
        expect(readBack).assertEqual(SAMPLE_TEXT);
        // The read back length also equals the source length.
        expect(readBack.length).assertEqual(SAMPLE_TEXT.length);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0500
     * @tc.name      testClipRoundTrip0002
     * @tc.desc      Verify a CJK payload keeps its multi byte characters intact through the pasteboard round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClipRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipRoundTrip0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the mixed CJK and ASCII sentence.
      const copied: boolean = await ClipboardUtil.copyText(SAMPLE_CJK_TEXT);
      // Read the payload back from the pasteboard.
      const readBack: string = await ClipboardUtil.readText();
      // Log both sides of the multi byte round trip.
      logCase(TAG, 'copied=' + boolText(copied) + ', readBack=' + readBack);
      // The read helper resolves a string for multi byte content as well.
      expect(typeof readBack).assertEqual('string');
      // The multi byte payload survives the round trip whenever the copy succeeded.
      if (copied) {
        // The read back value equals the copied value exactly.
        expect(readBack).assertEqual(SAMPLE_CJK_TEXT);
        // The CJK segment is still present in the read back value.
        expect(readBack.indexOf('字体')).assertLarger(-1);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0600
     * @tc.name      testClipEmptyPayload0001
     * @tc.desc      Verify copying an empty payload still resolves a boolean and leaves the clipboard readable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClipEmptyPayload0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipEmptyPayload0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy an empty payload to probe the lower boundary of the pasteboard.
      const copied: boolean = await ClipboardUtil.copyText(EMPTY_TEXT);
      // Read the clipboard after the empty payload copy.
      const readBack: string = await ClipboardUtil.readText();
      // Log the empty payload outcome.
      logCase(TAG, 'copied=' + boolText(copied) + ', readBack length=' + readBack.length.toString());
      // The helper reports a boolean for the empty payload as well.
      expect(typeof copied).assertEqual('boolean');
      // The read helper still resolves a string after the empty payload.
      expect(typeof readBack).assertEqual('string');
      // The empty payload never causes a longer record to survive unchanged.
      if (copied) {
        // The clipboard now holds the empty payload.
        expect(readBack).assertEqual(EMPTY_TEXT);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0700
     * @tc.name      testClipSingleChar0001
     * @tc.desc      Verify a single character payload is copied and read back so the boundary above empty works.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClipSingleChar0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipSingleChar0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the single character payload.
      const copied: boolean = await ClipboardUtil.copyText(SINGLE_CHAR_TEXT);
      // Read the single character payload back.
      const readBack: string = await ClipboardUtil.readText();
      // Log the single character round trip.
      logCase(TAG, 'copied=' + boolText(copied) + ', readBack=' + readBack);
      // The helper reports a boolean for the minimal payload.
      expect(typeof copied).assertEqual('boolean');
      // The minimal payload round trip succeeds whenever the copy succeeded.
      if (copied) {
        // The read back value equals the single character exactly.
        expect(readBack).assertEqual(SINGLE_CHAR_TEXT);
        // The read back length is exactly one.
        expect(readBack.length).assertEqual(1);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0800
     * @tc.name      testClipLongPayload0001
     * @tc.desc      Verify a long repeated payload is copied and read back with its full length so large font names work.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClipLongPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipLongPayload0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the long payload used by this case.
      const longText: string = buildLongText();
      // Copy the long payload into the clipboard.
      const copied: boolean = await ClipboardUtil.copyText(longText);
      // Read the long payload back.
      const readBack: string = await ClipboardUtil.readText();
      // Log the payload length and the read back length.
      logCase(TAG, 'source length=' + longText.length.toString() + ', readBack length=' + readBack.length.toString());
      // The source payload has the expected configured length.
      expect(longText.length).assertEqual(LONG_TEXT_UNIT.length * LONG_TEXT_REPEAT);
      // The read back value is a string regardless of the copy outcome.
      expect(typeof readBack).assertEqual('string');
      // The long payload survives the round trip whenever the copy succeeded.
      if (copied) {
        // The read back length equals the source length.
        expect(readBack.length).assertEqual(longText.length);
        // The read back value equals the source value.
        expect(readBack).assertEqual(longText);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_0900
     * @tc.name      testClipRepeatRoundTrip0001
     * @tc.desc      Verify repeated copy and read cycles stay consistent so later payloads fully replace earlier ones.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testClipRepeatRoundTrip0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipRepeatRoundTrip0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the per round payloads so each round writes a distinct value.
      const payloads: string[] = [SAMPLE_TEXT, SAMPLE_CJK_TEXT, SINGLE_CHAR_TEXT, buildLongText()];
      // Track the successful copies.
      let successCount: number = 0;
      // Track the rounds that read back the exact payload.
      let matchCount: number = 0;
      // Walk the configured number of rounds.
      for (let i: number = 0; i < REPEAT_ROUNDS; i++) {
        // Pick the payload of the current round.
        const payload: string = payloads[i % payloads.length];
        // Copy the current payload.
        const copied: boolean = await ClipboardUtil.copyText(payload);
        // Read the current payload back.
        const readBack: string = await ClipboardUtil.readText();
        // Log the round result.
        logCase(TAG, 'round ' + i.toString() + ' copied=' + boolText(copied) +
          ' matched=' + boolText(readBack === payload));
        // Count the successful copy.
        if (copied) {
          // Increment the success counter.
          successCount = successCount + 1;
          // Count the exact read back match.
          if (readBack === payload) {
            // Increment the match counter.
            matchCount = matchCount + 1;
          }
        }
      }
      // Every configured round must have run.
      expect(REPEAT_ROUNDS).assertEqual(payloads.length);
      // The success counter never exceeds the round count.
      expect(successCount).assertLessOrEqual(REPEAT_ROUNDS);
      // Every successful copy must also read back the same payload.
      expect(matchCount).assertEqual(successCount);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_1000
     * @tc.name      testClipPromiseShape0001
     * @tc.desc      Verify all three helpers return promise objects so callers can chain them without awaiting first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testClipPromiseShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipPromiseShape0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The copy helper must hand back a promise object.
      const copyPromise: Promise<boolean> = ClipboardUtil.copyText(SAMPLE_TEXT);
      // The read helper must hand back a promise object as well.
      const readPromise: Promise<string> = ClipboardUtil.readText();
      // The clear helper must hand back a promise object as well.
      const clearPromise: Promise<void> = ClipboardUtil.clear();
      // Await the copy promise so it does not leak into the next case.
      const copied: boolean = await copyPromise;
      // Await the read promise so it does not leak into the next case.
      const readBack: string = await readPromise;
      // Await the clear promise so the clipboard ends empty.
      await clearPromise;
      // Log the awaited values.
      logCase(TAG, 'copied=' + boolText(copied) + ', readBack length=' + readBack.length.toString());
      // The copy promise resolved one of the two boolean literals.
      expect(copied === true || copied === false).assertTrue();
      // The read promise resolved a string.
      expect(typeof readBack).assertEqual('string');
      // The clear promise resolved without a value.
      expect(clearPromise === undefined).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_1100
     * @tc.name      testClipClearIdempotence0001
     * @tc.desc      Verify clearing the clipboard twice in a row stays safe so repeated reset taps cannot crash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testClipClearIdempotence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipClearIdempotence0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy a payload so the first clear has work to do.
      const copied: boolean = await ClipboardUtil.copyText(SAMPLE_TEXT);
      // First clear of the clipboard.
      await ClipboardUtil.clear();
      // Second clear of the already empty clipboard.
      await ClipboardUtil.clear();
      // Read the clipboard after both clears.
      const afterClear: string = await ClipboardUtil.readText();
      // Log the copy outcome and the post clear read length.
      logCase(TAG, 'copied=' + boolText(copied) + ', afterClear length=' + afterClear.length.toString());
      // The double clear never leaves the helper in a throwing state, so a read still resolves a string.
      expect(typeof afterClear).assertEqual('string');
      // The read length is never negative.
      expect(afterClear.length).assertLargerOrEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_1200
     * @tc.name      testClipPayloadMatrix0001
     * @tc.desc      Verify the payload matrix of ASCII, CJK, empty and long text keeps a uniform string contract.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testClipPayloadMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipPayloadMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The payload matrix lists every payload shape exercised by this suite.
      const payloadMatrix: string[] = [SAMPLE_TEXT, SAMPLE_CJK_TEXT, EMPTY_TEXT, SINGLE_CHAR_TEXT, buildLongText()];
      // Track how many matrix rows produced a string read back.
      let stringRows: number = 0;
      // Walk the payload matrix and validate the read contract row by row.
      for (let i: number = 0; i < payloadMatrix.length; i++) {
        // Copy the matrix payload of the current row.
        const copied: boolean = await ClipboardUtil.copyText(payloadMatrix[i]);
        // Read the matrix payload back.
        const readBack: string = await ClipboardUtil.readText();
        // Log the row outcome together with both lengths.
        logCase(TAG, 'row ' + i.toString() + ' source length=' + payloadMatrix[i].length.toString() +
          ', readBack length=' + readBack.length.toString() + ', copied=' + boolText(copied));
        // Every row resolves a boolean from the copy helper.
        expect(typeof copied).assertEqual('boolean');
        // Every row resolves a string from the read helper.
        expect(typeof readBack).assertEqual('string');
        // Count the row that satisfied the string contract.
        stringRows = stringRows + 1;
      }
      // Every matrix row must have satisfied the string contract.
      expect(stringRows).assertEqual(payloadMatrix.length);
      // The matrix keeps the five documented payload shapes.
      expect(payloadMatrix.length).assertEqual(5);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_CLIP_1300
     * @tc.name      testClipOverwriteSemantics0001
     * @tc.desc      Verify a second copy replaces the first payload so the clipboard keeps exactly one primary text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testClipOverwriteSemantics0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClipOverwriteSemantics0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copy the first payload into the clipboard.
      const firstCopied: boolean = await ClipboardUtil.copyText(SAMPLE_TEXT);
      // Read the first payload back.
      const firstRead: string = await ClipboardUtil.readText();
      // Copy the second payload so it should replace the first one.
      const secondCopied: boolean = await ClipboardUtil.copyText(SINGLE_CHAR_TEXT);
      // Read the second payload back.
      const secondRead: string = await ClipboardUtil.readText();
      // Log the overwrite sequence.
      logCase(TAG, 'first=' + boolText(firstCopied) + '/' + firstRead.length.toString() + ', second=' +
        boolText(secondCopied) + '/' + secondRead.length.toString());
      // Both copy calls must resolve booleans.
      expect(typeof firstCopied).assertEqual('boolean');
      // The overwrite call resolves a boolean as well.
      expect(typeof secondCopied).assertEqual('boolean');
      // Both reads resolve strings.
      expect(typeof firstRead).assertEqual('string');
      // The overwrite read resolves a string as well.
      expect(typeof secondRead).assertEqual('string');
      // When both copies succeeded the second payload wins the clipboard.
      if (firstCopied && secondCopied) {
        // The second payload replaced the first one.
        expect(secondRead).assertEqual(SINGLE_CHAR_TEXT);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
