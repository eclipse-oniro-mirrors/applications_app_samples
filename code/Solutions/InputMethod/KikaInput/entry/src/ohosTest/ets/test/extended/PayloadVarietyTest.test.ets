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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { InputHandler } from '../../../../main/ets/model/KeyboardController';
import { FaultInputClient, CountingKeyboardController, attachFaultClient } from '../support/FaultHarness';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputPayloadVariety]';

function attach(): FaultInputClient {
  const client: FaultInputClient = new FaultInputClient();
  attachFaultClient(client, new CountingKeyboardController());
  return client;
}

/**
 * Editor stub that declares text preview unsupported.
 *
 * InputHandler.refreshInfo() never reads this flag, so the probe records
 * whether the five-character preview block is requested anyway.
 */
class PreviewlessClient extends FaultInputClient {
  /** How many times the editor attribute was requested. */
  public attributeReads: number = 0;

  constructor() {
    super();
  }

  public getEditorAttribute(): Promise<inputMethodEngine.EditorAttribute> {
    this.attributeReads = this.attributeReads + 1;
    const attribute: inputMethodEngine.EditorAttribute = {
      inputPattern: 0,
      enterKeyType: 0,
      isTextPreviewSupported: false
    };
    return Promise.resolve(attribute);
  }
}

