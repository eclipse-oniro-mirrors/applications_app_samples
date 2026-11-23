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

import { Level, Size, TestType, describe, expect, it } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { KeyState, MenuKey, sourceListType, symbolSourceListData } from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodMenuOrder]';

export default function MenuSymbolSuiteTest(): void {
  describe('MenuSymbolSuite', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_ORDER_0001
     * @tc.name      testMenuOrderTest_001
     * @tc.desc      Verify that the three key states keep the lower-once-upper order.
     */
    it('testMenuOrderTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuOrderTest_001 begin');
      expect(KeyState.LOWER_CASE).assertEqual(0);
      expect(KeyState.ONCE_UPPER_CASE).assertEqual(1);
      expect(KeyState.UPPER_CASE).assertEqual(2);
      expect(KeyState.LOWER_CASE < KeyState.ONCE_UPPER_CASE).assertTrue();
      expect(KeyState.ONCE_UPPER_CASE < KeyState.UPPER_CASE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuOrderTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_MENU_ORDER_0002
     * @tc.name      testMenuOrderTest_002
     * @tc.desc      Verify that the three switch labels keep their text and length.
     */
    it('testMenuOrderTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuOrderTest_002 begin');
      expect(MenuKey.NUMBER_KEY).assertEqual('?123');
      expect(MenuKey.NORMAL_KEY).assertEqual('ABC');
      expect(MenuKey.SPECIAL_KEY).assertEqual('=/<');
      expect(MenuKey.NUMBER_KEY.length).assertEqual(4);
      expect(MenuKey.NORMAL_KEY.length).assertEqual(3);
      expect(MenuKey.SPECIAL_KEY.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMenuOrderTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYMBOL_ORDER_0001
     * @tc.name      testSymbolTableOrderTest_001
     * @tc.desc      Verify the first, middle and last symbol rows by index.
     */
    it('testSymbolTableOrderTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolTableOrderTest_001 begin');
      const rows: sourceListType[] = symbolSourceListData;
      expect(rows.length).assertEqual(27);
      expect(rows[0].content).assertEqual('~');
      expect(rows[1].content).assertEqual('`');
      expect(rows[2].content).assertEqual('|');
      expect(rows[16].content).assertEqual('=');
      expect(rows[25].content).assertEqual('[');
      expect(rows[26].content).assertEqual(']');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolTableOrderTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYMBOL_ORDER_0002
     * @tc.name      testSymbolTableOrderTest_002
     * @tc.desc      Verify that the symbol rows carry one character each and no duplicates.
     */
    it('testSymbolTableOrderTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolTableOrderTest_002 begin');
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length).assertEqual(1);
        seen.add(symbolSourceListData[i].content);
      }
      expect(seen.size).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolTableOrderTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYMBOL_CODE_0001
     * @tc.name      testSymbolCodePointTest_001
     * @tc.desc      Verify the code points of the mathematical and currency symbol rows.
     */
    it('testSymbolCodePointTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolCodePointTest_001 begin');
      expect(symbolSourceListData[3].content.charCodeAt(0)).assertEqual(0x2022);
      expect(symbolSourceListData[4].content.charCodeAt(0)).assertEqual(0x221A);
      expect(symbolSourceListData[5].content.charCodeAt(0)).assertEqual(0x03A0);
      expect(symbolSourceListData[6].content.charCodeAt(0)).assertEqual(0x00F7);
      expect(symbolSourceListData[7].content.charCodeAt(0)).assertEqual(0x00D7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolCodePointTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SYMBOL_CODE_0002
     * @tc.name      testSymbolCodePointTest_002
     * @tc.desc      Verify the code points of the delta, euro, pound and cent rows.
     */
    it('testSymbolCodePointTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const expectedCodes: number[] = [0x2206, 0x00A3, 0x20AC, 0x00A5, 0x00A2];
      const actualCodes: number[] = [];
      for (let offset = 0; offset < expectedCodes.length; offset++) {
        actualCodes.push(symbolSourceListData[9 + offset].content.charCodeAt(0));
      }
      expect(actualCodes.join(',')).assertEqual(expectedCodes.join(','));
      expect(actualCodes[2] - actualCodes[3]).assertEqual(0x2007);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSymbolCodePointTest_002 end');
      await yieldToEventLoop();
    });

  });
}
