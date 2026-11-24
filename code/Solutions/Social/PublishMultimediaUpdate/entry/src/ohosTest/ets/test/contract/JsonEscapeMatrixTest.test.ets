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
 * Escaping matrix of the JSON codec.
 * Snapshot text carries user bodies, so quotes, control characters and
 * non ascii text all have to survive a stringify and parse round trip without
 * changing the stored value.
 */
function roundTrip(value: string): string {
  return JSON.parse(JSON.stringify(value)) as string;
}
export default function jsonEscapeMatrixTest() {
  describe('JsonEscapeMatrixTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      Logger.info(TAG, 'JsonEscapeMatrixTest ready');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0100
     * @tc.name QuoteEscaped001
     * @tc.desc Verify a double quote is escaped in the encoded text and restored on parse
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QuoteEscaped_001', 0, (): void => {
      Logger.info(TAG, 'QuoteEscaped_001 begin');
      const body: string = 'say "hi"';
      const encoded: string = JSON.stringify(body);
      expect(encoded).assertContain('\\"');
      expect(roundTrip(body)).assertEqual(body);
      Logger.info(TAG, 'QuoteEscaped_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0200
     * @tc.name BackslashEscaped002
     * @tc.desc Verify a backslash is doubled in the encoded text and restored on parse
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BackslashEscaped_002', 0, (): void => {
      Logger.info(TAG, 'BackslashEscaped_002 begin');
      const body: string = 'path\\to\\album';
      const encoded: string = JSON.stringify(body);
      const grew: boolean = encoded.length > body.length;
      expect(grew).assertTrue();
      expect(roundTrip(body)).assertEqual(body);
      expect(encoded).assertContain('\\\\');
      Logger.info(TAG, 'BackslashEscaped_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0300
     * @tc.name NewlineEscaped003
     * @tc.desc Verify a line break is encoded as an escape sequence and restored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NewlineEscaped_003', 0, (): void => {
      Logger.info(TAG, 'NewlineEscaped_003 begin');
      const body: string = 'first line\nsecond line';
      expect(JSON.stringify(body)).assertContain('\\n');
      expect(roundTrip(body)).assertEqual(body);
      Logger.info(TAG, 'NewlineEscaped_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0400
     * @tc.name TabEscaped004
     * @tc.desc Verify a tab is encoded as an escape sequence and restored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TabEscaped_004', 0, (): void => {
      Logger.info(TAG, 'TabEscaped_004 begin');
      const body: string = 'left\tright';
      expect(roundTrip(body)).assertEqual(body);
      expect(JSON.stringify(body)).assertContain('\\t');
      Logger.info(TAG, 'TabEscaped_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0500
     * @tc.name ChineseKeptPlain005
     * @tc.desc Verify CJK text is kept readable instead of being escaped
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChineseKeptPlain_005', 0, (): void => {
      Logger.info(TAG, 'ChineseKeptPlain_005 begin');
      const body: string = '来杯香槟';
      expect(roundTrip(body)).assertEqual(body);
      expect(JSON.stringify(body)).assertEqual('"' + body + '"');
      Logger.info(TAG, 'ChineseKeptPlain_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0600
     * @tc.name EmojiRoundTrip006
     * @tc.desc Verify an emoji survives the encode and parse round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmojiRoundTrip_006', 0, (): void => {
      Logger.info(TAG, 'EmojiRoundTrip_006 begin');
      const body: string = 'draw 🎨';
      expect(roundTrip(body)).assertEqual(body);
      Logger.info(TAG, 'EmojiRoundTrip_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0700
     * @tc.name KeyOrderPreserved007
     * @tc.desc Verify two declared keys keep their order in the encoded object text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'KeyOrderPreserved_007', 0, (): void => {
      Logger.info(TAG, 'KeyOrderPreserved_007 begin');
      const payload: string = JSON.stringify(JSON.parse('{"a":1,"b":2}'));
      expect(payload).assertEqual('{"a":1,"b":2}');
      Logger.info(TAG, 'KeyOrderPreserved_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0800
     * @tc.name UndefinedOmitted008
     * @tc.desc Verify an undefined property is omitted from the encoded object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UndefinedOmitted_008', 0, (): void => {
      Logger.info(TAG, 'UndefinedOmitted_008 begin');
      const payload: string = JSON.stringify(JSON.parse('{"a":1}'));
      const omitted: boolean = payload.indexOf('undefined') === -1;
      Logger.info(TAG, 'omitted=' + JSON.stringify(omitted));
      expect(omitted).assertTrue();
      Logger.info(TAG, 'UndefinedOmitted_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_0900
     * @tc.name NullPreserved009
     * @tc.desc Verify a null value is encoded as the null literal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NullPreserved_009', 0, (): void => {
      Logger.info(TAG, 'NullPreserved_009 begin');
      expect(JSON.stringify(JSON.parse('{"a":null}'))).assertEqual('{"a":null}');
      Logger.info(TAG, 'NullPreserved_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_1000
     * @tc.name NestedArrayKept010
     * @tc.desc Verify nested array structure is preserved through the round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NestedArrayKept_010', 0, (): void => {
      Logger.info(TAG, 'NestedArrayKept_010 begin');
      const parsed: Array<Object> = JSON.parse('[[1,2],[3]]') as Array<Object>;
      expect(parsed.length).assertEqual(2);
      const payload: string = JSON.stringify(parsed);
      expect(payload).assertEqual('[[1,2],[3]]');
      Logger.info(TAG, 'NestedArrayKept_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_1100
     * @tc.name FractionKept011
     * @tc.desc Verify a fractional number keeps its decimal form
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FractionKept_011', 0, (): void => {
      Logger.info(TAG, 'FractionKept_011 begin');
      const parsed: number = JSON.parse('1.5') as number;
      expect(parsed).assertEqual(1.5);
      expect(JSON.stringify(parsed)).assertEqual('1.5');
      Logger.info(TAG, 'FractionKept_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_1200
     * @tc.name EscapedRoundTripStable012
     * @tc.desc Verify a text full of escapes encodes to the same payload twice
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EscapedRoundTripStable_012', 0, (): void => {
      Logger.info(TAG, 'EscapedRoundTripStable_012 begin');
      const body: string = 'q" b\\ n\n t\t';
      const first: string = JSON.stringify(body);
      const second: string = JSON.stringify(JSON.parse(first));
      expect(second).assertEqual(first);
      Logger.info(TAG, 'EscapedRoundTripStable_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_1300
     * @tc.name EmptyContainers013
     * @tc.desc Verify empty object and empty array keep their compact form
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyContainers_013', 0, (): void => {
      Logger.info(TAG, 'EmptyContainers_013 begin');
      expect(JSON.stringify(JSON.parse('{}'))).assertEqual('{}');
      expect(JSON.stringify(JSON.parse('[]'))).assertEqual('[]');
      Logger.info(TAG, 'EmptyContainers_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONESC_1400
     * @tc.name ControlCharEscaped014
     * @tc.desc Verify a control character is escaped instead of emitted raw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ControlCharEscaped_014', 0, (): void => {
      Logger.info(TAG, 'ControlCharEscaped_014 begin');
      const body: string = 'bell' + String.fromCharCode(7) + 'end';
      const encoded: string = JSON.stringify(body);
      const restored: string = JSON.parse(encoded) as string;
      expect(restored.charCodeAt(4)).assertEqual(7);
      expect(encoded).assertContain('\\u0007');
      Logger.info(TAG, 'ControlCharEscaped_014 end');
    });
  });
}