export default function PayloadVarietyTestTest(): void {
  describe('PayloadVarietyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0100
     * @tc.name      testPayloadVariety_001
     * @tc.desc      Verify a NUL payload is forwarded as one code unit with code point zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_001 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('\u0000');
      expect(client.insertedTexts[0].length).assertEqual(1);
      expect(client.insertedTexts[0].charCodeAt(0)).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0200
     * @tc.name      testPayloadVariety_002
     * @tc.desc      Verify CRLF is preserved as two line-related code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_002 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('a\r\nb');
      expect(client.insertedTexts[0].indexOf('\r')).assertEqual(1);
      expect(client.insertedTexts[0].indexOf('\n')).assertEqual(2);
      expect(client.insertedTexts[0].length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0300
     * @tc.name      testPayloadVariety_003
     * @tc.desc      Verify a family emoji keeps all eight UTF-16 code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_003 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const family: string = '👨‍👩‍👧';
      InputHandler.getInstance().insertText(family);
      expect(client.insertedTexts[0].charCodeAt(5)).assertEqual(8205);
      expect(client.insertedTexts[0].length).assertEqual(8);
      expect(client.insertedTexts[0].charCodeAt(2)).assertEqual(8205);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0400
     * @tc.name      testPayloadVariety_004
     * @tc.desc      Verify a single emoji is stored as a surrogate pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('😀');
      expect(client.insertedTexts[0].length).assertEqual(2);
      expect(client.insertedTexts[0].charCodeAt(0)).assertEqual(55357);
      expect(client.insertedTexts[0].charCodeAt(1)).assertEqual(56832);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0500
     * @tc.name      testPayloadVariety_005
     * @tc.desc      Verify an Arabic payload keeps its five code units and first letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_005 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      const arabic: string = 'مرحبا';
      handlerRef.insertText(arabic);
      expect(client.insertedTexts[0].length).assertEqual(5);
      expect(client.insertedTexts[0].charCodeAt(0)).assertEqual(1605);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0600
     * @tc.name      testPayloadVariety_006
     * @tc.desc      Verify a zero-width space survives as one invisible code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_006 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const zwsp: string = String.fromCharCode(8203);
      const payload: string = 'a' + zwsp + 'b';
      InputHandler.getInstance().insertText(payload);
      const stored: string = client.insertedTexts[0];
      expect(stored.indexOf(zwsp)).assertEqual(1);
      expect(stored.split(zwsp).length).assertEqual(2);
      expect(stored.charCodeAt(1)).assertEqual(8203);
      expect(stored.length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0700
     * @tc.name      testPayloadVariety_007
     * @tc.desc      Verify a whitespace-only payload has three code units and an empty trim result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_007 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText(' \t ');
      expect(client.insertedTexts[0].length).assertEqual(3);
      expect(client.insertedTexts[0].trim().length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0800
     * @tc.name      testPayloadVariety_008
     * @tc.desc      Verify a four-letter run has five split segments around the letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_008 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('aaaa');
      expect(client.insertedTexts[0].lastIndexOf('a')).assertEqual(3);
      expect(client.insertedTexts[0].split('a').length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_0900
     * @tc.name      testPayloadVariety_009
     * @tc.desc      Verify a mixed-script payload keeps five code units in physical order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_009 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const mixed: string = 'a中1😀';
      InputHandler.getInstance().insertText(mixed);
      expect(client.insertedTexts[0].length).assertEqual(5);
      const mixedCodes: number[] = [];
      let i: number = 0;
      while (i < 3) {
        mixedCodes.push(client.insertedTexts[0].charCodeAt(i));
        i = i + 1;
      }
      expect(mixedCodes.join('|')).assertEqual('97|20013|49');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_VARIETY_1000
     * @tc.name      testPayloadVariety_010
     * @tc.desc      Verify a 4096-code-unit payload keeps both ends and its full length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadVariety_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_010 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      let payload: string = 'S';
      for (let i = 1; i < 4095; i++) {
        payload = payload + 'm';
      }
      payload = payload + 'E';
      InputHandler.getInstance().insertText(payload);
      expect(client.insertedTexts[0].charAt(0)).assertEqual('S');
      expect(client.insertedTexts[0].charAt(4095)).assertEqual('E');
      expect(client.insertedTexts[0].charCodeAt(4095)).assertEqual(69);
      expect(client.insertedTexts[0].length).assertEqual(4096);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadVariety_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0100
     * @tc.name      testPayloadExtra_001
     * @tc.desc      Verify a tab and a newline keep their own positions inside a four-unit payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_001 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('a\t\nb');
      const stored: string = client.insertedTexts[0];
      expect(stored.indexOf('\n')).assertEqual(2);
      expect(stored.substring(0, 1)).assertEqual('a');
      expect(stored.split('\t').length).assertEqual(2);
      expect(stored.split('\n').length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0200
     * @tc.name      testPayloadExtra_002
     * @tc.desc      Verify a four-letter Hebrew word keeps its right-to-left code order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_002 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('שלום');
      const stored: string = client.insertedTexts[0];
      const letters: string[] = stored.split('');
      expect(letters[3]).assertEqual('ם');
      expect(letters.length).assertEqual(4);
      expect(letters[0] === letters[3]).assertFalse();
      expect(letters[1]).assertEqual('ל');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0300
     * @tc.name      testPayloadExtra_003
     * @tc.desc      Verify one Hangul syllable occupies a single code unit in the BMP.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_003 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const payload: string = '한';
      InputHandler.getInstance().insertText(payload);
      const units: number[] = [];
      let i: number = 0;
      while (i < payload.length) {
        units.push(client.insertedTexts[0].charCodeAt(i));
        i = i + 1;
      }
      expect(units.length).assertEqual(1);
      expect(units[0]).assertEqual(54620);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0400
     * @tc.name      testPayloadExtra_004
     * @tc.desc      Verify two concatenated emoji occupy four UTF-16 code units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_004 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('😀😀');
      const stored: string = client.insertedTexts[0];
      const codes: number[] = [];
      for (let i = 0; i < stored.length; i++) {
        codes.push(stored.charCodeAt(i));
      }
      expect(codes.length).assertEqual(4);
      expect(codes.join('|')).assertEqual('55357|56832|55357|56832');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0500
     * @tc.name      testPayloadExtra_005
     * @tc.desc      Verify a byte-order mark survives as one invisible BMP code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_005 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const bom: string = String.fromCharCode(65279);
      InputHandler.getInstance().insertText(bom);
      const stored: string = client.insertedTexts[0];
      expect(stored.length - bom.length).assertEqual(0);
      expect(stored).assertEqual(bom);
      expect(stored.indexOf(bom)).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0600
     * @tc.name      testPayloadExtra_006
     * @tc.desc      Verify the line separator character arrives as one BMP code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_006 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const separator: string = String.fromCharCode(8232);
      InputHandler.getInstance().insertText(separator);
      const pieces: string[] = client.insertedTexts[0].split(separator);
      expect(pieces.length).assertEqual(2);
      expect(pieces[0]).assertEqual('');
      expect(pieces[1]).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0700
     * @tc.name      testPayloadExtra_007
     * @tc.desc      Verify a soft hyphen is forwarded as a one-unit non-whitespace glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_007 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('\u00AD');
      expect(client.insertedTexts[0].charCodeAt(0)).assertEqual(173);
      expect(client.insertedTexts[0].trim().length).assertEqual(1);
      expect(client.insertedTexts[0].length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0800
     * @tc.name      testPayloadExtra_008
     * @tc.desc      Verify a hundred repeated letters split into one hundred one segments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_008 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      let payload: string = '';
      for (let i = 0; i < 100; i++) {
        payload = payload + 'a';
      }
      InputHandler.getInstance().insertText(payload);
      expect(client.insertedTexts[0].lastIndexOf('a')).assertEqual(99);
      expect(client.insertedTexts[0].length).assertEqual(100);
      expect(client.insertedTexts[0].split('a').length).assertEqual(101);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_0900
     * @tc.name      testPayloadExtra_009
     * @tc.desc      Verify inserting the same payload twice records two identical journal entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_009 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('same');
      InputHandler.getInstance().insertText('same');
      expect(client.insertedTexts[0]).assertEqual(client.insertedTexts[1]);
      expect(client.journal[0].length).assertEqual(11);
      expect(client.journal.length).assertEqual(2);
      expect(client.journal[0]).assertEqual(client.journal[1]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_1000
     * @tc.name      testPayloadExtra_010
     * @tc.desc      Verify padded text keeps its spaces while the trimmed core stays two letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_010 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('  ab  ');
      expect(client.insertedTexts[0].indexOf('a')).assertEqual(2);
      expect(client.insertedTexts[0].length).assertEqual(6);
      expect(client.insertedTexts[0].trim()).assertEqual('ab');
      expect(client.insertedTexts[0].trim().length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_1100
     * @tc.name      testPayloadExtra_011
     * @tc.desc      Verify a single zero glyph stays one code unit with code point forty-eight.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_011 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('0');
      expect(Number(client.insertedTexts[0])).assertEqual(0);
      expect(client.insertedTexts[0].length).assertEqual(1);
      expect(client.insertedTexts[0].charCodeAt(0)).assertEqual(48);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_1200
     * @tc.name      testPayloadExtra_012
     * @tc.desc      Verify eleven CJK glyphs keep an eleven-unit length and two boundary code points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_012 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('汉字输入法测试文本内容');
      const stored: string = client.insertedTexts[0];
      const glyphs: string[] = stored.split('');
      expect(glyphs[0]).assertEqual('汉');
      expect(glyphs[glyphs.length - 1]).assertEqual('容');
      expect(glyphs[4]).assertEqual('法');
      expect(glyphs.length).assertEqual(11);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_1300
     * @tc.name      testPayloadExtra_013
     * @tc.desc      Verify a mixed ASCII, digit, punctuation and CJK payload keeps five units.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const handlerRef: InputHandler = InputHandler.getInstance();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_013 begin');
      handlerRef.onInputStop();
      const client: FaultInputClient = attach();
      handlerRef.insertText('Z9!?中');
      const stored: string = client.insertedTexts[0];
      expect(stored.length - 5).assertEqual(0);
      expect(stored.charAt(3)).assertEqual('?');
      expect(stored.substring(0, 2)).assertEqual('Z9');
      expect(stored.indexOf('中')).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_EXTRA_1400
     * @tc.name      testPayloadExtra_014
     * @tc.desc      Verify a quote-only payload keeps three quote code units unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_014 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('\'\'\'');
      expect(client.journal[0]).assertEqual('insert:\'\'\'');
      expect(client.insertedTexts[0].length).assertEqual(3);
      expect(client.insertedTexts[0].charCodeAt(0)).assertEqual(39);
      expect(client.insertedTexts[0].split('\'').length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadExtra_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0100
     * @tc.name      testPayloadShape_001
     * @tc.desc      Verify that a thumbs-up with a skin-tone modifier keeps four units and both surrogate leaders.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_001 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('👍🏽');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(4);
      expect(stored.charCodeAt(0)).assertEqual(55357);
      expect(stored.charCodeAt(2)).assertEqual(55356);
      expect(stored.charCodeAt(3)).assertEqual(57341);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0200
     * @tc.name      testPayloadShape_002
     * @tc.desc      Verify that a leading-zero digit string keeps three units although it parses as seven.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_002 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('007');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(3);
      expect(stored.charAt(0)).assertEqual('0');
      expect(Number(stored)).assertEqual(7);
      expect(stored.indexOf('0')).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0300
     * @tc.name      testPayloadShape_003
     * @tc.desc      Verify that a bare carriage return keeps its own position inside a three-unit payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_003 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('a\rb');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(3);
      expect(stored.indexOf('\r')).assertEqual(1);
      expect(stored.split('\r').length).assertEqual(2);
      expect(stored.charCodeAt(1)).assertEqual(13);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0400
     * @tc.name      testPayloadShape_004
     * @tc.desc      Verify that a hilog-style format marker is forwarded as plain text without substitution.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_004 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('%{public}s');
      const stored: string = client.insertedTexts[0];
      expect(stored).assertEqual('%{public}s');
      expect(stored.length).assertEqual(10);
      expect(stored.indexOf('{')).assertEqual(1);
      expect(stored.indexOf('}')).assertEqual(8);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0500
     * @tc.name      testPayloadShape_005
     * @tc.desc      Verify that four currency signs from different blocks keep four distinct BMP code points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_005 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('¥€£₹');
      const stored: string = client.insertedTexts[0];
      const codes: number[] = [stored.charCodeAt(0), stored.charCodeAt(1),
        stored.charCodeAt(2), stored.charCodeAt(3)];
      expect(stored.length).assertEqual(4);
      expect(codes.join('|')).assertEqual('165|8364|163|8377');
      expect(stored.charAt(1)).assertEqual('€');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0600
     * @tc.name      testPayloadShape_006
     * @tc.desc      Verify that a lone high surrogate followed by a letter keeps two units with a dangling leader.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_006 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const leader: string = String.fromCharCode(55357);
      InputHandler.getInstance().insertText(leader + 'a');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(2);
      expect(stored.charCodeAt(0)).assertEqual(55357);
      expect(stored.charCodeAt(1)).assertEqual(97);
      expect(stored.indexOf(leader)).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0700
     * @tc.name      testPayloadShape_007
     * @tc.desc      Verify that a lone low surrogate embedded between two letters stays at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_007 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const trailer: string = String.fromCharCode(56832);
      InputHandler.getInstance().insertText('a' + trailer + 'b');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(3);
      expect(stored.indexOf(trailer)).assertEqual(1);
      expect(stored.charCodeAt(1)).assertEqual(56832);
      expect(stored.split(trailer).length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0800
     * @tc.name      testPayloadShape_008
     * @tc.desc      Verify that one hundred ab pairs keep the pair boundary and a two-hundred-unit length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_008 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      let payload: string = '';
      let i: number = 0;
      while (i < 100) {
        payload = payload + 'ab';
        i = i + 1;
      }
      InputHandler.getInstance().insertText(payload);
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(200);
      expect(stored.indexOf('ba')).assertEqual(1);
      expect(stored.split('ab').length).assertEqual(101);
      expect(stored.lastIndexOf('b')).assertEqual(199);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_0900
     * @tc.name      testPayloadShape_009
     * @tc.desc      Verify that a compact JSON object is forwarded verbatim with its braces intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_009 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('{"k":[1,2]}');
      const stored: string = client.insertedTexts[0];
      expect(stored).assertEqual('{"k":[1,2]}');
      expect(stored.length).assertEqual(11);
      expect(stored.charAt(0)).assertEqual('{');
      expect(stored.charAt(stored.length - 1)).assertEqual('}');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1000
     * @tc.name      testPayloadShape_010
     * @tc.desc      Verify that a NUL in the middle of two letters keeps three units and splits once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_010 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('a\u0000b');
      const stored: string = client.insertedTexts[0];
      const codes: number[] = [];
      for (let idx: number = 0; idx < stored.length; idx++) {
        codes.push(stored.charCodeAt(idx));
      }
      expect(stored.split('\u0000').length).assertEqual(2);
      expect(stored.length).assertEqual(3);
      expect(codes.join(',')).assertEqual('97,0,98');
      expect(stored.split('\u0000')[1]).assertEqual('b');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1100
     * @tc.name      testPayloadShape_011
     * @tc.desc      Verify that full-width digits occupy three BMP units with consecutive code points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_011 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('１２３');
      const stored: string = client.insertedTexts[0];
      const codes: number[] = [stored.charCodeAt(0), stored.charCodeAt(1), stored.charCodeAt(2)];
      expect(stored.length).assertEqual(3);
      expect(codes.join('|')).assertEqual('65297|65298|65299');
      expect(stored.charAt(0)).assertEqual('１');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1200
     * @tc.name      testPayloadShape_012
     * @tc.desc      Verify that a combining acute accent stays a second code unit after its base letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_012 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const combining: string = String.fromCharCode(769);
      InputHandler.getInstance().insertText('e' + combining);
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(2);
      expect(stored.charAt(0)).assertEqual('e');
      expect(stored.charCodeAt(1)).assertEqual(769);
      expect(stored.indexOf(combining)).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1300
     * @tc.name      testPayloadShape_013
     * @tc.desc      Verify that an editor declaring no preview support still gets a five-character preview block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_013 begin');
      InputHandler.getInstance().onInputStop();
      const client: PreviewlessClient = new PreviewlessClient();
      attachFaultClient(client, new CountingKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('xyz');
      AppStorage.setOrCreate<string>('showLog', '');
      InputHandler.getInstance().refreshInfo();
      const summary: string = AppStorage.get<string>('showLog') ?? '';
      expect(summary.indexOf('five chars:')).assertEqual(0);
      expect(summary.indexOf('FWD5') > 0).assertTrue();
      expect(summary.indexOf('BWD5') > 0).assertTrue();
      expect(client.insertedTexts[0]).assertEqual('xyz');
      expect(client.attributeReads).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1400
     * @tc.name      testPayloadShape_014
     * @tc.desc      Verify that an 8192-unit payload keeps both sentinel letters at the expected offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_014 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      let payload: string = 'S';
      let i: number = 1;
      while (i < 8191) {
        payload = payload + 'm';
        i = i + 1;
      }
      payload = payload + 'E';
      InputHandler.getInstance().insertText(payload);
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(8192);
      expect(stored.charAt(0)).assertEqual('S');
      expect(stored.charAt(8191)).assertEqual('E');
      expect(stored.charCodeAt(8191)).assertEqual(69);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1500
     * @tc.name      testPayloadShape_015
     * @tc.desc      Verify that vertical tab and form feed stay two separate control units between letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_015 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const verticalTab: string = String.fromCharCode(11);
      const formFeed: string = String.fromCharCode(12);
      InputHandler.getInstance().insertText('a' + verticalTab + formFeed + 'b');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(4);
      expect(stored.charCodeAt(1)).assertEqual(11);
      expect(stored.charCodeAt(2)).assertEqual(12);
      expect(stored.split(verticalTab).length).assertEqual(2);
      expect(stored.split(formFeed).length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1600
     * @tc.name      testPayloadShape_016
     * @tc.desc      Verify that three Greek letters split across a recovery stay on their own session clients.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_016 begin');
      InputHandler.getInstance().onInputStop();
      const first: FaultInputClient = new FaultInputClient();
      attachFaultClient(first, new CountingKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('α');
      InputHandler.getInstance().onInputStop();
      const second: FaultInputClient = new FaultInputClient();
      attachFaultClient(second, new CountingKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('β');
      InputHandler.getInstance().onInputStop();
      attachFaultClient(first, new CountingKeyboardController());
      await Promise.resolve();
      await Promise.resolve();
      InputHandler.getInstance().insertText('γ');
      expect(first.insertedTexts.join('|')).assertEqual('α|γ');
      expect(second.insertedTexts.join('')).assertEqual('β');
      expect(first.journal.length).assertEqual(2);
      expect(second.journal.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1700
     * @tc.name      testPayloadShape_017
     * @tc.desc      Verify that an emoji at both ends of a payload keeps symmetric surrogate boundaries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_017 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('😀abc😀');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(7);
      expect(stored.indexOf('c')).assertEqual(4);
      expect(stored.charCodeAt(0)).assertEqual(55357);
      expect(stored.charCodeAt(6)).assertEqual(56832);
      expect(stored.split('😀').length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1800
     * @tc.name      testPayloadShape_018
     * @tc.desc      Verify that a Windows-style path keeps both backslashes and its colon at index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_018 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('C:\\dir\\file');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(11);
      expect(stored.charAt(1)).assertEqual(':');
      expect(stored.indexOf('\\')).assertEqual(2);
      expect(stored.lastIndexOf('\\')).assertEqual(6);
      expect(stored.split('\\').length).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_1900
     * @tc.name      testPayloadShape_019
     * @tc.desc      Verify that dotted and dotless Turkish i keep their own BMP code points without case folding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_019 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('İı');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(2);
      expect(stored.charCodeAt(0)).assertEqual(304);
      expect(stored.charCodeAt(1)).assertEqual(305);
      expect(stored.charAt(0) === stored.charAt(1)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2000
     * @tc.name      testPayloadShape_020
     * @tc.desc      Verify that the words undefined and null are forwarded as literal text of lengths nine and four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_020 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('undefined');
      InputHandler.getInstance().insertText('null');
      expect(client.insertedTexts[0]).assertEqual('undefined');
      expect(client.insertedTexts[1]).assertEqual('null');
      expect(client.insertedTexts[0].length).assertEqual(9);
      expect(client.insertedTexts[1].length).assertEqual(4);
      expect(client.journal.join('|')).assertEqual('insert:undefined|insert:null');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2100
     * @tc.name      testPayloadShape_021
     * @tc.desc      Verify that two consecutive newlines keep two line units and split into three empty parts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_021 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('\n\n');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(2);
      expect(stored.charCodeAt(0)).assertEqual(10);
      expect(stored.charCodeAt(1)).assertEqual(10);
      expect(stored.split('\n').length).assertEqual(3);
      expect(stored.split('\n')[0]).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2200
     * @tc.name      testPayloadShape_022
     * @tc.desc      Verify that a combining accent between two letters keeps the base first and the letter last.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_022 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      const mark: string = String.fromCharCode(769);
      InputHandler.getInstance().insertText('e' + mark + 'x');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(3);
      expect(stored.charAt(0)).assertEqual('e');
      expect(stored.charCodeAt(1)).assertEqual(769);
      expect(stored.charAt(2)).assertEqual('x');
      expect(stored.indexOf(mark)).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2300
     * @tc.name      testPayloadShape_023
     * @tc.desc      Verify that a thousand-letter payload keeps its first and last sentinel offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_023 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      let payload: string = 'a';
      let i: number = 1;
      while (i < 999) {
        payload = payload + 'm';
        i = i + 1;
      }
      payload = payload + 'z';
      InputHandler.getInstance().insertText(payload);
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(1000);
      expect(stored.charAt(0)).assertEqual('a');
      expect(stored.charAt(999)).assertEqual('z');
      expect(stored.lastIndexOf('z')).assertEqual(999);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2400
     * @tc.name      testPayloadShape_024
     * @tc.desc      Verify that two CJK glyphs followed by three Latin letters keep the script boundary at index two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_024 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('汉字ABC');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(5);
      expect(stored.indexOf('A')).assertEqual(2);
      expect(stored.charCodeAt(1)).assertEqual(23383);
      expect(stored.charAt(4)).assertEqual('C');
      expect(stored.substring(2)).assertEqual('ABC');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2500
     * @tc.name      testPayloadShape_025
     * @tc.desc      Verify that an em dash and an en dash keep two consecutive punctuation code points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_025 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('—–');
      const stored: string = client.insertedTexts[0];
      const codes: number[] = [stored.charCodeAt(0), stored.charCodeAt(1)];
      expect(stored.length).assertEqual(2);
      expect(codes.join('|')).assertEqual('8212|8211');
      expect(stored.charAt(0) === stored.charAt(1)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_PAYLOAD_SHAPE_2600
     * @tc.name      testPayloadShape_026
     * @tc.desc      Verify that two consecutive NUL units stay two zero code points and split into three parts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPayloadShape_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_026 begin');
      InputHandler.getInstance().onInputStop();
      const client: FaultInputClient = attach();
      InputHandler.getInstance().insertText('\u0000\u0000');
      const stored: string = client.insertedTexts[0];
      expect(stored.length).assertEqual(2);
      expect(stored.charCodeAt(0)).assertEqual(0);
      expect(stored.charCodeAt(1)).assertEqual(0);
      expect(stored.split('\u0000').length).assertEqual(3);
      expect(stored.trim().length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPayloadShape_026 end');
      await yieldToEventLoop();
    });

  });
}
