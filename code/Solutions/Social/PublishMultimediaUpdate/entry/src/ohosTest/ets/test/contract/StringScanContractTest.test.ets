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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Scanning and slicing rules of caption text.
 * The composer stores text exactly as typed, so the page relies on the
 * standard string accessors for trimming, highlighting and previews. These
 * cases pin the accessor contracts that such post processing uses.
 */
export default function stringScanContractTest() {
  describe('StringScanContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0100
     * @tc.name IncludesSubstring001
     * @tc.desc Verify the inclusion check accepts a contained word
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IncludesSubstring_001', 0, (): void => {
      Logger.info(TAG, 'IncludesSubstring_001 begin');
      expect('publish update'.includes('update')).assertTrue();
      expect('publish update'.includes('delete')).assertFalse();
      Logger.info(TAG, 'IncludesSubstring_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0200
     * @tc.name StartsWithFromOffset002
     * @tc.desc Verify the start check honours the given position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StartsWithFromOffset_002', 0, (): void => {
      Logger.info(TAG, 'StartsWithFromOffset_002 begin');
      expect('banana'.startsWith('an', 1)).assertTrue();
      expect('banana'.startsWith('an', 0)).assertFalse();
      Logger.info(TAG, 'StartsWithFromOffset_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0300
     * @tc.name EndsWithSuffix003
     * @tc.desc Verify the end check accepts only the closing text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EndsWithSuffix_003', 0, (): void => {
      Logger.info(TAG, 'EndsWithSuffix_003 begin');
      expect('photo.jpg'.endsWith('.jpg')).assertTrue();
      expect('photo.jpg'.endsWith('.png')).assertFalse();
      Logger.info(TAG, 'EndsWithSuffix_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0400
     * @tc.name IndexOfFromPosition004
     * @tc.desc Verify the search starts at the requested position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexOfFromPosition_004', 0, (): void => {
      Logger.info(TAG, 'IndexOfFromPosition_004 begin');
      expect('banana'.indexOf('a', 2)).assertEqual(3);
      Logger.info(TAG, 'IndexOfFromPosition_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0500
     * @tc.name LastIndexOfFindsTail005
     * @tc.desc Verify the reverse search reports the last position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastIndexOfFindsTail_005', 0, (): void => {
      Logger.info(TAG, 'LastIndexOfFindsTail_005 begin');
      expect('banana'.lastIndexOf('a')).assertEqual(5);
      Logger.info(TAG, 'LastIndexOfFindsTail_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0600
     * @tc.name SliceCountsFromEnd006
     * @tc.desc Verify a negative slice position counts back from the end
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SliceCountsFromEnd_006', 0, (): void => {
      Logger.info(TAG, 'SliceCountsFromEnd_006 begin');
      expect('abcdef'.slice(-3)).assertEqual('def');
      Logger.info(TAG, 'SliceCountsFromEnd_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0700
     * @tc.name SubstringSwapsBounds007
     * @tc.desc Verify the substring accessor accepts reversed bounds
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SubstringSwapsBounds_007', 0, (): void => {
      Logger.info(TAG, 'SubstringSwapsBounds_007 begin');
      expect('abcdef'.substring(4, 1)).assertEqual('bcd');
      Logger.info(TAG, 'SubstringSwapsBounds_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0800
     * @tc.name SplitBySeparator008
     * @tc.desc Verify splitting yields one piece per separator gap
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SplitBySeparator_008', 0, (): void => {
      Logger.info(TAG, 'SplitBySeparator_008 begin');
      const pieces: Array<string> = 'a,b,c'.split(',');
      expect(pieces.length).assertEqual(3);
      expect(pieces[2]).assertEqual('c');
      Logger.info(TAG, 'SplitBySeparator_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_0900
     * @tc.name TrimRemovesEdges009
     * @tc.desc Verify trimming drops leading and trailing spaces only
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TrimRemovesEdges_009', 0, (): void => {
      Logger.info(TAG, 'TrimRemovesEdges_009 begin');
      expect('  publish body  '.trim()).assertEqual('publish body');
      Logger.info(TAG, 'TrimRemovesEdges_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1000
     * @tc.name CharAtOutOfRangeEmpty010
     * @tc.desc Verify a position past the end yields an empty character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CharAtOutOfRangeEmpty_010', 0, (): void => {
      Logger.info(TAG, 'CharAtOutOfRangeEmpty_010 begin');
      expect('abc'.charAt(9)).assertEqual('');
      Logger.info(TAG, 'CharAtOutOfRangeEmpty_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1100
     * @tc.name CharCodeAtAscii011
     * @tc.desc Verify an ascii letter reports its code unit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CharCodeAtAscii_011', 0, (): void => {
      Logger.info(TAG, 'CharCodeAtAscii_011 begin');
      expect('A'.charCodeAt(0)).assertEqual(65);
      Logger.info(TAG, 'CharCodeAtAscii_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1200
     * @tc.name CodePointEmoji012
     * @tc.desc Verify an emoji is reported as one code point
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CodePointEmoji_012', 0, (): void => {
      Logger.info(TAG, 'CodePointEmoji_012 begin');
      expect('😊'.codePointAt(0)).assertEqual(0x1F60A);
      Logger.info(TAG, 'CodePointEmoji_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1300
     * @tc.name Utf16LengthEmoji013
     * @tc.desc Verify an emoji occupies two UTF-16 code units
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Utf16LengthEmoji_013', 0, (): void => {
      Logger.info(TAG, 'Utf16LengthEmoji_013 begin');
      expect('😊'.length).assertEqual(2);
      Logger.info(TAG, 'Utf16LengthEmoji_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1400
     * @tc.name ReplaceFirstOccurrence014
     * @tc.desc Verify a plain text replacement touches only the first hit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReplaceFirstOccurrence_014', 0, (): void => {
      Logger.info(TAG, 'ReplaceFirstOccurrence_014 begin');
      expect('a-b-c'.replace('-', '+')).assertEqual('a+b-c');
      Logger.info(TAG, 'ReplaceFirstOccurrence_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1500
     * @tc.name ReplaceAllViaSplitJoin015
     * @tc.desc Verify splitting and joining rewrites every separator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReplaceAllViaSplitJoin_015', 0, (): void => {
      Logger.info(TAG, 'ReplaceAllViaSplitJoin_015 begin');
      expect('a-b-c'.split('-').join('+')).assertEqual('a+b+c');
      Logger.info(TAG, 'ReplaceAllViaSplitJoin_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_STRSCAN_1600
     * @tc.name MissingSubstringNegative016
     * @tc.desc Verify a missing substring is reported as absent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MissingSubstringNegative_016', 0, (): void => {
      Logger.info(TAG, 'MissingSubstringNegative_016 begin');
      expect('publish'.indexOf('delete')).assertEqual(-1);
      Logger.info(TAG, 'MissingSubstringNegative_016 end');
    });
  });
}
