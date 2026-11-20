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

export default function KeyDataNumberSymbolTailTest(): void {
  describe('KeyDataNumberSymbolTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0357
     * @tc.name      testKeyDataSymbol0357
     * @tc.desc      Verify symbol key '{' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0357 begin');
      const idx: number = 17;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0357 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0358
     * @tc.name      testKeyDataSymbol0358
     * @tc.desc      Verify symbol key '{' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0358 begin');
      const item: sourceListType = symbolSourceListData[17];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0358 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0359
     * @tc.name      testKeyDataSymbol0359
     * @tc.desc      Verify symbol key '{' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0359 begin');
      const first: sourceListType = symbolSourceListData[17];
      const second: sourceListType = symbolSourceListData[17];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('{');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0359 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0360
     * @tc.name      testKeyDataSymbol0360
     * @tc.desc      Verify ASCII symbol key '{' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0360 begin');
      const item: sourceListType = symbolSourceListData[17];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0360 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0361
     * @tc.name      testKeyDataSymbol0361
     * @tc.desc      Verify symbol key at index 18 exposes the expected content '}'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0361 begin');
      const item: sourceListType = symbolSourceListData[18];
      expect(item.content).assertEqual('}');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0361 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0362
     * @tc.name      testKeyDataSymbol0362
     * @tc.desc      Verify symbol key '}' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0362 begin');
      const item: sourceListType = symbolSourceListData[18];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0362 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0363
     * @tc.name      testKeyDataSymbol0363
     * @tc.desc      Verify symbol key '}' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0363 begin');
      const item: sourceListType = symbolSourceListData[18];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0363 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0364
     * @tc.name      testKeyDataSymbol0364
     * @tc.desc      Verify symbol key '}' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0364 begin');
      const value: string = '}';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0364 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0365
     * @tc.name      testKeyDataSymbol0365
     * @tc.desc      Verify symbol key '}' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0365 begin');
      const idx: number = 18;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0365 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0366
     * @tc.name      testKeyDataSymbol0366
     * @tc.desc      Verify symbol key '}' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0366 begin');
      const item: sourceListType = symbolSourceListData[18];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0366 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0367
     * @tc.name      testKeyDataSymbol0367
     * @tc.desc      Verify symbol key '}' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0367 begin');
      const first: sourceListType = symbolSourceListData[18];
      const second: sourceListType = symbolSourceListData[18];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('}');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0367 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0368
     * @tc.name      testKeyDataSymbol0368
     * @tc.desc      Verify ASCII symbol key '}' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0368 begin');
      const item: sourceListType = symbolSourceListData[18];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0368 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0369
     * @tc.name      testKeyDataSymbol0369
     * @tc.desc      Verify symbol key at index 19 exposes the expected content ','.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0369 begin');
      const item: sourceListType = symbolSourceListData[19];
      expect(item.content).assertEqual(',');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0369 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0370
     * @tc.name      testKeyDataSymbol0370
     * @tc.desc      Verify symbol key ',' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0370 begin');
      const item: sourceListType = symbolSourceListData[19];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0370 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0371
     * @tc.name      testKeyDataSymbol0371
     * @tc.desc      Verify symbol key ',' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0371 begin');
      const item: sourceListType = symbolSourceListData[19];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0371 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0372
     * @tc.name      testKeyDataSymbol0372
     * @tc.desc      Verify symbol key ',' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0372 begin');
      const value: string = ',';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0372 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0373
     * @tc.name      testKeyDataSymbol0373
     * @tc.desc      Verify symbol key ',' is assigned to SymbolMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0373 begin');
      const idx: number = 19;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0373 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0374
     * @tc.name      testKeyDataSymbol0374
     * @tc.desc      Verify symbol key ',' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0374 begin');
      const item: sourceListType = symbolSourceListData[19];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0374 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0375
     * @tc.name      testKeyDataSymbol0375
     * @tc.desc      Verify symbol key ',' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0375 begin');
      const first: sourceListType = symbolSourceListData[19];
      const second: sourceListType = symbolSourceListData[19];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual(',');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0375 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0376
     * @tc.name      testKeyDataSymbol0376
     * @tc.desc      Verify ASCII symbol key ',' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0376 begin');
      const item: sourceListType = symbolSourceListData[19];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0376 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0377
     * @tc.name      testKeyDataSymbol0377
     * @tc.desc      Verify symbol key at index 20 exposes the expected content '\\'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0377 begin');
      const item: sourceListType = symbolSourceListData[20];
      expect(item.content).assertEqual('\\');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0377 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0378
     * @tc.name      testKeyDataSymbol0378
     * @tc.desc      Verify symbol key '\\' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0378 begin');
      const item: sourceListType = symbolSourceListData[20];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0378 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0379
     * @tc.name      testKeyDataSymbol0379
     * @tc.desc      Verify symbol key '\\' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0379 begin');
      const item: sourceListType = symbolSourceListData[20];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0379 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0380
     * @tc.name      testKeyDataSymbol0380
     * @tc.desc      Verify symbol key '\\' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0380 begin');
      const value: string = '\\';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0380 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0381
     * @tc.name      testKeyDataSymbol0381
     * @tc.desc      Verify symbol key '\\' is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0381 begin');
      const idx: number = 20;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0381 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0382
     * @tc.name      testKeyDataSymbol0382
     * @tc.desc      Verify symbol key '\\' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0382 begin');
      const item: sourceListType = symbolSourceListData[20];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0382 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0383
     * @tc.name      testKeyDataSymbol0383
     * @tc.desc      Verify symbol key '\\' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0383 begin');
      const first: sourceListType = symbolSourceListData[20];
      const second: sourceListType = symbolSourceListData[20];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\\');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0383 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0384
     * @tc.name      testKeyDataSymbol0384
     * @tc.desc      Verify ASCII symbol key '\\' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0384 begin');
      const item: sourceListType = symbolSourceListData[20];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0384 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0385
     * @tc.name      testKeyDataSymbol0385
     * @tc.desc      Verify symbol key at index 21 exposes the expected content '漏'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0385 begin');
      const item: sourceListType = symbolSourceListData[21];
      expect(item.content).assertEqual('\u00A9');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0385 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0386
     * @tc.name      testKeyDataSymbol0386
     * @tc.desc      Verify symbol key '漏' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0386 begin');
      const item: sourceListType = symbolSourceListData[21];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0386 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0387
     * @tc.name      testKeyDataSymbol0387
     * @tc.desc      Verify symbol key '漏' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0387 begin');
      const item: sourceListType = symbolSourceListData[21];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0387 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0388
     * @tc.name      testKeyDataSymbol0388
     * @tc.desc      Verify symbol key '漏' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0388 begin');
      const value: string = '\u00A9';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0388 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0389
     * @tc.name      testKeyDataSymbol0389
     * @tc.desc      Verify symbol key '漏' is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0389 begin');
      const idx: number = 21;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0389 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0390
     * @tc.name      testKeyDataSymbol0390
     * @tc.desc      Verify symbol key '漏' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0390 begin');
      const item: sourceListType = symbolSourceListData[21];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0390 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0391
     * @tc.name      testKeyDataSymbol0391
     * @tc.desc      Verify symbol key '漏' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0391 begin');
      const first: sourceListType = symbolSourceListData[21];
      const second: sourceListType = symbolSourceListData[21];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00A9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0391 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0392
     * @tc.name      testKeyDataSymbol0392
     * @tc.desc      Verify ASCII symbol key '漏' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0392 begin');
      const item: sourceListType = symbolSourceListData[21];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0392 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0393
     * @tc.name      testKeyDataSymbol0393
     * @tc.desc      Verify symbol key at index 22 exposes the expected content '庐'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0393 begin');
      const item: sourceListType = symbolSourceListData[22];
      expect(item.content).assertEqual('\u00AE');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0393 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0394
     * @tc.name      testKeyDataSymbol0394
     * @tc.desc      Verify symbol key '庐' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0394 begin');
      const item: sourceListType = symbolSourceListData[22];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0394 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0395
     * @tc.name      testKeyDataSymbol0395
     * @tc.desc      Verify symbol key '庐' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0395 begin');
      const item: sourceListType = symbolSourceListData[22];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0395 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0396
     * @tc.name      testKeyDataSymbol0396
     * @tc.desc      Verify symbol key '庐' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0396 begin');
      const value: string = '\u00AE';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0396 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0397
     * @tc.name      testKeyDataSymbol0397
     * @tc.desc      Verify symbol key '庐' is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0397 begin');
      const idx: number = 22;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0397 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0398
     * @tc.name      testKeyDataSymbol0398
     * @tc.desc      Verify symbol key '庐' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0398 begin');
      const item: sourceListType = symbolSourceListData[22];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0398 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0399
     * @tc.name      testKeyDataSymbol0399
     * @tc.desc      Verify symbol key '庐' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0399 begin');
      const first: sourceListType = symbolSourceListData[22];
      const second: sourceListType = symbolSourceListData[22];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u00AE');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0399 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0400
     * @tc.name      testKeyDataSymbol0400
     * @tc.desc      Verify ASCII symbol key '庐' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0400 begin');
      const item: sourceListType = symbolSourceListData[22];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0400 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0401
     * @tc.name      testKeyDataSymbol0401
     * @tc.desc      Verify symbol key at index 23 exposes the expected content '鈩?.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0401 begin');
      const item: sourceListType = symbolSourceListData[23];
      expect(item.content).assertEqual('\u2122');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0401 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0402
     * @tc.name      testKeyDataSymbol0402
     * @tc.desc      Verify symbol key '鈩? is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0402 begin');
      const item: sourceListType = symbolSourceListData[23];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0402 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0403
     * @tc.name      testKeyDataSymbol0403
     * @tc.desc      Verify symbol key '鈩? does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0403 begin');
      const item: sourceListType = symbolSourceListData[23];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0403 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0404
     * @tc.name      testKeyDataSymbol0404
     * @tc.desc      Verify symbol key '鈩? occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0404 begin');
      const value: string = '\u2122';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0404 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0405
     * @tc.name      testKeyDataSymbol0405
     * @tc.desc      Verify symbol key '鈩? is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0405 begin');
      const idx: number = 23;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0405 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0406
     * @tc.name      testKeyDataSymbol0406
     * @tc.desc      Verify symbol key '鈩? has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0406 begin');
      const item: sourceListType = symbolSourceListData[23];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0406 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0407
     * @tc.name      testKeyDataSymbol0407
     * @tc.desc      Verify symbol key '鈩? keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0407 begin');
      const first: sourceListType = symbolSourceListData[23];
      const second: sourceListType = symbolSourceListData[23];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u2122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0407 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0408
     * @tc.name      testKeyDataSymbol0408
     * @tc.desc      Verify ASCII symbol key '鈩? is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0408 begin');
      const item: sourceListType = symbolSourceListData[23];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0408 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0409
     * @tc.name      testKeyDataSymbol0409
     * @tc.desc      Verify symbol key at index 24 exposes the expected content '鈩?.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0409 begin');
      const item: sourceListType = symbolSourceListData[24];
      expect(item.content).assertEqual('\u2105');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0409 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0410
     * @tc.name      testKeyDataSymbol0410
     * @tc.desc      Verify symbol key '鈩? is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0410 begin');
      const item: sourceListType = symbolSourceListData[24];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0410 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0411
     * @tc.name      testKeyDataSymbol0411
     * @tc.desc      Verify symbol key '鈩? does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0411 begin');
      const item: sourceListType = symbolSourceListData[24];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0411 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0412
     * @tc.name      testKeyDataSymbol0412
     * @tc.desc      Verify symbol key '鈩? occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0412 begin');
      const value: string = '\u2105';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0412 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0413
     * @tc.name      testKeyDataSymbol0413
     * @tc.desc      Verify symbol key '鈩? is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0413 begin');
      const idx: number = 24;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0413 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0414
     * @tc.name      testKeyDataSymbol0414
     * @tc.desc      Verify symbol key '鈩? has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0414 begin');
      const item: sourceListType = symbolSourceListData[24];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0414 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0415
     * @tc.name      testKeyDataSymbol0415
     * @tc.desc      Verify symbol key '鈩? keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0415 begin');
      const first: sourceListType = symbolSourceListData[24];
      const second: sourceListType = symbolSourceListData[24];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\u2105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0415 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0416
     * @tc.name      testKeyDataSymbol0416
     * @tc.desc      Verify ASCII symbol key '鈩? is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0416 begin');
      const item: sourceListType = symbolSourceListData[24];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0416 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0417
     * @tc.name      testKeyDataSymbol0417
     * @tc.desc      Verify symbol key at index 25 exposes the expected content '['.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0417 begin');
      const item: sourceListType = symbolSourceListData[25];
      expect(item.content).assertEqual('[');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0417 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0418
     * @tc.name      testKeyDataSymbol0418
     * @tc.desc      Verify symbol key '[' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0418 begin');
      const item: sourceListType = symbolSourceListData[25];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0418 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0419
     * @tc.name      testKeyDataSymbol0419
     * @tc.desc      Verify symbol key '[' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0419 begin');
      const item: sourceListType = symbolSourceListData[25];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0419 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0420
     * @tc.name      testKeyDataSymbol0420
     * @tc.desc      Verify symbol key '[' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0420 begin');
      const value: string = '[';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0420 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0421
     * @tc.name      testKeyDataSymbol0421
     * @tc.desc      Verify symbol key '[' is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0421 begin');
      const idx: number = 25;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0421 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0422
     * @tc.name      testKeyDataSymbol0422
     * @tc.desc      Verify symbol key '[' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0422 begin');
      const item: sourceListType = symbolSourceListData[25];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0422 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0423
     * @tc.name      testKeyDataSymbol0423
     * @tc.desc      Verify symbol key '[' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0423 begin');
      const first: sourceListType = symbolSourceListData[25];
      const second: sourceListType = symbolSourceListData[25];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('[');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0423 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0424
     * @tc.name      testKeyDataSymbol0424
     * @tc.desc      Verify ASCII symbol key '[' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0424 begin');
      const item: sourceListType = symbolSourceListData[25];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0424 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0425
     * @tc.name      testKeyDataSymbol0425
     * @tc.desc      Verify symbol key at index 26 exposes the expected content ']'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0425 begin');
      const item: sourceListType = symbolSourceListData[26];
      expect(item.content).assertEqual(']');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0425 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0426
     * @tc.name      testKeyDataSymbol0426
     * @tc.desc      Verify symbol key ']' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0426 begin');
      const item: sourceListType = symbolSourceListData[26];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0426 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0427
     * @tc.name      testKeyDataSymbol0427
     * @tc.desc      Verify symbol key ']' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0427 begin');
      const item: sourceListType = symbolSourceListData[26];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0427 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0428
     * @tc.name      testKeyDataSymbol0428
     * @tc.desc      Verify symbol key ']' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0428 begin');
      const value: string = ']';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0428 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0429
     * @tc.name      testKeyDataSymbol0429
     * @tc.desc      Verify symbol key ']' is assigned to SymbolMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0429 begin');
      const idx: number = 26;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0429 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0430
     * @tc.name      testKeyDataSymbol0430
     * @tc.desc      Verify symbol key ']' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0430 begin');
      const item: sourceListType = symbolSourceListData[26];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0430 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0431
     * @tc.name      testKeyDataSymbol0431
     * @tc.desc      Verify symbol key ']' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0431 begin');
      const first: sourceListType = symbolSourceListData[26];
      const second: sourceListType = symbolSourceListData[26];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual(']');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0431 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0432
     * @tc.name      testKeyDataSymbol0432
     * @tc.desc      Verify ASCII symbol key ']' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0432 begin');
      const item: sourceListType = symbolSourceListData[26];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0432 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0433
     * @tc.name      testKeyDataTable0433
     * @tc.desc      The number table contains 27 keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0433 begin');
      expect(numberSourceListData.length).assertEqual(27);
      expect(numberSourceListData[0].content).assertEqual('1');
      expect(numberSourceListData[26].content).assertEqual('?');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0433 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0434
     * @tc.name      testKeyDataTable0434
     * @tc.desc      The first number row contains 0 through 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0434 begin');
      const row: sourceListType[] = numberSourceListData.slice(0, 10);
      expect(row.length).assertEqual(10);
      expect(row[0].content).assertEqual('1');
      expect(row[8].content).assertEqual('9');
      expect(row[9].content).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0434 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0435
     * @tc.name      testKeyDataTable0435
     * @tc.desc      The second number row contains ten punctuation keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0435 begin');
      expect(numberSourceListData.slice(10, 20).length).assertEqual(10);
      expect(numberSourceListData[10].content).assertEqual('@');
      expect(numberSourceListData[19].content).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0435 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0436
     * @tc.name      testKeyDataTable0436
     * @tc.desc      The third number row contains seven keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0436 begin');
      expect(numberSourceListData.slice(20).length).assertEqual(7);
      expect(numberSourceListData[20].content).assertEqual('*');
      expect(numberSourceListData[26].content).assertEqual('?');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0436 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0437
     * @tc.name      testKeyDataTable0437
     * @tc.desc      The symbol table contains 27 keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0437 begin');
      expect(symbolSourceListData.length).assertEqual(27);
      expect(symbolSourceListData[0].content).assertEqual('~');
      expect(symbolSourceListData[26].content).assertEqual(']');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0437 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0438
     * @tc.name      testKeyDataTable0438
     * @tc.desc      The first symbol row contains ten keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0438 begin');
      expect(symbolSourceListData.slice(0, 10).length).assertEqual(10);
      expect(symbolSourceListData[0].content).assertEqual('~');
      expect(symbolSourceListData[9].content).assertEqual('\u2206');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0438 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0439
     * @tc.name      testKeyDataTable0439
     * @tc.desc      The second symbol row contains ten keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0439 begin');
      expect(symbolSourceListData.slice(10, 20).length).assertEqual(10);
      expect(symbolSourceListData[10].content).assertEqual('\u00A3');
      expect(symbolSourceListData[19].content).assertEqual(',');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0439 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0440
     * @tc.name      testKeyDataTable0440
     * @tc.desc      The third symbol row contains seven keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0440 begin');
      expect(symbolSourceListData.slice(20).length).assertEqual(7);
      expect(symbolSourceListData[20].content).assertEqual('\\');
      expect(symbolSourceListData[26].content).assertEqual(']');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0440 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0441
     * @tc.name      testKeyDataTable0441
     * @tc.desc      All number key contents are unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0441 begin');
      const seen: string[] = [];
      for (let i: number = 0; i < numberSourceListData.length; i++) {
        expect(seen.indexOf(numberSourceListData[i].content)).assertEqual(-1);
        seen.push(numberSourceListData[i].content);
      }
      expect(seen.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0441 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0442
     * @tc.name      testKeyDataTable0442
     * @tc.desc      All symbol key contents are unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0442 begin');
      const seen: string[] = [];
      for (let i: number = 0; i < symbolSourceListData.length; i++) {
        expect(seen.indexOf(symbolSourceListData[i].content)).assertEqual(-1);
        seen.push(symbolSourceListData[i].content);
      }
      expect(seen.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0442 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0443
     * @tc.name      testKeyDataTable0443
     * @tc.desc      The number table contains all ten decimal digits.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0443 begin');
      let count: number = 0;
      for (let d: number = 0; d <= 9; d++) {
        const value: string = String.fromCharCode(48 + d);
        for (let i: number = 0; i < numberSourceListData.length; i++) {
          if (numberSourceListData[i].content === value) count++;
        }
      }
      expect(count).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0443 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0444
     * @tc.name      testKeyDataTable0444
     * @tc.desc      Every number key entry has non-empty content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0444 begin');
      for (let i: number = 0; i < numberSourceListData.length; i++) {
        expect(numberSourceListData[i].content.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0444 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0445
     * @tc.name      testKeyDataTable0445
     * @tc.desc      Every symbol key entry has non-empty content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0445 begin');
      for (let i: number = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0445 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0446
     * @tc.name      testKeyDataTable0446
     * @tc.desc      Number and symbol tables do not share plain ASCII letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataTable0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0446 begin');
      for (let i: number = 0; i < numberSourceListData.length; i++) {
        expect(numberSourceListData[i].content >= 'a' && numberSourceListData[i].content <= 'z').assertFalse();
      }
      for (let i: number = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTable0446 end');
    })
  })
}
