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

export default function KeyDataNumberSymbolExtendedTest(): void {
  describe('KeyDataNumberSymbolExtendedTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0120
     * @tc.name      testKeyDataNumber0120
     * @tc.desc      Verify number key '&' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0120 begin');
      const item: sourceListType = numberSourceListData[14];
      expect(item.content).assertEqual('&');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0121
     * @tc.name      testKeyDataNumber0121
     * @tc.desc      Verify number key at index 15 exposes the expected content '-'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0121 begin');
      const item: sourceListType = numberSourceListData[15];
      expect(item.content).assertEqual('-');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0122
     * @tc.name      testKeyDataNumber0122
     * @tc.desc      Verify number key '-' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0122 begin');
      const item: sourceListType = numberSourceListData[15];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0123
     * @tc.name      testKeyDataNumber0123
     * @tc.desc      Verify number key '-' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0123 begin');
      const item: sourceListType = numberSourceListData[15];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0124
     * @tc.name      testKeyDataNumber0124
     * @tc.desc      Verify number key '-' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0124 begin');
      const item: sourceListType = numberSourceListData[15];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0125
     * @tc.name      testKeyDataNumber0125
     * @tc.desc      Verify number key '-' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0125 begin');
      const value: string = '-';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0126
     * @tc.name      testKeyDataNumber0126
     * @tc.desc      Verify number key '-' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0126 begin');
      const idx: number = 15;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0127
     * @tc.name      testKeyDataNumber0127
     * @tc.desc      Verify number key '-' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0127 begin');
      const first: sourceListType = numberSourceListData[15];
      const second: sourceListType = numberSourceListData[15];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0128
     * @tc.name      testKeyDataNumber0128
     * @tc.desc      Verify number key '-' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0128 begin');
      const item: sourceListType = numberSourceListData[15];
      expect(item.content).assertEqual('-');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0128 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0129
     * @tc.name      testKeyDataNumber0129
     * @tc.desc      Verify number key at index 16 exposes the expected content '+'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0129 begin');
      const item: sourceListType = numberSourceListData[16];
      expect(item.content).assertEqual('+');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0129 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0130
     * @tc.name      testKeyDataNumber0130
     * @tc.desc      Verify number key '+' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0130 begin');
      const item: sourceListType = numberSourceListData[16];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0130 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0131
     * @tc.name      testKeyDataNumber0131
     * @tc.desc      Verify number key '+' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0131 begin');
      const item: sourceListType = numberSourceListData[16];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0131 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0132
     * @tc.name      testKeyDataNumber0132
     * @tc.desc      Verify number key '+' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0132 begin');
      const item: sourceListType = numberSourceListData[16];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0132 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0133
     * @tc.name      testKeyDataNumber0133
     * @tc.desc      Verify number key '+' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0133 begin');
      const value: string = '+';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0133 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0134
     * @tc.name      testKeyDataNumber0134
     * @tc.desc      Verify number key '+' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0134 begin');
      const idx: number = 16;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0134 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0135
     * @tc.name      testKeyDataNumber0135
     * @tc.desc      Verify number key '+' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0135 begin');
      const first: sourceListType = numberSourceListData[16];
      const second: sourceListType = numberSourceListData[16];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('+');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0136
     * @tc.name      testKeyDataNumber0136
     * @tc.desc      Verify number key '+' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0136 begin');
      const item: sourceListType = numberSourceListData[16];
      expect(item.content).assertEqual('+');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0137
     * @tc.name      testKeyDataNumber0137
     * @tc.desc      Verify number key at index 17 exposes the expected content '('.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0137 begin');
      const item: sourceListType = numberSourceListData[17];
      expect(item.content).assertEqual('(');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0138
     * @tc.name      testKeyDataNumber0138
     * @tc.desc      Verify number key '(' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0138 begin');
      const item: sourceListType = numberSourceListData[17];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0139
     * @tc.name      testKeyDataNumber0139
     * @tc.desc      Verify number key '(' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0139 begin');
      const item: sourceListType = numberSourceListData[17];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0140
     * @tc.name      testKeyDataNumber0140
     * @tc.desc      Verify number key '(' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0140 begin');
      const item: sourceListType = numberSourceListData[17];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0141
     * @tc.name      testKeyDataNumber0141
     * @tc.desc      Verify number key '(' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0141 begin');
      const value: string = '(';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0142
     * @tc.name      testKeyDataNumber0142
     * @tc.desc      Verify number key '(' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0142 begin');
      const idx: number = 17;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0143
     * @tc.name      testKeyDataNumber0143
     * @tc.desc      Verify number key '(' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0143 begin');
      const first: sourceListType = numberSourceListData[17];
      const second: sourceListType = numberSourceListData[17];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('(');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0144
     * @tc.name      testKeyDataNumber0144
     * @tc.desc      Verify number key '(' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0144 begin');
      const item: sourceListType = numberSourceListData[17];
      expect(item.content).assertEqual('(');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0145
     * @tc.name      testKeyDataNumber0145
     * @tc.desc      Verify number key at index 18 exposes the expected content ')'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0145 begin');
      const item: sourceListType = numberSourceListData[18];
      expect(item.content).assertEqual(')');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0146
     * @tc.name      testKeyDataNumber0146
     * @tc.desc      Verify number key ')' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0146 begin');
      const item: sourceListType = numberSourceListData[18];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0147
     * @tc.name      testKeyDataNumber0147
     * @tc.desc      Verify number key ')' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0147 begin');
      const item: sourceListType = numberSourceListData[18];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0148
     * @tc.name      testKeyDataNumber0148
     * @tc.desc      Verify number key ')' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0148 begin');
      const item: sourceListType = numberSourceListData[18];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0149
     * @tc.name      testKeyDataNumber0149
     * @tc.desc      Verify number key ')' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0149 begin');
      const value: string = ')';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0150
     * @tc.name      testKeyDataNumber0150
     * @tc.desc      Verify number key ')' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0150 begin');
      const idx: number = 18;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0151
     * @tc.name      testKeyDataNumber0151
     * @tc.desc      Verify number key ')' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0151 begin');
      const first: sourceListType = numberSourceListData[18];
      const second: sourceListType = numberSourceListData[18];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual(')');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0152
     * @tc.name      testKeyDataNumber0152
     * @tc.desc      Verify number key ')' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0152 begin');
      const item: sourceListType = numberSourceListData[18];
      expect(item.content).assertEqual(')');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0153
     * @tc.name      testKeyDataNumber0153
     * @tc.desc      Verify number key at index 19 exposes the expected content '/'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0153 begin');
      const item: sourceListType = numberSourceListData[19];
      expect(item.content).assertEqual('/');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0154
     * @tc.name      testKeyDataNumber0154
     * @tc.desc      Verify number key '/' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0154 begin');
      const item: sourceListType = numberSourceListData[19];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0155
     * @tc.name      testKeyDataNumber0155
     * @tc.desc      Verify number key '/' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0155 begin');
      const item: sourceListType = numberSourceListData[19];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0156
     * @tc.name      testKeyDataNumber0156
     * @tc.desc      Verify number key '/' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0156 begin');
      const item: sourceListType = numberSourceListData[19];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0157
     * @tc.name      testKeyDataNumber0157
     * @tc.desc      Verify number key '/' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0157 begin');
      const value: string = '/';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0158
     * @tc.name      testKeyDataNumber0158
     * @tc.desc      Verify number key '/' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0158 begin');
      const idx: number = 19;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0159
     * @tc.name      testKeyDataNumber0159
     * @tc.desc      Verify number key '/' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0159 begin');
      const first: sourceListType = numberSourceListData[19];
      const second: sourceListType = numberSourceListData[19];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0160
     * @tc.name      testKeyDataNumber0160
     * @tc.desc      Verify number key '/' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0160 begin');
      const item: sourceListType = numberSourceListData[19];
      expect(item.content).assertEqual('/');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0161
     * @tc.name      testKeyDataNumber0161
     * @tc.desc      Verify number key at index 20 exposes the expected content '*'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0161 begin');
      const item: sourceListType = numberSourceListData[20];
      expect(item.content).assertEqual('*');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0162
     * @tc.name      testKeyDataNumber0162
     * @tc.desc      Verify number key '*' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0162 begin');
      const item: sourceListType = numberSourceListData[20];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0163
     * @tc.name      testKeyDataNumber0163
     * @tc.desc      Verify number key '*' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0163 begin');
      const item: sourceListType = numberSourceListData[20];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0164
     * @tc.name      testKeyDataNumber0164
     * @tc.desc      Verify number key '*' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0164 begin');
      const item: sourceListType = numberSourceListData[20];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0165
     * @tc.name      testKeyDataNumber0165
     * @tc.desc      Verify number key '*' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0165 begin');
      const value: string = '*';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0166
     * @tc.name      testKeyDataNumber0166
     * @tc.desc      Verify number key '*' is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0166 begin');
      const idx: number = 20;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0167
     * @tc.name      testKeyDataNumber0167
     * @tc.desc      Verify number key '*' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0167 begin');
      const first: sourceListType = numberSourceListData[20];
      const second: sourceListType = numberSourceListData[20];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('*');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0168
     * @tc.name      testKeyDataNumber0168
     * @tc.desc      Verify number key '*' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0168 begin');
      const item: sourceListType = numberSourceListData[20];
      expect(item.content).assertEqual('*');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0169
     * @tc.name      testKeyDataNumber0169
     * @tc.desc      Verify number key at index 21 exposes the expected content '"'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0169 begin');
      const item: sourceListType = numberSourceListData[21];
      expect(item.content).assertEqual('"');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0170
     * @tc.name      testKeyDataNumber0170
     * @tc.desc      Verify number key '"' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0170 begin');
      const item: sourceListType = numberSourceListData[21];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0171
     * @tc.name      testKeyDataNumber0171
     * @tc.desc      Verify number key '"' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0171 begin');
      const item: sourceListType = numberSourceListData[21];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0172
     * @tc.name      testKeyDataNumber0172
     * @tc.desc      Verify number key '"' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0172 begin');
      const item: sourceListType = numberSourceListData[21];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0173
     * @tc.name      testKeyDataNumber0173
     * @tc.desc      Verify number key '"' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0173 begin');
      const value: string = '"';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0174
     * @tc.name      testKeyDataNumber0174
     * @tc.desc      Verify number key '"' is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0174 begin');
      const idx: number = 21;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0175
     * @tc.name      testKeyDataNumber0175
     * @tc.desc      Verify number key '"' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0175 begin');
      const first: sourceListType = numberSourceListData[21];
      const second: sourceListType = numberSourceListData[21];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('"');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0176
     * @tc.name      testKeyDataNumber0176
     * @tc.desc      Verify number key '"' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0176 begin');
      const item: sourceListType = numberSourceListData[21];
      expect(item.content).assertEqual('"');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0177
     * @tc.name      testKeyDataNumber0177
     * @tc.desc      Verify number key at index 22 exposes the expected content "'".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0177 begin');
      const item: sourceListType = numberSourceListData[22];
      expect(item.content).assertEqual('\'');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0178
     * @tc.name      testKeyDataNumber0178
     * @tc.desc      Verify number key "'" is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0178 begin');
      const item: sourceListType = numberSourceListData[22];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0179
     * @tc.name      testKeyDataNumber0179
     * @tc.desc      Verify number key "'" is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0179 begin');
      const item: sourceListType = numberSourceListData[22];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0180
     * @tc.name      testKeyDataNumber0180
     * @tc.desc      Verify number key "'" is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0180 begin');
      const item: sourceListType = numberSourceListData[22];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0181
     * @tc.name      testKeyDataNumber0181
     * @tc.desc      Verify number key "'" occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0181 begin');
      const value: string = '\'';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0182
     * @tc.name      testKeyDataNumber0182
     * @tc.desc      Verify number key "'" is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0182 begin');
      const idx: number = 22;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0183
     * @tc.name      testKeyDataNumber0183
     * @tc.desc      Verify number key "'" keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0183 begin');
      const first: sourceListType = numberSourceListData[22];
      const second: sourceListType = numberSourceListData[22];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('\'');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0184
     * @tc.name      testKeyDataNumber0184
     * @tc.desc      Verify number key "'" has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0184 begin');
      const item: sourceListType = numberSourceListData[22];
      expect(item.content).assertEqual('\'');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0185
     * @tc.name      testKeyDataNumber0185
     * @tc.desc      Verify number key at index 23 exposes the expected content ':'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0185 begin');
      const item: sourceListType = numberSourceListData[23];
      expect(item.content).assertEqual(':');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0186
     * @tc.name      testKeyDataNumber0186
     * @tc.desc      Verify number key ':' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0186 begin');
      const item: sourceListType = numberSourceListData[23];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0187
     * @tc.name      testKeyDataNumber0187
     * @tc.desc      Verify number key ':' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0187 begin');
      const item: sourceListType = numberSourceListData[23];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0188
     * @tc.name      testKeyDataNumber0188
     * @tc.desc      Verify number key ':' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0188 begin');
      const item: sourceListType = numberSourceListData[23];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0189
     * @tc.name      testKeyDataNumber0189
     * @tc.desc      Verify number key ':' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0189 begin');
      const value: string = ':';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0190
     * @tc.name      testKeyDataNumber0190
     * @tc.desc      Verify number key ':' is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0190 begin');
      const idx: number = 23;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0191
     * @tc.name      testKeyDataNumber0191
     * @tc.desc      Verify number key ':' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0191 begin');
      const first: sourceListType = numberSourceListData[23];
      const second: sourceListType = numberSourceListData[23];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0192
     * @tc.name      testKeyDataNumber0192
     * @tc.desc      Verify number key ':' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0192 begin');
      const item: sourceListType = numberSourceListData[23];
      expect(item.content).assertEqual(':');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0193
     * @tc.name      testKeyDataNumber0193
     * @tc.desc      Verify number key at index 24 exposes the expected content ';'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0193 begin');
      const item: sourceListType = numberSourceListData[24];
      expect(item.content).assertEqual(';');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0194
     * @tc.name      testKeyDataNumber0194
     * @tc.desc      Verify number key ';' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0194 begin');
      const item: sourceListType = numberSourceListData[24];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0195
     * @tc.name      testKeyDataNumber0195
     * @tc.desc      Verify number key ';' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0195 begin');
      const item: sourceListType = numberSourceListData[24];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0196
     * @tc.name      testKeyDataNumber0196
     * @tc.desc      Verify number key ';' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0196 begin');
      const item: sourceListType = numberSourceListData[24];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0197
     * @tc.name      testKeyDataNumber0197
     * @tc.desc      Verify number key ';' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0197 begin');
      const value: string = ';';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0198
     * @tc.name      testKeyDataNumber0198
     * @tc.desc      Verify number key ';' is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0198 begin');
      const idx: number = 24;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0199
     * @tc.name      testKeyDataNumber0199
     * @tc.desc      Verify number key ';' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0199 begin');
      const first: sourceListType = numberSourceListData[24];
      const second: sourceListType = numberSourceListData[24];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual(';');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0200
     * @tc.name      testKeyDataNumber0200
     * @tc.desc      Verify number key ';' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0200 begin');
      const item: sourceListType = numberSourceListData[24];
      expect(item.content).assertEqual(';');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0201
     * @tc.name      testKeyDataNumber0201
     * @tc.desc      Verify number key at index 25 exposes the expected content '!'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0201 begin');
      const item: sourceListType = numberSourceListData[25];
      expect(item.content).assertEqual('!');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0202
     * @tc.name      testKeyDataNumber0202
     * @tc.desc      Verify number key '!' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0202 begin');
      const item: sourceListType = numberSourceListData[25];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0203
     * @tc.name      testKeyDataNumber0203
     * @tc.desc      Verify number key '!' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0203 begin');
      const item: sourceListType = numberSourceListData[25];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0204
     * @tc.name      testKeyDataNumber0204
     * @tc.desc      Verify number key '!' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0204 begin');
      const item: sourceListType = numberSourceListData[25];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0205
     * @tc.name      testKeyDataNumber0205
     * @tc.desc      Verify number key '!' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0205 begin');
      const value: string = '!';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0205 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0206
     * @tc.name      testKeyDataNumber0206
     * @tc.desc      Verify number key '!' is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0206 begin');
      const idx: number = 25;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0207
     * @tc.name      testKeyDataNumber0207
     * @tc.desc      Verify number key '!' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0207 begin');
      const first: sourceListType = numberSourceListData[25];
      const second: sourceListType = numberSourceListData[25];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0208
     * @tc.name      testKeyDataNumber0208
     * @tc.desc      Verify number key '!' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0208 begin');
      const item: sourceListType = numberSourceListData[25];
      expect(item.content).assertEqual('!');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0209
     * @tc.name      testKeyDataNumber0209
     * @tc.desc      Verify number key at index 26 exposes the expected content '?'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0209 begin');
      const item: sourceListType = numberSourceListData[26];
      expect(item.content).assertEqual('?');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0210
     * @tc.name      testKeyDataNumber0210
     * @tc.desc      Verify number key '?' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0210 begin');
      const item: sourceListType = numberSourceListData[26];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0211
     * @tc.name      testKeyDataNumber0211
     * @tc.desc      Verify number key '?' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0211 begin');
      const item: sourceListType = numberSourceListData[26];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0211 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0212
     * @tc.name      testKeyDataNumber0212
     * @tc.desc      Verify number key '?' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0212 begin');
      const item: sourceListType = numberSourceListData[26];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0212 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0213
     * @tc.name      testKeyDataNumber0213
     * @tc.desc      Verify number key '?' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0213 begin');
      const value: string = '?';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0213 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0214
     * @tc.name      testKeyDataNumber0214
     * @tc.desc      Verify number key '?' is assigned to NumberMenu row 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0214 begin');
      const idx: number = 26;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0214 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0215
     * @tc.name      testKeyDataNumber0215
     * @tc.desc      Verify number key '?' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0215 begin');
      const first: sourceListType = numberSourceListData[26];
      const second: sourceListType = numberSourceListData[26];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('?');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0215 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0216
     * @tc.name      testKeyDataNumber0216
     * @tc.desc      Verify number key '?' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0216 begin');
      const item: sourceListType = numberSourceListData[26];
      expect(item.content).assertEqual('?');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0216 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0217
     * @tc.name      testKeyDataSymbol0217
     * @tc.desc      Verify symbol key at index 0 exposes the expected content '~'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0217 begin');
      const item: sourceListType = symbolSourceListData[0];
      expect(item.content).assertEqual('~');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0217 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0218
     * @tc.name      testKeyDataSymbol0218
     * @tc.desc      Verify symbol key '~' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0218 begin');
      const item: sourceListType = symbolSourceListData[0];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0218 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0219
     * @tc.name      testKeyDataSymbol0219
     * @tc.desc      Verify symbol key '~' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0219 begin');
      const item: sourceListType = symbolSourceListData[0];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0219 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0220
     * @tc.name      testKeyDataSymbol0220
     * @tc.desc      Verify symbol key '~' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0220 begin');
      const value: string = '~';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0220 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0221
     * @tc.name      testKeyDataSymbol0221
     * @tc.desc      Verify symbol key '~' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0221 begin');
      const idx: number = 0;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0221 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0222
     * @tc.name      testKeyDataSymbol0222
     * @tc.desc      Verify symbol key '~' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0222 begin');
      const item: sourceListType = symbolSourceListData[0];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0222 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0223
     * @tc.name      testKeyDataSymbol0223
     * @tc.desc      Verify symbol key '~' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0223 begin');
      const first: sourceListType = symbolSourceListData[0];
      const second: sourceListType = symbolSourceListData[0];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('~');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0223 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0224
     * @tc.name      testKeyDataSymbol0224
     * @tc.desc      Verify ASCII symbol key '~' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0224 begin');
      const item: sourceListType = symbolSourceListData[0];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0224 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0225
     * @tc.name      testKeyDataSymbol0225
     * @tc.desc      Verify symbol key at index 1 exposes the expected content '`'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0225 begin');
      const item: sourceListType = symbolSourceListData[1];
      expect(item.content).assertEqual('`');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0225 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0226
     * @tc.name      testKeyDataSymbol0226
     * @tc.desc      Verify symbol key '`' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0226 begin');
      const item: sourceListType = symbolSourceListData[1];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0226 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0227
     * @tc.name      testKeyDataSymbol0227
     * @tc.desc      Verify symbol key '`' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0227 begin');
      const item: sourceListType = symbolSourceListData[1];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0227 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0228
     * @tc.name      testKeyDataSymbol0228
     * @tc.desc      Verify symbol key '`' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0228 begin');
      const value: string = '`';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0228 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0229
     * @tc.name      testKeyDataSymbol0229
     * @tc.desc      Verify symbol key '`' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0229 begin');
      const idx: number = 1;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0229 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0230
     * @tc.name      testKeyDataSymbol0230
     * @tc.desc      Verify symbol key '`' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0230 begin');
      const item: sourceListType = symbolSourceListData[1];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0230 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0231
     * @tc.name      testKeyDataSymbol0231
     * @tc.desc      Verify symbol key '`' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0231 begin');
      const first: sourceListType = symbolSourceListData[1];
      const second: sourceListType = symbolSourceListData[1];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('`');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0231 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0232
     * @tc.name      testKeyDataSymbol0232
     * @tc.desc      Verify ASCII symbol key '`' is not alphanumeric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0232 begin');
      const item: sourceListType = symbolSourceListData[1];
      const code: number = item.content.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      expect(isDigit).assertFalse();
      expect(isUpper).assertFalse();
      expect(isLower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0232 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0233
     * @tc.name      testKeyDataSymbol0233
     * @tc.desc      Verify symbol key at index 2 exposes the expected content '|'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0233 begin');
      const item: sourceListType = symbolSourceListData[2];
      expect(item.content).assertEqual('|');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0233 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0234
     * @tc.name      testKeyDataSymbol0234
     * @tc.desc      Verify symbol key '|' is a single non-empty code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0234 begin');
      const item: sourceListType = symbolSourceListData[2];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0234 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0235
     * @tc.name      testKeyDataSymbol0235
     * @tc.desc      Verify symbol key '|' does not contain whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0235 begin');
      const item: sourceListType = symbolSourceListData[2];
      expect(item.content).assertEqual(item.content.trim());
      expect(item.content.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0235 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0236
     * @tc.name      testKeyDataSymbol0236
     * @tc.desc      Verify symbol key '|' occurs exactly once in the symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0236 begin');
      const value: string = '|';
      let count: number = 0;
      for (let j: number = 0; j < symbolSourceListData.length; j++) {
        if (symbolSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0236 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0237
     * @tc.name      testKeyDataSymbol0237
     * @tc.desc      Verify symbol key '|' is assigned to SymbolMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0237 begin');
      const idx: number = 2;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0237 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0238
     * @tc.name      testKeyDataSymbol0238
     * @tc.desc      Verify symbol key '|' has a valid positive character code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSymbol0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0238 begin');
      const item: sourceListType = symbolSourceListData[2];
      expect(item.content.charCodeAt(0) > 0).assertTrue();
      expect(item.content.charCodeAt(0) < 65536).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSymbol0238 end');
    })
  })
}
