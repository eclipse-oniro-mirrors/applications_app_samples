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
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  numberSourceListData,
  symbolSourceListData,
  sourceListType
} from '../../../main/ets/InputMethodExtensionAbility/pages/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyDataNumberSymbol]';

export default function KeyDataNumberSymbolAdvancedTest(): void {
  describe('KeyDataNumberSymbolAdvancedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0239
     * @tc.name      testKeyDataSymbol0239
     * @tc.desc      Verify symbol key '|' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0239 begin');
      const first: sourceListType = symbolSourceListData[2];
      const second: sourceListType = symbolSourceListData[2];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('|');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0239 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0240
     * @tc.name      testKeyDataSymbol0240
     * @tc.desc      Verify ASCII symbol key '|' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0240 begin');
      const item: sourceListType = symbolSourceListData[2];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0240 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0241
     * @tc.name      testKeyDataSymbol0241
     * @tc.desc      Verify symbol key at index 3 exposes the expected content '鈥?.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0241 begin');
      const item: sourceListType = symbolSourceListData[3];
      expect(item.content).assertEqual('\u2022');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0241 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0242
     * @tc.name      testKeyDataSymbol0242
     * @tc.desc      Verify symbol key '鈥? is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0242 begin');
      const item: sourceListType = symbolSourceListData[3];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0242 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0243
     * @tc.name      testKeyDataSymbol0243
     * @tc.desc      Verify symbol key '鈥? does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0243 begin');
      const item: sourceListType = symbolSourceListData[3];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0243 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0244
     * @tc.name      testKeyDataSymbol0244
     * @tc.desc      Verify symbol key '鈥? occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0244 begin');
      const value: string = '\u2022';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0244 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0245
     * @tc.name      testKeyDataSymbol0245
     * @tc.desc      Verify symbol key '鈥? is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0245 begin');
      const idx: number = 3;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0245 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0246
     * @tc.name      testKeyDataSymbol0246
     * @tc.desc      Verify symbol key '鈥? has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0246 begin');
      const item: sourceListType = symbolSourceListData[3];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0246 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0247
     * @tc.name      testKeyDataSymbol0247
     * @tc.desc      Verify symbol key '鈥? keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0247 begin');
      const first: sourceListType = symbolSourceListData[3];
      const second: sourceListType = symbolSourceListData[3];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u2022');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0247 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0248
     * @tc.name      testKeyDataSymbol0248
     * @tc.desc      Verify ASCII symbol key '鈥? is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0248 begin');
      const item: sourceListType = symbolSourceListData[3];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0248 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0249
     * @tc.name      testKeyDataSymbol0249
     * @tc.desc      Verify symbol key at index 4 exposes the expected content '鈭?.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0249 begin');
      const item: sourceListType = symbolSourceListData[4];
      expect(item.content).assertEqual('\u221A');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0249 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0250
     * @tc.name      testKeyDataSymbol0250
     * @tc.desc      Verify symbol key '鈭? is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0250 begin');
      const item: sourceListType = symbolSourceListData[4];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0250 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0251
     * @tc.name      testKeyDataSymbol0251
     * @tc.desc      Verify symbol key '鈭? does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0251 begin');
      const item: sourceListType = symbolSourceListData[4];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0251 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0252
     * @tc.name      testKeyDataSymbol0252
     * @tc.desc      Verify symbol key '鈭? occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0252 begin');
      const value: string = '\u221A';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0252 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0253
     * @tc.name      testKeyDataSymbol0253
     * @tc.desc      Verify symbol key '鈭? is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0253 begin');
      const idx: number = 4;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0253 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0254
     * @tc.name      testKeyDataSymbol0254
     * @tc.desc      Verify symbol key '鈭? has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0254 begin');
      const item: sourceListType = symbolSourceListData[4];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0254 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0255
     * @tc.name      testKeyDataSymbol0255
     * @tc.desc      Verify symbol key '鈭? keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0255 begin');
      const first: sourceListType = symbolSourceListData[4];
      const second: sourceListType = symbolSourceListData[4];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u221A');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0255 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0256
     * @tc.name      testKeyDataSymbol0256
     * @tc.desc      Verify ASCII symbol key '鈭? is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0256 begin');
      const item: sourceListType = symbolSourceListData[4];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0256 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0257
     * @tc.name      testKeyDataSymbol0257
     * @tc.desc      Verify symbol key at index 5 exposes the expected content '螤'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0257 begin');
      const item: sourceListType = symbolSourceListData[5];
      expect(item.content).assertEqual('\u03A0');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0257 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0258
     * @tc.name      testKeyDataSymbol0258
     * @tc.desc      Verify symbol key '螤' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0258 begin');
      const item: sourceListType = symbolSourceListData[5];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0258 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0259
     * @tc.name      testKeyDataSymbol0259
     * @tc.desc      Verify symbol key '螤' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0259 begin');
      const item: sourceListType = symbolSourceListData[5];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0259 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0260
     * @tc.name      testKeyDataSymbol0260
     * @tc.desc      Verify symbol key '螤' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0260 begin');
      const value: string = '\u03A0';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0260 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0261
     * @tc.name      testKeyDataSymbol0261
     * @tc.desc      Verify symbol key '螤' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0261 begin');
      const idx: number = 5;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0261 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0262
     * @tc.name      testKeyDataSymbol0262
     * @tc.desc      Verify symbol key '螤' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0262 begin');
      const item: sourceListType = symbolSourceListData[5];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0262 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0263
     * @tc.name      testKeyDataSymbol0263
     * @tc.desc      Verify symbol key '螤' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0263 begin');
      const first: sourceListType = symbolSourceListData[5];
      const second: sourceListType = symbolSourceListData[5];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u03A0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0263 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0264
     * @tc.name      testKeyDataSymbol0264
     * @tc.desc      Verify ASCII symbol key '螤' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0264 begin');
      const item: sourceListType = symbolSourceListData[5];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0264 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0265
     * @tc.name      testKeyDataSymbol0265
     * @tc.desc      Verify symbol key at index 6 exposes the expected content '梅'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0265 begin');
      const item: sourceListType = symbolSourceListData[6];
      expect(item.content).assertEqual('\u00F7');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0265 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0266
     * @tc.name      testKeyDataSymbol0266
     * @tc.desc      Verify symbol key '梅' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0266 begin');
      const item: sourceListType = symbolSourceListData[6];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0266 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0267
     * @tc.name      testKeyDataSymbol0267
     * @tc.desc      Verify symbol key '梅' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0267 begin');
      const item: sourceListType = symbolSourceListData[6];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0267 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0268
     * @tc.name      testKeyDataSymbol0268
     * @tc.desc      Verify symbol key '梅' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0268 begin');
      const value: string = '\u00F7';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0268 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0269
     * @tc.name      testKeyDataSymbol0269
     * @tc.desc      Verify symbol key '梅' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0269 begin');
      const idx: number = 6;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0269 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0270
     * @tc.name      testKeyDataSymbol0270
     * @tc.desc      Verify symbol key '梅' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0270 begin');
      const item: sourceListType = symbolSourceListData[6];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0270 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0271
     * @tc.name      testKeyDataSymbol0271
     * @tc.desc      Verify symbol key '梅' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0271 begin');
      const first: sourceListType = symbolSourceListData[6];
      const second: sourceListType = symbolSourceListData[6];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00F7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0271 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0272
     * @tc.name      testKeyDataSymbol0272
     * @tc.desc      Verify ASCII symbol key '梅' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0272 begin');
      const item: sourceListType = symbolSourceListData[6];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0272 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0273
     * @tc.name      testKeyDataSymbol0273
     * @tc.desc      Verify symbol key at index 7 exposes the expected content '脳'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0273 begin');
      const item: sourceListType = symbolSourceListData[7];
      expect(item.content).assertEqual('\u00D7');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0273 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0274
     * @tc.name      testKeyDataSymbol0274
     * @tc.desc      Verify symbol key '脳' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0274 begin');
      const item: sourceListType = symbolSourceListData[7];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0274 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0275
     * @tc.name      testKeyDataSymbol0275
     * @tc.desc      Verify symbol key '脳' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0275 begin');
      const item: sourceListType = symbolSourceListData[7];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0275 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0276
     * @tc.name      testKeyDataSymbol0276
     * @tc.desc      Verify symbol key '脳' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0276 begin');
      const value: string = '\u00D7';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0276 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0277
     * @tc.name      testKeyDataSymbol0277
     * @tc.desc      Verify symbol key '脳' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0277 begin');
      const idx: number = 7;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0277 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0278
     * @tc.name      testKeyDataSymbol0278
     * @tc.desc      Verify symbol key '脳' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0278 begin');
      const item: sourceListType = symbolSourceListData[7];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0278 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0279
     * @tc.name      testKeyDataSymbol0279
     * @tc.desc      Verify symbol key '脳' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0279 begin');
      const first: sourceListType = symbolSourceListData[7];
      const second: sourceListType = symbolSourceListData[7];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00D7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0279 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0280
     * @tc.name      testKeyDataSymbol0280
     * @tc.desc      Verify ASCII symbol key '脳' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0280 begin');
      const item: sourceListType = symbolSourceListData[7];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0280 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0281
     * @tc.name      testKeyDataSymbol0281
     * @tc.desc      Verify symbol key at index 8 exposes the expected content '露'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0281 begin');
      const item: sourceListType = symbolSourceListData[8];
      expect(item.content).assertEqual('\u00B6');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0281 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0282
     * @tc.name      testKeyDataSymbol0282
     * @tc.desc      Verify symbol key '露' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0282 begin');
      const item: sourceListType = symbolSourceListData[8];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0282 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0283
     * @tc.name      testKeyDataSymbol0283
     * @tc.desc      Verify symbol key '露' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0283 begin');
      const item: sourceListType = symbolSourceListData[8];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0283 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0284
     * @tc.name      testKeyDataSymbol0284
     * @tc.desc      Verify symbol key '露' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0284 begin');
      const value: string = '\u00B6';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0284 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0285
     * @tc.name      testKeyDataSymbol0285
     * @tc.desc      Verify symbol key '露' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0285 begin');
      const idx: number = 8;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0285 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0286
     * @tc.name      testKeyDataSymbol0286
     * @tc.desc      Verify symbol key '露' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0286 begin');
      const item: sourceListType = symbolSourceListData[8];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0286 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0287
     * @tc.name      testKeyDataSymbol0287
     * @tc.desc      Verify symbol key '露' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0287 begin');
      const first: sourceListType = symbolSourceListData[8];
      const second: sourceListType = symbolSourceListData[8];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00B6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0287 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0288
     * @tc.name      testKeyDataSymbol0288
     * @tc.desc      Verify ASCII symbol key '露' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0288 begin');
      const item: sourceListType = symbolSourceListData[8];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0288 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0289
     * @tc.name      testKeyDataSymbol0289
     * @tc.desc      Verify symbol key at index 9 exposes the expected content '鈭?.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0289 begin');
      const item: sourceListType = symbolSourceListData[9];
      expect(item.content).assertEqual('\u2206');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0289 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0290
     * @tc.name      testKeyDataSymbol0290
     * @tc.desc      Verify symbol key '鈭? is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0290 begin');
      const item: sourceListType = symbolSourceListData[9];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0290 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0291
     * @tc.name      testKeyDataSymbol0291
     * @tc.desc      Verify symbol key '鈭? does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0291 begin');
      const item: sourceListType = symbolSourceListData[9];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0291 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0292
     * @tc.name      testKeyDataSymbol0292
     * @tc.desc      Verify symbol key '鈭? occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0292 begin');
      const value: string = '\u2206';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0292 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0293
     * @tc.name      testKeyDataSymbol0293
     * @tc.desc      Verify symbol key '鈭? is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0293 begin');
      const idx: number = 9;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0293 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0294
     * @tc.name      testKeyDataSymbol0294
     * @tc.desc      Verify symbol key '鈭? has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0294 begin');
      const item: sourceListType = symbolSourceListData[9];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0294 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0295
     * @tc.name      testKeyDataSymbol0295
     * @tc.desc      Verify symbol key '鈭? keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0295 begin');
      const first: sourceListType = symbolSourceListData[9];
      const second: sourceListType = symbolSourceListData[9];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u2206');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0295 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0296
     * @tc.name      testKeyDataSymbol0296
     * @tc.desc      Verify ASCII symbol key '鈭? is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0296 begin');
      const item: sourceListType = symbolSourceListData[9];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0296 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0297
     * @tc.name      testKeyDataSymbol0297
     * @tc.desc      Verify symbol key at index 10 exposes the expected content '拢'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0297 begin');
      const item: sourceListType = symbolSourceListData[10];
      expect(item.content).assertEqual('\u00A3');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0297 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0298
     * @tc.name      testKeyDataSymbol0298
     * @tc.desc      Verify symbol key '拢' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0298 begin');
      const item: sourceListType = symbolSourceListData[10];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0298 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0299
     * @tc.name      testKeyDataSymbol0299
     * @tc.desc      Verify symbol key '拢' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0299 begin');
      const item: sourceListType = symbolSourceListData[10];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0299 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0300
     * @tc.name      testKeyDataSymbol0300
     * @tc.desc      Verify symbol key '拢' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0300 begin');
      const value: string = '\u00A3';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0300 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0301
     * @tc.name      testKeyDataSymbol0301
     * @tc.desc      Verify symbol key '拢' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0301 begin');
      const idx: number = 10;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0301 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0302
     * @tc.name      testKeyDataSymbol0302
     * @tc.desc      Verify symbol key '拢' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0302 begin');
      const item: sourceListType = symbolSourceListData[10];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0302 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0303
     * @tc.name      testKeyDataSymbol0303
     * @tc.desc      Verify symbol key '拢' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0303 begin');
      const first: sourceListType = symbolSourceListData[10];
      const second: sourceListType = symbolSourceListData[10];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00A3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0303 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0304
     * @tc.name      testKeyDataSymbol0304
     * @tc.desc      Verify ASCII symbol key '拢' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0304 begin');
      const item: sourceListType = symbolSourceListData[10];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0304 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0305
     * @tc.name      testKeyDataSymbol0305
     * @tc.desc      Verify symbol key at index 11 exposes the expected content '鈧?.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0305 begin');
      const item: sourceListType = symbolSourceListData[11];
      expect(item.content).assertEqual('\u20AC');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0305 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0306
     * @tc.name      testKeyDataSymbol0306
     * @tc.desc      Verify symbol key '鈧? is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0306 begin');
      const item: sourceListType = symbolSourceListData[11];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0306 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0307
     * @tc.name      testKeyDataSymbol0307
     * @tc.desc      Verify symbol key '鈧? does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0307 begin');
      const item: sourceListType = symbolSourceListData[11];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0307 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0308
     * @tc.name      testKeyDataSymbol0308
     * @tc.desc      Verify symbol key '鈧? occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0308 begin');
      const value: string = '\u20AC';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0308 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0309
     * @tc.name      testKeyDataSymbol0309
     * @tc.desc      Verify symbol key '鈧? is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0309 begin');
      const idx: number = 11;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0309 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0310
     * @tc.name      testKeyDataSymbol0310
     * @tc.desc      Verify symbol key '鈧? has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0310 begin');
      const item: sourceListType = symbolSourceListData[11];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0310 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0311
     * @tc.name      testKeyDataSymbol0311
     * @tc.desc      Verify symbol key '鈧? keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0311 begin');
      const first: sourceListType = symbolSourceListData[11];
      const second: sourceListType = symbolSourceListData[11];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u20AC');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0311 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0312
     * @tc.name      testKeyDataSymbol0312
     * @tc.desc      Verify ASCII symbol key '鈧? is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0312 begin');
      const item: sourceListType = symbolSourceListData[11];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0312 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0313
     * @tc.name      testKeyDataSymbol0313
     * @tc.desc      Verify symbol key at index 12 exposes the expected content '楼'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0313 begin');
      const item: sourceListType = symbolSourceListData[12];
      expect(item.content).assertEqual('\u00A5');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0313 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0314
     * @tc.name      testKeyDataSymbol0314
     * @tc.desc      Verify symbol key '楼' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0314 begin');
      const item: sourceListType = symbolSourceListData[12];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0314 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0315
     * @tc.name      testKeyDataSymbol0315
     * @tc.desc      Verify symbol key '楼' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0315 begin');
      const item: sourceListType = symbolSourceListData[12];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0315 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0316
     * @tc.name      testKeyDataSymbol0316
     * @tc.desc      Verify symbol key '楼' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0316 begin');
      const value: string = '\u00A5';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0316 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0317
     * @tc.name      testKeyDataSymbol0317
     * @tc.desc      Verify symbol key '楼' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0317 begin');
      const idx: number = 12;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0317 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0318
     * @tc.name      testKeyDataSymbol0318
     * @tc.desc      Verify symbol key '楼' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0318 begin');
      const item: sourceListType = symbolSourceListData[12];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0318 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0319
     * @tc.name      testKeyDataSymbol0319
     * @tc.desc      Verify symbol key '楼' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0319 begin');
      const first: sourceListType = symbolSourceListData[12];
      const second: sourceListType = symbolSourceListData[12];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00A5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0319 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0320
     * @tc.name      testKeyDataSymbol0320
     * @tc.desc      Verify ASCII symbol key '楼' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0320 begin');
      const item: sourceListType = symbolSourceListData[12];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0320 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0321
     * @tc.name      testKeyDataSymbol0321
     * @tc.desc      Verify symbol key at index 13 exposes the expected content '垄'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0321 begin');
      const item: sourceListType = symbolSourceListData[13];
      expect(item.content).assertEqual('\u00A2');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0321 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0322
     * @tc.name      testKeyDataSymbol0322
     * @tc.desc      Verify symbol key '垄' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0322 begin');
      const item: sourceListType = symbolSourceListData[13];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0322 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0323
     * @tc.name      testKeyDataSymbol0323
     * @tc.desc      Verify symbol key '垄' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0323 begin');
      const item: sourceListType = symbolSourceListData[13];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0323 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0324
     * @tc.name      testKeyDataSymbol0324
     * @tc.desc      Verify symbol key '垄' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0324 begin');
      const value: string = '\u00A2';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0324 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0325
     * @tc.name      testKeyDataSymbol0325
     * @tc.desc      Verify symbol key '垄' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0325 begin');
      const idx: number = 13;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0325 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0326
     * @tc.name      testKeyDataSymbol0326
     * @tc.desc      Verify symbol key '垄' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0326 begin');
      const item: sourceListType = symbolSourceListData[13];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0326 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0327
     * @tc.name      testKeyDataSymbol0327
     * @tc.desc      Verify symbol key '垄' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0327 begin');
      const first: sourceListType = symbolSourceListData[13];
      const second: sourceListType = symbolSourceListData[13];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00A2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0327 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0328
     * @tc.name      testKeyDataSymbol0328
     * @tc.desc      Verify ASCII symbol key '垄' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0328 begin');
      const item: sourceListType = symbolSourceListData[13];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0328 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0329
     * @tc.name      testKeyDataSymbol0329
     * @tc.desc      Verify symbol key at index 14 exposes the expected content '^'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0329 begin');
      const item: sourceListType = symbolSourceListData[14];
      expect(item.content).assertEqual('^');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0329 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0330
     * @tc.name      testKeyDataSymbol0330
     * @tc.desc      Verify symbol key '^' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0330 begin');
      const item: sourceListType = symbolSourceListData[14];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0330 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0331
     * @tc.name      testKeyDataSymbol0331
     * @tc.desc      Verify symbol key '^' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0331 begin');
      const item: sourceListType = symbolSourceListData[14];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0331 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0332
     * @tc.name      testKeyDataSymbol0332
     * @tc.desc      Verify symbol key '^' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0332 begin');
      const value: string = '^';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0332 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0333
     * @tc.name      testKeyDataSymbol0333
     * @tc.desc      Verify symbol key '^' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0333 begin');
      const idx: number = 14;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0333 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0334
     * @tc.name      testKeyDataSymbol0334
     * @tc.desc      Verify symbol key '^' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0334 begin');
      const item: sourceListType = symbolSourceListData[14];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0334 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0335
     * @tc.name      testKeyDataSymbol0335
     * @tc.desc      Verify symbol key '^' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0335 begin');
      const first: sourceListType = symbolSourceListData[14];
      const second: sourceListType = symbolSourceListData[14];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('^');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0335 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0336
     * @tc.name      testKeyDataSymbol0336
     * @tc.desc      Verify ASCII symbol key '^' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0336 begin');
      const item: sourceListType = symbolSourceListData[14];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0336 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0337
     * @tc.name      testKeyDataSymbol0337
     * @tc.desc      Verify symbol key at index 15 exposes the expected content '掳'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0337 begin');
      const item: sourceListType = symbolSourceListData[15];
      expect(item.content).assertEqual('\u00B0');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0337 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0338
     * @tc.name      testKeyDataSymbol0338
     * @tc.desc      Verify symbol key '掳' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0338 begin');
      const item: sourceListType = symbolSourceListData[15];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0338 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0339
     * @tc.name      testKeyDataSymbol0339
     * @tc.desc      Verify symbol key '掳' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0339 begin');
      const item: sourceListType = symbolSourceListData[15];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0339 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0340
     * @tc.name      testKeyDataSymbol0340
     * @tc.desc      Verify symbol key '掳' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0340 begin');
      const value: string = '\u00B0';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0340 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0341
     * @tc.name      testKeyDataSymbol0341
     * @tc.desc      Verify symbol key '掳' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0341 begin');
      const idx: number = 15;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0341 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0342
     * @tc.name      testKeyDataSymbol0342
     * @tc.desc      Verify symbol key '掳' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0342 begin');
      const item: sourceListType = symbolSourceListData[15];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0342 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0343
     * @tc.name      testKeyDataSymbol0343
     * @tc.desc      Verify symbol key '掳' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0343 begin');
      const first: sourceListType = symbolSourceListData[15];
      const second: sourceListType = symbolSourceListData[15];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00B0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0343 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0344
     * @tc.name      testKeyDataSymbol0344
     * @tc.desc      Verify ASCII symbol key '掳' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0344 begin');
      const item: sourceListType = symbolSourceListData[15];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0344 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0345
     * @tc.name      testKeyDataSymbol0345
     * @tc.desc      Verify symbol key at index 16 exposes the expected content '='.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0345 begin');
      const item: sourceListType = symbolSourceListData[16];
      expect(item.content).assertEqual('=');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0345 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0346
     * @tc.name      testKeyDataSymbol0346
     * @tc.desc      Verify symbol key '=' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0346 begin');
      const item: sourceListType = symbolSourceListData[16];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0346 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0347
     * @tc.name      testKeyDataSymbol0347
     * @tc.desc      Verify symbol key '=' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0347 begin');
      const item: sourceListType = symbolSourceListData[16];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0347 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0348
     * @tc.name      testKeyDataSymbol0348
     * @tc.desc      Verify symbol key '=' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0348 begin');
      const value: string = '=';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0348 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0349
     * @tc.name      testKeyDataSymbol0349
     * @tc.desc      Verify symbol key '=' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0349 begin');
      const idx: number = 16;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0349 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0350
     * @tc.name      testKeyDataSymbol0350
     * @tc.desc      Verify symbol key '=' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0350 begin');
      const item: sourceListType = symbolSourceListData[16];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0350 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0351
     * @tc.name      testKeyDataSymbol0351
     * @tc.desc      Verify symbol key '=' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0351 begin');
      const first: sourceListType = symbolSourceListData[16];
      const second: sourceListType = symbolSourceListData[16];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0351 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0352
     * @tc.name      testKeyDataSymbol0352
     * @tc.desc      Verify ASCII symbol key '=' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0352 begin');
      const item: sourceListType = symbolSourceListData[16];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0352 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0353
     * @tc.name      testKeyDataSymbol0353
     * @tc.desc      Verify symbol key at index 17 exposes the expected content '{'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0353 begin');
      const item: sourceListType = symbolSourceListData[17];
      expect(item.content).assertEqual('{');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0353 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0354
     * @tc.name      testKeyDataSymbol0354
     * @tc.desc      Verify symbol key '{' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0354 begin');
      const item: sourceListType = symbolSourceListData[17];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0354 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0355
     * @tc.name      testKeyDataSymbol0355
     * @tc.desc      Verify symbol key '{' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0355 begin');
      const item: sourceListType = symbolSourceListData[17];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0355 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0356
     * @tc.name      testKeyDataSymbol0356
     * @tc.desc      Verify symbol key '{' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0356 begin');
      const value: string = '{';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0356 end');
    })
  })
}
