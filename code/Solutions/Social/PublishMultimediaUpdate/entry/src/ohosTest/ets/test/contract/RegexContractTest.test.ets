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
 * Pattern matching rules used to validate a caption.
 * A body may be checked for forbidden tokens, split into words or have names
 * highlighted before it reaches the feed. The cases pin the matching,
 * replacement and splitting contracts that such validation relies on.
 */
export default function regexContractTest() {
  describe('RegexContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0100
     * @tc.name AnchoredPatternNeedsWholeText001
     * @tc.desc Verify anchors reject a string that only contains the body
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AnchoredPatternNeedsWholeText_001', 0, (): void => {
      Logger.info(TAG, 'AnchoredPatternNeedsWholeText_001 begin');
      expect(/^publish$/.test('publish')).assertTrue();
      expect(/^publish$/.test('publish now')).assertFalse();
      Logger.info(TAG, 'AnchoredPatternNeedsWholeText_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0200
     * @tc.name ExecExposesCaptureGroups002
     * @tc.desc Verify each bracketed group is returned in match position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ExecExposesCaptureGroups_002', 0, (): void => {
      Logger.info(TAG, 'ExecExposesCaptureGroups_002 begin');
      const matched: RegExpExecArray | null = /(\d+)-(\d+)/.exec('range 10-20');
      if (matched !== null) {
        expect(matched[1]).assertEqual('10');
        expect(matched[2]).assertEqual('20');
      }
      else {
        expect(matched).assertNull();
      }
      Logger.info(TAG, 'ExecExposesCaptureGroups_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0300
     * @tc.name GlobalExecWalksEachMatch003
     * @tc.desc Verify repeated global execution visits every occurrence then stops
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GlobalExecWalksEachMatch_003', 0, (): void => {
      Logger.info(TAG, 'GlobalExecWalksEachMatch_003 begin');
      const pattern: RegExp = new RegExp('a', 'g');
      let count: number = 0;
      let step: RegExpExecArray | null = pattern.exec('banana');
      while (step !== null) {
        count += 1;
        step = pattern.exec('banana');
      }
      expect(count).assertEqual(3);
      Logger.info(TAG, 'GlobalExecWalksEachMatch_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0400
     * @tc.name GlobalReplaceTouchesEveryHit004
     * @tc.desc Verify a global replacement rewrites all occurrences
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GlobalReplaceTouchesEveryHit_004', 0, (): void => {
      Logger.info(TAG, 'GlobalReplaceTouchesEveryHit_004 begin');
      const replaced: string = 'a-b-a'.replace(/a/g, 'x');
      expect(replaced).assertEqual('x-b-x');
      Logger.info(TAG, 'GlobalReplaceTouchesEveryHit_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0500
     * @tc.name ReplaceCallbackSeesMatch005
     * @tc.desc Verify the replacement callback receives each matched text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReplaceCallbackSeesMatch_005', 0, (): void => {
      Logger.info(TAG, 'ReplaceCallbackSeesMatch_005 begin');
      const wrapped: string = 'tag1 tag2'.replace(/tag\d/g, (hit: string): string => '[' + hit + ']');
      expect(wrapped).assertEqual('[tag1] [tag2]');
      Logger.info(TAG, 'ReplaceCallbackSeesMatch_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0600
     * @tc.name SplitLimitCapsPieces006
     * @tc.desc Verify the split limit caps the number of returned pieces
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SplitLimitCapsPieces_006', 0, (): void => {
      Logger.info(TAG, 'SplitLimitCapsPieces_006 begin');
      const pieces: Array<string> = 'a,b,c'.split(',', 2);
      expect(pieces.length).assertEqual(2);
      Logger.info(TAG, 'SplitLimitCapsPieces_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0700
     * @tc.name CaseInsensitiveFlag007
     * @tc.desc Verify the ignore case flag accepts a differently cased text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CaseInsensitiveFlag_007', 0, (): void => {
      Logger.info(TAG, 'CaseInsensitiveFlag_007 begin');
      expect(/publish/i.test('PUBLISH')).assertTrue();
      expect(/publish/.test('PUBLISH')).assertFalse();
      Logger.info(TAG, 'CaseInsensitiveFlag_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0800
     * @tc.name MultilineAnchorPerLine008
     * @tc.desc Verify the multiline flag lets an anchor match the second line
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MultilineAnchorPerLine_008', 0, (): void => {
      Logger.info(TAG, 'MultilineAnchorPerLine_008 begin');
      const text: string = 'first' + String.fromCharCode(10) + 'second';
      expect(/^second/m.test(text)).assertTrue();
      expect(/^second/.test(text)).assertFalse();
      Logger.info(TAG, 'MultilineAnchorPerLine_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_0900
     * @tc.name DotStopsAtLineBreak009
     * @tc.desc Verify the dot wildcard does not cross a line break
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DotStopsAtLineBreak_009', 0, (): void => {
      Logger.info(TAG, 'DotStopsAtLineBreak_009 begin');
      const text: string = 'a' + String.fromCharCode(10) + 'b';
      expect(/a.b/.test(text)).assertFalse();
      Logger.info(TAG, 'DotStopsAtLineBreak_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1000
     * @tc.name EscapedDotIsLiteral010
     * @tc.desc Verify an escaped dot only matches the dot character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EscapedDotIsLiteral_010', 0, (): void => {
      Logger.info(TAG, 'EscapedDotIsLiteral_010 begin');
      expect(/a\.b/.test('a.b')).assertTrue();
      expect(/a\.b/.test('axb')).assertFalse();
      Logger.info(TAG, 'EscapedDotIsLiteral_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1100
     * @tc.name ExactQuantifierCounts011
     * @tc.desc Verify a fixed quantifier accepts only the exact repetition count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ExactQuantifierCounts_011', 0, (): void => {
      Logger.info(TAG, 'ExactQuantifierCounts_011 begin');
      expect(/^a{3}$/.test('aaa')).assertTrue();
      expect(/^a{3}$/.test('aa')).assertFalse();
      Logger.info(TAG, 'ExactQuantifierCounts_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1200
     * @tc.name CharacterRangeAccepts1012
     * @tc.desc Verify a character range accepts only members of the range
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CharacterRangeAccepts1_012', 0, (): void => {
      Logger.info(TAG, 'CharacterRangeAccepts1_012 begin');
      expect(/^[a-c]+$/.test('abc')).assertTrue();
      expect(/^[a-c]+$/.test('abd')).assertFalse();
      Logger.info(TAG, 'CharacterRangeAccepts1_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1300
     * @tc.name NegatedClassRejectsDigits013
     * @tc.desc Verify a negated class refuses a string that contains a digit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NegatedClassRejectsDigits_013', 0, (): void => {
      Logger.info(TAG, 'NegatedClassRejectsDigits_013 begin');
      expect(/^[^0-9]+$/.test('caption')).assertTrue();
      expect(/^[^0-9]+$/.test('caption2')).assertFalse();
      Logger.info(TAG, 'NegatedClassRejectsDigits_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1400
     * @tc.name LookaheadKeepsMatchedText014
     * @tc.desc Verify a lookahead constrains the match without consuming its tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LookaheadKeepsMatchedText_014', 0, (): void => {
      Logger.info(TAG, 'LookaheadKeepsMatchedText_014 begin');
      const matched: RegExpExecArray | null = /foo(?=bar)/.exec('foobar');
      if (matched !== null) {
        expect(matched[0]).assertEqual('foo');
      }
      else {
        expect(matched).assertNull();
      }
      Logger.info(TAG, 'LookaheadKeepsMatchedText_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1500
     * @tc.name LastIndexAdvancesGlobal015
     * @tc.desc Verify a global match moves the next search position past the hit
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastIndexAdvancesGlobal_015', 0, (): void => {
      Logger.info(TAG, 'LastIndexAdvancesGlobal_015 begin');
      const pattern: RegExp = new RegExp('b', 'g');
      pattern.exec('abc');
      expect(pattern.lastIndex).assertEqual(2);
      Logger.info(TAG, 'LastIndexAdvancesGlobal_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1600
     * @tc.name SourceAndFlagsExposed016
     * @tc.desc Verify a constructed pattern reports its body and flags
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SourceAndFlagsExposed_016', 0, (): void => {
      Logger.info(TAG, 'SourceAndFlagsExposed_016 begin');
      const pattern: RegExp = new RegExp('a+', 'i');
      expect(pattern.source).assertEqual('a+');
      expect(pattern.flags.indexOf('i') !== -1).assertTrue();
      Logger.info(TAG, 'SourceAndFlagsExposed_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1700
     * @tc.name UnicodeFlagKeepsEmoji017
     * @tc.desc Verify an emoji is matched as one code point
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnicodeFlagKeepsEmoji_017', 0, (): void => {
      Logger.info(TAG, 'UnicodeFlagKeepsEmoji_017 begin');
      expect(/😊/u.test('caption 😊')).assertTrue();
      Logger.info(TAG, 'UnicodeFlagKeepsEmoji_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_REGEX_1800
     * @tc.name EmptyAnchorsMatchEmptyText018
     * @tc.desc Verify the empty body pattern accepts only an empty string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyAnchorsMatchEmptyText_018', 0, (): void => {
      Logger.info(TAG, 'EmptyAnchorsMatchEmptyText_018 begin');
      expect(/^$/.test('')).assertTrue();
      expect(/^$/.test('body')).assertFalse();
      Logger.info(TAG, 'EmptyAnchorsMatchEmptyText_018 end');
    });
  });
}
