/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { util } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import { common } from '@kit.AbilityKit';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';

const RAW_FILE_NAME: string = 'sanguo.txt';
const ZERO_WIDTH_SPACE: string = '\u200B';
const CHUNK_COUNT: number = 3;

export default function textDecodeTest(): void {
  describe('TextDecodeTest', (): void => {
    let rawContent: Uint8Array = new Uint8Array(0);
    let rawText: string = '';

    beforeAll((): void => {
      const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const resMgr: resourceManager.ResourceManager = appContext.resourceManager;
      rawContent = resMgr.getRawFileContentSync(RAW_FILE_NAME);
      const decoder: util.TextDecoder = util.TextDecoder.create();
      rawText = decoder.decodeWithStream(rawContent);
    });

    /**
     * @tc.name   testDecodeRawFile0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0100
     * @tc.desc   Test that the rawfile bytes are decoded into a non-empty text by TextDecoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDecodeRawFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testDecodeRawFile0001';
      InterfaceTestLog.begin(name, `rawfile=${RAW_FILE_NAME},byteLength=${rawContent.length}`);
      InterfaceTestLog.flag(name, 'rawContentNonEmpty expected=true', rawContent.length > 0);
      expect(rawContent.length > 0).assertTrue();
      InterfaceTestLog.value(name, 'rawTextType', 'string', typeof rawText);
      expect(typeof rawText).assertEqual('string');
      InterfaceTestLog.flag(name, 'rawTextNonEmpty expected=true', rawText.length > 0);
      expect(rawText.length > 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testDecodeResultContent0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0200
     * @tc.desc   Test that the decoded text contains Chinese characters and no Unicode replacement character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDecodeResultContent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testDecodeResultContent0001';
      InterfaceTestLog.begin(name, `rawfile=${RAW_FILE_NAME},textLength=${rawText.length}`);
      InterfaceTestLog.flag(name, 'containsExpectedChineseText expected=true', rawText.indexOf('三国') >= 0);
      expect(rawText.indexOf('三国') >= 0).assertTrue();
      InterfaceTestLog.flag(name, 'hasNoReplacementCharacter expected=true', rawText.indexOf('\uFFFD') < 0);
      expect(rawText.indexOf('\uFFFD') < 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testDecodeWithStreamChunk0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0300
     * @tc.desc   Test that chunked stream decoding produces the same text as a single decoding call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDecodeWithStreamChunk0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testDecodeWithStreamChunk0001';
      InterfaceTestLog.begin(name,
        `rawfile=${RAW_FILE_NAME},byteLength=${rawContent.length},chunkCount=${CHUNK_COUNT}`);
      const chunkSize: number = Math.floor(rawContent.length / CHUNK_COUNT);
      InterfaceTestLog.flag(name, 'chunkSizePositive expected=true', chunkSize > 0);
      expect(chunkSize > 0).assertTrue();
      const streamDecoder: util.TextDecoder = util.TextDecoder.create();
      let chunkedText: string = '';
      for (let offset: number = 0; offset < rawContent.length; offset += chunkSize) {
        const end: number = Math.min(offset + chunkSize, rawContent.length);
        const isLastChunk: boolean = end === rawContent.length;
        chunkedText += streamDecoder.decodeWithStream(rawContent.subarray(offset, end), { stream: !isLastChunk });
      }
      InterfaceTestLog.number(name, 'chunkedTextLength', rawText.length, chunkedText.length);
      InterfaceTestLog.flag(name, 'chunkedTextMatchesRawText expected=true', chunkedText === rawText);
      expect(chunkedText).assertEqual(rawText);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testRawTextHasNoZeroWidthSpace0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0400
     * @tc.desc   Test that the raw text contains no zero width space before the insertion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawTextHasNoZeroWidthSpace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testRawTextHasNoZeroWidthSpace0001';
      InterfaceTestLog.begin(name, `textLength=${rawText.length},separator=U+200B`);
      InterfaceTestLog.flag(name, 'hasNoZeroWidthSpace expected=true', rawText.indexOf(ZERO_WIDTH_SPACE) < 0);
      expect(rawText.indexOf(ZERO_WIDTH_SPACE) < 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testInsertZeroWidthSpace0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0500
     * @tc.desc   Test that inserting zero width spaces grows the text to 2n-1 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertZeroWidthSpace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testInsertZeroWidthSpace0001';
      InterfaceTestLog.begin(name, `textLength=${rawText.length},separator=U+200B`);
      const insertedText: string = rawText.split('').join(ZERO_WIDTH_SPACE);
      InterfaceTestLog.number(name, 'insertedTextLength', rawText.length * 2 - 1, insertedText.length);
      expect(insertedText.length).assertEqual(rawText.length * 2 - 1);
      const separatorCode: number = insertedText.charCodeAt(1);
      InterfaceTestLog.number(name, 'separatorCode', 0x200B, separatorCode);
      expect(separatorCode).assertEqual(0x200B);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testRemoveZeroWidthSpace0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0600
     * @tc.desc   Test that all inserted zero width spaces can be removed and the original text is restored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveZeroWidthSpace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testRemoveZeroWidthSpace0001';
      InterfaceTestLog.begin(name, `textLength=${rawText.length},separator=U+200B`);
      const insertedText: string = rawText.split('').join(ZERO_WIDTH_SPACE);
      const restoredText: string = insertedText.split(ZERO_WIDTH_SPACE).join('');
      InterfaceTestLog.number(name, 'restoredTextLength', rawText.length, restoredText.length);
      InterfaceTestLog.flag(name, 'restoredTextMatchesRawText expected=true', restoredText === rawText);
      expect(restoredText).assertEqual(rawText);
      InterfaceTestLog.flag(name, 'hasNoZeroWidthSpace expected=true', restoredText.indexOf(ZERO_WIDTH_SPACE) < 0);
      expect(restoredText.indexOf(ZERO_WIDTH_SPACE) < 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testZeroWidthSpaceBoundary0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_TEXTDECODE_0700
     * @tc.desc   Test the boundary handling of an empty string and of a single character string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testZeroWidthSpaceBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testZeroWidthSpaceBoundary0001';
      InterfaceTestLog.begin(name, 'inputs=empty;A,separator=U+200B');
      const emptyResult: string = ''.split('').join(ZERO_WIDTH_SPACE);
      const singleResult: string = 'A'.split('').join(ZERO_WIDTH_SPACE);
      InterfaceTestLog.number(name, 'emptyResultLength', 0, emptyResult.length);
      expect(emptyResult.length).assertEqual(0);
      InterfaceTestLog.value(name, 'singleResult', 'A', singleResult);
      expect(singleResult).assertEqual('A');
      InterfaceTestLog.end(name);
    });
  });
}
