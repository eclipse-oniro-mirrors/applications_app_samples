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
import xml from '@ohos.xml';
import util from '@ohos.util';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Structured text built through the XML serializer.
 * A feed row may be exported as a small document; the serializer is the only
 * path that turns fields into tags without hand written escaping. The cases
 * pin the document prologue, tag pairing, attribute form, empty elements and
 * text survival for CJK bodies.
 */
function textOf(serializer: xml.XmlDynamicSerializer): string {
  const raw: ArrayBuffer = serializer.getOutput();
  const bytes: Uint8Array = new Uint8Array(raw);
  return util.TextDecoder.create('utf-8').decodeToString(bytes);
}
function countOf(text: string, needle: string): number {
  return text.split(needle).length - 1;
}
export default function xmlBuildTest() {
  describe('XmlBuildTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0100
     * @tc.name DeclarationStartsWithMark001
     * @tc.desc Verify the document prologue is written first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeclarationStartsWithMark_001', 0, (): void => {
      Logger.info(TAG, 'DeclarationStartsWithMark_001 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.setDeclaration();
      serializer.startElement('feed');
      serializer.endElement();
      expect(textOf(serializer).startsWith('<?xml')).assertTrue();
      Logger.info(TAG, 'DeclarationStartsWithMark_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0200
     * @tc.name RootTagIsPaired002
     * @tc.desc Verify one element is written as an opening and a closing tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RootTagIsPaired_002', 0, (): void => {
      Logger.info(TAG, 'RootTagIsPaired_002 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement('feed');
      serializer.setText('body');
      serializer.endElement();
      const text: string = textOf(serializer);
      expect(text).assertContain('<feed>');
      expect(text).assertContain('</feed>');
      Logger.info(TAG, 'RootTagIsPaired_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0300
     * @tc.name AttributeRenderedWithQuotes003
     * @tc.desc Verify an attribute is written in name quotes value form
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AttributeRenderedWithQuotes_003', 0, (): void => {
      Logger.info(TAG, 'AttributeRenderedWithQuotes_003 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement('item');
      serializer.setAttributes('kind', 'update');
      serializer.endElement();
      expect(textOf(serializer)).assertContain('kind="update"');
      Logger.info(TAG, 'AttributeRenderedWithQuotes_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0400
     * @tc.name TextLandingBetweenTags004
     * @tc.desc Verify element text is placed between the opening and closing tag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextLandingBetweenTags_004', 0, (): void => {
      Logger.info(TAG, 'TextLandingBetweenTags_004 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement('body');
      serializer.setText('hello');
      serializer.endElement();
      expect(textOf(serializer)).assertContain('<body>hello</body>');
      Logger.info(TAG, 'TextLandingBetweenTags_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0500
     * @tc.name EmptyElementClosesAlone005
     * @tc.desc Verify an empty element is written without a closing pair
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyElementClosesAlone_005', 0, (): void => {
      Logger.info(TAG, 'EmptyElementClosesAlone_005 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.addEmptyElement('img');
      const text: string = textOf(serializer);
      expect(text).assertContain('<img/>');
      expect(text.indexOf('</img>') === -1).assertTrue();
      Logger.info(TAG, 'EmptyElementClosesAlone_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0600
     * @tc.name NestedTagsKeepOrder006
     * @tc.desc Verify inner tags are opened and closed inside the root pair
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NestedTagsKeepOrder_006', 0, (): void => {
      Logger.info(TAG, 'NestedTagsKeepOrder_006 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement('feed');
      serializer.startElement('item');
      serializer.setText('row');
      serializer.endElement();
      serializer.endElement();
      const text: string = textOf(serializer);
      expect(text.indexOf('<feed>') < text.indexOf('<item>')).assertTrue();
      expect(text.indexOf('</item>') < text.indexOf('</feed>')).assertTrue();
      Logger.info(TAG, 'NestedTagsKeepOrder_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0700
     * @tc.name CjkBodySurvives007
     * @tc.desc Verify a CJK caption is written back unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CjkBodySurvives_007', 0, (): void => {
      Logger.info(TAG, 'CjkBodySurvives_007 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      const text: string = '来杯香槟';
      serializer.startElement('body');
      serializer.setText(text);
      serializer.endElement();
      const output: string = textOf(serializer);
      expect(output.indexOf(text) !== -1).assertTrue();
      expect(output.length > text.length).assertTrue();
      Logger.info(TAG, 'CjkBodySurvives_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0800
     * @tc.name OutputBufferCarriesBytes008
     * @tc.desc Verify the serializer exposes its document as a non empty buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OutputBufferCarriesBytes_008', 0, (): void => {
      Logger.info(TAG, 'OutputBufferCarriesBytes_008 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement('feed');
      serializer.endElement();
      expect(serializer.getOutput().byteLength > 0).assertTrue();
      Logger.info(TAG, 'OutputBufferCarriesBytes_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_0900
     * @tc.name SameOperationsSameDocument009
     * @tc.desc Verify two identical build sequences produce identical text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameOperationsSameDocument_009', 0, (): void => {
      Logger.info(TAG, 'SameOperationsSameDocument_009 begin');
      const first: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      first.startElement('feed');
      first.setAttributes('owner', 'Zoologist');
      first.endElement();
      const second: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      second.startElement('feed');
      second.setAttributes('owner', 'Zoologist');
      second.endElement();
      expect(textOf(second)).assertEqual(textOf(first));
      Logger.info(TAG, 'SameOperationsSameDocument_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_XML_1000
     * @tc.name RepeatedElementCounted010
     * @tc.desc Verify two built rows appear as two separate elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedElementCounted_010', 0, (): void => {
      Logger.info(TAG, 'RepeatedElementCounted_010 begin');
      const serializer: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement('feed');
      serializer.startElement('item');
      serializer.setText('first');
      serializer.endElement();
      serializer.startElement('item');
      serializer.setText('second');
      serializer.endElement();
      serializer.endElement();
      expect(countOf(textOf(serializer), '<item>')).assertEqual(2);
      Logger.info(TAG, 'RepeatedElementCounted_010 end');
    });
  });
}
